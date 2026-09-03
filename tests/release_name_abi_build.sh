#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

rm -f /tmp/tt_release_name.s /tmp/tt_release_name.o /tmp/tt_release_name.c /tmp/tt_release_name
bash tests/macos_build.sh src/main.tt --emit=obj lib/release_name.tt -o /tmp/tt_release_name.s >/dev/null
clang -c /tmp/tt_release_name.s -o /tmp/tt_release_name.o
cat > /tmp/tt_release_name.c <<'EOF'
#include <pthread.h>
#include <stdint.h>
#include <string.h>
typedef struct { uint64_t abi, title_len, year, season, episode, resolution, source, codec; } Parsed;
extern uint64_t tt_release_parse_v1(const uint8_t *, uint64_t, uint8_t *, uint64_t, Parsed *);
static int check(const char *raw, const char *title, uint64_t year, uint64_t season, uint64_t episode, uint64_t resolution, uint64_t source, uint64_t codec) {
    uint8_t scratch[512]; Parsed out;
    if (tt_release_parse_v1((const uint8_t *)raw, strlen(raw), scratch, sizeof scratch, &out)) return 1;
    return out.abi != 1 || out.title_len != strlen(title) || memcmp(scratch, title, out.title_len) || out.year != year || out.season != season || out.episode != episode || out.resolution != resolution || out.source != source || out.codec != codec;
}
static void *run(void *unused) {
    const uint64_t none = UINT64_MAX;
    for (int i = 0; i < 1000; i++) if (check("The.Office.US.S03E12.720p.HDTV.x264-LOL", "The Office US", none, 3, 12, 4, 9, 2)) return (void *)1;
    return 0;
}
int main(void) {
    const uint64_t n = UINT64_MAX;
    if (check("Blade.Runner.2049.2017.2160p.UHD.BluRay.x265-CyTSuNee", "Blade Runner 2049", 2017, n, n, 1, 1, 1)) return 1;
    if (check("2001.A.Space.Odyssey.1968.1080p.BluRay.x264", "2001 A Space Odyssey", 1968, n, n, 3, 1, 2)) return 2;
    if (check("Series.Name.S01.EP01.1080p.WEB-DL", "Series Name", n, 1, 1, 3, 5, 0)) return 3;
    if (check("Funny.Games.2007.HDRip.XviD-FooBar", "Funny Games", 2007, n, n, 0, 7, 7)) return 4;
    if (check("Some Random Movie Name", "Some Random Movie Name", n, n, n, 0, 0, 0)) return 5;
    uint8_t tiny[1]; Parsed out;
    if (tt_release_parse_v1((const uint8_t *)"Long.Title", 10, tiny, sizeof tiny, &out) != 10) return 6;
    pthread_t a, b; void *ra, *rb;
    if (pthread_create(&a, 0, run, 0) || pthread_create(&b, 0, run, 0)) return 7;
    if (pthread_join(a, &ra) || pthread_join(b, &rb)) return 8;
    return ra != 0 || rb != 0;
}
EOF
clang /tmp/tt_release_name.c /tmp/tt_release_name.o -o /tmp/tt_release_name
/tmp/tt_release_name