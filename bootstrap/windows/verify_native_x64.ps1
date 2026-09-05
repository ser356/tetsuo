$ErrorActionPreference = "Stop"
Set-Location (Resolve-Path "$PSScriptRoot/../..")

$build = "build/windows-native"
New-Item -ItemType Directory -Force $build | Out-Null

function Build-TetsuoExe($compiler, $output) {
    $assembly = "$output.s"
    $object = "$output.obj"
    & $compiler --target=windows-x64 tests/fixpoint_entry.tt -o $assembly
    if ($LASTEXITCODE -ne 0) { throw "$compiler failed" }
    clang --target=x86_64-windows-msvc -c $assembly -o $object
    if ($LASTEXITCODE -ne 0) { throw "clang failed" }
    python tools/link_pe_x64.py $object "$output.exe"
    if ($LASTEXITCODE -ne 0) { throw "PE linker failed" }
}

Build-TetsuoExe "bootstrap/tetsuoc-x64.exe" "$build/stage1"
Build-TetsuoExe "$build/stage1.exe" "$build/stage2"

$stage1Hash = (Get-FileHash "$build/stage1.exe" -Algorithm SHA256).Hash
$stage2Hash = (Get-FileHash "$build/stage2.exe" -Algorithm SHA256).Hash
if ($stage1Hash -ne $stage2Hash) { throw "Windows x64 fixpoint failed: stage1 != stage2" }

$smokeSource = "$build/smoke.tt"
Set-Content -NoNewline $smokeSource "fun main() -> u64 { return 42 }"
& "$build/stage2.exe" --target=windows-x64 $smokeSource -o "$build/smoke.s"
if ($LASTEXITCODE -ne 0) { throw "stage2 failed to compile smoke" }
clang --target=x86_64-windows-msvc -c "$build/smoke.s" -o "$build/smoke.obj"
if ($LASTEXITCODE -ne 0) { throw "clang failed to assemble smoke" }
python tools/link_pe_x64.py "$build/smoke.obj" "$build/smoke.exe"
if ($LASTEXITCODE -ne 0) { throw "PE linker failed for smoke" }
& "$build/smoke.exe"
if ($LASTEXITCODE -ne 42) { throw "smoke returned $LASTEXITCODE, expected 42" }

Write-Host "VERIFY WINDOWS X64 OK"
