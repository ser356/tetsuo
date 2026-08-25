    .section __TEXT,__text
    .globl   _tt_start
_tt_start:
    bl      _main
    mov     x16, #1
    svc     #0x80

    .globl   _arena_init
_arena_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #128
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
.L677:
    add     sp, sp, #128
    ldp     x29, x30, [sp], #16
    ret

    .globl   _arena_take
_arena_take:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #352
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0007
    add     x11, x9, x10
    movz    x9, #0x0008
    udiv     x10, x11, x9
    movz    x9, #0x0008
    mul     x11, x10, x9
    str     x11, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    cmp     x11, x9
    cset    w10, hi
    cbz     w10, .L0
    movz    x9, #0x0046
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #184]
.L0:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    str     x11, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    ldr     x10, [sp, #16]
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L678
.L678:
    add     sp, sp, #352
    ldp     x29, x30, [sp], #16
    ret

    .globl   _io_open_read
_io_open_read:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    movz    x9, #0x0005
    ldr     x10, [sp, #0]
    mov     x11, #0
    mov     x12, #0
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    mov     x13, x0
    mov     x0, x13
    b       .L679
.L679:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _io_open_write
_io_open_write:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    movz    x9, #0x0005
    ldr     x10, [sp, #0]
    movz    x11, #0x0601
    movz    x12, #0x01a4
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    mov     x13, x0
    mov     x0, x13
    b       .L680
.L680:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _io_read
_io_read:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x9, #0x0003
    ldr     x10, [sp, #0]
    ldr     x11, [sp, #8]
    ldr     x12, [sp, #16]
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    mov     x13, x0
    mov     x0, x13
    b       .L681
.L681:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _io_write
_io_write:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x9, #0x0004
    ldr     x10, [sp, #0]
    ldr     x11, [sp, #8]
    ldr     x12, [sp, #16]
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    str     x0, [sp, #56]
.L682:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _io_close
_io_close:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    movz    x9, #0x0006
    ldr     x10, [sp, #0]
    mov     x11, #0
    mov     x12, #0
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    str     x0, [sp, #40]
.L683:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _io_exit
_io_exit:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    movz    x9, #0x0001
    ldr     x10, [sp, #0]
    mov     x11, #0
    mov     x12, #0
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    str     x0, [sp, #40]
.L684:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _bytes_eq
_bytes_eq:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
.L1:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L2
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    add     x11, x9, x10
    ldrb    w9, [x11]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    ldrb    w10, [x12]
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L3
    mov     x9, #0
    mov     w0, w9
    b       .L685
.L3:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L1
.L2:
    movz    x9, #0x0001
    mov     w0, w9
    b       .L685
.L685:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mem_copy
_mem_copy:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
.L4:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L5
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    add     x12, x9, x10
    ldrb    w9, [x12]
    strb    w9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L4
.L5:
.L686:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_init
_out_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
.L687:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_flush
_out_flush:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L6
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #0]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _io_write
    str     x0, [sp, #152]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
.L6:
.L688:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_byte
_out_byte:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #256
    str     x0, [sp, #0]
    strb    w1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L7
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #96]
.L7:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldrb    w9, [sp, #8]
    strb    w9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
.L689:
    add     sp, sp, #256
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_bytes
_out_bytes:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
.L8:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L9
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #104]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L8
.L9:
.L690:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_u64
_out_u64:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #352
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L10
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #72]
    b       .L691
.L10:
    mov     x9, #0
    str     x9, [sp, #16]
.L11:
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L12
    ldr     x9, [sp, #8]
    movz    x10, #0x000a
    udiv     x11, x9, x10
    str     x11, [sp, #24]
    adrp    x9, _DIGITS@PAGE
    add     x9, x9, _DIGITS@PAGEOFF
    ldr     x10, [sp, #16]
    add     x11, x9, x10
    movz    x9, #0x0030
    ldr     x10, [sp, #8]
    ldr     x12, [sp, #24]
    movz    x13, #0x000a
    mul     x14, x12, x13
    sub     x12, x10, x14
    add     x10, x9, x12
    strb    w10, [x11]
    ldr     x9, [sp, #24]
    str     x9, [sp, #8]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #16]
    b       .L11
.L12:
.L13:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L14
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    sub     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #0]
    adrp    x10, _DIGITS@PAGE
    add     x10, x10, _DIGITS@PAGEOFF
    ldr     x11, [sp, #16]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #336]
    b       .L13
.L14:
.L691:
    add     sp, sp, #352
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_nibble
_out_nibble:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #128
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L15
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    ldr     x11, [sp, #8]
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_byte
    str     x0, [sp, #72]
    b       .L692
.L15:
    ldr     x9, [sp, #0]
    movz    x10, #0x0057
    ldr     x11, [sp, #8]
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_byte
    str     x0, [sp, #112]
.L692:
    add     sp, sp, #128
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_hex4
_out_hex4:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #352
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x1000
    udiv     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x1000
    mul     x12, x10, x11
    sub     x10, x9, x12
    str     x10, [sp, #24]
    ldr     x9, [sp, #24]
    movz    x10, #0x0100
    udiv     x11, x9, x10
    str     x11, [sp, #32]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    movz    x11, #0x0100
    mul     x12, x10, x11
    sub     x10, x9, x12
    str     x10, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0010
    udiv     x11, x9, x10
    str     x11, [sp, #48]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    movz    x11, #0x0010
    mul     x12, x10, x11
    sub     x10, x9, x12
    str     x10, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_nibble
    str     x0, [sp, #272]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _out_nibble
    str     x0, [sp, #296]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _out_nibble
    str     x0, [sp, #320]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    bl      _out_nibble
    str     x0, [sp, #344]
.L693:
    add     sp, sp, #352
    ldp     x29, x30, [sp], #16
    ret

    .globl   _die_line
_die_line:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #320
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, _ERR_STORAGE@PAGE
    add     x9, x9, _ERR_STORAGE@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    movz    x10, #0x0002
    adrp    x11, _ERR_BUF@PAGE
    add     x11, x11, _ERR_BUF@PAGEOFF
    movz    x12, #0x1000
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #104]
    adrp    x9, L_str0@PAGE
    add     x9, x9, L_str0@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x000c
    str     x9, [sp, #40]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #152]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #176]
    adrp    x9, L_str1@PAGE
    add     x9, x9, L_str1@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0002
    str     x9, [sp, #56]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #224]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #0]
    ldr     x11, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #256]
    ldr     x9, [sp, #24]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #280]
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #296]
    movz    x9, #0x0002
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #312]
.L694:
    add     sp, sp, #320
    ldp     x29, x30, [sp], #16
    ret

    .globl   _vec_init
_vec_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
.L695:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _vec_push
_vec_push:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #640
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L16
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    mul     x11, x9, x10
    str     x11, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #8]
    movz    x12, #0x0018
    add     x13, x11, x12
    ldr     x11, [x13]
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _arena_take
    mov     x10, x0
    str     x10, [sp, #32]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #8]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #8]
    movz    x13, #0x0018
    add     x14, x12, x13
    ldr     x12, [x14]
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _mem_copy
    str     x0, [sp, #336]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
.L16:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0018
    add     x13, x11, x12
    ldr     x11, [x13]
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    ldr     x11, [sp, #8]
    movz    x12, #0x0018
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x10
    mov     x1, x9
    mov     x2, x11
    bl      _mem_copy
    str     x0, [sp, #560]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
.L696:
    add     sp, sp, #640
    ldp     x29, x30, [sp], #16
    ret

    .globl   _vec_get
_vec_get:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #112
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #0]
    movz    x12, #0x0018
    add     x13, x11, x12
    ldr     x11, [x13]
    mul     x12, x10, x11
    add     x10, x9, x12
    mov     x0, x10
    b       .L697
.L697:
    add     sp, sp, #112
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ast_init
_ast_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _AST_ARENA_STORE@PAGE
    add     x9, x9, _AST_ARENA_STORE@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    adrp    x10, _AST_BUF@PAGE
    add     x10, x10, _AST_BUF@PAGEOFF
    movz    x11, #0x0100, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _arena_init
    str     x0, [sp, #40]
    ldr     x9, [sp, #0]
    mov     x0, x9
    b       .L698
.L698:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lex_init
_lex_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
.L699:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _is_digit
_is_digit:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    strb    w0, [sp, #0]
    ldrb    w9, [sp, #0]
    movz    x10, #0x0030
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L17
    ldrb    w9, [sp, #0]
    movz    x10, #0x0039
    cmp     w9, w10
    cset    w11, ls
    cbz     w11, .L18
    movz    x9, #0x0001
    mov     w0, w9
    b       .L700
.L18:
.L17:
    mov     x9, #0
    mov     w0, w9
    b       .L700
.L700:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _is_hex
_is_hex:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    strb    w0, [sp, #0]
    ldrb    w9, [sp, #0]
    mov     x0, x9
    bl      _is_digit
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L19
    movz    x9, #0x0001
    mov     w0, w9
    b       .L701
.L19:
    ldrb    w9, [sp, #0]
    movz    x10, #0x0061
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L20
    ldrb    w9, [sp, #0]
    movz    x10, #0x0066
    cmp     w9, w10
    cset    w11, ls
    cbz     w11, .L21
    movz    x9, #0x0001
    mov     w0, w9
    b       .L701
.L21:
.L20:
    ldrb    w9, [sp, #0]
    movz    x10, #0x0041
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L22
    ldrb    w9, [sp, #0]
    movz    x10, #0x0046
    cmp     w9, w10
    cset    w11, ls
    cbz     w11, .L23
    movz    x9, #0x0001
    mov     w0, w9
    b       .L701
.L23:
.L22:
    mov     x9, #0
    mov     w0, w9
    b       .L701
.L701:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _hex_val
_hex_val:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    strb    w0, [sp, #0]
    ldrb    w9, [sp, #0]
    mov     x0, x9
    bl      _is_digit
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L24
    ldrb    w9, [sp, #0]
    movz    x10, #0x0030
    sub     w11, w9, w10
    mov     w0, w11
    b       .L702
.L24:
    ldrb    w9, [sp, #0]
    movz    x10, #0x0061
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L25
    ldrb    w9, [sp, #0]
    movz    x10, #0x0061
    sub     w11, w9, w10
    movz    x9, #0x000a
    add     w10, w11, w9
    mov     w0, w10
    b       .L702
.L25:
    ldrb    w9, [sp, #0]
    movz    x10, #0x0041
    sub     w11, w9, w10
    movz    x9, #0x000a
    add     w10, w11, w9
    mov     w0, w10
    b       .L702
.L702:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _is_alpha
_is_alpha:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    strb    w0, [sp, #0]
    ldrb    w9, [sp, #0]
    movz    x10, #0x005f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L26
    movz    x9, #0x0001
    mov     w0, w9
    b       .L703
.L26:
    ldrb    w9, [sp, #0]
    movz    x10, #0x0061
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L27
    ldrb    w9, [sp, #0]
    movz    x10, #0x007a
    cmp     w9, w10
    cset    w11, ls
    cbz     w11, .L28
    movz    x9, #0x0001
    mov     w0, w9
    b       .L703
.L28:
.L27:
    ldrb    w9, [sp, #0]
    movz    x10, #0x0041
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L29
    ldrb    w9, [sp, #0]
    movz    x10, #0x005a
    cmp     w9, w10
    cset    w11, ls
    cbz     w11, .L30
    movz    x9, #0x0001
    mov     w0, w9
    b       .L703
.L30:
.L29:
    mov     x9, #0
    mov     w0, w9
    b       .L703
.L703:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _is_alnum
_is_alnum:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    strb    w0, [sp, #0]
    ldrb    w9, [sp, #0]
    mov     x0, x9
    bl      _is_alpha
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L31
    movz    x9, #0x0001
    mov     w0, w9
    b       .L704
.L31:
    ldrb    w9, [sp, #0]
    mov     x0, x9
    bl      _is_digit
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L32
    movz    x9, #0x0001
    mov     w0, w9
    b       .L704
.L32:
    mov     x9, #0
    mov     w0, w9
    b       .L704
.L704:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _peek
_peek:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L33
    mov     x9, #0
    mov     w0, w9
    b       .L705
.L33:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldrb    w9, [x11]
    mov     w0, w9
    b       .L705
.L705:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _peek1
_peek1:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #8]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L34
    mov     x9, #0
    mov     w0, w9
    b       .L706
.L34:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    add     x11, x9, x10
    ldrb    w9, [x11]
    mov     w0, w9
    b       .L706
.L706:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _skip_ws
_skip_ws:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #944
    str     x0, [sp, #0]
.L35:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L36
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldrb    w9, [x11]
    strb    w9, [sp, #8]
    ldrb    w9, [sp, #8]
    movz    x10, #0x0020
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L37
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    b       .L38
.L37:
    ldrb    w9, [sp, #8]
    movz    x10, #0x0009
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L39
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    b       .L40
.L39:
    ldrb    w9, [sp, #8]
    movz    x10, #0x000d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L41
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    b       .L42
.L41:
    ldrb    w9, [sp, #8]
    movz    x10, #0x000a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L43
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    b       .L44
.L43:
    ldrb    w9, [sp, #8]
    movz    x10, #0x002f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L45
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x002f
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L46
.L47:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L48
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldrb    w9, [x11]
    strb    w9, [sp, #16]
    ldrb    w9, [sp, #16]
    movz    x10, #0x000a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L49
    b       .L48
.L49:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    b       .L47
.L48:
    b       .L50
.L46:
    b       .L36
.L50:
    b       .L51
.L45:
    b       .L36
.L51:
.L44:
.L42:
.L40:
.L38:
    b       .L35
.L36:
.L707:
    add     sp, sp, #944
    ldp     x29, x30, [sp], #16
    ret

    .globl   _kw_kind
_kw_kind:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1296
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, L_str2@PAGE
    add     x9, x9, L_str2@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0003
    str     x9, [sp, #24]
    adrp    x9, L_str3@PAGE
    add     x9, x9, L_str3@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0003
    str     x9, [sp, #40]
    adrp    x9, L_str4@PAGE
    add     x9, x9, L_str4@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0005
    str     x9, [sp, #56]
    adrp    x9, L_str5@PAGE
    add     x9, x9, L_str5@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x0006
    str     x9, [sp, #72]
    adrp    x9, L_str6@PAGE
    add     x9, x9, L_str6@PAGEOFF
    str     x9, [sp, #80]
    movz    x9, #0x0002
    str     x9, [sp, #88]
    adrp    x9, L_str7@PAGE
    add     x9, x9, L_str7@PAGEOFF
    str     x9, [sp, #96]
    movz    x9, #0x0004
    str     x9, [sp, #104]
    adrp    x9, L_str8@PAGE
    add     x9, x9, L_str8@PAGEOFF
    str     x9, [sp, #112]
    movz    x9, #0x0004
    str     x9, [sp, #120]
    adrp    x9, L_str9@PAGE
    add     x9, x9, L_str9@PAGEOFF
    str     x9, [sp, #128]
    movz    x9, #0x0005
    str     x9, [sp, #136]
    adrp    x9, L_str10@PAGE
    add     x9, x9, L_str10@PAGEOFF
    str     x9, [sp, #144]
    movz    x9, #0x0005
    str     x9, [sp, #152]
    adrp    x9, L_str11@PAGE
    add     x9, x9, L_str11@PAGEOFF
    str     x9, [sp, #160]
    movz    x9, #0x0006
    str     x9, [sp, #168]
    adrp    x9, L_str12@PAGE
    add     x9, x9, L_str12@PAGEOFF
    str     x9, [sp, #176]
    movz    x9, #0x0003
    str     x9, [sp, #184]
    adrp    x9, L_str13@PAGE
    add     x9, x9, L_str13@PAGEOFF
    str     x9, [sp, #192]
    movz    x9, #0x0003
    str     x9, [sp, #200]
    adrp    x9, L_str14@PAGE
    add     x9, x9, L_str14@PAGEOFF
    str     x9, [sp, #208]
    movz    x9, #0x0006
    str     x9, [sp, #216]
    ldr     x9, [sp, #8]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L52
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L53
    movz    x9, #0x0001
    mov     w0, w9
    b       .L708
.L53:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    movz    x11, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L54
    movz    x9, #0x0002
    mov     w0, w9
    b       .L708
.L54:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #176]
    movz    x11, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L55
    movz    x9, #0x000b
    mov     w0, w9
    b       .L708
.L55:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #192]
    movz    x11, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L56
    movz    x9, #0x000c
    mov     w0, w9
    b       .L708
.L56:
.L52:
    ldr     x9, [sp, #8]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L57
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    movz    x11, #0x0005
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L58
    movz    x9, #0x0003
    mov     w0, w9
    b       .L708
.L58:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #128]
    movz    x11, #0x0005
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L59
    movz    x9, #0x0008
    mov     w0, w9
    b       .L708
.L59:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #144]
    movz    x11, #0x0005
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L60
    movz    x9, #0x0009
    mov     w0, w9
    b       .L708
.L60:
.L57:
    ldr     x9, [sp, #8]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L61
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    movz    x11, #0x0006
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L62
    movz    x9, #0x0004
    mov     w0, w9
    b       .L708
.L62:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #160]
    movz    x11, #0x0006
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L63
    movz    x9, #0x000a
    mov     w0, w9
    b       .L708
.L63:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #208]
    movz    x11, #0x0006
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L64
    movz    x9, #0x000d
    mov     w0, w9
    b       .L708
.L64:
.L61:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L65
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    movz    x11, #0x0002
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L66
    movz    x9, #0x0005
    mov     w0, w9
    b       .L708
.L66:
.L65:
    ldr     x9, [sp, #8]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L67
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    movz    x11, #0x0004
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L68
    movz    x9, #0x0006
    mov     w0, w9
    b       .L708
.L68:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #112]
    movz    x11, #0x0004
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L69
    movz    x9, #0x0007
    mov     w0, w9
    b       .L708
.L69:
.L67:
    movz    x9, #0x000e
    mov     w0, w9
    b       .L708
.L708:
    add     sp, sp, #1296
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lex_number
_lex_number:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #912
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x000f
    str     w9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    movz    x9, #0x000a
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldrb    w9, [x11]
    strb    w9, [sp, #24]
    ldrb    w9, [sp, #24]
    movz    x10, #0x0030
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L70
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x0078
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L71
    movz    x9, #0x0010
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
.L71:
.L70:
    mov     x9, #0
    str     x9, [sp, #32]
.L72:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L73
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldrb    w9, [x11]
    strb    w9, [sp, #40]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L74
    ldrb    w9, [sp, #40]
    mov     x0, x9
    bl      _is_hex
    mov     x10, x0
    mov     x9, #0
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L75
    b       .L73
.L75:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    mul     x16, x9, x10
    str     x16, [sp, #592]
    ldrb    w9, [sp, #40]
    mov     x0, x9
    bl      _hex_val
    mov     x10, x0
    ldr     x16, [sp, #592]
    add     x9, x16, x10
    str     x9, [sp, #32]
    b       .L76
.L74:
    ldrb    w9, [sp, #40]
    mov     x0, x9
    bl      _is_digit
    mov     x10, x0
    mov     x9, #0
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L77
    b       .L73
.L77:
    ldr     x9, [sp, #32]
    movz    x10, #0x000a
    mul     x11, x9, x10
    ldrb    w9, [sp, #40]
    movz    x10, #0x0030
    sub     w12, w9, w10
    add     x9, x11, x12
    str     x9, [sp, #32]
.L76:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    b       .L72
.L73:
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    ldr     x10, [sp, #8]
    movz    x12, #0x0008
    add     x13, x10, x12
    ldr     x10, [x13]
    sub     x12, x9, x10
    str     x12, [x11]
.L709:
    add     sp, sp, #912
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lex_ident
_lex_ident:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #560
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
.L78:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L79
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldrb    w9, [x11]
    mov     x0, x9
    bl      _is_alnum
    mov     x10, x0
    mov     x9, #0
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L80
    b       .L79
.L80:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    b       .L78
.L79:
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    ldr     x10, [sp, #8]
    movz    x12, #0x0008
    add     x13, x10, x12
    ldr     x10, [x13]
    sub     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x16, x9, x10
    str     x16, [sp, #432]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    mov     x0, x11
    mov     x1, x9
    bl      _kw_kind
    mov     x10, x0
    ldr     x17, [sp, #432]
    str     w10, [x17]
.L710:
    add     sp, sp, #560
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lex_string
_lex_string:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #704
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0010
    str     w9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
.L81:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L82
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldrb    w9, [x11]
    strb    w9, [sp, #16]
    ldrb    w9, [sp, #16]
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L83
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    b       .L82
.L83:
    ldrb    w9, [sp, #16]
    movz    x10, #0x005c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L84
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
    b       .L85
.L84:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
.L85:
    b       .L81
.L82:
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    ldr     x10, [sp, #8]
    movz    x12, #0x0008
    add     x13, x10, x12
    ldr     x10, [x13]
    sub     x12, x9, x10
    str     x12, [x11]
.L711:
    add     sp, sp, #704
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lex_next
_lex_next:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #3632
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _skip_ws
    str     x0, [sp, #32]
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L86
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    mov     x9, #0
    str     w9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    b       .L712
.L86:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldrb    w9, [x11]
    strb    w9, [sp, #16]
    ldrb    w9, [sp, #16]
    mov     x0, x9
    bl      _is_digit
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L87
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_number
    str     x0, [sp, #416]
    b       .L712
.L87:
    ldrb    w9, [sp, #16]
    mov     x0, x9
    bl      _is_alpha
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L88
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_ident
    str     x0, [sp, #472]
    b       .L712
.L88:
    ldrb    w9, [sp, #16]
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L89
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_string
    str     x0, [sp, #520]
    b       .L712
.L89:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L90
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003e
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L91
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0029
    str     w9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
    b       .L712
.L91:
.L90:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L92
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003d
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L93
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001f
    str     w9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
    b       .L712
.L93:
.L92:
    ldrb    w9, [sp, #16]
    movz    x10, #0x0021
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L94
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003d
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L95
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0020
    str     w9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
    b       .L712
.L95:
.L94:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L96
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003d
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L97
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0022
    str     w9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
    b       .L712
.L97:
.L96:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L98
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003d
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L99
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0024
    str     w9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
    b       .L712
.L99:
.L98:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L100
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003c
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L101
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x002b
    str     w9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
    b       .L712
.L101:
.L100:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L102
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003e
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L103
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x002c
    str     w9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
    b       .L712
.L103:
.L102:
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldrb    w9, [sp, #16]
    movz    x10, #0x0028
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L104
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0011
    str     w9, [x11]
    b       .L712
.L104:
    ldrb    w9, [sp, #16]
    movz    x10, #0x0029
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L105
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0012
    str     w9, [x11]
    b       .L712
.L105:
    ldrb    w9, [sp, #16]
    movz    x10, #0x007b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L106
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0013
    str     w9, [x11]
    b       .L712
.L106:
    ldrb    w9, [sp, #16]
    movz    x10, #0x007d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L107
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0014
    str     w9, [x11]
    b       .L712
.L107:
    ldrb    w9, [sp, #16]
    movz    x10, #0x005b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L108
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0015
    str     w9, [x11]
    b       .L712
.L108:
    ldrb    w9, [sp, #16]
    movz    x10, #0x005d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L109
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0016
    str     w9, [x11]
    b       .L712
.L109:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L110
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0017
    str     w9, [x11]
    b       .L712
.L110:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L111
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0018
    str     w9, [x11]
    b       .L712
.L111:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L112
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0019
    str     w9, [x11]
    b       .L712
.L112:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L113
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001a
    str     w9, [x11]
    b       .L712
.L113:
    ldrb    w9, [sp, #16]
    movz    x10, #0x0026
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L114
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001b
    str     w9, [x11]
    b       .L712
.L114:
    ldrb    w9, [sp, #16]
    movz    x10, #0x007c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L115
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001c
    str     w9, [x11]
    b       .L712
.L115:
    ldrb    w9, [sp, #16]
    movz    x10, #0x005e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L116
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001d
    str     w9, [x11]
    b       .L712
.L116:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L117
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001e
    str     w9, [x11]
    b       .L712
.L117:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L118
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0025
    str     w9, [x11]
    b       .L712
.L118:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L119
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0026
    str     w9, [x11]
    b       .L712
.L119:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L120
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0027
    str     w9, [x11]
    b       .L712
.L120:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L121
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0028
    str     w9, [x11]
    b       .L712
.L121:
    ldrb    w9, [sp, #16]
    movz    x10, #0x0040
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L122
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x002a
    str     w9, [x11]
    b       .L712
.L122:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L123
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0021
    str     w9, [x11]
    b       .L712
.L123:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L124
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0023
    str     w9, [x11]
    b       .L712
.L124:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    mov     x9, #0
    str     w9, [x11]
.L712:
    add     sp, sp, #3632
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_prim
_mk_prim:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L713
.L713:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_ptr
_mk_ptr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0003
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L714
.L714:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _type_width
_type_width:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #464
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L125
    movz    x9, #0x0001
    mov     x0, x9
    b       .L715
.L125:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L126
    movz    x9, #0x0004
    mov     x0, x9
    b       .L715
.L126:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L127
    movz    x9, #0x0008
    mov     x0, x9
    b       .L715
.L127:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L128
    movz    x9, #0x0008
    mov     x0, x9
    b       .L715
.L128:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L129
    movz    x9, #0x0010
    mov     x0, x9
    b       .L715
.L129:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L130
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L131
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    mul     x11, x9, x10
    mov     x0, x11
    b       .L715
.L131:
.L130:
    movz    x9, #0x0008
    mov     x0, x9
    b       .L715
.L715:
    add     sp, sp, #464
    ldp     x29, x30, [sp], #16
    ret

    .globl   _die_here
_die_here:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0020
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #80]
.L716:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cur_func_set
_cur_func_set:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _CUR_FUNC@PAGE
    add     x9, x9, _CUR_FUNC@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    str     x9, [x10]
.L717:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cur_func
_cur_func:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _CUR_FUNC@PAGE
    add     x9, x9, _CUR_FUNC@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L718
.L718:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cur_prog_set
_cur_prog_set:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _CUR_PROG@PAGE
    add     x9, x9, _CUR_PROG@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    str     x9, [x10]
.L719:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cur_prog
_cur_prog:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _CUR_PROG@PAGE
    add     x9, x9, _CUR_PROG@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L720
.L720:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _bytes_eq_off
_bytes_eq_off:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L132
    mov     x9, #0
    mov     w0, w9
    b       .L721
.L132:
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x12, x9, x10
    ldr     x9, [x12]
    ldr     x10, [sp, #16]
    add     x12, x9, x10
    ldr     x9, [sp, #8]
    mov     x0, x11
    mov     x1, x12
    mov     x2, x9
    bl      _bytes_eq
    mov     x10, x0
    mov     w0, w10
    b       .L721
.L721:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _add_local
_add_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1184
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    str     x4, [sp, #32]
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #48]
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #56]
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #40]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #48]
    str     x9, [x10]
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    mov     x9, #0
    str     x9, [sp, #64]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L133
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L134
    movz    x9, #0x0001
    str     x9, [sp, #64]
.L134:
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L135
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #72]
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L136
    ldr     x9, [sp, #72]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L137
    ldr     x9, [sp, #72]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    sub     x11, x9, x10
    str     x11, [sp, #64]
.L137:
.L136:
.L135:
.L133:
    mov     x9, #0
    str     x9, [sp, #80]
.L138:
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #64]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L139
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #88]
    ldr     x9, [sp, #88]
    mov     x10, #0
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #88]
    movz    x10, #0x0010
    add     x16, x9, x10
    str     x16, [sp, #808]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #808]
    str     x11, [x17]
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L140
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #80]
    movz    x11, #0x0001
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _struct_field_type
    mov     x10, x0
    str     x10, [sp, #96]
    ldr     x9, [sp, #96]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L141
    ldr     x9, [sp, #88]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
.L141:
.L140:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #8]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #88]
    str     x9, [x10]
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #80]
    b       .L138
.L139:
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L722
.L722:
    add     sp, sp, #1184
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lookup_local
_lookup_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #352
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    str     x9, [sp, #32]
.L142:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L143
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    sub     x11, x9, x10
    str     x11, [sp, #32]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #48]
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #48]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    ldr     x12, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_off
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L144
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L723
.L144:
    b       .L142
.L143:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L723
.L723:
    add     sp, sp, #352
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lookup_const
_lookup_const:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L145:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L146
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #24]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    ldr     x12, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_off
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L147
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L724
.L147:
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L145
.L146:
    mov     x9, #0
    mov     x0, x9
    b       .L724
.L724:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lookup_bss
_lookup_bss:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L148:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L149
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #24]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    ldr     x12, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_off
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L150
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L725
.L150:
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L148
.L149:
    mov     x9, #0
    mov     x0, x9
    b       .L725
.L725:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lookup_struct
_lookup_struct:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L151:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L152
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #24]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    ldr     x12, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_off
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L153
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L726
.L153:
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L151
.L152:
    mov     x9, #0
    mov     x0, x9
    b       .L726
.L726:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _struct_field_index
_struct_field_index:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #304
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
.L154:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L155
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    ldr     x12, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_off
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L156
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L727
.L156:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L154
.L155:
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    b       .L727
.L727:
    add     sp, sp, #304
    ldp     x29, x30, [sp], #16
    ret

    .globl   _struct_field_type
_struct_field_type:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #224
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    mov     x9, #0
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L157:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L158
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L159
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    b       .L728
.L159:
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L157
.L158:
    mov     x9, #0
    mov     x0, x9
    b       .L728
.L728:
    add     sp, sp, #224
    ldp     x29, x30, [sp], #16
    ret

    .globl   _str_table_init
_str_table_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    adrp    x9, _STR_HEAD@PAGE
    add     x9, x9, _STR_HEAD@PAGEOFF
    str     x9, [sp, #0]
    adrp    x9, _STR_COUNT@PAGE
    add     x9, x9, _STR_COUNT@PAGEOFF
    str     x9, [sp, #8]
    adrp    x9, _STR_TAIL@PAGE
    add     x9, x9, _STR_TAIL@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    mov     x9, #0
    str     x9, [x10]
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    mov     x9, #0
    str     x9, [x10]
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    mov     x9, #0
    str     x9, [x10]
.L729:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _str_table_add
_str_table_add:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #656
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, _STR_COUNT@PAGE
    add     x9, x9, _STR_COUNT@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #40]
    ldr     x9, [sp, #40]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    adrp    x9, _STR_HEAD@PAGE
    add     x9, x9, _STR_HEAD@PAGEOFF
    str     x9, [sp, #48]
    adrp    x9, _STR_TAIL@PAGE
    add     x9, x9, _STR_TAIL@PAGEOFF
    str     x9, [sp, #56]
    ldr     x9, [sp, #48]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L160
    ldr     x9, [sp, #48]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #40]
    str     x9, [x10]
    ldr     x9, [sp, #56]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #40]
    str     x9, [x10]
    b       .L161
.L160:
    ldr     x9, [sp, #56]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #64]
    ldr     x9, [sp, #64]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    str     x9, [x11]
    ldr     x9, [sp, #56]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #40]
    str     x9, [x10]
.L161:
    ldr     x9, [sp, #24]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #32]
    movz    x11, #0x0001
    add     x12, x9, x11
    str     x12, [x10]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L730
.L730:
    add     sp, sp, #656
    ldp     x29, x30, [sp], #16
    ret

    .globl   _str_unescape
_str_unescape:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #848
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    movz    x11, #0x0008
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _arena_take
    mov     x10, x0
    str     x10, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L162:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L163
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    ldrb    w9, [x11]
    strb    w9, [sp, #56]
    ldrb    w9, [sp, #56]
    movz    x10, #0x005c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L164
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    ldrb    w9, [x11]
    strb    w9, [sp, #64]
    mov     x9, #0
    str     x9, [sp, #72]
    ldrb    w9, [sp, #64]
    movz    x10, #0x006e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L165
    movz    x9, #0x000a
    str     x9, [sp, #72]
.L165:
    ldrb    w9, [sp, #64]
    movz    x10, #0x0074
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L166
    movz    x9, #0x0009
    str     x9, [sp, #72]
.L166:
    ldrb    w9, [sp, #64]
    movz    x10, #0x005c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L167
    movz    x9, #0x005c
    str     x9, [sp, #72]
.L167:
    ldrb    w9, [sp, #64]
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L168
    movz    x9, #0x0027
    str     x9, [sp, #72]
.L168:
    ldrb    w9, [sp, #64]
    movz    x10, #0x0078
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L169
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    movz    x11, #0x0001
    add     x12, x10, x11
    add     x10, x9, x12
    ldrb    w9, [x10]
    mov     x0, x9
    bl      _hex_val
    mov     x10, x0
    str     x10, [sp, #80]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    movz    x11, #0x0002
    add     x12, x10, x11
    add     x10, x9, x12
    ldrb    w9, [x10]
    mov     x0, x9
    bl      _hex_val
    mov     x10, x0
    str     x10, [sp, #88]
    ldr     x9, [sp, #80]
    movz    x10, #0x0010
    mul     x11, x9, x10
    ldr     x9, [sp, #88]
    add     x10, x11, x9
    str     x10, [sp, #72]
    ldr     x9, [sp, #40]
    movz    x10, #0x0002
    add     x11, x9, x10
    str     x11, [sp, #40]
.L169:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #48]
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    strb    w9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L170
.L164:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #48]
    add     x11, x9, x10
    ldrb    w9, [sp, #56]
    strb    w9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #48]
.L170:
    b       .L162
.L163:
    ldr     x9, [sp, #8]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    str     x9, [x11]
.L731:
    add     sp, sp, #848
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ps_init
_ps_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #112
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    ldr     x11, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lex_init
    str     x0, [sp, #64]
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_next
    str     x0, [sp, #96]
.L732:
    add     sp, sp, #112
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ps_advance
_ps_advance:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #0]
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_next
    str     x0, [sp, #48]
.L733:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ps_kind
_ps_kind:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     w9, [x11]
    mov     w0, w9
    b       .L734
.L734:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_expr
_mk_expr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #608
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0088
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0030
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0038
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0048
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0050
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0058
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0060
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0068
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0070
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0078
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0080
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L735
.L735:
    add     sp, sp, #608
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_primary
_parse_primary:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #3024
    str     x0, [sp, #0]
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     w9, [x11]
    str     w9, [sp, #16]
    ldr     w9, [sp, #16]
    movz    x10, #0x000f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L171
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #432]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #432]
    str     x11, [x17]
    bl      _ps_advance
    str     x0, [sp, #464]
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L736
.L171:
    ldr     w9, [sp, #16]
    movz    x10, #0x000c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L172
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #576]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #576]
    str     x11, [x17]
    bl      _ps_advance
    str     x0, [sp, #608]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L736
.L172:
    ldr     w9, [sp, #16]
    movz    x10, #0x000d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L173
    bl      _ps_advance
    str     x0, [sp, #648]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #664]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    str     x10, [sp, #40]
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #696]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #48]
    ldr     x9, [sp, #48]
    movz    x10, #0x0010
    add     x16, x9, x10
    str     x16, [sp, #744]
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    ldr     x17, [sp, #744]
    str     x10, [x17]
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #784]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #784]
    str     x11, [x17]
    ldr     x9, [sp, #48]
    mov     x0, x9
    b       .L736
.L173:
    ldr     w9, [sp, #16]
    movz    x10, #0x0011
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L174
    bl      _ps_advance
    str     x0, [sp, #848]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #56]
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #888]
    ldr     x9, [sp, #56]
    mov     x0, x9
    b       .L736
.L174:
    ldr     w9, [sp, #16]
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L175
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #64]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #72]
    bl      _ps_advance
    str     x0, [sp, #992]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0011
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L176
    bl      _ps_advance
    str     x0, [sp, #1024]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #80]
    ldr     x9, [sp, #80]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    ldr     x9, [sp, #80]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #88]
    ldr     x9, [sp, #80]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    str     x9, [x11]
    mov     x9, #0
    str     x9, [sp, #96]
.L177:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L178
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #104]
    ldr     x9, [sp, #96]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L179
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #104]
    str     x9, [x10]
.L179:
    ldr     x9, [sp, #96]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #96]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L180
    movz    x9, #0x0026
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1360]
.L180:
    b       .L177
.L178:
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1376]
    ldr     x9, [sp, #96]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L181
    adrp    x9, L_str15@PAGE
    add     x9, x9, L_str15@PAGEOFF
    str     x9, [sp, #112]
    movz    x9, #0x0014
    str     x9, [sp, #120]
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #120]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #1440]
.L181:
    ldr     x9, [sp, #80]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
    adrp    x9, L_str16@PAGE
    add     x9, x9, L_str16@PAGEOFF
    str     x9, [sp, #128]
    movz    x9, #0x0007
    str     x9, [sp, #136]
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #128]
    movz    x12, #0x0007
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_at
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L182
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1568]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1568]
    str     x11, [x17]
    b       .L183
.L182:
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1616]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1616]
    str     x11, [x17]
.L183:
    ldr     x9, [sp, #80]
    mov     x0, x9
    b       .L736
.L176:
    bl      _cur_func
    mov     x9, x0
    str     x9, [sp, #144]
    ldr     x9, [sp, #144]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L184
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lookup_local
    mov     x12, x0
    str     x12, [sp, #152]
    ldr     x9, [sp, #152]
    ldr     x10, [sp, #144]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L185
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #160]
    ldr     x9, [sp, #160]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [sp, #152]
    str     x9, [x11]
    ldr     x9, [sp, #144]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #168]
    ldr     x9, [sp, #168]
    ldr     x10, [sp, #152]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #176]
    ldr     x9, [sp, #160]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #176]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    mov     x0, x9
    b       .L736
.L185:
.L184:
    bl      _cur_prog
    mov     x9, x0
    str     x9, [sp, #184]
    ldr     x9, [sp, #184]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L186
    ldr     x9, [sp, #184]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lookup_const
    mov     x12, x0
    str     x12, [sp, #192]
    ldr     x9, [sp, #192]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L187
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #200]
    ldr     x9, [sp, #200]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #192]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #200]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #192]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #200]
    mov     x0, x9
    b       .L736
.L187:
    ldr     x9, [sp, #184]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lookup_bss
    mov     x12, x0
    str     x12, [sp, #208]
    ldr     x9, [sp, #208]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L188
    ldr     x9, [sp, #0]
    movz    x10, #0x000d
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #216]
    ldr     x9, [sp, #216]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    ldr     x9, [sp, #216]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #216]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2424]
    ldr     x16, [sp, #0]
    str     x16, [sp, #2432]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #2432]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x17, [sp, #2424]
    str     x9, [x17]
    ldr     x9, [sp, #216]
    mov     x0, x9
    b       .L736
.L188:
.L186:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #224]
    ldr     x9, [sp, #224]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    ldr     x9, [sp, #224]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #224]
    mov     x0, x9
    b       .L736
.L175:
    ldr     w9, [sp, #16]
    movz    x10, #0x0010
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L189
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #232]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #240]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #248]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #248]
    ldr     x11, [sp, #240]
    mov     x12, #0
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #232]
    movz    x13, #0x0008
    add     x14, x12, x13
    ldr     x12, [x14]
    add     x13, x11, x12
    movz    x11, #0x0001
    add     x12, x13, x11
    ldr     x11, [sp, #232]
    movz    x13, #0x0010
    add     x14, x11, x13
    ldr     x11, [x14]
    movz    x13, #0x0002
    sub     x14, x11, x13
    mov     x0, x9
    mov     x1, x10
    mov     x2, x12
    mov     x3, x14
    bl      _str_unescape
    str     x0, [sp, #2792]
    ldr     x9, [sp, #248]
    movz    x10, #0x0080
    add     x16, x9, x10
    str     x16, [sp, #2816]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #248]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #248]
    movz    x12, #0x0070
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _str_table_add
    mov     x12, x0
    ldr     x17, [sp, #2816]
    str     x12, [x17]
    ldr     x9, [sp, #248]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2920]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #2920]
    str     x11, [x17]
    bl      _ps_advance
    str     x0, [sp, #2952]
    ldr     x9, [sp, #248]
    mov     x0, x9
    b       .L736
.L189:
    adrp    x9, L_str17@PAGE
    add     x9, x9, L_str17@PAGEOFF
    str     x9, [sp, #256]
    movz    x9, #0x001b
    str     x9, [sp, #264]
    ldr     x9, [sp, #256]
    ldr     x10, [sp, #264]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #3000]
    mov     x9, #0
    mov     x0, x9
    b       .L736
.L736:
    add     sp, sp, #3024
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_postfix
_parse_postfix:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #3408
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_primary
    mov     x10, x0
    str     x10, [sp, #8]
.L190:
    movz    x9, #0x0001
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L191
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #16]
    ldr     w9, [sp, #16]
    movz    x10, #0x0028
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L192
    bl      _ps_advance
    str     x0, [sp, #424]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L193
    adrp    x9, L_str18@PAGE
    add     x9, x9, L_str18@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0020
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #488]
.L193:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #56]
    bl      _ps_advance
    str     x0, [sp, #568]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #64]
    mov     x9, #0
    str     x9, [sp, #72]
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L194
    ldr     x9, [sp, #64]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L195
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L196
    adrp    x9, L_str19@PAGE
    add     x9, x9, L_str19@PAGEOFF
    str     x9, [sp, #80]
    movz    x9, #0x0003
    str     x9, [sp, #88]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #80]
    movz    x12, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_at
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L197
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #96]
    ldr     x9, [sp, #96]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #96]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #904]
    ldr     x16, [sp, #0]
    str     x16, [sp, #912]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #912]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x17, [sp, #904]
    str     x9, [x17]
    ldr     x9, [sp, #96]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #72]
.L197:
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L198
    adrp    x9, L_str20@PAGE
    add     x9, x9, L_str20@PAGEOFF
    str     x9, [sp, #104]
    movz    x9, #0x0003
    str     x9, [sp, #112]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #104]
    movz    x12, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_at
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L199
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #120]
    ldr     x9, [sp, #120]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #120]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1176]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1176]
    str     x11, [x17]
    ldr     x9, [sp, #120]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #72]
.L199:
.L198:
.L196:
.L195:
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L200
    ldr     x9, [sp, #64]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L201
    ldr     x9, [sp, #64]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #128]
    ldr     x9, [sp, #128]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L202
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L203
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _struct_field_index
    mov     x12, x0
    str     x12, [sp, #136]
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #128]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L204
    adrp    x9, L_str21@PAGE
    add     x9, x9, L_str21@PAGEOFF
    str     x9, [sp, #144]
    movz    x9, #0x001b
    str     x9, [sp, #152]
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #152]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #1512]
.L204:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #160]
    ldr     x9, [sp, #160]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    ldr     x10, [sp, #136]
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1632]
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    bl      _struct_field_type
    mov     x11, x0
    ldr     x17, [sp, #1632]
    str     x11, [x17]
    ldr     x9, [sp, #160]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #72]
.L203:
.L202:
.L201:
.L200:
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L205
    ldr     x9, [sp, #64]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L206
    ldr     x9, [sp, #64]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #168]
    ldr     x9, [sp, #168]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L207
    ldr     x9, [sp, #168]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L208
    ldr     x9, [sp, #168]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #176]
    ldr     x9, [sp, #176]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L209
    ldr     x9, [sp, #176]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _struct_field_index
    mov     x12, x0
    str     x12, [sp, #184]
    ldr     x9, [sp, #184]
    ldr     x10, [sp, #176]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L210
    adrp    x9, L_str22@PAGE
    add     x9, x9, L_str22@PAGEOFF
    str     x9, [sp, #192]
    movz    x9, #0x001b
    str     x9, [sp, #200]
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #200]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2024]
.L210:
    ldr     x9, [sp, #176]
    ldr     x10, [sp, #184]
    mov     x0, x9
    mov     x1, x10
    bl      _struct_field_type
    mov     x11, x0
    str     x11, [sp, #208]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #216]
    ldr     x9, [sp, #216]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #184]
    movz    x10, #0x0008
    mul     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #216]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2144]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #2144]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #224]
    ldr     x9, [sp, #224]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #224]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #224]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #216]
    str     x9, [x11]
    ldr     x9, [sp, #224]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2312]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #208]
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ptr
    mov     x11, x0
    ldr     x17, [sp, #2312]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #232]
    ldr     x9, [sp, #232]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #224]
    str     x9, [x11]
    ldr     x9, [sp, #232]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #208]
    str     x9, [x11]
    ldr     x9, [sp, #232]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #72]
.L209:
.L208:
.L207:
.L206:
.L205:
.L194:
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L211
    adrp    x9, L_str23@PAGE
    add     x9, x9, L_str23@PAGEOFF
    str     x9, [sp, #240]
    movz    x9, #0x0014
    str     x9, [sp, #248]
    ldr     x9, [sp, #240]
    ldr     x10, [sp, #248]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2504]
.L211:
    b       .L212
.L192:
    ldr     w9, [sp, #16]
    movz    x10, #0x0015
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L213
    bl      _ps_advance
    str     x0, [sp, #2536]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #256]
    movz    x9, #0x0016
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #2576]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #264]
    ldr     x9, [sp, #264]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L214
    adrp    x9, L_str24@PAGE
    add     x9, x9, L_str24@PAGEOFF
    str     x9, [sp, #272]
    movz    x9, #0x001e
    str     x9, [sp, #280]
    ldr     x9, [sp, #272]
    ldr     x10, [sp, #280]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2672]
.L214:
    ldr     x9, [sp, #264]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L215
    adrp    x9, L_str25@PAGE
    add     x9, x9, L_str25@PAGEOFF
    str     x9, [sp, #288]
    movz    x9, #0x0016
    str     x9, [sp, #296]
    ldr     x9, [sp, #288]
    ldr     x10, [sp, #296]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2760]
.L215:
    ldr     x9, [sp, #264]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    str     x10, [sp, #304]
    ldr     x9, [sp, #256]
    str     x9, [sp, #312]
    ldr     x9, [sp, #304]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L216
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #320]
    ldr     x9, [sp, #320]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #304]
    str     x9, [x11]
    ldr     x9, [sp, #320]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2912]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #2912]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #328]
    ldr     x9, [sp, #328]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #328]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #256]
    str     x9, [x11]
    ldr     x9, [sp, #328]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #320]
    str     x9, [x11]
    ldr     x9, [sp, #328]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #3080]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #3080]
    str     x11, [x17]
    ldr     x9, [sp, #328]
    str     x9, [sp, #312]
.L216:
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #336]
    ldr     x9, [sp, #336]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #336]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #336]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #312]
    str     x9, [x11]
    ldr     x9, [sp, #336]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #264]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #344]
    ldr     x9, [sp, #344]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #336]
    str     x9, [x11]
    ldr     x9, [sp, #344]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #264]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #344]
    str     x9, [sp, #8]
    b       .L217
.L213:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L737
.L217:
.L212:
    b       .L190
.L191:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L737
.L737:
    add     sp, sp, #3408
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_unary
_parse_unary:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #544
    str     x0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #8]
    ldr     w9, [sp, #8]
    movz    x10, #0x002a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L218
    bl      _ps_advance
    str     x0, [sp, #88]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_unary
    mov     x10, x0
    str     x10, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #24]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L219
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L220
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
.L220:
.L219:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L738
.L218:
    ldr     w9, [sp, #8]
    movz    x10, #0x001b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L221
    bl      _ps_advance
    str     x0, [sp, #360]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_unary
    mov     x10, x0
    str     x10, [sp, #40]
    ldr     x9, [sp, #0]
    movz    x10, #0x000c
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #48]
    ldr     x9, [sp, #48]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #456]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ptr
    mov     x11, x0
    ldr     x17, [sp, #456]
    str     x11, [x17]
    ldr     x9, [sp, #48]
    mov     x0, x9
    b       .L738
.L221:
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_postfix
    mov     x10, x0
    mov     x0, x10
    b       .L738
.L738:
    add     sp, sp, #544
    ldp     x29, x30, [sp], #16
    ret

    .globl   _bin_prec
_bin_prec:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #496
    str     w0, [sp, #0]
    ldr     w9, [sp, #0]
    movz    x10, #0x0017
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L222
    movz    x9, #0x0006
    mov     x0, x9
    b       .L739
.L222:
    ldr     w9, [sp, #0]
    movz    x10, #0x001a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L223
    movz    x9, #0x0006
    mov     x0, x9
    b       .L739
.L223:
    ldr     w9, [sp, #0]
    movz    x10, #0x0018
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L224
    movz    x9, #0x0005
    mov     x0, x9
    b       .L739
.L224:
    ldr     w9, [sp, #0]
    movz    x10, #0x0019
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L225
    movz    x9, #0x0005
    mov     x0, x9
    b       .L739
.L225:
    ldr     w9, [sp, #0]
    movz    x10, #0x002b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L226
    movz    x9, #0x0005
    mov     x0, x9
    b       .L739
.L226:
    ldr     w9, [sp, #0]
    movz    x10, #0x002c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L227
    movz    x9, #0x0005
    mov     x0, x9
    b       .L739
.L227:
    ldr     w9, [sp, #0]
    movz    x10, #0x001b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L228
    movz    x9, #0x0004
    mov     x0, x9
    b       .L739
.L228:
    ldr     w9, [sp, #0]
    movz    x10, #0x001d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L229
    movz    x9, #0x0003
    mov     x0, x9
    b       .L739
.L229:
    ldr     w9, [sp, #0]
    movz    x10, #0x001c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L230
    movz    x9, #0x0002
    mov     x0, x9
    b       .L739
.L230:
    ldr     w9, [sp, #0]
    movz    x10, #0x001f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L231
    movz    x9, #0x0001
    mov     x0, x9
    b       .L739
.L231:
    ldr     w9, [sp, #0]
    movz    x10, #0x0020
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L232
    movz    x9, #0x0001
    mov     x0, x9
    b       .L739
.L232:
    ldr     w9, [sp, #0]
    movz    x10, #0x0021
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L233
    movz    x9, #0x0001
    mov     x0, x9
    b       .L739
.L233:
    ldr     w9, [sp, #0]
    movz    x10, #0x0022
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L234
    movz    x9, #0x0001
    mov     x0, x9
    b       .L739
.L234:
    ldr     w9, [sp, #0]
    movz    x10, #0x0023
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L235
    movz    x9, #0x0001
    mov     x0, x9
    b       .L739
.L235:
    ldr     w9, [sp, #0]
    movz    x10, #0x0024
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L236
    movz    x9, #0x0001
    mov     x0, x9
    b       .L739
.L236:
    mov     x9, #0
    mov     x0, x9
    b       .L739
.L739:
    add     sp, sp, #496
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_expr
_parse_expr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1280
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_unary
    mov     x10, x0
    str     x10, [sp, #16]
.L237:
    bl      _ps_kind
    mov     x9, x0
    mov     x0, x9
    bl      _bin_prec
    mov     x10, x0
    ldr     x9, [sp, #8]
    cmp     w10, w9
    cset    w11, hs
    cbz     w11, .L238
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #24]
    ldr     w9, [sp, #24]
    mov     x0, x9
    bl      _bin_prec
    mov     x10, x0
    str     x10, [sp, #32]
    bl      _ps_advance
    str     x0, [sp, #128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    movz    x11, #0x0001
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _parse_expr
    mov     x10, x0
    str     x10, [sp, #40]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #48]
    ldr     w9, [sp, #24]
    movz    x10, #0x0017
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L239
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
.L239:
    ldr     w9, [sp, #24]
    movz    x10, #0x001a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L240
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0003
    str     x9, [x11]
.L240:
    ldr     w9, [sp, #24]
    movz    x10, #0x0018
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L241
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
.L241:
    ldr     w9, [sp, #24]
    movz    x10, #0x0019
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L242
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
.L242:
    ldr     w9, [sp, #24]
    movz    x10, #0x001b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L243
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0004
    str     x9, [x11]
.L243:
    ldr     w9, [sp, #24]
    movz    x10, #0x001d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L244
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0006
    str     x9, [x11]
.L244:
    ldr     w9, [sp, #24]
    movz    x10, #0x001c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L245
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0005
    str     x9, [x11]
.L245:
    ldr     w9, [sp, #24]
    movz    x10, #0x002b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L246
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0007
    str     x9, [x11]
.L246:
    ldr     w9, [sp, #24]
    movz    x10, #0x002c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L247
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
.L247:
    ldr     w9, [sp, #24]
    movz    x10, #0x001f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L248
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0005
    str     x9, [x11]
.L248:
    ldr     w9, [sp, #24]
    movz    x10, #0x0020
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L249
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0006
    str     x9, [x11]
.L249:
    ldr     w9, [sp, #24]
    movz    x10, #0x0021
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L250
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0007
    str     x9, [x11]
.L250:
    ldr     w9, [sp, #24]
    movz    x10, #0x0022
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L251
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
.L251:
    ldr     w9, [sp, #24]
    movz    x10, #0x0023
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L252
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0009
    str     x9, [x11]
.L252:
    ldr     w9, [sp, #24]
    movz    x10, #0x0024
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L253
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x000a
    str     x9, [x11]
.L253:
    ldr     x9, [sp, #48]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L254
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    b       .L255
.L254:
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1224]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1224]
    str     x11, [x17]
.L255:
    ldr     x9, [sp, #48]
    str     x9, [sp, #16]
    b       .L237
.L238:
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L740
.L740:
    add     sp, sp, #1280
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_stmt
_mk_stmt:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #448
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0060
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0030
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0038
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0048
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0050
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0058
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L741
.L741:
    add     sp, sp, #448
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ps_expect
_ps_expect:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     w0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    ldr     w10, [sp, #0]
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L256
    adrp    x9, L_str26@PAGE
    add     x9, x9, L_str26@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x0011
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #80]
.L256:
    bl      _ps_advance
    str     x0, [sp, #88]
.L742:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ps_accept
_ps_accept:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     w0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    ldr     w10, [sp, #0]
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L257
    bl      _ps_advance
    str     x0, [sp, #32]
    movz    x9, #0x0001
    mov     w0, w9
    b       .L743
.L257:
    mov     x9, #0
    mov     w0, w9
    b       .L743
.L743:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _bytes_eq_at
_bytes_eq_at:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L258
    mov     x9, #0
    mov     w0, w9
    b       .L744
.L258:
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #0]
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    mov     x0, x11
    mov     x1, x9
    mov     x2, x10
    bl      _bytes_eq
    mov     x12, x0
    mov     w0, w12
    b       .L744
.L744:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_type
_parse_type:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1072
    str     x0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0017
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L259
    bl      _ps_advance
    str     x0, [sp, #152]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    str     x10, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ptr
    mov     x11, x0
    mov     x0, x11
    b       .L745
.L259:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L260
    adrp    x9, L_str27@PAGE
    add     x9, x9, L_str27@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0010
    str     x9, [sp, #24]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #256]
.L260:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #32]
    adrp    x9, L_str28@PAGE
    add     x9, x9, L_str28@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0002
    str     x9, [sp, #48]
    adrp    x9, L_str29@PAGE
    add     x9, x9, L_str29@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0003
    str     x9, [sp, #64]
    adrp    x9, L_str30@PAGE
    add     x9, x9, L_str30@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x0003
    str     x9, [sp, #80]
    adrp    x9, L_str31@PAGE
    add     x9, x9, L_str31@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x0003
    str     x9, [sp, #96]
    mov     x9, #0
    str     x9, [sp, #104]
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #40]
    movz    x12, #0x0002
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_at
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L261
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #104]
.L261:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #56]
    movz    x12, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_at
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L262
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #104]
.L262:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #72]
    movz    x12, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_at
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L263
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #104]
.L263:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #88]
    movz    x12, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_at
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L264
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #104]
.L264:
    ldr     x9, [sp, #104]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L265
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #104]
    bl      _cur_prog
    mov     x9, x0
    str     x9, [sp, #112]
    ldr     x9, [sp, #112]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L266
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #32]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lookup_struct
    mov     x12, x0
    str     x12, [sp, #120]
    ldr     x9, [sp, #104]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #120]
    str     x9, [x11]
.L266:
.L265:
    bl      _ps_advance
    str     x0, [sp, #1048]
    ldr     x9, [sp, #104]
    mov     x0, x9
    b       .L745
.L745:
    add     sp, sp, #1072
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_block
_parse_block:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    movz    x9, #0x0013
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #8]
    mov     x9, #0
    str     x9, [sp, #16]
.L267:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0014
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L268
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_stmt
    mov     x10, x0
    str     x10, [sp, #24]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L269
    ldr     x9, [sp, #24]
    str     x9, [sp, #8]
    b       .L270
.L269:
    ldr     x9, [sp, #16]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
.L270:
    ldr     x9, [sp, #24]
    str     x9, [sp, #16]
.L271:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0025
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L272
    bl      _ps_advance
    str     x0, [sp, #200]
    b       .L271
.L272:
    b       .L267
.L268:
    movz    x9, #0x0014
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #216]
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L746
.L746:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_stmt
_parse_stmt:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #2128
    str     x0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #8]
    ldr     w9, [sp, #8]
    movz    x10, #0x0002
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L273
    bl      _ps_advance
    str     x0, [sp, #176]
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #16]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L274
    adrp    x9, L_str32@PAGE
    add     x9, x9, L_str32@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x001a
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #248]
.L274:
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #392]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L275
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x16, x9, x10
    str     x16, [sp, #448]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #448]
    str     x10, [x17]
.L275:
    movz    x9, #0x001e
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L276
    ldr     x9, [sp, #40]
    movz    x10, #0x0020
    add     x16, x9, x10
    str     x16, [sp, #520]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #520]
    str     x11, [x17]
.L276:
    bl      _cur_func
    mov     x9, x0
    str     x9, [sp, #48]
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L277
    ldr     x9, [sp, #40]
    movz    x10, #0x0058
    add     x16, x9, x10
    str     x16, [sp, #600]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #40]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #40]
    movz    x13, #0x0010
    add     x14, x12, x13
    ldr     x12, [x14]
    ldr     x13, [sp, #40]
    movz    x14, #0x0018
    add     x15, x13, x14
    ldr     x13, [x15]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    mov     x4, x13
    bl      _add_local
    mov     x14, x0
    ldr     x17, [sp, #600]
    str     x14, [x17]
.L277:
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L747
.L273:
    ldr     w9, [sp, #8]
    movz    x10, #0x0004
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L278
    bl      _ps_advance
    str     x0, [sp, #760]
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #56]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0025
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L279
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0014
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L280
    ldr     x9, [sp, #56]
    movz    x10, #0x0040
    add     x16, x9, x10
    str     x16, [sp, #856]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #856]
    str     x11, [x17]
.L280:
.L279:
    ldr     x9, [sp, #56]
    mov     x0, x9
    b       .L747
.L278:
    ldr     w9, [sp, #8]
    movz    x10, #0x0005
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L281
    bl      _ps_advance
    str     x0, [sp, #920]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    str     w10, [sp, #64]
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #72]
    ldr     x9, [sp, #72]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #984]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #984]
    str     x11, [x17]
    ldr     w9, [sp, #64]
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L282
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1048]
.L282:
    ldr     x9, [sp, #72]
    movz    x10, #0x0030
    add     x16, x9, x10
    str     x16, [sp, #1072]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1072]
    str     x10, [x17]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0006
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L283
    bl      _ps_advance
    str     x0, [sp, #1120]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0005
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L284
    ldr     x9, [sp, #72]
    movz    x10, #0x0038
    add     x16, x9, x10
    str     x16, [sp, #1168]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_stmt
    mov     x10, x0
    ldr     x17, [sp, #1168]
    str     x10, [x17]
    b       .L285
.L284:
    ldr     x9, [sp, #72]
    movz    x10, #0x0038
    add     x16, x9, x10
    str     x16, [sp, #1208]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1208]
    str     x10, [x17]
.L285:
.L283:
    ldr     x9, [sp, #72]
    mov     x0, x9
    b       .L747
.L281:
    ldr     w9, [sp, #8]
    movz    x10, #0x0008
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L286
    bl      _ps_advance
    str     x0, [sp, #1264]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    str     w10, [sp, #80]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #88]
    ldr     x9, [sp, #88]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #1328]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #1328]
    str     x11, [x17]
    ldr     w9, [sp, #80]
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L287
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1392]
.L287:
    ldr     x9, [sp, #88]
    movz    x10, #0x0030
    add     x16, x9, x10
    str     x16, [sp, #1416]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1416]
    str     x10, [x17]
    ldr     x9, [sp, #88]
    mov     x0, x9
    b       .L747
.L286:
    ldr     w9, [sp, #8]
    movz    x10, #0x0007
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L288
    bl      _ps_advance
    str     x0, [sp, #1472]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #96]
    ldr     x9, [sp, #96]
    movz    x10, #0x0030
    add     x16, x9, x10
    str     x16, [sp, #1520]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1520]
    str     x10, [x17]
    ldr     x9, [sp, #96]
    mov     x0, x9
    b       .L747
.L288:
    ldr     w9, [sp, #8]
    movz    x10, #0x0009
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L289
    bl      _ps_advance
    str     x0, [sp, #1576]
    ldr     x9, [sp, #0]
    movz    x10, #0x0006
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    mov     x0, x11
    b       .L747
.L289:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #104]
    movz    x9, #0x001e
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L290
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #112]
    ldr     x9, [sp, #104]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L291
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #120]
    ldr     x9, [sp, #120]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #104]
    movz    x10, #0x0028
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #120]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #112]
    str     x9, [x11]
    ldr     x9, [sp, #120]
    mov     x0, x9
    b       .L747
.L291:
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #128]
    ldr     x9, [sp, #128]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #104]
    str     x9, [x11]
    ldr     x9, [sp, #128]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #112]
    str     x9, [x11]
    ldr     x9, [sp, #104]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L292
    ldr     x9, [sp, #128]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #104]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
.L292:
    ldr     x9, [sp, #128]
    mov     x0, x9
    b       .L747
.L290:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #136]
    ldr     x9, [sp, #136]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #104]
    str     x9, [x11]
    ldr     x9, [sp, #136]
    mov     x0, x9
    b       .L747
.L747:
    add     sp, sp, #2128
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_program
_mk_program:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L748
.L748:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_fun
_parse_fun:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1584
    str     x0, [sp, #0]
    movz    x9, #0x0001
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #104]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L293
    adrp    x9, L_str33@PAGE
    add     x9, x9, L_str33@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x001a
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #168]
.L293:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0028
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0030
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0038
    add     x16, x9, x10
    str     x16, [sp, #496]
    ldr     x9, [sp, #0]
    movz    x10, #0x0800
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    ldr     x17, [sp, #496]
    str     x11, [x17]
    ldr     x9, [sp, #32]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #32]
    mov     x0, x9
    bl      _cur_func_set
    str     x0, [sp, #568]
    bl      _ps_advance
    str     x0, [sp, #576]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #592]
    mov     x9, #0
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L294:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L295
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L296
    adrp    x9, L_str34@PAGE
    add     x9, x9, L_str34@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0020
    str     x9, [sp, #64]
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #696]
.L296:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #80]
    ldr     x9, [sp, #80]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #80]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #880]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #896]
    ldr     x9, [sp, #80]
    movz    x10, #0x0010
    add     x16, x9, x10
    str     x16, [sp, #920]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #920]
    str     x10, [x17]
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L297
    ldr     x9, [sp, #80]
    str     x9, [sp, #40]
    b       .L298
.L297:
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
.L298:
    ldr     x9, [sp, #80]
    str     x9, [sp, #48]
    ldr     x9, [sp, #80]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #88]
    ldr     x9, [sp, #88]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L299
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
    b       .L300
.L299:
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
.L300:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #80]
    mov     x12, #0
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #80]
    movz    x13, #0x0008
    add     x14, x12, x13
    ldr     x12, [x14]
    ldr     x13, [sp, #80]
    movz    x14, #0x0010
    add     x15, x13, x14
    ldr     x13, [x15]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    mov     x4, x13
    bl      _add_local
    str     x0, [sp, #1352]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L301
    movz    x9, #0x0026
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1392]
.L301:
    b       .L294
.L295:
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1408]
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    str     x9, [x11]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0029
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L302
    bl      _ps_advance
    str     x0, [sp, #1472]
    ldr     x9, [sp, #32]
    movz    x10, #0x0020
    add     x16, x9, x10
    str     x16, [sp, #1496]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #1496]
    str     x10, [x17]
.L302:
    ldr     x9, [sp, #32]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #1536]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1536]
    str     x10, [x17]
    mov     x9, #0
    mov     x0, x9
    bl      _cur_func_set
    str     x0, [sp, #1568]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L749
.L749:
    add     sp, sp, #1584
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_const_decl
_parse_const_decl:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #544
    str     x0, [sp, #0]
    movz    x9, #0x0003
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #72]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L303
    adrp    x9, L_str35@PAGE
    add     x9, x9, L_str35@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x001c
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #136]
.L303:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0028
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #320]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #336]
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x16, x9, x10
    str     x16, [sp, #360]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #360]
    str     x10, [x17]
    movz    x9, #0x001e
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #392]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000f
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L304
    adrp    x9, L_str36@PAGE
    add     x9, x9, L_str36@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x001b
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #456]
.L304:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #56]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #56]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #528]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L750
.L750:
    add     sp, sp, #544
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_bss_decl
_parse_bss_decl:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #496
    str     x0, [sp, #0]
    movz    x9, #0x000b
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #72]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L305
    adrp    x9, L_str37@PAGE
    add     x9, x9, L_str37@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x001a
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #136]
.L305:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #320]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #336]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000f
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L306
    adrp    x9, L_str38@PAGE
    add     x9, x9, L_str38@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0014
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #400]
.L306:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #56]
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #56]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #472]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L751
.L751:
    add     sp, sp, #496
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_struct_decl
_parse_struct_decl:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1312
    str     x0, [sp, #0]
    movz    x9, #0x000a
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #112]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L307
    adrp    x9, L_str39@PAGE
    add     x9, x9, L_str39@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x001d
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #176]
.L307:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0028
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #424]
    bl      _cur_prog
    mov     x9, x0
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L308
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L309
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    b       .L310
.L309:
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
.L311:
    ldr     x9, [sp, #48]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L312
    ldr     x9, [sp, #48]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    b       .L311
.L312:
    ldr     x9, [sp, #48]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
.L310:
.L308:
    movz    x9, #0x0013
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #696]
    mov     x9, #0
    str     x9, [sp, #56]
    mov     x9, #0
    str     x9, [sp, #64]
.L313:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0014
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L314
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L315
    adrp    x9, L_str40@PAGE
    add     x9, x9, L_str40@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x001c
    str     x9, [sp, #80]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #800]
.L315:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #88]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #96]
    ldr     x9, [sp, #96]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #96]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #96]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #984]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1000]
    ldr     x9, [sp, #96]
    movz    x10, #0x0010
    add     x16, x9, x10
    str     x16, [sp, #1024]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #1024]
    str     x10, [x17]
    ldr     x9, [sp, #56]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L316
    ldr     x9, [sp, #96]
    str     x9, [sp, #56]
    b       .L317
.L316:
    ldr     x9, [sp, #64]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
.L317:
    ldr     x9, [sp, #96]
    str     x9, [sp, #64]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #56]
    str     x9, [x11]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0026
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L318
    bl      _ps_advance
    str     x0, [sp, #1248]
.L318:
    b       .L313
.L314:
    movz    x9, #0x0014
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1264]
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #56]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L752
.L752:
    add     sp, sp, #1312
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse
_parse:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #976
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _ps_init
    str     x0, [sp, #120]
    bl      _str_table_init
    str     x0, [sp, #128]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _mk_program
    mov     x10, x0
    str     x10, [sp, #24]
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _cur_prog_set
    str     x0, [sp, #160]
    mov     x9, #0
    str     x9, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L319:
    bl      _ps_kind
    mov     x9, x0
    mov     x10, #0
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L320
.L321:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0025
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L322
    bl      _ps_advance
    str     x0, [sp, #240]
    b       .L321
.L322:
    bl      _ps_kind
    mov     x9, x0
    mov     x10, #0
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L323
    b       .L320
.L323:
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #56]
    ldr     w9, [sp, #56]
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L324
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_fun
    mov     x10, x0
    str     x10, [sp, #64]
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L325
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    b       .L326
.L325:
    ldr     x9, [sp, #32]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
.L326:
    ldr     x9, [sp, #64]
    str     x9, [sp, #32]
.L324:
    ldr     w9, [sp, #56]
    movz    x10, #0x0003
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L327
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_const_decl
    mov     x10, x0
    str     x10, [sp, #72]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L328
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    b       .L329
.L328:
    ldr     x9, [sp, #40]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
.L329:
    ldr     x9, [sp, #72]
    str     x9, [sp, #40]
.L327:
    ldr     w9, [sp, #56]
    movz    x10, #0x000b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L330
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_bss_decl
    mov     x10, x0
    str     x10, [sp, #80]
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L331
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
    b       .L332
.L331:
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
.L332:
    ldr     x9, [sp, #80]
    str     x9, [sp, #48]
.L330:
    ldr     w9, [sp, #56]
    movz    x10, #0x000a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L333
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_struct_decl
    str     x0, [sp, #792]
.L333:
    b       .L319
.L320:
    adrp    x9, _STR_HEAD@PAGE
    add     x9, x9, _STR_HEAD@PAGEOFF
    str     x9, [sp, #88]
    adrp    x9, _STR_COUNT@PAGE
    add     x9, x9, _STR_COUNT@PAGEOFF
    str     x9, [sp, #96]
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    mov     x10, #0
    movz    x12, #0x0008
    mul     x13, x10, x12
    add     x10, x9, x13
    ldr     x9, [x10]
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    mov     x10, #0
    movz    x12, #0x0008
    mul     x13, x10, x12
    add     x10, x9, x13
    ldr     x9, [x10]
    str     x9, [x11]
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L753
.L753:
    add     sp, sp, #976
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ir_init
_ir_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _IR_ARENA_STORE@PAGE
    add     x9, x9, _IR_ARENA_STORE@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    adrp    x10, _IR_BUF@PAGE
    add     x10, x10, _IR_BUF@PAGEOFF
    movz    x11, #0x0100, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _arena_init
    str     x0, [sp, #40]
    ldr     x9, [sp, #0]
    mov     x0, x9
    b       .L754
.L754:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ir_width_of
_ir_width_of:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L334
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L755
.L334:
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    mov     x0, x10
    b       .L755
.L755:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_ins
_mk_ins:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #544
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0078
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0030
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0038
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0048
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0050
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0058
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0060
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0068
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0070
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L756
.L756:
    add     sp, sp, #544
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_ir_fn
_mk_ir_fn:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #512
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0070
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0028
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0030
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0048
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0050
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0058
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0060
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0068
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L757
.L757:
    add     sp, sp, #512
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ir_emit
_ir_emit:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L335
    ldr     x9, [sp, #0]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    b       .L758
.L335:
    ldr     x9, [sp, #0]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
.L758:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_builder
_mk_builder:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #416
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    movz    x9, #0x1000
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x8000
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0030
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0080
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #16]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L759
.L759:
    add     sp, sp, #416
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ir_new_slot
_ir_new_slot:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #304
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L336
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
.L336:
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #8]
    str     x9, [x10]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L760
.L760:
    add     sp, sp, #304
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ir_new_label
_ir_new_label:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    adrp    x9, _IR_NEXT_LABEL@PAGE
    add     x9, x9, _IR_NEXT_LABEL@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    movz    x11, #0x0001
    add     x12, x9, x11
    str     x12, [x10]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L761
.L761:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ir_emit_label
_ir_emit_label:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0012
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #144]
.L762:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ir_emit_jmp
_ir_emit_jmp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0010
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #144]
.L763:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ir_emit_jz
_ir_emit_jz:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0011
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #184]
.L764:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_expr
_lower_expr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    movz    x16, #0x1430
    sub     sp, sp, x16
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L337
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #576]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L765
.L337:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L338
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #872]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #8]
    movz    x11, #0x0078
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #872]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1008]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L765
.L338:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L339
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #56]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #64]
    ldr     x9, [sp, #64]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #56]
    str     x9, [x11]
    ldr     x9, [sp, #64]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0080
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1296]
    ldr     x9, [sp, #56]
    mov     x0, x9
    b       .L765
.L339:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L340
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #88]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #96]
    ldr     x9, [sp, #96]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    str     x9, [x11]
    ldr     x9, [sp, #96]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #96]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
    ldr     x9, [sp, #96]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #96]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #1720]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #1720]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1816]
    ldr     x9, [sp, #88]
    mov     x0, x9
    b       .L765
.L340:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L341
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L765
.L341:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L342
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0009
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L765
.L342:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L343
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000a
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L765
.L343:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L344
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000b
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L765
.L344:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L345
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000c
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L765
.L345:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L346
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000d
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L765
.L346:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L347
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #104]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #112]
    ldr     x9, [sp, #112]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #104]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #120]
    ldr     x9, [sp, #112]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #120]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #2616]
    ldr     x9, [sp, #104]
    mov     x0, x9
    b       .L765
.L347:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L348
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #136]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #144]
    ldr     x9, [sp, #144]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #136]
    str     x9, [x11]
    ldr     x9, [sp, #144]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #128]
    str     x9, [x11]
    ldr     x9, [sp, #144]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #2904]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #2904]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #144]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #3000]
    ldr     x9, [sp, #136]
    mov     x0, x9
    b       .L765
.L348:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L349
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #152]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #160]
    ldr     x9, [sp, #160]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #152]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0060
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #3344]
    ldr     x9, [sp, #152]
    mov     x0, x9
    b       .L765
.L349:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L350
    ldr     x9, [sp, #8]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #168]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #176]
    ldr     x9, [sp, #168]
    movz    x10, #0x0010
    mul     x11, x9, x10
    str     x11, [sp, #184]
    ldr     x9, [sp, #184]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L351
    movz    x9, #0x0008
    str     x9, [sp, #184]
.L351:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #184]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #192]
    mov     x9, #0
    str     x9, [sp, #200]
    mov     x9, #0
    str     x9, [sp, #208]
.L352:
    ldr     x9, [sp, #208]
    ldr     x10, [sp, #168]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L353
    ldr     x9, [sp, #176]
    ldr     x10, [sp, #208]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #216]
    mov     x9, #0
    str     x9, [sp, #224]
    ldr     x9, [sp, #216]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #232]
    ldr     x9, [sp, #232]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L354
    ldr     x9, [sp, #232]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L355
    ldr     x9, [sp, #216]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L356
    movz    x9, #0x0001
    str     x9, [sp, #224]
.L356:
.L355:
.L354:
    ldr     x9, [sp, #224]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L357
    ldr     x16, [sp, #0]
    str     x16, [sp, #3856]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x16, [x11]
    str     x16, [sp, #3888]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #3888]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x0, [sp, #3856]
    mov     x1, x9
    bl      _ir_new_slot
    mov     x10, x0
    str     x10, [sp, #240]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #248]
    ldr     x9, [sp, #248]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #240]
    str     x9, [x11]
    ldr     x9, [sp, #248]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #216]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #248]
    movz    x10, #0x0028
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #248]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #4168]
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #200]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #240]
    str     x9, [x10]
    ldr     x9, [sp, #200]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #200]
    ldr     x16, [sp, #0]
    str     x16, [sp, #4248]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #4248]
    mov     x1, x11
    bl      _ir_new_slot
    mov     x9, x0
    str     x9, [sp, #256]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #264]
    ldr     x9, [sp, #264]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #256]
    str     x9, [x11]
    ldr     x9, [sp, #264]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #216]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #264]
    movz    x10, #0x0028
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #264]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #4536]
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #200]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #256]
    str     x9, [x10]
    ldr     x9, [sp, #200]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #200]
    b       .L358
.L357:
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #200]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x16, x9, x12
    str     x16, [sp, #4648]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    ldr     x17, [sp, #4648]
    str     x11, [x17]
    ldr     x9, [sp, #200]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #200]
.L358:
    ldr     x9, [sp, #208]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #208]
    b       .L352
.L353:
    ldr     x9, [sp, #200]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L359
    adrp    x9, L_str41@PAGE
    add     x9, x9, L_str41@PAGEOFF
    str     x9, [sp, #272]
    movz    x9, #0x0016
    str     x9, [sp, #280]
    ldr     x9, [sp, #272]
    ldr     x10, [sp, #280]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #4792]
.L359:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #288]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #296]
    ldr     x9, [sp, #296]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #288]
    str     x9, [x11]
    ldr     x9, [sp, #296]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #296]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0060
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #296]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [sp, #192]
    str     x9, [x11]
    ldr     x9, [sp, #296]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [sp, #200]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #296]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #5144]
    ldr     x9, [sp, #288]
    mov     x0, x9
    b       .L765
.L350:
    mov     x9, #0
    mov     x0, x9
    b       .L765
.L765:
    movz    x16, #0x1430
    add     sp, sp, x16
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_cmp
_lower_cmp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #512
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #40]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #48]
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #56]
    ldr     x9, [sp, #48]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #400]
    ldr     x9, [sp, #56]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #400]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #496]
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L766
.L766:
    add     sp, sp, #512
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_stmt
_lower_stmt:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    movz    x16, #0x1490
    sub     sp, sp, x16
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L360
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L361
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0058
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L362
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L363
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L364
    movz    x9, #0x0001
    str     x9, [sp, #32]
.L364:
.L363:
.L362:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L365
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    ldr     x16, [sp, #0]
    str     x16, [sp, #744]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x16, [x11]
    str     x16, [sp, #776]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #776]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x0, [sp, #744]
    mov     x1, x9
    bl      _ir_new_slot
    mov     x10, x0
    str     x10, [sp, #56]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #64]
    ldr     x9, [sp, #64]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #56]
    str     x9, [x11]
    ldr     x9, [sp, #64]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    movz    x10, #0x0080
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1024]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #72]
    ldr     x9, [sp, #72]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #72]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #56]
    str     x9, [x11]
    ldr     x9, [sp, #72]
    movz    x10, #0x0028
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1240]
    ldr     x16, [sp, #0]
    str     x16, [sp, #1248]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #1248]
    mov     x1, x11
    bl      _ir_new_slot
    mov     x9, x0
    str     x9, [sp, #80]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #88]
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
    ldr     x9, [sp, #88]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    movz    x10, #0x0070
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1488]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #96]
    ldr     x9, [sp, #96]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #96]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
    ldr     x9, [sp, #96]
    movz    x10, #0x0028
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1720]
    b       .L767
.L365:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #104]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #112]
    ldr     x9, [sp, #112]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #112]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #104]
    str     x9, [x11]
    ldr     x9, [sp, #112]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #1928]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #1928]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #2000]
.L361:
    b       .L767
.L360:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L366
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L367
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #120]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #128]
    ldr     x9, [sp, #128]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #128]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #120]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #136]
    ldr     x9, [sp, #128]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #2336]
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #8]
    movz    x11, #0x0058
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #2336]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #2472]
.L367:
    b       .L767
.L366:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L368
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #144]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #152]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #160]
    ldr     x9, [sp, #160]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #144]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #152]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0028
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #168]
    ldr     x9, [sp, #168]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #176]
    ldr     x9, [sp, #176]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L369
    ldr     x9, [sp, #176]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L370
    ldr     x9, [sp, #160]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #2920]
    ldr     x9, [sp, #176]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #2920]
    str     x11, [x17]
.L370:
.L369:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #3016]
    b       .L767
.L368:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L371
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L372
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #184]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000f
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #192]
    ldr     x9, [sp, #192]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #184]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #192]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #3288]
    b       .L767
.L372:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000f
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #200]
    ldr     x9, [sp, #200]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #200]
    movz    x10, #0x0030
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #200]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #3448]
    b       .L767
.L371:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L373
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L374
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    str     x0, [sp, #3592]
.L374:
    b       .L767
.L373:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L375
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #208]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _ir_new_label
    mov     x10, x0
    str     x10, [sp, #216]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #208]
    ldr     x11, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ir_emit_jz
    str     x0, [sp, #3736]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_block
    str     x0, [sp, #3784]
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L376
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #3856]
    b       .L767
.L376:
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _ir_new_label
    mov     x10, x0
    str     x10, [sp, #224]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #224]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_jmp
    str     x0, [sp, #3896]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #3920]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_block
    str     x0, [sp, #3968]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #224]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #3992]
    b       .L767
.L375:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L377
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _ir_new_label
    mov     x10, x0
    str     x10, [sp, #232]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _ir_new_label
    mov     x10, x0
    str     x10, [sp, #240]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #232]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #4096]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #248]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #248]
    ldr     x11, [sp, #240]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ir_emit_jz
    str     x0, [sp, #4176]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #256]
    ldr     x9, [sp, #256]
    ldr     x10, [sp, #0]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #240]
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_block
    str     x0, [sp, #4400]
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    sub     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #232]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_jmp
    str     x0, [sp, #4496]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #240]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #4520]
    b       .L767
.L377:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L378
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _ir_new_label
    mov     x10, x0
    str     x10, [sp, #264]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _ir_new_label
    mov     x10, x0
    str     x10, [sp, #272]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #264]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #4624]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #280]
    ldr     x9, [sp, #280]
    ldr     x10, [sp, #0]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #272]
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_block
    str     x0, [sp, #4848]
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    sub     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #264]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_jmp
    str     x0, [sp, #4944]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #272]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #4968]
    b       .L767
.L378:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L379
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L380
    adrp    x9, L_str42@PAGE
    add     x9, x9, L_str42@PAGEOFF
    str     x9, [sp, #288]
    movz    x9, #0x0013
    str     x9, [sp, #296]
    ldr     x9, [sp, #288]
    ldr     x10, [sp, #296]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #5112]
.L380:
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #304]
    ldr     x9, [sp, #304]
    ldr     x10, [sp, #0]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0001
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #312]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #312]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_jmp
    str     x0, [sp, #5256]
    b       .L767
.L379:
.L767:
    movz    x16, #0x1490
    add     sp, sp, x16
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_block
_lower_block:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #112
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    str     x9, [sp, #16]
.L381:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L382
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_stmt
    str     x0, [sp, #72]
    ldr     x9, [sp, #16]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    b       .L381
.L382:
.L768:
    add     sp, sp, #112
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_one_fn
_lower_one_fn:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1152
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _mk_ir_fn
    mov     x12, x0
    str     x12, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _mk_builder
    mov     x11, x0
    str     x11, [sp, #48]
    ldr     x9, [sp, #48]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #56]
    mov     x9, #0
    str     x9, [sp, #64]
.L383:
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L384
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #64]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #72]
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #64]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #72]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    ldr     x9, [sp, #64]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #64]
    b       .L383
.L384:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #80]
    ldr     x9, [sp, #80]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L385
    movz    x9, #0x0008
    str     x9, [sp, #80]
.L385:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #88]
    mov     x9, #0
    str     x9, [sp, #64]
.L386:
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L387
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #64]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #96]
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #64]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #96]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    ldr     x9, [sp, #64]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #64]
    b       .L386
.L387:
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #8]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_block
    str     x0, [sp, #1024]
    ldr     x9, [sp, #40]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    movz    x10, #0x0020
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L769
.L769:
    add     sp, sp, #1152
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ir_count_ins
_ir_count_ins:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    mov     x9, #0
    str     x9, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
.L388:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L389
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #8]
    ldr     x9, [sp, #16]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    b       .L388
.L389:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L770
.L770:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ir_has_dst
_ir_has_dst:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #752
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L390
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L390:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L391
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L391:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L392
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L392:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L393
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L393:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L394
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L394:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L395
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L395:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L396
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L396:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L397
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L397:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L398
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L398:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L399
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L399:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L400
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L400:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L401
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L401:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L402
    movz    x9, #0x0001
    mov     x0, x9
    b       .L771
.L402:
    mov     x9, #0
    mov     x0, x9
    b       .L771
.L771:
    add     sp, sp, #752
    ldp     x29, x30, [sp], #16
    ret

    .globl   _collect_uses
_collect_uses:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #2496
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L403
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0001
    mov     x0, x9
    b       .L772
.L403:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L404
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0001
    mov     x0, x9
    b       .L772
.L404:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L405
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0018
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0002
    mov     x0, x9
    b       .L772
.L405:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L406
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0018
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0002
    mov     x0, x9
    b       .L772
.L406:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L407
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0018
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0002
    mov     x0, x9
    b       .L772
.L407:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L408
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0018
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0002
    mov     x0, x9
    b       .L772
.L408:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L409
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0018
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0002
    mov     x0, x9
    b       .L772
.L409:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L410
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0018
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0002
    mov     x0, x9
    b       .L772
.L410:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L411
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0018
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0002
    mov     x0, x9
    b       .L772
.L411:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L412
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0018
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0002
    mov     x0, x9
    b       .L772
.L412:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L413
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0001
    mov     x0, x9
    b       .L772
.L413:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000f
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L414
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L415
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    add     x12, x9, x11
    ldr     x9, [x12]
    str     x9, [x10]
    movz    x9, #0x0001
    mov     x0, x9
    b       .L772
.L415:
    mov     x9, #0
    mov     x0, x9
    b       .L772
.L414:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L416
    mov     x9, #0
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L417:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L418
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x9, x13
    ldr     x9, [x11]
    str     x9, [x10]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #16]
    b       .L417
.L418:
    ldr     x9, [sp, #0]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    b       .L772
.L416:
    mov     x9, #0
    mov     x0, x9
    b       .L772
.L772:
    add     sp, sp, #2496
    ldp     x29, x30, [sp], #16
    ret

    .globl   _regalloc
_regalloc:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #3600
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _ir_count_ins
    mov     x10, x0
    str     x10, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L419
    movz    x9, #0x0008
    str     x9, [sp, #32]
.L419:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #40]
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    mov     x9, #0
    str     x9, [sp, #56]
.L420:
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L421
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #56]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #48]
    str     x9, [x10]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    ldr     x9, [sp, #48]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    b       .L420
.L421:
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #64]
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L422
    movz    x9, #0x0008
    str     x9, [sp, #64]
.L422:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #88]
    mov     x9, #0
    str     x9, [sp, #96]
.L423:
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L424
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    str     x9, [x10]
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    str     x9, [x10]
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    mov     x9, #0
    str     x9, [x10]
    ldr     x9, [sp, #96]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #96]
    b       .L423
.L424:
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #104]
    ldr     x9, [sp, #104]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L425
    movz    x9, #0x0008
    str     x9, [sp, #104]
.L425:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #104]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #112]
    mov     x9, #0
    str     x9, [sp, #120]
    mov     x9, #0
    str     x9, [sp, #128]
.L426:
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L427
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #128]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L428
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #120]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #128]
    str     x9, [x10]
    ldr     x9, [sp, #120]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #120]
.L428:
    ldr     x9, [sp, #128]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #128]
    b       .L426
.L427:
    ldr     x9, [sp, #0]
    movz    x10, #0x0080
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #136]
    ldr     x9, [sp, #16]
    str     x9, [sp, #128]
.L429:
    ldr     x9, [sp, #128]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L430
    ldr     x9, [sp, #128]
    movz    x10, #0x0001
    sub     x11, x9, x10
    str     x11, [sp, #128]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #128]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    bl      _collect_uses
    mov     x11, x0
    str     x11, [sp, #144]
    mov     x9, #0
    str     x9, [sp, #152]
.L431:
    ldr     x9, [sp, #152]
    ldr     x10, [sp, #144]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L432
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #152]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #160]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #160]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L433
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #160]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #128]
    str     x9, [x10]
.L433:
    ldr     x9, [sp, #152]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #152]
    b       .L431
.L432:
    b       .L429
.L430:
    mov     x9, #0
    str     x9, [sp, #128]
.L434:
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L435
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #128]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #168]
    ldr     x9, [sp, #168]
    mov     x0, x9
    bl      _ir_has_dst
    mov     x10, x0
    mov     x9, #0
    cmp     w10, w9
    cset    w11, ne
    cbz     w11, .L436
    ldr     x9, [sp, #168]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #176]
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #176]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L437
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #176]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #128]
    str     x9, [x10]
.L437:
.L436:
    ldr     x9, [sp, #128]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #128]
    b       .L434
.L435:
    mov     x9, #0
    str     x9, [sp, #96]
.L438:
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L439
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L440
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L441
    mov     x9, #0
    str     x9, [sp, #184]
.L442:
    ldr     x9, [sp, #184]
    ldr     x10, [sp, #120]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L443
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #184]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #192]
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #96]
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x10, x13
    ldr     x10, [x11]
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L444
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #96]
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x10, x13
    ldr     x10, [x11]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L445
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0001
    str     x9, [x10]
.L445:
.L444:
    ldr     x9, [sp, #184]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #184]
    b       .L442
.L443:
.L441:
.L440:
    ldr     x9, [sp, #96]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #96]
    b       .L438
.L439:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #200]
    mov     x9, #0
    str     x9, [sp, #96]
.L446:
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L447
    ldr     x9, [sp, #200]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0007
    str     x9, [x10]
    ldr     x9, [sp, #96]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #96]
    b       .L446
.L447:
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #200]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #208]
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #216]
    mov     x9, #0
    str     x9, [sp, #224]
.L448:
    ldr     x9, [sp, #224]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L449
    ldr     x9, [sp, #216]
    ldr     x10, [sp, #224]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0001
    str     x9, [x10]
    ldr     x9, [sp, #224]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #224]
    b       .L448
.L449:
    mov     x9, #0
    str     x9, [sp, #128]
.L450:
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L451
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #128]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #232]
    ldr     x9, [sp, #232]
    mov     x0, x9
    bl      _ir_has_dst
    mov     x10, x0
    mov     x9, #0
    cmp     w10, w9
    cset    w11, ne
    cbz     w11, .L452
    ldr     x9, [sp, #232]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #240]
    ldr     x9, [sp, #240]
    ldr     x10, [sp, #208]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L453
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #240]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L454
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #240]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L455
    mov     x9, #0
    str     x9, [sp, #248]
    movz    x9, #0x0007
    str     x9, [sp, #256]
.L456:
    ldr     x9, [sp, #248]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L457
    ldr     x9, [sp, #216]
    ldr     x10, [sp, #248]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L458
    ldr     x9, [sp, #256]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L459
    ldr     x9, [sp, #248]
    str     x9, [sp, #256]
.L459:
.L458:
    ldr     x9, [sp, #248]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #248]
    b       .L456
.L457:
    ldr     x9, [sp, #256]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L460
    ldr     x9, [sp, #200]
    ldr     x10, [sp, #240]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #256]
    str     x9, [x10]
    ldr     x9, [sp, #216]
    ldr     x10, [sp, #256]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    mov     x9, #0
    str     x9, [x10]
.L460:
.L455:
.L454:
.L453:
.L452:
    ldr     x9, [sp, #232]
    ldr     x10, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    bl      _collect_uses
    mov     x11, x0
    str     x11, [sp, #264]
    mov     x9, #0
    str     x9, [sp, #272]
.L461:
    ldr     x9, [sp, #272]
    ldr     x10, [sp, #264]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L462
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #272]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #280]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #280]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #128]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L463
    ldr     x9, [sp, #200]
    ldr     x10, [sp, #280]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #288]
    ldr     x9, [sp, #288]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L464
    ldr     x9, [sp, #216]
    ldr     x10, [sp, #288]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0001
    str     x9, [x10]
.L464:
.L463:
    ldr     x9, [sp, #272]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #272]
    b       .L461
.L462:
    ldr     x9, [sp, #128]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #128]
    b       .L450
.L451:
.L773:
    add     sp, sp, #3600
    ldp     x29, x30, [sp], #16
    ret

    .globl   _finalize_frame
_finalize_frame:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x000f
    add     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    udiv     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    mul     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
.L774:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower
_lower:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #368
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _IR_NEXT_LABEL@PAGE
    add     x9, x9, _IR_NEXT_LABEL@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    mov     x9, #0
    str     x9, [x10]
    mov     x9, #0
    str     x9, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
.L465:
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L466
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_one_fn
    mov     x11, x0
    str     x11, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _regalloc
    str     x0, [sp, #224]
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _finalize_frame
    str     x0, [sp, #240]
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L467
    ldr     x9, [sp, #48]
    str     x9, [sp, #24]
    ldr     x9, [sp, #48]
    str     x9, [sp, #32]
    b       .L468
.L467:
    ldr     x9, [sp, #32]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    str     x9, [sp, #32]
.L468:
    ldr     x9, [sp, #40]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    b       .L465
.L466:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L775
.L775:
    add     sp, sp, #368
    ldp     x29, x30, [sp], #16
    ret

    .globl   _dump_ir
_dump_ir:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1664
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    str     x9, [sp, #24]
.L469:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L470
    adrp    x9, L_str43@PAGE
    add     x9, x9, L_str43@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0003
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #312]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #24]
    mov     x12, #0
    add     x13, x11, x12
    ldr     x11, [x13]
    add     x12, x10, x11
    ldr     x10, [sp, #24]
    movz    x11, #0x0008
    add     x13, x10, x11
    ldr     x10, [x13]
    mov     x0, x9
    mov     x1, x12
    mov     x2, x10
    bl      _out_bytes
    str     x0, [sp, #432]
    adrp    x9, L_str44@PAGE
    add     x9, x9, L_str44@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0009
    str     x9, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #480]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #528]
    adrp    x9, L_str45@PAGE
    add     x9, x9, L_str45@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x0008
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #576]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #624]
    adrp    x9, L_str46@PAGE
    add     x9, x9, L_str46@PAGEOFF
    str     x9, [sp, #80]
    movz    x9, #0x000d
    str     x9, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #672]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #720]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #744]
    ldr     x9, [sp, #24]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #96]
.L471:
    ldr     x9, [sp, #96]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L472
    adrp    x9, L_str47@PAGE
    add     x9, x9, L_str47@PAGEOFF
    str     x9, [sp, #104]
    movz    x9, #0x0005
    str     x9, [sp, #112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #104]
    ldr     x11, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #848]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #896]
    adrp    x9, L_str48@PAGE
    add     x9, x9, L_str48@PAGEOFF
    str     x9, [sp, #120]
    movz    x9, #0x0005
    str     x9, [sp, #128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #120]
    ldr     x11, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #944]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #992]
    adrp    x9, L_str49@PAGE
    add     x9, x9, L_str49@PAGEOFF
    str     x9, [sp, #136]
    movz    x9, #0x0003
    str     x9, [sp, #144]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #136]
    ldr     x11, [sp, #144]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1040]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #1088]
    adrp    x9, L_str50@PAGE
    add     x9, x9, L_str50@PAGEOFF
    str     x9, [sp, #152]
    movz    x9, #0x0003
    str     x9, [sp, #160]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #152]
    ldr     x11, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1136]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #1184]
    adrp    x9, L_str51@PAGE
    add     x9, x9, L_str51@PAGEOFF
    str     x9, [sp, #168]
    movz    x9, #0x0007
    str     x9, [sp, #176]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #168]
    ldr     x11, [sp, #176]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1232]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #1280]
    adrp    x9, L_str52@PAGE
    add     x9, x9, L_str52@PAGEOFF
    str     x9, [sp, #184]
    movz    x9, #0x0005
    str     x9, [sp, #192]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #184]
    ldr     x11, [sp, #192]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1328]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #1376]
    adrp    x9, L_str53@PAGE
    add     x9, x9, L_str53@PAGEOFF
    str     x9, [sp, #200]
    movz    x9, #0x0007
    str     x9, [sp, #208]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #200]
    ldr     x11, [sp, #208]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1424]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #1472]
    adrp    x9, L_str54@PAGE
    add     x9, x9, L_str54@PAGEOFF
    str     x9, [sp, #216]
    movz    x9, #0x0008
    str     x9, [sp, #224]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #216]
    ldr     x11, [sp, #224]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1520]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #1568]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #1592]
    ldr     x9, [sp, #96]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #96]
    b       .L471
.L472:
    ldr     x9, [sp, #24]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L469
.L470:
.L776:
    add     sp, sp, #1664
    ldp     x29, x30, [sp], #16
    ret

    .globl   _set_target
_set_target:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _G_TARGET@PAGE
    add     x9, x9, _G_TARGET@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    str     x9, [x10]
.L777:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _get_target
_get_target:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _G_TARGET@PAGE
    add     x9, x9, _G_TARGET@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L778
.L778:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_reg_x
_out_reg_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0078
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_u64
    str     x0, [sp, #72]
.L779:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_reg_w
_out_reg_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0077
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_u64
    str     x0, [sp, #72]
.L780:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_x_n
_out_x_n:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0078
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #56]
.L781:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_w_n
_out_w_n:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0077
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #56]
.L782:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_reg_wx
_out_reg_wx:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L473
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #64]
    b       .L783
.L473:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #88]
.L783:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_mn
_out_mn:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #352
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L474
    adrp    x9, L_str55@PAGE
    add     x9, x9, L_str55@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x000c
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #144]
    b       .L784
.L474:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L475
    adrp    x9, L_str56@PAGE
    add     x9, x9, L_str56@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x000c
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #216]
    b       .L784
.L475:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L476
    adrp    x9, L_str57@PAGE
    add     x9, x9, L_str57@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x000c
    str     x9, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #288]
    b       .L784
.L476:
    adrp    x9, L_str58@PAGE
    add     x9, x9, L_str58@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x000c
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #336]
.L784:
    add     sp, sp, #352
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_sp_tail
_out_sp_tail:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, L_str59@PAGE
    add     x9, x9, L_str59@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0008
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #112]
    adrp    x9, L_str60@PAGE
    add     x9, x9, L_str60@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0002
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #160]
.L785:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_mem_tail
_out_mem_tail:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, L_str61@PAGE
    add     x9, x9, L_str61@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0003
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #112]
    adrp    x9, L_str62@PAGE
    add     x9, x9, L_str62@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0002
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #160]
.L786:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_movi
_emit_movi:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1568
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001, lsl #16
    udiv     x11, x9, x10
    str     x11, [sp, #24]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    movz    x11, #0x0001, lsl #16
    mul     x12, x10, x11
    sub     x10, x9, x12
    str     x10, [sp, #32]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001, lsl #16
    udiv     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #40]
    movz    x11, #0x0001, lsl #16
    mul     x12, x10, x11
    sub     x10, x9, x12
    str     x10, [sp, #48]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001, lsl #16
    udiv     x11, x9, x10
    str     x11, [sp, #56]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #56]
    movz    x11, #0x0001, lsl #16
    mul     x12, x10, x11
    sub     x10, x9, x12
    str     x10, [sp, #64]
    ldr     x9, [sp, #56]
    str     x9, [sp, #72]
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L477
    adrp    x9, L_str63@PAGE
    add     x9, x9, L_str63@PAGEOFF
    str     x9, [sp, #80]
    movz    x9, #0x000c
    str     x9, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #504]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #528]
    adrp    x9, L_str64@PAGE
    add     x9, x9, L_str64@PAGEOFF
    str     x9, [sp, #96]
    movz    x9, #0x0005
    str     x9, [sp, #104]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    ldr     x11, [sp, #104]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #576]
    b       .L787
.L477:
    movz    x9, #0x0004
    str     x9, [sp, #112]
    mov     x9, #0
    str     x9, [sp, #120]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L478
    mov     x9, #0
    str     x9, [sp, #112]
    ldr     x9, [sp, #32]
    str     x9, [sp, #120]
.L478:
    ldr     x9, [sp, #112]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L479
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L480
    movz    x9, #0x0001
    str     x9, [sp, #112]
    ldr     x9, [sp, #48]
    str     x9, [sp, #120]
.L480:
.L479:
    ldr     x9, [sp, #112]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L481
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L482
    movz    x9, #0x0002
    str     x9, [sp, #112]
    ldr     x9, [sp, #64]
    str     x9, [sp, #120]
.L482:
.L481:
    ldr     x9, [sp, #112]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L483
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L484
    movz    x9, #0x0003
    str     x9, [sp, #112]
    ldr     x9, [sp, #72]
    str     x9, [sp, #120]
.L484:
.L483:
    adrp    x9, L_str65@PAGE
    add     x9, x9, L_str65@PAGEOFF
    str     x9, [sp, #128]
    movz    x9, #0x000c
    str     x9, [sp, #136]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #128]
    ldr     x11, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #872]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #896]
    adrp    x9, L_str66@PAGE
    add     x9, x9, L_str66@PAGEOFF
    str     x9, [sp, #144]
    movz    x9, #0x0005
    str     x9, [sp, #152]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #144]
    ldr     x11, [sp, #152]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #944]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #120]
    mov     x0, x9
    mov     x1, x10
    bl      _out_hex4
    str     x0, [sp, #968]
    ldr     x9, [sp, #112]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L485
    adrp    x9, L_str67@PAGE
    add     x9, x9, L_str67@PAGEOFF
    str     x9, [sp, #160]
    movz    x9, #0x0007
    str     x9, [sp, #168]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #160]
    ldr     x11, [sp, #168]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1040]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #112]
    movz    x11, #0x0010
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_u64
    str     x0, [sp, #1080]
.L485:
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #1104]
    ldr     x9, [sp, #112]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #176]
.L486:
    ldr     x9, [sp, #176]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L487
    mov     x9, #0
    str     x9, [sp, #184]
    ldr     x9, [sp, #176]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L488
    ldr     x9, [sp, #48]
    str     x9, [sp, #184]
.L488:
    ldr     x9, [sp, #176]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L489
    ldr     x9, [sp, #64]
    str     x9, [sp, #184]
.L489:
    ldr     x9, [sp, #176]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L490
    ldr     x9, [sp, #72]
    str     x9, [sp, #184]
.L490:
    ldr     x9, [sp, #184]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L491
    adrp    x9, L_str68@PAGE
    add     x9, x9, L_str68@PAGEOFF
    str     x9, [sp, #192]
    movz    x9, #0x000c
    str     x9, [sp, #200]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #192]
    ldr     x11, [sp, #200]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1328]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #1352]
    adrp    x9, L_str69@PAGE
    add     x9, x9, L_str69@PAGEOFF
    str     x9, [sp, #208]
    movz    x9, #0x0005
    str     x9, [sp, #216]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #208]
    ldr     x11, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1400]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #184]
    mov     x0, x9
    mov     x1, x10
    bl      _out_hex4
    str     x0, [sp, #1424]
    adrp    x9, L_str70@PAGE
    add     x9, x9, L_str70@PAGEOFF
    str     x9, [sp, #224]
    movz    x9, #0x0007
    str     x9, [sp, #232]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #224]
    ldr     x11, [sp, #232]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1472]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #176]
    movz    x11, #0x0010
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_u64
    str     x0, [sp, #1512]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #1536]
.L491:
    ldr     x9, [sp, #176]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #176]
    b       .L486
.L487:
.L787:
    add     sp, sp, #1568
    ldp     x29, x30, [sp], #16
    ret

    .globl   _set_src
_set_src:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _G_SRC@PAGE
    add     x9, x9, _G_SRC@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    str     x9, [x10]
.L788:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _get_src
_get_src:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _G_SRC@PAGE
    add     x9, x9, _G_SRC@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L789
.L789:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _slot_off
_slot_off:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    mul     x11, x9, x10
    mov     x0, x11
    b       .L790
.L790:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _in_reg
_in_reg:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L492
    movz    x9, #0x0001
    mov     x0, x9
    b       .L791
.L492:
    mov     x9, #0
    mov     x0, x9
    b       .L791
.L791:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _dst_x_reg
_dst_x_reg:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L493
    ldr     x9, [sp, #24]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L792
.L493:
    movz    x9, #0x0010
    mov     x0, x9
    b       .L792
.L792:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_ldr_x
_emit_ldr_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #272
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, L_str71@PAGE
    add     x9, x9, L_str71@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x000c
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #136]
    adrp    x9, L_str72@PAGE
    add     x9, x9, L_str72@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0008
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #184]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #208]
    adrp    x9, L_str73@PAGE
    add     x9, x9, L_str73@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0002
    str     x9, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #256]
.L793:
    add     sp, sp, #272
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_str_x
_emit_str_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #272
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, L_str74@PAGE
    add     x9, x9, L_str74@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x000c
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #136]
    adrp    x9, L_str75@PAGE
    add     x9, x9, L_str75@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0008
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #184]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #208]
    adrp    x9, L_str76@PAGE
    add     x9, x9, L_str76@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0002
    str     x9, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #256]
.L794:
    add     sp, sp, #272
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_mov_x_x
_emit_mov_x_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #224
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, L_str77@PAGE
    add     x9, x9, L_str77@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x000c
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #96]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #120]
    adrp    x9, L_str78@PAGE
    add     x9, x9, L_str78@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0002
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #168]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #192]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #216]
.L795:
    add     sp, sp, #224
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_mov_w_w
_emit_mov_w_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #224
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, L_str79@PAGE
    add     x9, x9, L_str79@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x000c
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #96]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #120]
    adrp    x9, L_str80@PAGE
    add     x9, x9, L_str80@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0002
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #168]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #192]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #216]
.L796:
    add     sp, sp, #224
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_ldr_w
_emit_ldr_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_sp_tail
    str     x0, [sp, #88]
.L797:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_load_slot_to_x
_emit_load_slot_to_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #256
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L494
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #40]
    movz    x12, #0x0009
    add     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_mov_x_x
    str     x0, [sp, #192]
    b       .L798
.L494:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_ldr_x
    str     x0, [sp, #240]
.L798:
    add     sp, sp, #256
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_spill_x
_emit_spill_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L495
    b       .L799
.L495:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_str_x
    str     x0, [sp, #176]
.L799:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ensure_src_x
_ensure_src_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L496
    ldr     x9, [sp, #40]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L800
.L496:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_ldr_x
    str     x0, [sp, #216]
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L800
.L800:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ensure_src_w
_ensure_src_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L497
    ldr     x9, [sp, #40]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L801
.L497:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_ldr_w
    str     x0, [sp, #216]
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L801
.L801:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_binop_mnemonic
_out_binop_mnemonic:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #816
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L498
    adrp    x9, L_str81@PAGE
    add     x9, x9, L_str81@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0003
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #224]
    b       .L802
.L498:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L499
    adrp    x9, L_str82@PAGE
    add     x9, x9, L_str82@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0003
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #296]
    b       .L802
.L499:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L500
    adrp    x9, L_str83@PAGE
    add     x9, x9, L_str83@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0003
    str     x9, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #368]
    b       .L802
.L500:
    ldr     x9, [sp, #8]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L501
    adrp    x9, L_str84@PAGE
    add     x9, x9, L_str84@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x0004
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #440]
    b       .L802
.L501:
    ldr     x9, [sp, #8]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L502
    adrp    x9, L_str85@PAGE
    add     x9, x9, L_str85@PAGEOFF
    str     x9, [sp, #80]
    movz    x9, #0x0003
    str     x9, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #512]
    b       .L802
.L502:
    ldr     x9, [sp, #8]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L503
    adrp    x9, L_str86@PAGE
    add     x9, x9, L_str86@PAGEOFF
    str     x9, [sp, #96]
    movz    x9, #0x0003
    str     x9, [sp, #104]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    ldr     x11, [sp, #104]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #584]
    b       .L802
.L503:
    ldr     x9, [sp, #8]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L504
    adrp    x9, L_str87@PAGE
    add     x9, x9, L_str87@PAGEOFF
    str     x9, [sp, #112]
    movz    x9, #0x0003
    str     x9, [sp, #120]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #112]
    ldr     x11, [sp, #120]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #656]
    b       .L802
.L504:
    ldr     x9, [sp, #8]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L505
    adrp    x9, L_str88@PAGE
    add     x9, x9, L_str88@PAGEOFF
    str     x9, [sp, #128]
    movz    x9, #0x0003
    str     x9, [sp, #136]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #128]
    ldr     x11, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #728]
    b       .L802
.L505:
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L506
    adrp    x9, L_str89@PAGE
    add     x9, x9, L_str89@PAGEOFF
    str     x9, [sp, #144]
    movz    x9, #0x0003
    str     x9, [sp, #152]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #144]
    ldr     x11, [sp, #152]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #800]
    b       .L802
.L506:
.L802:
    add     sp, sp, #816
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_movi
_emit_i_movi:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #208
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _dst_x_reg
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #16]
    movz    x12, #0x0030
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_movi
    str     x0, [sp, #128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_spill_x
    str     x0, [sp, #192]
.L803:
    add     sp, sp, #208
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_label_addr
_emit_i_label_addr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1456
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _dst_x_reg
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L507
    adrp    x9, L_str90@PAGE
    add     x9, x9, L_str90@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x000c
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #336]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #360]
    adrp    x9, L_str91@PAGE
    add     x9, x9, L_str91@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0003
    str     x9, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #408]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    movz    x12, #0x0050
    add     x13, x11, x12
    ldr     x11, [x13]
    add     x12, x10, x11
    ldr     x10, [sp, #16]
    movz    x11, #0x0058
    add     x13, x10, x11
    ldr     x10, [x13]
    mov     x0, x9
    mov     x1, x12
    mov     x2, x10
    bl      _out_bytes
    str     x0, [sp, #536]
    adrp    x9, L_str92@PAGE
    add     x9, x9, L_str92@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x0012
    str     x9, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #584]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #608]
    adrp    x9, L_str93@PAGE
    add     x9, x9, L_str93@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x0002
    str     x9, [sp, #96]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #656]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #680]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #712]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    movz    x12, #0x0050
    add     x13, x11, x12
    ldr     x11, [x13]
    add     x12, x10, x11
    ldr     x10, [sp, #16]
    movz    x11, #0x0058
    add     x13, x10, x11
    ldr     x10, [x13]
    mov     x0, x9
    mov     x1, x12
    mov     x2, x10
    bl      _out_bytes
    str     x0, [sp, #832]
    adrp    x9, L_str94@PAGE
    add     x9, x9, L_str94@PAGEOFF
    str     x9, [sp, #104]
    movz    x9, #0x0009
    str     x9, [sp, #112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #104]
    ldr     x11, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #880]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_spill_x
    str     x0, [sp, #944]
    b       .L804
.L507:
    adrp    x9, L_str95@PAGE
    add     x9, x9, L_str95@PAGEOFF
    str     x9, [sp, #120]
    movz    x9, #0x000c
    str     x9, [sp, #128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #120]
    ldr     x11, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #992]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #1016]
    adrp    x9, L_str96@PAGE
    add     x9, x9, L_str96@PAGEOFF
    str     x9, [sp, #136]
    movz    x9, #0x0007
    str     x9, [sp, #144]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #136]
    ldr     x11, [sp, #144]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1064]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #1112]
    adrp    x9, L_str97@PAGE
    add     x9, x9, L_str97@PAGEOFF
    str     x9, [sp, #152]
    movz    x9, #0x0012
    str     x9, [sp, #160]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #152]
    ldr     x11, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1160]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #1184]
    adrp    x9, L_str98@PAGE
    add     x9, x9, L_str98@PAGEOFF
    str     x9, [sp, #168]
    movz    x9, #0x0002
    str     x9, [sp, #176]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #168]
    ldr     x11, [sp, #176]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1232]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #1256]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #136]
    ldr     x11, [sp, #144]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1288]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #1336]
    adrp    x9, L_str99@PAGE
    add     x9, x9, L_str99@PAGEOFF
    str     x9, [sp, #184]
    movz    x9, #0x0009
    str     x9, [sp, #192]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #184]
    ldr     x11, [sp, #192]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1384]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_spill_x
    str     x0, [sp, #1448]
.L804:
    add     sp, sp, #1456
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_addr_local
_emit_i_addr_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #384
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _dst_x_reg
    mov     x11, x0
    str     x11, [sp, #24]
    adrp    x9, L_str100@PAGE
    add     x9, x9, L_str100@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x000c
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #152]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #176]
    adrp    x9, L_str101@PAGE
    add     x9, x9, L_str101@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0007
    str     x9, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #224]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_u64
    str     x0, [sp, #288]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #312]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_spill_x
    str     x0, [sp, #376]
.L805:
    add     sp, sp, #384
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_load_local
_emit_i_load_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #544
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _dst_x_reg
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L508
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #144]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #168]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_sp_tail
    str     x0, [sp, #232]
    b       .L509
.L508:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L510
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #304]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #328]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_sp_tail
    str     x0, [sp, #392]
    b       .L511
.L510:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #16]
    movz    x12, #0x0020
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_ldr_x
    str     x0, [sp, #464]
.L511:
.L509:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_spill_x
    str     x0, [sp, #528]
.L806:
    add     sp, sp, #544
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_store_local
_emit_i_store_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #672
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    movz    x9, #0x0010
    str     x9, [sp, #40]
    ldr     x9, [sp, #32]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L512
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L513
.L512:
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_ldr_x
    str     x0, [sp, #272]
.L513:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L514
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #344]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #368]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_sp_tail
    str     x0, [sp, #432]
    b       .L515
.L514:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L516
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #504]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #528]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_sp_tail
    str     x0, [sp, #592]
    b       .L517
.L516:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #16]
    movz    x12, #0x0020
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_str_x
    str     x0, [sp, #664]
.L517:
.L515:
.L807:
    add     sp, sp, #672
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_load_mem
_emit_i_load_mem:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #528
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_x
    mov     x13, x0
    str     x13, [sp, #24]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _dst_x_reg
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L518
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #216]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #240]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_mem_tail
    str     x0, [sp, #264]
    b       .L519
.L518:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L520
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #336]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #360]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_mem_tail
    str     x0, [sp, #384]
    b       .L521
.L520:
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #408]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #432]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_mem_tail
    str     x0, [sp, #456]
.L521:
.L519:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_spill_x
    str     x0, [sp, #520]
.L808:
    add     sp, sp, #528
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_store_mem
_emit_i_store_mem:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #672
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_x
    mov     x13, x0
    str     x13, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #40]
    movz    x9, #0x0010
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L522
    ldr     x9, [sp, #40]
    movz    x10, #0x0009
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L523
.L522:
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    ldr     x11, [sp, #16]
    movz    x12, #0x0018
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_ldr_x
    str     x0, [sp, #344]
.L523:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L524
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #416]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #440]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_mem_tail
    str     x0, [sp, #464]
    b       .L525
.L524:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L526
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #536]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #560]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_mem_tail
    str     x0, [sp, #584]
    b       .L527
.L526:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #608]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #632]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_mem_tail
    str     x0, [sp, #656]
.L527:
.L525:
.L809:
    add     sp, sp, #672
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_binop
_emit_i_binop:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #928
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L528
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L528:
    mov     x9, #0
    str     x9, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L529
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0010
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_x
    mov     x13, x0
    str     x13, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0018
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_x
    mov     x13, x0
    str     x13, [sp, #40]
    b       .L530
.L529:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0010
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_w
    mov     x13, x0
    str     x13, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0018
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_w
    mov     x13, x0
    str     x13, [sp, #40]
.L530:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _dst_x_reg
    mov     x11, x0
    str     x11, [sp, #48]
    adrp    x9, L_str102@PAGE
    add     x9, x9, L_str102@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0004
    str     x9, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #552]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_binop_mnemonic
    str     x0, [sp, #600]
    adrp    x9, L_str103@PAGE
    add     x9, x9, L_str103@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x0005
    str     x9, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #648]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #680]
    adrp    x9, L_str104@PAGE
    add     x9, x9, L_str104@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x0002
    str     x9, [sp, #96]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #728]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #760]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #792]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #824]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #848]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_spill_x
    str     x0, [sp, #912]
.L810:
    add     sp, sp, #928
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_cc
_out_cc:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #544
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L531
    adrp    x9, L_str105@PAGE
    add     x9, x9, L_str105@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0002
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #176]
    b       .L811
.L531:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L532
    adrp    x9, L_str106@PAGE
    add     x9, x9, L_str106@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0002
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #248]
    b       .L811
.L532:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L533
    adrp    x9, L_str107@PAGE
    add     x9, x9, L_str107@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0002
    str     x9, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #320]
    b       .L811
.L533:
    ldr     x9, [sp, #8]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L534
    adrp    x9, L_str108@PAGE
    add     x9, x9, L_str108@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x0002
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #392]
    b       .L811
.L534:
    ldr     x9, [sp, #8]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L535
    adrp    x9, L_str109@PAGE
    add     x9, x9, L_str109@PAGEOFF
    str     x9, [sp, #80]
    movz    x9, #0x0002
    str     x9, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #464]
    b       .L811
.L535:
    ldr     x9, [sp, #8]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L536
    adrp    x9, L_str110@PAGE
    add     x9, x9, L_str110@PAGEOFF
    str     x9, [sp, #96]
    movz    x9, #0x0002
    str     x9, [sp, #104]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    ldr     x11, [sp, #104]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #536]
    b       .L811
.L536:
.L811:
    add     sp, sp, #544
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_cmp
_emit_i_cmp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #928
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L537
    movz    x9, #0x0001
    str     x9, [sp, #32]
.L537:
    mov     x9, #0
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L538
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0010
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_x
    mov     x13, x0
    str     x13, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0018
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_x
    mov     x13, x0
    str     x13, [sp, #48]
    b       .L539
.L538:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0010
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_w
    mov     x13, x0
    str     x13, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0018
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_w
    mov     x13, x0
    str     x13, [sp, #48]
.L539:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _dst_x_reg
    mov     x11, x0
    str     x11, [sp, #56]
    adrp    x9, L_str111@PAGE
    add     x9, x9, L_str111@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x000c
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #560]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #592]
    adrp    x9, L_str112@PAGE
    add     x9, x9, L_str112@PAGEOFF
    str     x9, [sp, #80]
    movz    x9, #0x0002
    str     x9, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #640]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #672]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #696]
    adrp    x9, L_str113@PAGE
    add     x9, x9, L_str113@PAGEOFF
    str     x9, [sp, #96]
    movz    x9, #0x000c
    str     x9, [sp, #104]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    ldr     x11, [sp, #104]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #744]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #768]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #800]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_cc
    str     x0, [sp, #824]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #848]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_spill_x
    str     x0, [sp, #912]
.L812:
    add     sp, sp, #928
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_syscall
_emit_i_syscall:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #816
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #40]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #48]
    ldr     x9, [sp, #48]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L540
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    ldr     x11, [sp, #48]
    movz    x12, #0x0009
    add     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_mov_x_x
    str     x0, [sp, #312]
    b       .L541
.L540:
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    ldr     x11, [sp, #40]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_ldr_x
    str     x0, [sp, #360]
.L541:
    movz    x9, #0x0001
    str     x9, [sp, #56]
.L542:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #16]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L543
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    ldr     x12, [sp, #56]
    movz    x13, #0x0008
    mul     x14, x12, x13
    add     x12, x11, x14
    ldr     x11, [x12]
    ldr     x12, [sp, #56]
    movz    x13, #0x0001
    sub     x14, x12, x13
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x14
    bl      _emit_load_slot_to_x
    str     x0, [sp, #512]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L542
.L543:
    adrp    x9, L_str114@PAGE
    add     x9, x9, L_str114@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x0012
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #584]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #80]
    ldr     x9, [sp, #80]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L544
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x10, #0
    mov     x0, x9
    mov     x1, x12
    mov     x2, x10
    bl      _emit_mov_x_x
    str     x0, [sp, #728]
    b       .L813
.L544:
    ldr     x9, [sp, #0]
    mov     x10, #0
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_str_x
    str     x0, [sp, #800]
.L813:
    add     sp, sp, #816
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_call
_emit_i_call:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #832
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, L_str115@PAGE
    add     x9, x9, L_str115@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0007
    str     x9, [sp, #32]
    ldr     x9, [sp, #16]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    movz    x11, #0x0058
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #24]
    movz    x12, #0x0007
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_at
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L545
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_syscall
    str     x0, [sp, #232]
    b       .L814
.L545:
    ldr     x9, [sp, #16]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L546:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #16]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L547
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #40]
    ldr     x12, [sp, #48]
    movz    x13, #0x0008
    mul     x14, x12, x13
    add     x12, x11, x14
    ldr     x11, [x12]
    ldr     x12, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_load_slot_to_x
    str     x0, [sp, #400]
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L546
.L547:
    adrp    x9, L_str116@PAGE
    add     x9, x9, L_str116@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x000c
    str     x9, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #472]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0050
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    movz    x12, #0x0058
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_sym
    str     x0, [sp, #552]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #576]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #72]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #80]
    ldr     x9, [sp, #80]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L548
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x10, #0
    mov     x0, x9
    mov     x1, x12
    mov     x2, x10
    bl      _emit_mov_x_x
    str     x0, [sp, #752]
    b       .L814
.L548:
    ldr     x9, [sp, #0]
    mov     x10, #0
    ldr     x11, [sp, #16]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_str_x
    str     x0, [sp, #824]
.L814:
    add     sp, sp, #832
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_ret
_emit_i_ret:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #752
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L549
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L550
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    movz    x9, #0x0008
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L551
    movz    x9, #0x0001
    str     x9, [sp, #32]
.L551:
.L550:
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #16]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #56]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L552
    ldr     x9, [sp, #56]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L553
    ldr     x9, [sp, #0]
    mov     x10, #0
    ldr     x11, [sp, #56]
    movz    x12, #0x0009
    add     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_mov_x_x
    str     x0, [sp, #424]
    b       .L554
.L553:
    ldr     x9, [sp, #0]
    mov     x10, #0
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_ldr_x
    str     x0, [sp, #496]
.L554:
    b       .L555
.L552:
    ldr     x9, [sp, #56]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L556
    ldr     x9, [sp, #0]
    mov     x10, #0
    ldr     x11, [sp, #56]
    movz    x12, #0x0009
    add     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_mov_w_w
    str     x0, [sp, #568]
    b       .L557
.L556:
    ldr     x9, [sp, #0]
    mov     x10, #0
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_ldr_w
    str     x0, [sp, #640]
.L557:
.L555:
.L549:
    adrp    x9, L_str117@PAGE
    add     x9, x9, L_str117@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x000e
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #688]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #712]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #736]
.L815:
    add     sp, sp, #752
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_jmp
_emit_i_jmp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, L_str118@PAGE
    add     x9, x9, L_str118@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x000e
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #120]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #144]
.L816:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_jz
_emit_i_jz:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #320
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0010
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _ensure_src_w
    mov     x13, x0
    str     x13, [sp, #24]
    adrp    x9, L_str119@PAGE
    add     x9, x9, L_str119@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x000c
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #168]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #192]
    adrp    x9, L_str120@PAGE
    add     x9, x9, L_str120@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0004
    str     x9, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #240]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #288]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #312]
.L817:
    add     sp, sp, #320
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_label
_emit_i_label:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, L_str121@PAGE
    add     x9, x9, L_str121@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0002
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #136]
    adrp    x9, L_str122@PAGE
    add     x9, x9, L_str122@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0002
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #184]
.L818:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_instr
_emit_instr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1184
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L558
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_movi
    str     x0, [sp, #120]
    b       .L819
.L558:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L559
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_label_addr
    str     x0, [sp, #176]
    b       .L819
.L559:
    ldr     x9, [sp, #32]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L560
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_addr_local
    str     x0, [sp, #232]
    b       .L819
.L560:
    ldr     x9, [sp, #32]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L561
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_load_local
    str     x0, [sp, #288]
    b       .L819
.L561:
    ldr     x9, [sp, #32]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L562
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_store_local
    str     x0, [sp, #344]
    b       .L819
.L562:
    ldr     x9, [sp, #32]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L563
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_load_mem
    str     x0, [sp, #400]
    b       .L819
.L563:
    ldr     x9, [sp, #32]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L564
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_store_mem
    str     x0, [sp, #456]
    b       .L819
.L564:
    ldr     x9, [sp, #32]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L565
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_binop
    str     x0, [sp, #512]
    b       .L819
.L565:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L566
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x12, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_i_cmp
    str     x0, [sp, #576]
    b       .L819
.L566:
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L567
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0001
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_i_cmp
    str     x0, [sp, #640]
    b       .L819
.L567:
    ldr     x9, [sp, #32]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L568
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0002
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_i_cmp
    str     x0, [sp, #704]
    b       .L819
.L568:
    ldr     x9, [sp, #32]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L569
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_i_cmp
    str     x0, [sp, #768]
    b       .L819
.L569:
    ldr     x9, [sp, #32]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L570
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0004
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_i_cmp
    str     x0, [sp, #832]
    b       .L819
.L570:
    ldr     x9, [sp, #32]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L571
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    movz    x12, #0x0005
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_i_cmp
    str     x0, [sp, #896]
    b       .L819
.L571:
    ldr     x9, [sp, #32]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L572
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_call
    str     x0, [sp, #952]
    b       .L819
.L572:
    ldr     x9, [sp, #32]
    movz    x10, #0x000f
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L573
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    ldr     x12, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_i_ret
    str     x0, [sp, #1016]
    b       .L819
.L573:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L574
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_i_jmp
    str     x0, [sp, #1064]
    b       .L819
.L574:
    ldr     x9, [sp, #32]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L575
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_jz
    str     x0, [sp, #1120]
    b       .L819
.L575:
    ldr     x9, [sp, #32]
    movz    x10, #0x0012
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L576
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_i_label
    str     x0, [sp, #1168]
    b       .L819
.L576:
.L819:
    add     sp, sp, #1184
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_sym
_emit_sym:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L577
    ldr     x9, [sp, #0]
    movz    x10, #0x005f
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #72]
.L577:
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    add     x12, x10, x11
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x12
    mov     x2, x10
    bl      _out_bytes
    str     x0, [sp, #152]
.L820:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_prologue
_emit_prologue:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #688
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, L_str123@PAGE
    add     x9, x9, L_str123@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x000e
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #120]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_sym
    str     x0, [sp, #200]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #224]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_sym
    str     x0, [sp, #304]
    adrp    x9, L_str124@PAGE
    add     x9, x9, L_str124@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0038
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #352]
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L578
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0fff
    cmp     x9, x10
    cset    w11, ls
    cbz     w11, .L579
    adrp    x9, L_str125@PAGE
    add     x9, x9, L_str125@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0015
    str     x9, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #496]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #544]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #568]
    b       .L580
.L579:
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    ldr     x11, [sp, #8]
    movz    x12, #0x0038
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_movi
    str     x0, [sp, #624]
    adrp    x9, L_str126@PAGE
    add     x9, x9, L_str126@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x0018
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #672]
.L580:
.L578:
.L821:
    add     sp, sp, #688
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_epilogue
_emit_epilogue:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #592
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, L_str127@PAGE
    add     x9, x9, L_str127@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0002
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #144]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #168]
    adrp    x9, L_str128@PAGE
    add     x9, x9, L_str128@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0002
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #216]
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L581
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0fff
    cmp     x9, x10
    cset    w11, ls
    cbz     w11, .L582
    adrp    x9, L_str129@PAGE
    add     x9, x9, L_str129@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0015
    str     x9, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #360]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #408]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #432]
    b       .L583
.L582:
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    ldr     x11, [sp, #8]
    movz    x12, #0x0038
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_movi
    str     x0, [sp, #488]
    adrp    x9, L_str130@PAGE
    add     x9, x9, L_str130@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x0018
    str     x9, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #536]
.L583:
.L581:
    adrp    x9, L_str131@PAGE
    add     x9, x9, L_str131@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x0028
    str     x9, [sp, #96]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #584]
.L822:
    add     sp, sp, #592
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_text_section
_emit_text_section:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L584
    adrp    x9, L_str132@PAGE
    add     x9, x9, L_str132@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x001b
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #104]
    b       .L823
.L584:
    adrp    x9, L_str133@PAGE
    add     x9, x9, L_str133@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0018
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #152]
.L823:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_param_spill
_emit_param_spill:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #592
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x9, #0x0008
    str     x9, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L585
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L586
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    str     x10, [sp, #48]
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L587
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L587:
    ldr     x9, [sp, #48]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L588
    movz    x9, #0x0004
    str     x9, [sp, #24]
.L588:
.L586:
.L585:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L589
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #312]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #336]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_sp_tail
    str     x0, [sp, #376]
    b       .L824
.L589:
    ldr     x9, [sp, #24]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L590
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #424]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #448]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_sp_tail
    str     x0, [sp, #488]
    b       .L824
.L590:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _out_mn
    str     x0, [sp, #512]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #536]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_sp_tail
    str     x0, [sp, #576]
.L824:
    add     sp, sp, #592
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_fn
_emit_fn:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #336
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_prologue
    str     x0, [sp, #56]
    mov     x9, #0
    str     x9, [sp, #24]
.L591:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L592
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_param_spill
    str     x0, [sp, #144]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L591
.L592:
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
.L593:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L594
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #32]
    ldr     x12, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_instr
    str     x0, [sp, #264]
    ldr     x9, [sp, #32]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L593
.L594:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_epilogue
    str     x0, [sp, #328]
.L825:
    add     sp, sp, #336
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_string_byte
_emit_string_byte:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, L_str134@PAGE
    add     x9, x9, L_str134@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x000e
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #88]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    udiv     x11, x9, x10
    str     x11, [sp, #32]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #32]
    movz    x11, #0x0010
    mul     x12, x10, x11
    sub     x10, x9, x12
    str     x10, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _out_nibble
    str     x0, [sp, #176]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _out_nibble
    str     x0, [sp, #200]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #224]
.L826:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_strings
_emit_strings:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #592
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L595
    b       .L827
.L595:
    adrp    x9, L_str135@PAGE
    add     x9, x9, L_str135@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x001f
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #168]
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
.L596:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L597
    adrp    x9, L_str136@PAGE
    add     x9, x9, L_str136@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0014
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #272]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #320]
    adrp    x9, L_str137@PAGE
    add     x9, x9, L_str137@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0002
    str     x9, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #368]
    mov     x9, #0
    str     x9, [sp, #72]
.L598:
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #32]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L599
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #72]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_string_byte
    str     x0, [sp, #496]
    ldr     x9, [sp, #72]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #72]
    b       .L598
.L599:
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _emit_string_byte
    str     x0, [sp, #544]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L596
.L597:
.L827:
    add     sp, sp, #592
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_macos_start
_emit_macos_start:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, L_str138@PAGE
    add     x9, x9, L_str138@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x005a
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #64]
.L828:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_bsses
_emit_bsses:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #560
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L600
    b       .L829
.L600:
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #144]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
.L601:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L602
    adrp    x9, L_str139@PAGE
    add     x9, x9, L_str139@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x001c
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #248]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    mov     x12, #0
    add     x13, x11, x12
    ldr     x11, [x13]
    add     x12, x10, x11
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x13, x10, x11
    ldr     x10, [x13]
    mov     x0, x9
    mov     x1, x12
    mov     x2, x10
    bl      _out_bytes
    str     x0, [sp, #376]
    adrp    x9, L_str140@PAGE
    add     x9, x9, L_str140@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0001
    str     x9, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #424]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #472]
    adrp    x9, L_str141@PAGE
    add     x9, x9, L_str141@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x0003
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #520]
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    b       .L601
.L602:
.L829:
    add     sp, sp, #560
    ldp     x29, x30, [sp], #16
    ret

    .globl   _codegen
_codegen:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #928
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _set_target
    str     x0, [sp, #80]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _emit_text_section
    str     x0, [sp, #96]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L603
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _emit_macos_start
    str     x0, [sp, #136]
.L603:
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    str     x9, [sp, #40]
.L604:
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L605
    ldr     x9, [sp, #40]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
.L606:
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L607
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0012
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L608
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L609
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
.L609:
.L608:
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L610
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L611
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
.L611:
.L610:
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L612
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L613
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
.L613:
.L612:
    ldr     x9, [sp, #48]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    b       .L606
.L607:
    ldr     x9, [sp, #40]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    b       .L604
.L605:
    ldr     x9, [sp, #32]
    str     x9, [sp, #56]
    ldr     x9, [sp, #24]
    str     x9, [sp, #64]
.L614:
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L615
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_fn
    str     x0, [sp, #800]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    ldr     x9, [sp, #64]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #64]
    b       .L614
.L615:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_strings
    str     x0, [sp, #880]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_bsses
    str     x0, [sp, #904]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #920]
.L830:
    add     sp, sp, #928
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_arena_init
_pp_arena_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _PP_ARENA_STORE@PAGE
    add     x9, x9, _PP_ARENA_STORE@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    adrp    x10, _PP_ARENA_BUF@PAGE
    add     x10, x10, _PP_ARENA_BUF@PAGEOFF
    movz    x11, #0x0040, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _arena_init
    str     x0, [sp, #40]
    ldr     x9, [sp, #0]
    mov     x0, x9
    b       .L831
.L831:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_seen
_pp_seen:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #352
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _PP_SEEN_COUNT@PAGE
    add     x9, x9, _PP_SEEN_COUNT@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #24]
    adrp    x9, _PP_SEEN_PTRS@PAGE
    add     x9, x9, _PP_SEEN_PTRS@PAGEOFF
    str     x9, [sp, #32]
    adrp    x9, _PP_SEEN_LENS@PAGE
    add     x9, x9, _PP_SEEN_LENS@PAGEOFF
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L616:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L617
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L618
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #48]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #0]
    ldr     x11, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L619
    movz    x9, #0x0001
    mov     x0, x9
    b       .L832
.L619:
.L618:
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L616
.L617:
    mov     x9, #0
    mov     x0, x9
    b       .L832
.L832:
    add     sp, sp, #352
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_mark
_pp_mark:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #288
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _PP_SEEN_COUNT@PAGE
    add     x9, x9, _PP_SEEN_COUNT@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #24]
    adrp    x9, _PP_SEEN_PTRS@PAGE
    add     x9, x9, _PP_SEEN_PTRS@PAGEOFF
    str     x9, [sp, #32]
    adrp    x9, _PP_SEEN_LENS@PAGE
    add     x9, x9, _PP_SEEN_LENS@PAGEOFF
    str     x9, [sp, #40]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #24]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    str     x9, [x10]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #24]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #8]
    str     x9, [x10]
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0001
    add     x12, x9, x11
    str     x12, [x10]
.L833:
    add     sp, sp, #288
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_out_append
_pp_out_append:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #304
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _PP_OUT_LEN@PAGE
    add     x9, x9, _PP_OUT_LEN@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #24]
    adrp    x9, _PP_OUT@PAGE
    add     x9, x9, _PP_OUT@PAGEOFF
    str     x9, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
.L620:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L621
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #40]
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    ldr     x11, [sp, #40]
    add     x12, x9, x11
    ldrb    w9, [x12]
    strb    w9, [x10]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L620
.L621:
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    ldr     x11, [sp, #8]
    add     x12, x9, x11
    str     x12, [x10]
.L834:
    add     sp, sp, #304
    ldp     x29, x30, [sp], #16
    ret

    .globl   _is_import_line
_is_import_line:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #272
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, L_str142@PAGE
    add     x9, x9, L_str142@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0007
    str     x9, [sp, #32]
    ldr     x9, [sp, #8]
    movz    x10, #0x0007
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    cmp     x11, x9
    cset    w10, hi
    cbz     w10, .L622
    mov     x9, #0
    mov     x0, x9
    b       .L835
.L622:
    mov     x9, #0
    str     x9, [sp, #40]
.L623:
    ldr     x9, [sp, #40]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L624
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #40]
    add     x12, x10, x11
    add     x10, x9, x12
    ldrb    w9, [x10]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #40]
    add     x12, x10, x11
    ldrb    w10, [x12]
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L625
    mov     x9, #0
    mov     x0, x9
    b       .L835
.L625:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L623
.L624:
    movz    x9, #0x0001
    mov     x0, x9
    b       .L835
.L835:
    add     sp, sp, #272
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_expand
_pp_expand:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1552
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _pp_seen
    mov     x11, x0
    movz    x9, #0x0001
    cmp     w11, w9
    cset    w10, eq
    cbz     w10, .L626
    b       .L836
.L626:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0001
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _arena_take
    mov     x10, x0
    str     x10, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
.L627:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L628
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #32]
    add     x12, x9, x10
    ldrb    w9, [x12]
    strb    w9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L627
.L628:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    add     x11, x9, x10
    mov     x9, #0
    strb    w9, [x11]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _pp_mark
    str     x0, [sp, #392]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #40]
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _io_open_read
    mov     x10, x0
    str     x10, [sp, #48]
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L629
    b       .L836
.L629:
    mov     x9, #0
    str     x9, [sp, #56]
.L630:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #56]
    add     x12, x10, x11
    movz    x10, #0x0002, lsl #16
    ldr     x11, [sp, #56]
    sub     x13, x10, x11
    mov     x0, x9
    mov     x1, x12
    mov     x2, x13
    bl      _io_read
    mov     x10, x0
    str     x10, [sp, #64]
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L632
    b       .L631
.L632:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #64]
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L630
.L631:
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #592]
    ldr     x9, [sp, #40]
    str     x9, [sp, #72]
    mov     x9, #0
    str     x9, [sp, #80]
.L633:
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #56]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L634
    ldr     x9, [sp, #80]
    str     x9, [sp, #88]
.L635:
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #56]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L636
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #80]
    add     x11, x9, x10
    ldrb    w9, [x11]
    movz    x10, #0x000a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L637
    b       .L636
.L637:
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #80]
    b       .L635
.L636:
    ldr     x9, [sp, #80]
    str     x9, [sp, #96]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _is_import_line
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L638
    ldr     x9, [sp, #88]
    movz    x10, #0x0007
    add     x11, x9, x10
    str     x11, [sp, #104]
.L639:
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #96]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L640
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #104]
    add     x11, x9, x10
    ldrb    w9, [x11]
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L641
    b       .L640
.L641:
    ldr     x9, [sp, #104]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #104]
    b       .L639
.L640:
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #96]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L642
    ldr     x9, [sp, #104]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #112]
.L643:
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #96]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L644
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #112]
    add     x11, x9, x10
    ldrb    w9, [x11]
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L645
    b       .L644
.L645:
    ldr     x9, [sp, #112]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #112]
    b       .L643
.L644:
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #96]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L646
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #104]
    sub     x11, x9, x10
    movz    x9, #0x0001
    sub     x10, x11, x9
    str     x10, [sp, #120]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #120]
    movz    x11, #0x0001
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _arena_take
    mov     x10, x0
    str     x10, [sp, #128]
    mov     x9, #0
    str     x9, [sp, #136]
.L647:
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #120]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L648
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #136]
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #104]
    movz    x12, #0x0001
    add     x13, x10, x12
    ldr     x10, [sp, #136]
    add     x12, x13, x10
    add     x10, x9, x12
    ldrb    w9, [x10]
    strb    w9, [x11]
    ldr     x9, [sp, #136]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #136]
    b       .L647
.L648:
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #120]
    add     x11, x9, x10
    mov     x9, #0
    strb    w9, [x11]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #128]
    ldr     x11, [sp, #120]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _pp_expand
    str     x0, [sp, #1368]
.L646:
.L642:
    b       .L649
.L638:
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #88]
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #88]
    sub     x12, x9, x10
    mov     x0, x11
    mov     x1, x12
    bl      _pp_out_append
    str     x0, [sp, #1424]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #96]
    add     x11, x9, x10
    str     x11, [sp, #144]
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #56]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L650
    ldr     x9, [sp, #144]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _pp_out_append
    str     x0, [sp, #1496]
.L650:
.L649:
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #56]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L651
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #80]
.L651:
    b       .L633
.L634:
.L836:
    add     sp, sp, #1552
    ldp     x29, x30, [sp], #16
    ret

    .globl   _dump_tokens
_dump_tokens:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #640
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lex_init
    str     x0, [sp, #136]
    adrp    x9, _DUMP_TOK_STORE@PAGE
    add     x9, x9, _DUMP_TOK_STORE@PAGEOFF
    str     x9, [sp, #32]
.L652:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_next
    str     x0, [sp, #168]
    adrp    x9, L_str143@PAGE
    add     x9, x9, L_str143@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0005
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #216]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x11, #0
    add     x12, x10, x11
    ldr     w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #264]
    adrp    x9, L_str144@PAGE
    add     x9, x9, L_str144@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0007
    str     x9, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #312]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #360]
    adrp    x9, L_str145@PAGE
    add     x9, x9, L_str145@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x0005
    str     x9, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #408]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #456]
    adrp    x9, L_str146@PAGE
    add     x9, x9, L_str146@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x0006
    str     x9, [sp, #96]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #504]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #552]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #576]
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     w9, [x11]
    mov     x10, #0
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L654
    b       .L653
.L654:
    b       .L652
.L653:
.L837:
    add     sp, sp, #640
    ldp     x29, x30, [sp], #16
    ret

    .globl   _read_all
_read_all:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _io_open_read
    mov     x10, x0
    str     x10, [sp, #24]
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L655
    mov     x9, #0
    mov     x0, x9
    b       .L838
.L655:
    mov     x9, #0
    str     x9, [sp, #32]
.L656:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #32]
    add     x12, x10, x11
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #32]
    sub     x13, x10, x11
    mov     x0, x9
    mov     x1, x12
    mov     x2, x13
    bl      _io_read
    mov     x10, x0
    str     x10, [sp, #40]
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L658
    b       .L657
.L658:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L656
.L657:
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #224]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L838
.L838:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _bytes_eq_lit
_bytes_eq_lit:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
.L659:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L660
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    add     x11, x9, x10
    ldrb    w9, [x11]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    ldrb    w10, [x12]
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L661
    mov     x9, #0
    mov     x0, x9
    b       .L839
.L661:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L659
.L660:
    movz    x9, #0x0001
    mov     x0, x9
    b       .L839
.L839:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cstr_eq
_cstr_eq:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #240
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
.L662:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L663
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    add     x11, x9, x10
    ldrb    w9, [x11]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    ldrb    w10, [x12]
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L664
    mov     x9, #0
    mov     x0, x9
    b       .L840
.L664:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L662
.L663:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    add     x11, x9, x10
    ldrb    w9, [x11]
    mov     x10, #0
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L665
    mov     x9, #0
    mov     x0, x9
    b       .L840
.L665:
    movz    x9, #0x0001
    mov     x0, x9
    b       .L840
.L840:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _main
_main:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1584
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L666
    movz    x9, #0x0002
    mov     w0, w9
    b       .L841
.L666:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #16]
    adrp    x9, L_str147@PAGE
    add     x9, x9, L_str147@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x000d
    str     x9, [sp, #32]
    adrp    x9, L_str148@PAGE
    add     x9, x9, L_str148@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0009
    str     x9, [sp, #48]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cstr_eq
    mov     x12, x0
    str     x12, [sp, #56]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cstr_eq
    mov     x12, x0
    str     x12, [sp, #64]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L667
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #72]
    ldr     x9, [sp, #72]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    movz    x11, #0x0004, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _read_all
    mov     x12, x0
    str     x12, [sp, #80]
    ldr     x9, [sp, #80]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L668
    movz    x9, #0x0003
    mov     w0, w9
    b       .L841
.L668:
    adrp    x9, _OUT_STORAGE@PAGE
    add     x9, x9, _OUT_STORAGE@PAGEOFF
    str     x9, [sp, #88]
    ldr     x9, [sp, #88]
    movz    x10, #0x0001
    adrp    x11, _OUT_BUF@PAGE
    add     x11, x11, _OUT_BUF@PAGEOFF
    movz    x12, #0x0001, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #608]
    ldr     x9, [sp, #88]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    ldr     x11, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _dump_tokens
    str     x0, [sp, #640]
    ldr     x9, [sp, #88]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #656]
    mov     x9, #0
    mov     w0, w9
    b       .L841
.L667:
    ldr     x9, [sp, #64]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L669
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #96]
    ldr     x9, [sp, #96]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    movz    x11, #0x0004, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _read_all
    mov     x12, x0
    str     x12, [sp, #104]
    ldr     x9, [sp, #104]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L670
    movz    x9, #0x0003
    mov     w0, w9
    b       .L841
.L670:
    bl      _ast_init
    mov     x9, x0
    str     x9, [sp, #112]
    bl      _ir_init
    mov     x9, x0
    str     x9, [sp, #120]
    ldr     x9, [sp, #112]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    ldr     x11, [sp, #104]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _parse
    mov     x12, x0
    str     x12, [sp, #128]
    ldr     x9, [sp, #120]
    ldr     x10, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    bl      _lower
    mov     x11, x0
    str     x11, [sp, #136]
    adrp    x9, _OUT_STORAGE@PAGE
    add     x9, x9, _OUT_STORAGE@PAGEOFF
    str     x9, [sp, #144]
    ldr     x9, [sp, #144]
    movz    x10, #0x0001
    adrp    x11, _OUT_BUF@PAGE
    add     x11, x11, _OUT_BUF@PAGEOFF
    movz    x12, #0x0001, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #920]
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    bl      _dump_ir
    str     x0, [sp, #944]
    ldr     x9, [sp, #144]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #960]
    mov     x9, #0
    mov     w0, w9
    b       .L841
.L669:
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L671
    movz    x9, #0x0002
    mov     w0, w9
    b       .L841
.L671:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0003
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #152]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0001
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #160]
    bl      _pp_arena_init
    mov     x9, x0
    str     x9, [sp, #168]
    mov     x9, #0
    str     x9, [sp, #176]
.L672:
    ldr     x9, [sp, #152]
    ldr     x10, [sp, #176]
    add     x11, x9, x10
    ldrb    w9, [x11]
    mov     x10, #0
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L674
    b       .L673
.L674:
    ldr     x9, [sp, #176]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #176]
    b       .L672
.L673:
    ldr     x9, [sp, #168]
    ldr     x10, [sp, #152]
    ldr     x11, [sp, #176]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _pp_expand
    str     x0, [sp, #1248]
    adrp    x9, _PP_OUT_LEN@PAGE
    add     x9, x9, _PP_OUT_LEN@PAGEOFF
    str     x9, [sp, #184]
    ldr     x9, [sp, #184]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #192]
    ldr     x9, [sp, #192]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L675
    movz    x9, #0x0003
    mov     w0, w9
    b       .L841
.L675:
    adrp    x9, _PP_OUT@PAGE
    add     x9, x9, _PP_OUT@PAGEOFF
    str     x9, [sp, #200]
    bl      _ast_init
    mov     x9, x0
    str     x9, [sp, #208]
    bl      _ir_init
    mov     x9, x0
    str     x9, [sp, #216]
    ldr     x9, [sp, #208]
    ldr     x10, [sp, #200]
    ldr     x11, [sp, #192]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _parse
    mov     x12, x0
    str     x12, [sp, #224]
    ldr     x9, [sp, #216]
    ldr     x10, [sp, #224]
    mov     x0, x9
    mov     x1, x10
    bl      _lower
    mov     x11, x0
    str     x11, [sp, #232]
    ldr     x9, [sp, #160]
    mov     x0, x9
    bl      _io_open_write
    mov     x10, x0
    str     x10, [sp, #240]
    ldr     x9, [sp, #240]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L676
    movz    x9, #0x0004
    mov     w0, w9
    b       .L841
.L676:
    adrp    x9, _OUT_STORAGE@PAGE
    add     x9, x9, _OUT_STORAGE@PAGEOFF
    str     x9, [sp, #248]
    ldr     x9, [sp, #248]
    ldr     x10, [sp, #240]
    adrp    x11, _OUT_BUF@PAGE
    add     x11, x11, _OUT_BUF@PAGEOFF
    movz    x12, #0x0001, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #1512]
    ldr     x9, [sp, #248]
    movz    x10, #0x0001
    ldr     x11, [sp, #224]
    ldr     x12, [sp, #232]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _codegen
    str     x0, [sp, #1552]
    ldr     x9, [sp, #240]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #1568]
    mov     x9, #0
    mov     w0, w9
    b       .L841
.L841:
    add     sp, sp, #1584
    ldp     x29, x30, [sp], #16
    ret

    .section __TEXT,__cstring
    .balign  8
L_str0:
    .byte   0x65
    .byte   0x72
    .byte   0x72
    .byte   0x6f
    .byte   0x72
    .byte   0x20
    .byte   0x6c
    .byte   0x69
    .byte   0x6e
    .byte   0x65
    .byte   0x61
    .byte   0x20
    .byte   0x00
    .balign  8
L_str1:
    .byte   0x3a
    .byte   0x20
    .byte   0x00
    .balign  8
L_str2:
    .byte   0x66
    .byte   0x75
    .byte   0x6e
    .byte   0x00
    .balign  8
L_str3:
    .byte   0x6c
    .byte   0x65
    .byte   0x74
    .byte   0x00
    .balign  8
L_str4:
    .byte   0x63
    .byte   0x6f
    .byte   0x6e
    .byte   0x73
    .byte   0x74
    .byte   0x00
    .balign  8
L_str5:
    .byte   0x72
    .byte   0x65
    .byte   0x74
    .byte   0x75
    .byte   0x72
    .byte   0x6e
    .byte   0x00
    .balign  8
L_str6:
    .byte   0x69
    .byte   0x66
    .byte   0x00
    .balign  8
L_str7:
    .byte   0x65
    .byte   0x6c
    .byte   0x73
    .byte   0x65
    .byte   0x00
    .balign  8
L_str8:
    .byte   0x6c
    .byte   0x6f
    .byte   0x6f
    .byte   0x70
    .byte   0x00
    .balign  8
L_str9:
    .byte   0x77
    .byte   0x68
    .byte   0x69
    .byte   0x6c
    .byte   0x65
    .byte   0x00
    .balign  8
L_str10:
    .byte   0x62
    .byte   0x72
    .byte   0x65
    .byte   0x61
    .byte   0x6b
    .byte   0x00
    .balign  8
L_str11:
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x75
    .byte   0x63
    .byte   0x74
    .byte   0x00
    .balign  8
L_str12:
    .byte   0x62
    .byte   0x73
    .byte   0x73
    .byte   0x00
    .balign  8
L_str13:
    .byte   0x6e
    .byte   0x69
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str14:
    .byte   0x73
    .byte   0x69
    .byte   0x7a
    .byte   0x65
    .byte   0x6f
    .byte   0x66
    .byte   0x00
    .balign  8
L_str15:
    .byte   0x64
    .byte   0x65
    .byte   0x6d
    .byte   0x61
    .byte   0x73
    .byte   0x69
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x73
    .byte   0x20
    .byte   0x61
    .byte   0x72
    .byte   0x67
    .byte   0x73
    .byte   0x20
    .byte   0x28
    .byte   0x3e
    .byte   0x38
    .byte   0x29
    .byte   0x00
    .balign  8
L_str16:
    .byte   0x73
    .byte   0x79
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str17:
    .byte   0x65
    .byte   0x78
    .byte   0x70
    .byte   0x72
    .byte   0x65
    .byte   0x73
    .byte   0x69
    .byte   0x6f
    .byte   0x6e
    .byte   0x20
    .byte   0x70
    .byte   0x72
    .byte   0x69
    .byte   0x6d
    .byte   0x61
    .byte   0x72
    .byte   0x69
    .byte   0x61
    .byte   0x20
    .byte   0x69
    .byte   0x6e
    .byte   0x76
    .byte   0x61
    .byte   0x6c
    .byte   0x69
    .byte   0x64
    .byte   0x61
    .byte   0x00
    .balign  8
L_str18:
    .byte   0x73
    .byte   0x65
    .byte   0x20
    .byte   0x65
    .byte   0x73
    .byte   0x70
    .byte   0x65
    .byte   0x72
    .byte   0x61
    .byte   0x62
    .byte   0x61
    .byte   0x20
    .byte   0x69
    .byte   0x64
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x69
    .byte   0x66
    .byte   0x69
    .byte   0x63
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x72
    .byte   0x20
    .byte   0x74
    .byte   0x72
    .byte   0x61
    .byte   0x73
    .byte   0x20
    .byte   0x2e
    .byte   0x00
    .balign  8
L_str19:
    .byte   0x70
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str20:
    .byte   0x6c
    .byte   0x65
    .byte   0x6e
    .byte   0x00
    .balign  8
L_str21:
    .byte   0x63
    .byte   0x61
    .byte   0x6d
    .byte   0x70
    .byte   0x6f
    .byte   0x20
    .byte   0x64
    .byte   0x65
    .byte   0x73
    .byte   0x63
    .byte   0x6f
    .byte   0x6e
    .byte   0x6f
    .byte   0x63
    .byte   0x69
    .byte   0x64
    .byte   0x6f
    .byte   0x20
    .byte   0x65
    .byte   0x6e
    .byte   0x20
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x75
    .byte   0x63
    .byte   0x74
    .byte   0x00
    .balign  8
L_str22:
    .byte   0x63
    .byte   0x61
    .byte   0x6d
    .byte   0x70
    .byte   0x6f
    .byte   0x20
    .byte   0x64
    .byte   0x65
    .byte   0x73
    .byte   0x63
    .byte   0x6f
    .byte   0x6e
    .byte   0x6f
    .byte   0x63
    .byte   0x69
    .byte   0x64
    .byte   0x6f
    .byte   0x20
    .byte   0x65
    .byte   0x6e
    .byte   0x20
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x75
    .byte   0x63
    .byte   0x74
    .byte   0x00
    .balign  8
L_str23:
    .byte   0x70
    .byte   0x6f
    .byte   0x73
    .byte   0x74
    .byte   0x66
    .byte   0x69
    .byte   0x78
    .byte   0x20
    .byte   0x6e
    .byte   0x6f
    .byte   0x20
    .byte   0x73
    .byte   0x6f
    .byte   0x70
    .byte   0x6f
    .byte   0x72
    .byte   0x74
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str24:
    .byte   0x64
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x66
    .byte   0x20
    .byte   0x73
    .byte   0x6f
    .byte   0x62
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x65
    .byte   0x78
    .byte   0x70
    .byte   0x72
    .byte   0x65
    .byte   0x73
    .byte   0x69
    .byte   0x6f
    .byte   0x6e
    .byte   0x20
    .byte   0x73
    .byte   0x69
    .byte   0x6e
    .byte   0x20
    .byte   0x74
    .byte   0x69
    .byte   0x70
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str25:
    .byte   0x64
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x66
    .byte   0x20
    .byte   0x73
    .byte   0x6f
    .byte   0x62
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x6e
    .byte   0x6f
    .byte   0x2d
    .byte   0x70
    .byte   0x75
    .byte   0x6e
    .byte   0x74
    .byte   0x65
    .byte   0x72
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str26:
    .byte   0x73
    .byte   0x65
    .byte   0x20
    .byte   0x65
    .byte   0x73
    .byte   0x70
    .byte   0x65
    .byte   0x72
    .byte   0x61
    .byte   0x62
    .byte   0x61
    .byte   0x20
    .byte   0x74
    .byte   0x6f
    .byte   0x6b
    .byte   0x65
    .byte   0x6e
    .byte   0x00
    .balign  8
L_str27:
    .byte   0x73
    .byte   0x65
    .byte   0x20
    .byte   0x65
    .byte   0x73
    .byte   0x70
    .byte   0x65
    .byte   0x72
    .byte   0x61
    .byte   0x62
    .byte   0x61
    .byte   0x20
    .byte   0x74
    .byte   0x69
    .byte   0x70
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str28:
    .byte   0x75
    .byte   0x38
    .byte   0x00
    .balign  8
L_str29:
    .byte   0x75
    .byte   0x33
    .byte   0x32
    .byte   0x00
    .balign  8
L_str30:
    .byte   0x75
    .byte   0x36
    .byte   0x34
    .byte   0x00
    .balign  8
L_str31:
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str32:
    .byte   0x6c
    .byte   0x65
    .byte   0x74
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x71
    .byte   0x75
    .byte   0x69
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x69
    .byte   0x64
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x69
    .byte   0x66
    .byte   0x69
    .byte   0x63
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str33:
    .byte   0x66
    .byte   0x75
    .byte   0x6e
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x71
    .byte   0x75
    .byte   0x69
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x69
    .byte   0x64
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x69
    .byte   0x66
    .byte   0x69
    .byte   0x63
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str34:
    .byte   0x70
    .byte   0x61
    .byte   0x72
    .byte   0x61
    .byte   0x6d
    .byte   0x65
    .byte   0x74
    .byte   0x72
    .byte   0x6f
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x71
    .byte   0x75
    .byte   0x69
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x69
    .byte   0x64
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x69
    .byte   0x66
    .byte   0x69
    .byte   0x63
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str35:
    .byte   0x63
    .byte   0x6f
    .byte   0x6e
    .byte   0x73
    .byte   0x74
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x71
    .byte   0x75
    .byte   0x69
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x69
    .byte   0x64
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x69
    .byte   0x66
    .byte   0x69
    .byte   0x63
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str36:
    .byte   0x63
    .byte   0x6f
    .byte   0x6e
    .byte   0x73
    .byte   0x74
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x71
    .byte   0x75
    .byte   0x69
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x76
    .byte   0x61
    .byte   0x6c
    .byte   0x6f
    .byte   0x72
    .byte   0x20
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x65
    .byte   0x72
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str37:
    .byte   0x62
    .byte   0x73
    .byte   0x73
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x71
    .byte   0x75
    .byte   0x69
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x69
    .byte   0x64
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x69
    .byte   0x66
    .byte   0x69
    .byte   0x63
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str38:
    .byte   0x62
    .byte   0x73
    .byte   0x73
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x71
    .byte   0x75
    .byte   0x69
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x74
    .byte   0x61
    .byte   0x6d
    .byte   0x61
    .byte   0xc3
    .byte   0xb1
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str39:
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x75
    .byte   0x63
    .byte   0x74
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x71
    .byte   0x75
    .byte   0x69
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x69
    .byte   0x64
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x69
    .byte   0x66
    .byte   0x69
    .byte   0x63
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str40:
    .byte   0x63
    .byte   0x61
    .byte   0x6d
    .byte   0x70
    .byte   0x6f
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x71
    .byte   0x75
    .byte   0x69
    .byte   0x65
    .byte   0x72
    .byte   0x65
    .byte   0x20
    .byte   0x69
    .byte   0x64
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x69
    .byte   0x66
    .byte   0x69
    .byte   0x63
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str41:
    .byte   0x64
    .byte   0x65
    .byte   0x6d
    .byte   0x61
    .byte   0x73
    .byte   0x69
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x73
    .byte   0x20
    .byte   0x70
    .byte   0x61
    .byte   0x72
    .byte   0x61
    .byte   0x6d
    .byte   0x73
    .byte   0x20
    .byte   0x28
    .byte   0x3e
    .byte   0x38
    .byte   0x29
    .byte   0x00
    .balign  8
L_str42:
    .byte   0x62
    .byte   0x72
    .byte   0x65
    .byte   0x61
    .byte   0x6b
    .byte   0x20
    .byte   0x66
    .byte   0x75
    .byte   0x65
    .byte   0x72
    .byte   0x61
    .byte   0x20
    .byte   0x64
    .byte   0x65
    .byte   0x20
    .byte   0x6c
    .byte   0x6f
    .byte   0x6f
    .byte   0x70
    .byte   0x00
    .balign  8
L_str43:
    .byte   0x66
    .byte   0x6e
    .byte   0x20
    .byte   0x00
    .balign  8
L_str44:
    .byte   0x20
    .byte   0x6e
    .byte   0x70
    .byte   0x61
    .byte   0x72
    .byte   0x61
    .byte   0x6d
    .byte   0x73
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str45:
    .byte   0x20
    .byte   0x6e
    .byte   0x73
    .byte   0x6c
    .byte   0x6f
    .byte   0x74
    .byte   0x73
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str46:
    .byte   0x20
    .byte   0x66
    .byte   0x72
    .byte   0x61
    .byte   0x6d
    .byte   0x65
    .byte   0x5f
    .byte   0x62
    .byte   0x79
    .byte   0x74
    .byte   0x65
    .byte   0x73
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str47:
    .byte   0x20
    .byte   0x20
    .byte   0x6f
    .byte   0x70
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str48:
    .byte   0x20
    .byte   0x64
    .byte   0x73
    .byte   0x74
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str49:
    .byte   0x20
    .byte   0x61
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str50:
    .byte   0x20
    .byte   0x62
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str51:
    .byte   0x20
    .byte   0x6c
    .byte   0x6f
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str52:
    .byte   0x20
    .byte   0x69
    .byte   0x6d
    .byte   0x6d
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str53:
    .byte   0x20
    .byte   0x6c
    .byte   0x61
    .byte   0x62
    .byte   0x65
    .byte   0x6c
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str54:
    .byte   0x20
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x5f
    .byte   0x69
    .byte   0x64
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str55:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6c
    .byte   0x64
    .byte   0x72
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str56:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str57:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6c
    .byte   0x64
    .byte   0x72
    .byte   0x62
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str58:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x62
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str59:
    .byte   0x2c
    .byte   0x20
    .byte   0x5b
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str60:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str61:
    .byte   0x2c
    .byte   0x20
    .byte   0x5b
    .byte   0x00
    .balign  8
L_str62:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str63:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6d
    .byte   0x6f
    .byte   0x76
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str64:
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str65:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6d
    .byte   0x6f
    .byte   0x76
    .byte   0x7a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str66:
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x78
    .byte   0x00
    .balign  8
L_str67:
    .byte   0x2c
    .byte   0x20
    .byte   0x6c
    .byte   0x73
    .byte   0x6c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str68:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6d
    .byte   0x6f
    .byte   0x76
    .byte   0x6b
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str69:
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x78
    .byte   0x00
    .balign  8
L_str70:
    .byte   0x2c
    .byte   0x20
    .byte   0x6c
    .byte   0x73
    .byte   0x6c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str71:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6c
    .byte   0x64
    .byte   0x72
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str72:
    .byte   0x2c
    .byte   0x20
    .byte   0x5b
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str73:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str74:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str75:
    .byte   0x2c
    .byte   0x20
    .byte   0x5b
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str76:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str77:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6d
    .byte   0x6f
    .byte   0x76
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str78:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str79:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6d
    .byte   0x6f
    .byte   0x76
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str80:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str81:
    .byte   0x61
    .byte   0x64
    .byte   0x64
    .byte   0x00
    .balign  8
L_str82:
    .byte   0x73
    .byte   0x75
    .byte   0x62
    .byte   0x00
    .balign  8
L_str83:
    .byte   0x6d
    .byte   0x75
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str84:
    .byte   0x75
    .byte   0x64
    .byte   0x69
    .byte   0x76
    .byte   0x00
    .balign  8
L_str85:
    .byte   0x61
    .byte   0x6e
    .byte   0x64
    .byte   0x00
    .balign  8
L_str86:
    .byte   0x6f
    .byte   0x72
    .byte   0x72
    .byte   0x00
    .balign  8
L_str87:
    .byte   0x65
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str88:
    .byte   0x6c
    .byte   0x73
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str89:
    .byte   0x6c
    .byte   0x73
    .byte   0x72
    .byte   0x00
    .balign  8
L_str90:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x61
    .byte   0x64
    .byte   0x72
    .byte   0x70
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str91:
    .byte   0x2c
    .byte   0x20
    .byte   0x5f
    .byte   0x00
    .balign  8
L_str92:
    .byte   0x40
    .byte   0x50
    .byte   0x41
    .byte   0x47
    .byte   0x45
    .byte   0x0a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x61
    .byte   0x64
    .byte   0x64
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str93:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str94:
    .byte   0x40
    .byte   0x50
    .byte   0x41
    .byte   0x47
    .byte   0x45
    .byte   0x4f
    .byte   0x46
    .byte   0x46
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str95:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x61
    .byte   0x64
    .byte   0x72
    .byte   0x70
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str96:
    .byte   0x2c
    .byte   0x20
    .byte   0x4c
    .byte   0x5f
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str97:
    .byte   0x40
    .byte   0x50
    .byte   0x41
    .byte   0x47
    .byte   0x45
    .byte   0x0a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x61
    .byte   0x64
    .byte   0x64
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str98:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str99:
    .byte   0x40
    .byte   0x50
    .byte   0x41
    .byte   0x47
    .byte   0x45
    .byte   0x4f
    .byte   0x46
    .byte   0x46
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str100:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x61
    .byte   0x64
    .byte   0x64
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str101:
    .byte   0x2c
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str102:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str103:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str104:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str105:
    .byte   0x65
    .byte   0x71
    .byte   0x00
    .balign  8
L_str106:
    .byte   0x6e
    .byte   0x65
    .byte   0x00
    .balign  8
L_str107:
    .byte   0x6c
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str108:
    .byte   0x6c
    .byte   0x73
    .byte   0x00
    .balign  8
L_str109:
    .byte   0x68
    .byte   0x69
    .byte   0x00
    .balign  8
L_str110:
    .byte   0x68
    .byte   0x73
    .byte   0x00
    .balign  8
L_str111:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x63
    .byte   0x6d
    .byte   0x70
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str112:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str113:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x63
    .byte   0x73
    .byte   0x65
    .byte   0x74
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str114:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x76
    .byte   0x63
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x78
    .byte   0x38
    .byte   0x30
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str115:
    .byte   0x73
    .byte   0x79
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str116:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x62
    .byte   0x6c
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str117:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x62
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str118:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x62
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str119:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x63
    .byte   0x62
    .byte   0x7a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str120:
    .byte   0x2c
    .byte   0x20
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str121:
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str122:
    .byte   0x3a
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str123:
    .byte   0x0a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x67
    .byte   0x6c
    .byte   0x6f
    .byte   0x62
    .byte   0x6c
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str124:
    .byte   0x3a
    .byte   0x0a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x74
    .byte   0x70
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x78
    .byte   0x32
    .byte   0x39
    .byte   0x2c
    .byte   0x20
    .byte   0x78
    .byte   0x33
    .byte   0x30
    .byte   0x2c
    .byte   0x20
    .byte   0x5b
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x2d
    .byte   0x31
    .byte   0x36
    .byte   0x5d
    .byte   0x21
    .byte   0x0a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6d
    .byte   0x6f
    .byte   0x76
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x78
    .byte   0x32
    .byte   0x39
    .byte   0x2c
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str125:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x75
    .byte   0x62
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str126:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x75
    .byte   0x62
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x78
    .byte   0x31
    .byte   0x36
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str127:
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str128:
    .byte   0x3a
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str129:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x61
    .byte   0x64
    .byte   0x64
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str130:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x61
    .byte   0x64
    .byte   0x64
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x78
    .byte   0x31
    .byte   0x36
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str131:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6c
    .byte   0x64
    .byte   0x70
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x78
    .byte   0x32
    .byte   0x39
    .byte   0x2c
    .byte   0x20
    .byte   0x78
    .byte   0x33
    .byte   0x30
    .byte   0x2c
    .byte   0x20
    .byte   0x5b
    .byte   0x73
    .byte   0x70
    .byte   0x5d
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x31
    .byte   0x36
    .byte   0x0a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x74
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str132:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x73
    .byte   0x65
    .byte   0x63
    .byte   0x74
    .byte   0x69
    .byte   0x6f
    .byte   0x6e
    .byte   0x20
    .byte   0x5f
    .byte   0x5f
    .byte   0x54
    .byte   0x45
    .byte   0x58
    .byte   0x54
    .byte   0x2c
    .byte   0x5f
    .byte   0x5f
    .byte   0x74
    .byte   0x65
    .byte   0x78
    .byte   0x74
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str133:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x73
    .byte   0x65
    .byte   0x63
    .byte   0x74
    .byte   0x69
    .byte   0x6f
    .byte   0x6e
    .byte   0x20
    .byte   0x2e
    .byte   0x74
    .byte   0x65
    .byte   0x78
    .byte   0x74
    .byte   0x2e
    .byte   0x62
    .byte   0x6f
    .byte   0x6f
    .byte   0x74
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str134:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x62
    .byte   0x79
    .byte   0x74
    .byte   0x65
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x30
    .byte   0x78
    .byte   0x00
    .balign  8
L_str135:
    .byte   0x0a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x73
    .byte   0x65
    .byte   0x63
    .byte   0x74
    .byte   0x69
    .byte   0x6f
    .byte   0x6e
    .byte   0x20
    .byte   0x5f
    .byte   0x5f
    .byte   0x54
    .byte   0x45
    .byte   0x58
    .byte   0x54
    .byte   0x2c
    .byte   0x5f
    .byte   0x5f
    .byte   0x63
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x69
    .byte   0x6e
    .byte   0x67
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str136:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x62
    .byte   0x61
    .byte   0x6c
    .byte   0x69
    .byte   0x67
    .byte   0x6e
    .byte   0x20
    .byte   0x20
    .byte   0x38
    .byte   0x0a
    .byte   0x4c
    .byte   0x5f
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str137:
    .byte   0x3a
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str138:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x67
    .byte   0x6c
    .byte   0x6f
    .byte   0x62
    .byte   0x6c
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x5f
    .byte   0x74
    .byte   0x74
    .byte   0x5f
    .byte   0x73
    .byte   0x74
    .byte   0x61
    .byte   0x72
    .byte   0x74
    .byte   0x0a
    .byte   0x5f
    .byte   0x74
    .byte   0x74
    .byte   0x5f
    .byte   0x73
    .byte   0x74
    .byte   0x61
    .byte   0x72
    .byte   0x74
    .byte   0x3a
    .byte   0x0a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x62
    .byte   0x6c
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x5f
    .byte   0x6d
    .byte   0x61
    .byte   0x69
    .byte   0x6e
    .byte   0x0a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x6d
    .byte   0x6f
    .byte   0x76
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x78
    .byte   0x31
    .byte   0x36
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x31
    .byte   0x0a
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x76
    .byte   0x63
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x78
    .byte   0x38
    .byte   0x30
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str139:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x7a
    .byte   0x65
    .byte   0x72
    .byte   0x6f
    .byte   0x66
    .byte   0x69
    .byte   0x6c
    .byte   0x6c
    .byte   0x20
    .byte   0x5f
    .byte   0x5f
    .byte   0x44
    .byte   0x41
    .byte   0x54
    .byte   0x41
    .byte   0x2c
    .byte   0x5f
    .byte   0x5f
    .byte   0x62
    .byte   0x73
    .byte   0x73
    .byte   0x2c
    .byte   0x5f
    .byte   0x00
    .balign  8
L_str140:
    .byte   0x2c
    .byte   0x00
    .balign  8
L_str141:
    .byte   0x2c
    .byte   0x33
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str142:
    .byte   0x69
    .byte   0x6d
    .byte   0x70
    .byte   0x6f
    .byte   0x72
    .byte   0x74
    .byte   0x20
    .byte   0x00
    .balign  8
L_str143:
    .byte   0x6b
    .byte   0x69
    .byte   0x6e
    .byte   0x64
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str144:
    .byte   0x20
    .byte   0x73
    .byte   0x74
    .byte   0x61
    .byte   0x72
    .byte   0x74
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str145:
    .byte   0x20
    .byte   0x6c
    .byte   0x65
    .byte   0x6e
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str146:
    .byte   0x20
    .byte   0x6c
    .byte   0x69
    .byte   0x6e
    .byte   0x65
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str147:
    .byte   0x2d
    .byte   0x2d
    .byte   0x64
    .byte   0x75
    .byte   0x6d
    .byte   0x70
    .byte   0x2d
    .byte   0x74
    .byte   0x6f
    .byte   0x6b
    .byte   0x65
    .byte   0x6e
    .byte   0x73
    .byte   0x00
    .balign  8
L_str148:
    .byte   0x2d
    .byte   0x2d
    .byte   0x64
    .byte   0x75
    .byte   0x6d
    .byte   0x70
    .byte   0x2d
    .byte   0x69
    .byte   0x72
    .byte   0x00

    .zerofill __DATA,__bss,_IO_BUF,16777216,3
    .zerofill __DATA,__bss,_DIGITS,32,3
    .zerofill __DATA,__bss,_ERR_STORAGE,64,3
    .zerofill __DATA,__bss,_ERR_BUF,4096,3
    .zerofill __DATA,__bss,_AST_BUF,16777216,3
    .zerofill __DATA,__bss,_AST_ARENA_STORE,24,3
    .zerofill __DATA,__bss,_LX_STATE,32,3
    .zerofill __DATA,__bss,_TOK_CUR,40,3
    .zerofill __DATA,__bss,_STR_HEAD,8,3
    .zerofill __DATA,__bss,_STR_COUNT,8,3
    .zerofill __DATA,__bss,_STR_TAIL,8,3
    .zerofill __DATA,__bss,_CUR_FUNC,8,3
    .zerofill __DATA,__bss,_CUR_PROG,8,3
    .zerofill __DATA,__bss,_IR_BUF,16777216,3
    .zerofill __DATA,__bss,_IR_ARENA_STORE,24,3
    .zerofill __DATA,__bss,_IR_NEXT_LABEL,8,3
    .zerofill __DATA,__bss,_G_TARGET,8,3
    .zerofill __DATA,__bss,_G_SRC,8,3
    .zerofill __DATA,__bss,_SRC_BUF,262144,3
    .zerofill __DATA,__bss,_OUT_BUF,65536,3
    .zerofill __DATA,__bss,_OUT_STORAGE,64,3
    .zerofill __DATA,__bss,_DUMP_TOK_STORE,40,3
    .zerofill __DATA,__bss,_PP_OUT,524288,3
    .zerofill __DATA,__bss,_PP_OUT_LEN,8,3
    .zerofill __DATA,__bss,_PP_ARENA_STORE,24,3
    .zerofill __DATA,__bss,_PP_ARENA_BUF,4194304,3
    .zerofill __DATA,__bss,_PP_SEEN_COUNT,8,3
    .zerofill __DATA,__bss,_PP_SEEN_PTRS,256,3
    .zerofill __DATA,__bss,_PP_SEEN_LENS,256,3
