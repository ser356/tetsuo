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
.L609:
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
    b       .L610
.L610:
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
    b       .L611
.L611:
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
    b       .L612
.L612:
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
    b       .L613
.L613:
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
.L614:
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
.L615:
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
.L616:
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
    b       .L617
.L3:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L1
.L2:
    movz    x9, #0x0001
    mov     w0, w9
    b       .L617
.L617:
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
.L618:
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
.L619:
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
.L620:
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
.L621:
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
.L622:
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
    b       .L623
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
.L623:
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
    b       .L624
.L15:
    ldr     x9, [sp, #0]
    movz    x10, #0x0057
    ldr     x11, [sp, #8]
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_byte
    str     x0, [sp, #112]
.L624:
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
.L625:
    add     sp, sp, #352
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
.L626:
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
.L627:
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
    b       .L628
.L628:
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
    b       .L629
.L629:
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
.L630:
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
    b       .L631
.L18:
.L17:
    mov     x9, #0
    mov     w0, w9
    b       .L631
.L631:
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
    b       .L632
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
    b       .L632
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
    b       .L632
.L23:
.L22:
    mov     x9, #0
    mov     w0, w9
    b       .L632
.L632:
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
    b       .L633
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
    b       .L633
.L25:
    ldrb    w9, [sp, #0]
    movz    x10, #0x0041
    sub     w11, w9, w10
    movz    x9, #0x000a
    add     w10, w11, w9
    mov     w0, w10
    b       .L633
.L633:
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
    b       .L634
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
    b       .L634
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
    b       .L634
.L30:
.L29:
    mov     x9, #0
    mov     w0, w9
    b       .L634
.L634:
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
    b       .L635
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
    b       .L635
.L32:
    mov     x9, #0
    mov     w0, w9
    b       .L635
.L635:
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
    b       .L636
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
    b       .L636
.L636:
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
    b       .L637
.L34:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    add     x11, x9, x10
    ldrb    w9, [x11]
    mov     w0, w9
    b       .L637
.L637:
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
.L638:
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
    adrp    x9, L_str0@PAGE
    add     x9, x9, L_str0@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0003
    str     x9, [sp, #24]
    adrp    x9, L_str1@PAGE
    add     x9, x9, L_str1@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0003
    str     x9, [sp, #40]
    adrp    x9, L_str2@PAGE
    add     x9, x9, L_str2@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0005
    str     x9, [sp, #56]
    adrp    x9, L_str3@PAGE
    add     x9, x9, L_str3@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x0006
    str     x9, [sp, #72]
    adrp    x9, L_str4@PAGE
    add     x9, x9, L_str4@PAGEOFF
    str     x9, [sp, #80]
    movz    x9, #0x0002
    str     x9, [sp, #88]
    adrp    x9, L_str5@PAGE
    add     x9, x9, L_str5@PAGEOFF
    str     x9, [sp, #96]
    movz    x9, #0x0004
    str     x9, [sp, #104]
    adrp    x9, L_str6@PAGE
    add     x9, x9, L_str6@PAGEOFF
    str     x9, [sp, #112]
    movz    x9, #0x0004
    str     x9, [sp, #120]
    adrp    x9, L_str7@PAGE
    add     x9, x9, L_str7@PAGEOFF
    str     x9, [sp, #128]
    movz    x9, #0x0005
    str     x9, [sp, #136]
    adrp    x9, L_str8@PAGE
    add     x9, x9, L_str8@PAGEOFF
    str     x9, [sp, #144]
    movz    x9, #0x0005
    str     x9, [sp, #152]
    adrp    x9, L_str9@PAGE
    add     x9, x9, L_str9@PAGEOFF
    str     x9, [sp, #160]
    movz    x9, #0x0006
    str     x9, [sp, #168]
    adrp    x9, L_str10@PAGE
    add     x9, x9, L_str10@PAGEOFF
    str     x9, [sp, #176]
    movz    x9, #0x0003
    str     x9, [sp, #184]
    adrp    x9, L_str11@PAGE
    add     x9, x9, L_str11@PAGEOFF
    str     x9, [sp, #192]
    movz    x9, #0x0003
    str     x9, [sp, #200]
    adrp    x9, L_str12@PAGE
    add     x9, x9, L_str12@PAGEOFF
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
    b       .L639
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
    b       .L639
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
    b       .L639
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
    b       .L639
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
    b       .L639
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
    b       .L639
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
    b       .L639
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
    b       .L639
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
    b       .L639
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
    b       .L639
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
    b       .L639
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
    b       .L639
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
    b       .L639
.L69:
.L67:
    movz    x9, #0x000e
    mov     w0, w9
    b       .L639
.L639:
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
.L640:
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
.L641:
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
.L642:
    add     sp, sp, #704
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lex_next
_lex_next:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #3136
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
    b       .L643
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
    b       .L643
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
    b       .L643
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
    b       .L643
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
    b       .L643
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
    b       .L643
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
    b       .L643
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
    b       .L643
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
    b       .L643
.L99:
.L98:
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
    cbz     w11, .L100
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0011
    str     w9, [x11]
    b       .L643
.L100:
    ldrb    w9, [sp, #16]
    movz    x10, #0x0029
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L101
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0012
    str     w9, [x11]
    b       .L643
.L101:
    ldrb    w9, [sp, #16]
    movz    x10, #0x007b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L102
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0013
    str     w9, [x11]
    b       .L643
.L102:
    ldrb    w9, [sp, #16]
    movz    x10, #0x007d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L103
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0014
    str     w9, [x11]
    b       .L643
.L103:
    ldrb    w9, [sp, #16]
    movz    x10, #0x005b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L104
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0015
    str     w9, [x11]
    b       .L643
.L104:
    ldrb    w9, [sp, #16]
    movz    x10, #0x005d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L105
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0016
    str     w9, [x11]
    b       .L643
.L105:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L106
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0017
    str     w9, [x11]
    b       .L643
.L106:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L107
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0018
    str     w9, [x11]
    b       .L643
.L107:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L108
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0019
    str     w9, [x11]
    b       .L643
.L108:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L109
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001a
    str     w9, [x11]
    b       .L643
.L109:
    ldrb    w9, [sp, #16]
    movz    x10, #0x0026
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L110
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001b
    str     w9, [x11]
    b       .L643
.L110:
    ldrb    w9, [sp, #16]
    movz    x10, #0x007c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L111
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001c
    str     w9, [x11]
    b       .L643
.L111:
    ldrb    w9, [sp, #16]
    movz    x10, #0x005e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L112
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001d
    str     w9, [x11]
    b       .L643
.L112:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L113
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001e
    str     w9, [x11]
    b       .L643
.L113:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L114
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0025
    str     w9, [x11]
    b       .L643
.L114:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L115
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0026
    str     w9, [x11]
    b       .L643
.L115:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L116
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0027
    str     w9, [x11]
    b       .L643
.L116:
    ldrb    w9, [sp, #16]
    movz    x10, #0x002e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L117
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0028
    str     w9, [x11]
    b       .L643
.L117:
    ldrb    w9, [sp, #16]
    movz    x10, #0x0040
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L118
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x002a
    str     w9, [x11]
    b       .L643
.L118:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L119
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0021
    str     w9, [x11]
    b       .L643
.L119:
    ldrb    w9, [sp, #16]
    movz    x10, #0x003e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L120
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0023
    str     w9, [x11]
    b       .L643
.L120:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    mov     x9, #0
    str     w9, [x11]
.L643:
    add     sp, sp, #3136
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
    b       .L644
.L644:
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
    b       .L645
.L645:
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
    cbz     w11, .L121
    movz    x9, #0x0001
    mov     x0, x9
    b       .L646
.L121:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L122
    movz    x9, #0x0004
    mov     x0, x9
    b       .L646
.L122:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L123
    movz    x9, #0x0008
    mov     x0, x9
    b       .L646
.L123:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L124
    movz    x9, #0x0008
    mov     x0, x9
    b       .L646
.L124:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L125
    movz    x9, #0x0010
    mov     x0, x9
    b       .L646
.L125:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L126
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L127
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    mul     x11, x9, x10
    mov     x0, x11
    b       .L646
.L127:
.L126:
    movz    x9, #0x0008
    mov     x0, x9
    b       .L646
.L646:
    add     sp, sp, #464
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
.L647:
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
    b       .L648
.L648:
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
.L649:
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
    b       .L650
.L650:
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
    cbz     w11, .L128
    mov     x9, #0
    mov     w0, w9
    b       .L651
.L128:
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
    b       .L651
.L651:
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
    cbz     w11, .L129
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L130
    movz    x9, #0x0001
    str     x9, [sp, #64]
.L130:
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L131
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #72]
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L132
    ldr     x9, [sp, #72]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L133
    ldr     x9, [sp, #72]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    sub     x11, x9, x10
    str     x11, [sp, #64]
.L133:
.L132:
.L131:
.L129:
    mov     x9, #0
    str     x9, [sp, #80]
.L134:
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #64]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L135
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
    cbz     w11, .L136
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
    cbz     w11, .L137
    ldr     x9, [sp, #88]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
.L137:
.L136:
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
    b       .L134
.L135:
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L652
.L652:
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
.L138:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L139
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
    cbz     w10, .L140
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L653
.L140:
    b       .L138
.L139:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L653
.L653:
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
.L141:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L142
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
    cbz     w10, .L143
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L654
.L143:
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L141
.L142:
    mov     x9, #0
    mov     x0, x9
    b       .L654
.L654:
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
.L144:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L145
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
    cbz     w10, .L146
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L655
.L146:
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L144
.L145:
    mov     x9, #0
    mov     x0, x9
    b       .L655
.L655:
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
.L147:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L148
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
    cbz     w10, .L149
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L656
.L149:
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L147
.L148:
    mov     x9, #0
    mov     x0, x9
    b       .L656
.L656:
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
.L150:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L151
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
    cbz     w10, .L152
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L657
.L152:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L150
.L151:
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    b       .L657
.L657:
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
.L153:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L154
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L155
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    b       .L658
.L155:
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L153
.L154:
    mov     x9, #0
    mov     x0, x9
    b       .L658
.L658:
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
.L659:
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
    cbz     w11, .L156
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
    b       .L157
.L156:
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
.L157:
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
    b       .L660
.L660:
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
.L158:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L159
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    ldrb    w9, [x11]
    strb    w9, [sp, #56]
    ldrb    w9, [sp, #56]
    movz    x10, #0x005c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L160
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
    cbz     w11, .L161
    movz    x9, #0x000a
    str     x9, [sp, #72]
.L161:
    ldrb    w9, [sp, #64]
    movz    x10, #0x0074
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L162
    movz    x9, #0x0009
    str     x9, [sp, #72]
.L162:
    ldrb    w9, [sp, #64]
    movz    x10, #0x005c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L163
    movz    x9, #0x005c
    str     x9, [sp, #72]
.L163:
    ldrb    w9, [sp, #64]
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L164
    movz    x9, #0x0027
    str     x9, [sp, #72]
.L164:
    ldrb    w9, [sp, #64]
    movz    x10, #0x0078
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L165
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
.L165:
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
    b       .L166
.L160:
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
.L166:
    b       .L158
.L159:
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
.L661:
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
.L662:
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
.L663:
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
    b       .L664
.L664:
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
    b       .L665
.L665:
    add     sp, sp, #608
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_primary
_parse_primary:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #2944
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
    cbz     w11, .L167
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
    str     x16, [sp, #400]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #400]
    str     x11, [x17]
    bl      _ps_advance
    str     x0, [sp, #432]
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L666
.L167:
    ldr     w9, [sp, #16]
    movz    x10, #0x000c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L168
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
    str     x16, [sp, #544]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #544]
    str     x11, [x17]
    bl      _ps_advance
    str     x0, [sp, #576]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L666
.L168:
    ldr     w9, [sp, #16]
    movz    x10, #0x000d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L169
    bl      _ps_advance
    str     x0, [sp, #616]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #632]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    str     x10, [sp, #40]
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #664]
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
    str     x16, [sp, #712]
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    ldr     x17, [sp, #712]
    str     x10, [x17]
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #752]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #752]
    str     x11, [x17]
    ldr     x9, [sp, #48]
    mov     x0, x9
    b       .L666
.L169:
    ldr     w9, [sp, #16]
    movz    x10, #0x0011
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L170
    bl      _ps_advance
    str     x0, [sp, #816]
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
    str     x0, [sp, #856]
    ldr     x9, [sp, #56]
    mov     x0, x9
    b       .L666
.L170:
    ldr     w9, [sp, #16]
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L171
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
    str     x0, [sp, #960]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0011
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L172
    bl      _ps_advance
    str     x0, [sp, #992]
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
.L173:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L174
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
    cbz     w11, .L175
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #104]
    str     x9, [x10]
.L175:
    ldr     x9, [sp, #96]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #96]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L176
    movz    x9, #0x0026
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1328]
.L176:
    b       .L173
.L174:
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1344]
    ldr     x9, [sp, #96]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L177
    movz    x9, #0x005d
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #1384]
.L177:
    ldr     x9, [sp, #80]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
    adrp    x9, L_str13@PAGE
    add     x9, x9, L_str13@PAGEOFF
    str     x9, [sp, #112]
    movz    x9, #0x0007
    str     x9, [sp, #120]
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #112]
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
    cbz     w10, .L178
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1512]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1512]
    str     x11, [x17]
    b       .L179
.L178:
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1560]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1560]
    str     x11, [x17]
.L179:
    ldr     x9, [sp, #80]
    mov     x0, x9
    b       .L666
.L172:
    bl      _cur_func
    mov     x9, x0
    str     x9, [sp, #128]
    ldr     x9, [sp, #128]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L180
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lookup_local
    mov     x12, x0
    str     x12, [sp, #136]
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #128]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L181
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #144]
    ldr     x9, [sp, #144]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    ldr     x9, [sp, #144]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #144]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [sp, #136]
    str     x9, [x11]
    ldr     x9, [sp, #128]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #152]
    ldr     x9, [sp, #152]
    ldr     x10, [sp, #136]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #160]
    ldr     x9, [sp, #144]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #160]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #144]
    mov     x0, x9
    b       .L666
.L181:
.L180:
    bl      _cur_prog
    mov     x9, x0
    str     x9, [sp, #168]
    ldr     x9, [sp, #168]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L182
    ldr     x9, [sp, #168]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lookup_const
    mov     x12, x0
    str     x12, [sp, #176]
    ldr     x9, [sp, #176]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L183
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #184]
    ldr     x9, [sp, #184]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #176]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #184]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #176]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #184]
    mov     x0, x9
    b       .L666
.L183:
    ldr     x9, [sp, #168]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lookup_bss
    mov     x12, x0
    str     x12, [sp, #192]
    ldr     x9, [sp, #192]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L184
    ldr     x9, [sp, #0]
    movz    x10, #0x000d
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #200]
    ldr     x9, [sp, #200]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    ldr     x9, [sp, #200]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #200]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2368]
    ldr     x16, [sp, #0]
    str     x16, [sp, #2376]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #2376]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x17, [sp, #2368]
    str     x9, [x17]
    ldr     x9, [sp, #200]
    mov     x0, x9
    b       .L666
.L184:
.L182:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #208]
    ldr     x9, [sp, #208]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    ldr     x9, [sp, #208]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #208]
    mov     x0, x9
    b       .L666
.L171:
    ldr     w9, [sp, #16]
    movz    x10, #0x0010
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L185
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #216]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #224]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #232]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #232]
    ldr     x11, [sp, #224]
    mov     x12, #0
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #216]
    movz    x13, #0x0008
    add     x14, x12, x13
    ldr     x12, [x14]
    add     x13, x11, x12
    movz    x11, #0x0001
    add     x12, x13, x11
    ldr     x11, [sp, #216]
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
    str     x0, [sp, #2736]
    ldr     x9, [sp, #232]
    movz    x10, #0x0080
    add     x16, x9, x10
    str     x16, [sp, #2760]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #232]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #232]
    movz    x12, #0x0070
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _str_table_add
    mov     x12, x0
    ldr     x17, [sp, #2760]
    str     x12, [x17]
    ldr     x9, [sp, #232]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2864]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #2864]
    str     x11, [x17]
    bl      _ps_advance
    str     x0, [sp, #2896]
    ldr     x9, [sp, #232]
    mov     x0, x9
    b       .L666
.L185:
    movz    x9, #0x0050
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #2920]
    mov     x9, #0
    mov     x0, x9
    b       .L666
.L666:
    add     sp, sp, #2944
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_postfix
_parse_postfix:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #3168
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_primary
    mov     x10, x0
    str     x10, [sp, #8]
.L186:
    movz    x9, #0x0001
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L187
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #16]
    ldr     w9, [sp, #16]
    movz    x10, #0x0028
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L188
    bl      _ps_advance
    str     x0, [sp, #328]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L189
    movz    x9, #0x005b
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #368]
.L189:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    bl      _ps_advance
    str     x0, [sp, #448]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    mov     x9, #0
    str     x9, [sp, #56]
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L190
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L191
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L192
    adrp    x9, L_str14@PAGE
    add     x9, x9, L_str14@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x0003
    str     x9, [sp, #72]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #64]
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
    cbz     w10, .L193
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #80]
    ldr     x9, [sp, #80]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #784]
    ldr     x16, [sp, #0]
    str     x16, [sp, #792]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #792]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x17, [sp, #784]
    str     x9, [x17]
    ldr     x9, [sp, #80]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #56]
.L193:
    ldr     x9, [sp, #56]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L194
    adrp    x9, L_str15@PAGE
    add     x9, x9, L_str15@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x0003
    str     x9, [sp, #96]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
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
    cbz     w10, .L195
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #104]
    ldr     x9, [sp, #104]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #104]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1056]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1056]
    str     x11, [x17]
    ldr     x9, [sp, #104]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #56]
.L195:
.L194:
.L192:
.L191:
    ldr     x9, [sp, #56]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L196
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L197
    ldr     x9, [sp, #48]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #112]
    ldr     x9, [sp, #112]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L198
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L199
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _struct_field_index
    mov     x12, x0
    str     x12, [sp, #120]
    ldr     x9, [sp, #120]
    ldr     x10, [sp, #112]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L200
    movz    x9, #0x005f
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #1368]
.L200:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #128]
    ldr     x9, [sp, #128]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    ldr     x10, [sp, #120]
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #128]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1488]
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #120]
    mov     x0, x9
    mov     x1, x10
    bl      _struct_field_type
    mov     x11, x0
    ldr     x17, [sp, #1488]
    str     x11, [x17]
    ldr     x9, [sp, #128]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #56]
.L199:
.L198:
.L197:
.L196:
    ldr     x9, [sp, #56]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L201
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L202
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #136]
    ldr     x9, [sp, #136]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L203
    ldr     x9, [sp, #136]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L204
    ldr     x9, [sp, #136]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #144]
    ldr     x9, [sp, #144]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L205
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _struct_field_index
    mov     x12, x0
    str     x12, [sp, #152]
    ldr     x9, [sp, #152]
    ldr     x10, [sp, #144]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L206
    movz    x9, #0x005f
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #1856]
.L206:
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #152]
    mov     x0, x9
    mov     x1, x10
    bl      _struct_field_type
    mov     x11, x0
    str     x11, [sp, #160]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #168]
    ldr     x9, [sp, #168]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #152]
    movz    x10, #0x0008
    mul     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #168]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1976]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1976]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #176]
    ldr     x9, [sp, #176]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #176]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #176]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #168]
    str     x9, [x11]
    ldr     x9, [sp, #176]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2144]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ptr
    mov     x11, x0
    ldr     x17, [sp, #2144]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #184]
    ldr     x9, [sp, #184]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #176]
    str     x9, [x11]
    ldr     x9, [sp, #184]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #160]
    str     x9, [x11]
    ldr     x9, [sp, #184]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #56]
.L205:
.L204:
.L203:
.L202:
.L201:
.L190:
    ldr     x9, [sp, #56]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L207
    movz    x9, #0x005b
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #2312]
.L207:
    b       .L208
.L188:
    ldr     w9, [sp, #16]
    movz    x10, #0x0015
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L209
    bl      _ps_advance
    str     x0, [sp, #2344]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #192]
    movz    x9, #0x0016
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #2384]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #200]
    ldr     x9, [sp, #200]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L210
    movz    x9, #0x005c
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #2456]
.L210:
    ldr     x9, [sp, #200]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L211
    movz    x9, #0x005c
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #2520]
.L211:
    ldr     x9, [sp, #200]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    str     x10, [sp, #208]
    ldr     x9, [sp, #192]
    str     x9, [sp, #216]
    ldr     x9, [sp, #208]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L212
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #224]
    ldr     x9, [sp, #224]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #208]
    str     x9, [x11]
    ldr     x9, [sp, #224]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2672]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #2672]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #232]
    ldr     x9, [sp, #232]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #232]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #192]
    str     x9, [x11]
    ldr     x9, [sp, #232]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #224]
    str     x9, [x11]
    ldr     x9, [sp, #232]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2840]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #2840]
    str     x11, [x17]
    ldr     x9, [sp, #232]
    str     x9, [sp, #216]
.L212:
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #240]
    ldr     x9, [sp, #240]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #240]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #240]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #216]
    str     x9, [x11]
    ldr     x9, [sp, #240]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #200]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #248]
    ldr     x9, [sp, #248]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #240]
    str     x9, [x11]
    ldr     x9, [sp, #248]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #200]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #248]
    str     x9, [sp, #8]
    b       .L213
.L209:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L667
.L213:
.L208:
    b       .L186
.L187:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L667
.L667:
    add     sp, sp, #3168
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
    cbz     w11, .L214
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
    cbz     w11, .L215
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L216
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
.L216:
.L215:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L668
.L214:
    ldr     w9, [sp, #8]
    movz    x10, #0x001b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L217
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
    b       .L668
.L217:
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_postfix
    mov     x10, x0
    mov     x0, x10
    b       .L668
.L668:
    add     sp, sp, #544
    ldp     x29, x30, [sp], #16
    ret

    .globl   _bin_prec
_bin_prec:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #432
    str     w0, [sp, #0]
    ldr     w9, [sp, #0]
    movz    x10, #0x0017
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L218
    movz    x9, #0x0006
    mov     x0, x9
    b       .L669
.L218:
    ldr     w9, [sp, #0]
    movz    x10, #0x001a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L219
    movz    x9, #0x0006
    mov     x0, x9
    b       .L669
.L219:
    ldr     w9, [sp, #0]
    movz    x10, #0x0018
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L220
    movz    x9, #0x0005
    mov     x0, x9
    b       .L669
.L220:
    ldr     w9, [sp, #0]
    movz    x10, #0x0019
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L221
    movz    x9, #0x0005
    mov     x0, x9
    b       .L669
.L221:
    ldr     w9, [sp, #0]
    movz    x10, #0x001b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L222
    movz    x9, #0x0004
    mov     x0, x9
    b       .L669
.L222:
    ldr     w9, [sp, #0]
    movz    x10, #0x001d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L223
    movz    x9, #0x0003
    mov     x0, x9
    b       .L669
.L223:
    ldr     w9, [sp, #0]
    movz    x10, #0x001c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L224
    movz    x9, #0x0002
    mov     x0, x9
    b       .L669
.L224:
    ldr     w9, [sp, #0]
    movz    x10, #0x001f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L225
    movz    x9, #0x0001
    mov     x0, x9
    b       .L669
.L225:
    ldr     w9, [sp, #0]
    movz    x10, #0x0020
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L226
    movz    x9, #0x0001
    mov     x0, x9
    b       .L669
.L226:
    ldr     w9, [sp, #0]
    movz    x10, #0x0021
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L227
    movz    x9, #0x0001
    mov     x0, x9
    b       .L669
.L227:
    ldr     w9, [sp, #0]
    movz    x10, #0x0022
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L228
    movz    x9, #0x0001
    mov     x0, x9
    b       .L669
.L228:
    ldr     w9, [sp, #0]
    movz    x10, #0x0023
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L229
    movz    x9, #0x0001
    mov     x0, x9
    b       .L669
.L229:
    ldr     w9, [sp, #0]
    movz    x10, #0x0024
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L230
    movz    x9, #0x0001
    mov     x0, x9
    b       .L669
.L230:
    mov     x9, #0
    mov     x0, x9
    b       .L669
.L669:
    add     sp, sp, #432
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_expr
_parse_expr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1168
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_unary
    mov     x10, x0
    str     x10, [sp, #16]
.L231:
    bl      _ps_kind
    mov     x9, x0
    mov     x0, x9
    bl      _bin_prec
    mov     x10, x0
    ldr     x9, [sp, #8]
    cmp     w10, w9
    cset    w11, hs
    cbz     w11, .L232
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
    cbz     w11, .L233
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
.L233:
    ldr     w9, [sp, #24]
    movz    x10, #0x001a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L234
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0003
    str     x9, [x11]
.L234:
    ldr     w9, [sp, #24]
    movz    x10, #0x0018
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L235
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
.L235:
    ldr     w9, [sp, #24]
    movz    x10, #0x0019
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L236
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
.L236:
    ldr     w9, [sp, #24]
    movz    x10, #0x001b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L237
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0004
    str     x9, [x11]
.L237:
    ldr     w9, [sp, #24]
    movz    x10, #0x001d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L238
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0006
    str     x9, [x11]
.L238:
    ldr     w9, [sp, #24]
    movz    x10, #0x001c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L239
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0005
    str     x9, [x11]
.L239:
    ldr     w9, [sp, #24]
    movz    x10, #0x001f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L240
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0005
    str     x9, [x11]
.L240:
    ldr     w9, [sp, #24]
    movz    x10, #0x0020
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L241
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0006
    str     x9, [x11]
.L241:
    ldr     w9, [sp, #24]
    movz    x10, #0x0021
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L242
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0007
    str     x9, [x11]
.L242:
    ldr     w9, [sp, #24]
    movz    x10, #0x0022
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L243
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
.L243:
    ldr     w9, [sp, #24]
    movz    x10, #0x0023
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L244
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0009
    str     x9, [x11]
.L244:
    ldr     w9, [sp, #24]
    movz    x10, #0x0024
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L245
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x000a
    str     x9, [x11]
.L245:
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
    cbz     w11, .L246
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    b       .L247
.L246:
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1112]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1112]
    str     x11, [x17]
.L247:
    ldr     x9, [sp, #48]
    str     x9, [sp, #16]
    b       .L231
.L232:
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L670
.L670:
    add     sp, sp, #1168
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
    b       .L671
.L671:
    add     sp, sp, #448
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ps_expect
_ps_expect:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     w0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    ldr     w10, [sp, #0]
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L248
    movz    x9, #0x0051
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #40]
.L248:
    bl      _ps_advance
    str     x0, [sp, #48]
.L672:
    add     sp, sp, #64
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
    cbz     w11, .L249
    bl      _ps_advance
    str     x0, [sp, #32]
    movz    x9, #0x0001
    mov     w0, w9
    b       .L673
.L249:
    mov     x9, #0
    mov     w0, w9
    b       .L673
.L673:
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
    cbz     w11, .L250
    mov     x9, #0
    mov     w0, w9
    b       .L674
.L250:
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
    b       .L674
.L674:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_type
_parse_type:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1024
    str     x0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0017
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L251
    bl      _ps_advance
    str     x0, [sp, #136]
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
    b       .L675
.L251:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L252
    movz    x9, #0x0052
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #216]
.L252:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #16]
    adrp    x9, L_str16@PAGE
    add     x9, x9, L_str16@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0002
    str     x9, [sp, #32]
    adrp    x9, L_str17@PAGE
    add     x9, x9, L_str17@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0003
    str     x9, [sp, #48]
    adrp    x9, L_str18@PAGE
    add     x9, x9, L_str18@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0003
    str     x9, [sp, #64]
    adrp    x9, L_str19@PAGE
    add     x9, x9, L_str19@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x0003
    str     x9, [sp, #80]
    mov     x9, #0
    str     x9, [sp, #88]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #24]
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
    cbz     w10, .L253
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #88]
.L253:
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #40]
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
    cbz     w10, .L254
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #88]
.L254:
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
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
    cbz     w10, .L255
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #88]
.L255:
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
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
    cbz     w10, .L256
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #88]
.L256:
    ldr     x9, [sp, #88]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L257
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #88]
    bl      _cur_prog
    mov     x9, x0
    str     x9, [sp, #96]
    ldr     x9, [sp, #96]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L258
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lookup_struct
    mov     x12, x0
    str     x12, [sp, #104]
    ldr     x9, [sp, #88]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #104]
    str     x9, [x11]
.L258:
.L257:
    bl      _ps_advance
    str     x0, [sp, #1008]
    ldr     x9, [sp, #88]
    mov     x0, x9
    b       .L675
.L675:
    add     sp, sp, #1024
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
.L259:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0014
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L260
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_stmt
    mov     x10, x0
    str     x10, [sp, #24]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L261
    ldr     x9, [sp, #24]
    str     x9, [sp, #8]
    b       .L262
.L261:
    ldr     x9, [sp, #16]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
.L262:
    ldr     x9, [sp, #24]
    str     x9, [sp, #16]
.L263:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0025
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L264
    bl      _ps_advance
    str     x0, [sp, #200]
    b       .L263
.L264:
    b       .L259
.L260:
    movz    x9, #0x0014
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #216]
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L676
.L676:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_stmt
_parse_stmt:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #2080
    str     x0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #8]
    ldr     w9, [sp, #8]
    movz    x10, #0x0002
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L265
    bl      _ps_advance
    str     x0, [sp, #160]
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #16]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L266
    movz    x9, #0x0053
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #208]
.L266:
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #352]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L267
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x16, x9, x10
    str     x16, [sp, #408]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #408]
    str     x10, [x17]
.L267:
    movz    x9, #0x001e
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L268
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    add     x16, x9, x10
    str     x16, [sp, #480]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #480]
    str     x11, [x17]
.L268:
    bl      _cur_func
    mov     x9, x0
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L269
    ldr     x9, [sp, #24]
    movz    x10, #0x0058
    add     x16, x9, x10
    str     x16, [sp, #560]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #24]
    movz    x12, #0x0008
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #24]
    movz    x13, #0x0010
    add     x14, x12, x13
    ldr     x12, [x14]
    ldr     x13, [sp, #24]
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
    ldr     x17, [sp, #560]
    str     x14, [x17]
.L269:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L677
.L265:
    ldr     w9, [sp, #8]
    movz    x10, #0x0004
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L270
    bl      _ps_advance
    str     x0, [sp, #720]
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #40]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0025
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L271
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0014
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L272
    ldr     x9, [sp, #40]
    movz    x10, #0x0040
    add     x16, x9, x10
    str     x16, [sp, #816]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #816]
    str     x11, [x17]
.L272:
.L271:
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L677
.L270:
    ldr     w9, [sp, #8]
    movz    x10, #0x0005
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L273
    bl      _ps_advance
    str     x0, [sp, #880]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    str     w10, [sp, #48]
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #56]
    ldr     x9, [sp, #56]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #944]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #944]
    str     x11, [x17]
    ldr     w9, [sp, #48]
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L274
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1008]
.L274:
    ldr     x9, [sp, #56]
    movz    x10, #0x0030
    add     x16, x9, x10
    str     x16, [sp, #1032]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1032]
    str     x10, [x17]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0006
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L275
    bl      _ps_advance
    str     x0, [sp, #1080]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0005
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L276
    ldr     x9, [sp, #56]
    movz    x10, #0x0038
    add     x16, x9, x10
    str     x16, [sp, #1128]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_stmt
    mov     x10, x0
    ldr     x17, [sp, #1128]
    str     x10, [x17]
    b       .L277
.L276:
    ldr     x9, [sp, #56]
    movz    x10, #0x0038
    add     x16, x9, x10
    str     x16, [sp, #1168]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1168]
    str     x10, [x17]
.L277:
.L275:
    ldr     x9, [sp, #56]
    mov     x0, x9
    b       .L677
.L273:
    ldr     w9, [sp, #8]
    movz    x10, #0x0008
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L278
    bl      _ps_advance
    str     x0, [sp, #1224]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    str     w10, [sp, #64]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #72]
    ldr     x9, [sp, #72]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #1288]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #1288]
    str     x11, [x17]
    ldr     w9, [sp, #64]
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L279
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1352]
.L279:
    ldr     x9, [sp, #72]
    movz    x10, #0x0030
    add     x16, x9, x10
    str     x16, [sp, #1376]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1376]
    str     x10, [x17]
    ldr     x9, [sp, #72]
    mov     x0, x9
    b       .L677
.L278:
    ldr     w9, [sp, #8]
    movz    x10, #0x0007
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L280
    bl      _ps_advance
    str     x0, [sp, #1432]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #80]
    ldr     x9, [sp, #80]
    movz    x10, #0x0030
    add     x16, x9, x10
    str     x16, [sp, #1480]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1480]
    str     x10, [x17]
    ldr     x9, [sp, #80]
    mov     x0, x9
    b       .L677
.L280:
    ldr     w9, [sp, #8]
    movz    x10, #0x0009
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L281
    bl      _ps_advance
    str     x0, [sp, #1536]
    ldr     x9, [sp, #0]
    movz    x10, #0x0006
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    mov     x0, x11
    b       .L677
.L281:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #88]
    movz    x9, #0x001e
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L282
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #96]
    ldr     x9, [sp, #88]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L283
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #104]
    ldr     x9, [sp, #104]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    movz    x10, #0x0028
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #104]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
    ldr     x9, [sp, #104]
    mov     x0, x9
    b       .L677
.L283:
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #112]
    ldr     x9, [sp, #112]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    str     x9, [x11]
    ldr     x9, [sp, #112]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
    ldr     x9, [sp, #88]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L284
    ldr     x9, [sp, #112]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
.L284:
    ldr     x9, [sp, #112]
    mov     x0, x9
    b       .L677
.L282:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #120]
    ldr     x9, [sp, #120]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    str     x9, [x11]
    ldr     x9, [sp, #120]
    mov     x0, x9
    b       .L677
.L677:
    add     sp, sp, #2080
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
    b       .L678
.L678:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_fun
_parse_fun:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1504
    str     x0, [sp, #0]
    movz    x9, #0x0001
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #72]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L285
    movz    x9, #0x0054
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #112]
.L285:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #8]
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
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
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
    add     x16, x9, x10
    str     x16, [sp, #440]
    ldr     x9, [sp, #0]
    movz    x10, #0x0800
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    ldr     x17, [sp, #440]
    str     x11, [x17]
    ldr     x9, [sp, #16]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _cur_func_set
    str     x0, [sp, #512]
    bl      _ps_advance
    str     x0, [sp, #520]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #536]
    mov     x9, #0
    str     x9, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
.L286:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L287
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L288
    movz    x9, #0x0055
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #616]
.L288:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #48]
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #800]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #816]
    ldr     x9, [sp, #48]
    movz    x10, #0x0010
    add     x16, x9, x10
    str     x16, [sp, #840]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #840]
    str     x10, [x17]
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L289
    ldr     x9, [sp, #48]
    str     x9, [sp, #24]
    b       .L290
.L289:
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    str     x9, [x11]
.L290:
    ldr     x9, [sp, #48]
    str     x9, [sp, #32]
    ldr     x9, [sp, #48]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #56]
    ldr     x9, [sp, #56]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L291
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0002
    add     x12, x9, x10
    str     x12, [x11]
    b       .L292
.L291:
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
.L292:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #48]
    mov     x12, #0
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #48]
    movz    x13, #0x0008
    add     x14, x12, x13
    ldr     x12, [x14]
    ldr     x13, [sp, #48]
    movz    x14, #0x0010
    add     x15, x13, x14
    ldr     x13, [x15]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    mov     x4, x13
    bl      _add_local
    str     x0, [sp, #1272]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L293
    movz    x9, #0x0026
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1312]
.L293:
    b       .L286
.L287:
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1328]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0029
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L294
    bl      _ps_advance
    str     x0, [sp, #1392]
    ldr     x9, [sp, #16]
    movz    x10, #0x0020
    add     x16, x9, x10
    str     x16, [sp, #1416]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #1416]
    str     x10, [x17]
.L294:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #1456]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1456]
    str     x10, [x17]
    mov     x9, #0
    mov     x0, x9
    bl      _cur_func_set
    str     x0, [sp, #1488]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L679
.L679:
    add     sp, sp, #1504
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_const_decl
_parse_const_decl:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #464
    str     x0, [sp, #0]
    movz    x9, #0x0003
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #40]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L295
    movz    x9, #0x0056
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #80]
.L295:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0028
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #264]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #280]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x16, x9, x10
    str     x16, [sp, #304]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #304]
    str     x10, [x17]
    movz    x9, #0x001e
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #336]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000f
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L296
    movz    x9, #0x0056
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #376]
.L296:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #448]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L680
.L680:
    add     sp, sp, #464
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_bss_decl
_parse_bss_decl:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #416
    str     x0, [sp, #0]
    movz    x9, #0x000b
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #40]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L297
    movz    x9, #0x0057
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #80]
.L297:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #264]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #280]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000f
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L298
    movz    x9, #0x0058
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #320]
.L298:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #392]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L681
.L681:
    add     sp, sp, #416
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_struct_decl
_parse_struct_decl:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1232
    str     x0, [sp, #0]
    movz    x9, #0x000a
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #80]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L299
    movz    x9, #0x0059
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #120]
.L299:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0028
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
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
    bl      _ps_advance
    str     x0, [sp, #368]
    bl      _cur_prog
    mov     x9, x0
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L300
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L301
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    b       .L302
.L301:
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
.L303:
    ldr     x9, [sp, #32]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L304
    ldr     x9, [sp, #32]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L303
.L304:
    ldr     x9, [sp, #32]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
.L302:
.L300:
    movz    x9, #0x0013
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #640]
    mov     x9, #0
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L305:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0014
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L306
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L307
    movz    x9, #0x005a
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #720]
.L307:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #56]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #64]
    ldr     x9, [sp, #64]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #56]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #64]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #56]
    movz    x10, #0x0010
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #64]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    bl      _ps_advance
    str     x0, [sp, #904]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #920]
    ldr     x9, [sp, #64]
    movz    x10, #0x0010
    add     x16, x9, x10
    str     x16, [sp, #944]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #944]
    str     x10, [x17]
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L308
    ldr     x9, [sp, #64]
    str     x9, [sp, #40]
    b       .L309
.L308:
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
.L309:
    ldr     x9, [sp, #64]
    str     x9, [sp, #48]
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    str     x9, [x11]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0026
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L310
    bl      _ps_advance
    str     x0, [sp, #1168]
.L310:
    b       .L305
.L306:
    movz    x9, #0x0014
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1184]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L682
.L682:
    add     sp, sp, #1232
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
.L311:
    bl      _ps_kind
    mov     x9, x0
    mov     x10, #0
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L312
.L313:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0025
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L314
    bl      _ps_advance
    str     x0, [sp, #240]
    b       .L313
.L314:
    bl      _ps_kind
    mov     x9, x0
    mov     x10, #0
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L315
    b       .L312
.L315:
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #56]
    ldr     w9, [sp, #56]
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L316
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
    cbz     w11, .L317
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    b       .L318
.L317:
    ldr     x9, [sp, #32]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
.L318:
    ldr     x9, [sp, #64]
    str     x9, [sp, #32]
.L316:
    ldr     w9, [sp, #56]
    movz    x10, #0x0003
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L319
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
    cbz     w11, .L320
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    b       .L321
.L320:
    ldr     x9, [sp, #40]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
.L321:
    ldr     x9, [sp, #72]
    str     x9, [sp, #40]
.L319:
    ldr     w9, [sp, #56]
    movz    x10, #0x000b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L322
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
    cbz     w11, .L323
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
    b       .L324
.L323:
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
.L324:
    ldr     x9, [sp, #80]
    str     x9, [sp, #48]
.L322:
    ldr     w9, [sp, #56]
    movz    x10, #0x000a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L325
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_struct_decl
    str     x0, [sp, #792]
.L325:
    b       .L311
.L312:
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
    b       .L683
.L683:
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
    b       .L684
.L684:
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
    cbz     w11, .L326
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L685
.L326:
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    mov     x0, x10
    b       .L685
.L685:
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
    b       .L686
.L686:
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
    b       .L687
.L687:
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
    cbz     w11, .L327
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
    b       .L688
.L327:
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
.L688:
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
    b       .L689
.L689:
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
    cbz     w11, .L328
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
.L328:
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
    b       .L690
.L690:
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
    b       .L691
.L691:
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
.L692:
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
.L693:
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
.L694:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_expr
_lower_expr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    movz    x16, #0x1400
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
    cbz     w11, .L329
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
    str     x0, [sp, #560]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L695
.L329:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L330
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
    str     x16, [sp, #856]
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
    ldr     x17, [sp, #856]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #992]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L695
.L330:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L331
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
    str     x0, [sp, #1280]
    ldr     x9, [sp, #56]
    mov     x0, x9
    b       .L695
.L331:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L332
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
    str     x16, [sp, #1704]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #1704]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1800]
    ldr     x9, [sp, #88]
    mov     x0, x9
    b       .L695
.L332:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L333
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L695
.L333:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L334
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0009
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L695
.L334:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L335
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000a
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L695
.L335:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L336
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000b
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L695
.L336:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L337
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000c
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L695
.L337:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L338
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000d
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L695
.L338:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000c
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
    str     x0, [sp, #2600]
    ldr     x9, [sp, #104]
    mov     x0, x9
    b       .L695
.L339:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L340
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
    str     x16, [sp, #2888]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #2888]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #144]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #2984]
    ldr     x9, [sp, #136]
    mov     x0, x9
    b       .L695
.L340:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L341
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
    str     x0, [sp, #3328]
    ldr     x9, [sp, #152]
    mov     x0, x9
    b       .L695
.L341:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L342
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
    cbz     w11, .L343
    movz    x9, #0x0008
    str     x9, [sp, #184]
.L343:
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
.L344:
    ldr     x9, [sp, #208]
    ldr     x10, [sp, #168]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L345
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
    cbz     w11, .L346
    ldr     x9, [sp, #232]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L347
    ldr     x9, [sp, #216]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L348
    movz    x9, #0x0001
    str     x9, [sp, #224]
.L348:
.L347:
.L346:
    ldr     x9, [sp, #224]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L349
    ldr     x16, [sp, #0]
    str     x16, [sp, #3840]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x16, [x11]
    str     x16, [sp, #3872]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #3872]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x0, [sp, #3840]
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
    str     x0, [sp, #4152]
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
    str     x16, [sp, #4232]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #4232]
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
    str     x0, [sp, #4520]
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
    b       .L350
.L349:
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #200]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x16, x9, x12
    str     x16, [sp, #4632]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    ldr     x17, [sp, #4632]
    str     x11, [x17]
    ldr     x9, [sp, #200]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #200]
.L350:
    ldr     x9, [sp, #208]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #208]
    b       .L344
.L345:
    ldr     x9, [sp, #200]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L351
    movz    x9, #0x005e
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #4744]
.L351:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #272]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #280]
    ldr     x9, [sp, #280]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #272]
    str     x9, [x11]
    ldr     x9, [sp, #280]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #280]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0060
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #280]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [sp, #192]
    str     x9, [x11]
    ldr     x9, [sp, #280]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [sp, #200]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #280]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #5096]
    ldr     x9, [sp, #272]
    mov     x0, x9
    b       .L695
.L342:
    mov     x9, #0
    mov     x0, x9
    b       .L695
.L695:
    movz    x16, #0x1400
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
    b       .L696
.L696:
    add     sp, sp, #512
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_stmt
_lower_stmt:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    movz    x16, #0x1460
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
    cbz     w11, .L352
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L353
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
    cbz     w11, .L354
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L355
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
    cbz     w11, .L356
    movz    x9, #0x0001
    str     x9, [sp, #32]
.L356:
.L355:
.L354:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L357
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    ldr     x16, [sp, #0]
    str     x16, [sp, #728]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x16, [x11]
    str     x16, [sp, #760]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #760]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x0, [sp, #728]
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
    str     x0, [sp, #1008]
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
    str     x0, [sp, #1224]
    ldr     x16, [sp, #0]
    str     x16, [sp, #1232]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #1232]
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
    str     x0, [sp, #1472]
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
    str     x0, [sp, #1704]
    b       .L697
.L357:
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
    str     x16, [sp, #1912]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #1912]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1984]
.L353:
    b       .L697
.L352:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L358
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L359
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
    str     x16, [sp, #2320]
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
    ldr     x17, [sp, #2320]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #2456]
.L359:
    b       .L697
.L358:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L360
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
    cbz     w11, .L361
    ldr     x9, [sp, #176]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L362
    ldr     x9, [sp, #160]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #2904]
    ldr     x9, [sp, #176]
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
.L362:
.L361:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #3000]
    b       .L697
.L360:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L363
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L364
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
    str     x0, [sp, #3272]
    b       .L697
.L364:
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
    str     x0, [sp, #3432]
    b       .L697
.L363:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L365
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L366
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    str     x0, [sp, #3576]
.L366:
    b       .L697
.L365:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L367
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
    str     x0, [sp, #3720]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_block
    str     x0, [sp, #3768]
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L368
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #3840]
    b       .L697
.L368:
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
    str     x0, [sp, #3880]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #3904]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_block
    str     x0, [sp, #3952]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #224]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #3976]
    b       .L697
.L367:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L369
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
    str     x0, [sp, #4080]
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
    str     x0, [sp, #4160]
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
    str     x0, [sp, #4384]
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
    str     x0, [sp, #4480]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #240]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #4504]
    b       .L697
.L369:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L370
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
    str     x0, [sp, #4608]
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
    str     x0, [sp, #4832]
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
    str     x0, [sp, #4928]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #272]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #4952]
    b       .L697
.L370:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L371
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L372
    movz    x9, #0x005a
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #5064]
.L372:
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #288]
    ldr     x9, [sp, #288]
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
    str     x9, [sp, #296]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #296]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_jmp
    str     x0, [sp, #5208]
    b       .L697
.L371:
.L697:
    movz    x16, #0x1460
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
.L373:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L374
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
    b       .L373
.L374:
.L698:
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
.L375:
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L376
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
    b       .L375
.L376:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #80]
    ldr     x9, [sp, #80]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L377
    movz    x9, #0x0008
    str     x9, [sp, #80]
.L377:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #88]
    mov     x9, #0
    str     x9, [sp, #64]
.L378:
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L379
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
    b       .L378
.L379:
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
    b       .L699
.L699:
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
.L380:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L381
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #8]
    ldr     x9, [sp, #16]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    b       .L380
.L381:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L700
.L700:
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
    cbz     w11, .L382
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L382:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L383
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L383:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L384
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L384:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L385
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L385:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L386
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L386:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L387
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L387:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L388
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L388:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L389
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L389:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L390
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L390:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L391
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L391:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L392
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L392:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L393
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L393:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L394
    movz    x9, #0x0001
    mov     x0, x9
    b       .L701
.L394:
    mov     x9, #0
    mov     x0, x9
    b       .L701
.L701:
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
    cbz     w11, .L395
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
    b       .L702
.L395:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L396
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
    b       .L702
.L396:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L397
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
    b       .L702
.L397:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L398
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
    b       .L702
.L398:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L399
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
    b       .L702
.L399:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L400
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
    b       .L702
.L400:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L401
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
    b       .L702
.L401:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L402
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
    b       .L702
.L402:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000c
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
    b       .L702
.L403:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000d
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
    b       .L702
.L404:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0011
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
    movz    x9, #0x0001
    mov     x0, x9
    b       .L702
.L405:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000f
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L406
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
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
    movz    x9, #0x0001
    mov     x0, x9
    b       .L702
.L407:
    mov     x9, #0
    mov     x0, x9
    b       .L702
.L406:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L408
    mov     x9, #0
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L409:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L410
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
    b       .L409
.L410:
    ldr     x9, [sp, #0]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    b       .L702
.L408:
    mov     x9, #0
    mov     x0, x9
    b       .L702
.L702:
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
    cbz     w11, .L411
    movz    x9, #0x0008
    str     x9, [sp, #32]
.L411:
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
.L412:
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L413
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
    b       .L412
.L413:
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #64]
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L414
    movz    x9, #0x0008
    str     x9, [sp, #64]
.L414:
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
.L415:
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L416
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
    b       .L415
.L416:
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #104]
    ldr     x9, [sp, #104]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L417
    movz    x9, #0x0008
    str     x9, [sp, #104]
.L417:
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
.L418:
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L419
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
    cbz     w11, .L420
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
.L420:
    ldr     x9, [sp, #128]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #128]
    b       .L418
.L419:
    ldr     x9, [sp, #0]
    movz    x10, #0x0080
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #136]
    ldr     x9, [sp, #16]
    str     x9, [sp, #128]
.L421:
    ldr     x9, [sp, #128]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L422
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
.L423:
    ldr     x9, [sp, #152]
    ldr     x10, [sp, #144]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L424
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
    cbz     w11, .L425
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #160]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #128]
    str     x9, [x10]
.L425:
    ldr     x9, [sp, #152]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #152]
    b       .L423
.L424:
    b       .L421
.L422:
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
    str     x9, [sp, #168]
    ldr     x9, [sp, #168]
    mov     x0, x9
    bl      _ir_has_dst
    mov     x10, x0
    mov     x9, #0
    cmp     w10, w9
    cset    w11, ne
    cbz     w11, .L428
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
    cbz     w11, .L429
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #176]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #128]
    str     x9, [x10]
.L429:
.L428:
    ldr     x9, [sp, #128]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #128]
    b       .L426
.L427:
    mov     x9, #0
    str     x9, [sp, #96]
.L430:
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L431
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L432
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L433
    mov     x9, #0
    str     x9, [sp, #184]
.L434:
    ldr     x9, [sp, #184]
    ldr     x10, [sp, #120]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L435
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
    cbz     w11, .L436
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #96]
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x10, x13
    ldr     x10, [x11]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L437
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0001
    str     x9, [x10]
.L437:
.L436:
    ldr     x9, [sp, #184]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #184]
    b       .L434
.L435:
.L433:
.L432:
    ldr     x9, [sp, #96]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #96]
    b       .L430
.L431:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #200]
    mov     x9, #0
    str     x9, [sp, #96]
.L438:
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L439
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
    b       .L438
.L439:
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
.L440:
    ldr     x9, [sp, #224]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L441
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
    b       .L440
.L441:
    mov     x9, #0
    str     x9, [sp, #128]
.L442:
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L443
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
    cbz     w11, .L444
    ldr     x9, [sp, #232]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #240]
    ldr     x9, [sp, #240]
    ldr     x10, [sp, #208]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L445
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #240]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L446
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #240]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L447
    mov     x9, #0
    str     x9, [sp, #248]
    movz    x9, #0x0007
    str     x9, [sp, #256]
.L448:
    ldr     x9, [sp, #248]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L449
    ldr     x9, [sp, #216]
    ldr     x10, [sp, #248]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L450
    ldr     x9, [sp, #256]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L451
    ldr     x9, [sp, #248]
    str     x9, [sp, #256]
.L451:
.L450:
    ldr     x9, [sp, #248]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #248]
    b       .L448
.L449:
    ldr     x9, [sp, #256]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L452
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
.L452:
.L447:
.L446:
.L445:
.L444:
    ldr     x9, [sp, #232]
    ldr     x10, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    bl      _collect_uses
    mov     x11, x0
    str     x11, [sp, #264]
    mov     x9, #0
    str     x9, [sp, #272]
.L453:
    ldr     x9, [sp, #272]
    ldr     x10, [sp, #264]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L454
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
    cbz     w11, .L455
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
    cbz     w11, .L456
    ldr     x9, [sp, #216]
    ldr     x10, [sp, #288]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0001
    str     x9, [x10]
.L456:
.L455:
    ldr     x9, [sp, #272]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #272]
    b       .L453
.L454:
    ldr     x9, [sp, #128]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #128]
    b       .L442
.L443:
.L703:
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
.L704:
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
.L457:
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L458
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
    cbz     w11, .L459
    ldr     x9, [sp, #48]
    str     x9, [sp, #24]
    ldr     x9, [sp, #48]
    str     x9, [sp, #32]
    b       .L460
.L459:
    ldr     x9, [sp, #32]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    str     x9, [sp, #32]
.L460:
    ldr     x9, [sp, #40]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    b       .L457
.L458:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L705
.L705:
    add     sp, sp, #368
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
.L706:
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
    b       .L707
.L707:
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
.L708:
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
.L709:
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
.L710:
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
.L711:
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
    cbz     w11, .L461
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #64]
    b       .L712
.L461:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #88]
.L712:
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
    cbz     w11, .L462
    adrp    x9, L_str20@PAGE
    add     x9, x9, L_str20@PAGEOFF
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
    b       .L713
.L462:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L463
    adrp    x9, L_str21@PAGE
    add     x9, x9, L_str21@PAGEOFF
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
    b       .L713
.L463:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L464
    adrp    x9, L_str22@PAGE
    add     x9, x9, L_str22@PAGEOFF
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
    b       .L713
.L464:
    adrp    x9, L_str23@PAGE
    add     x9, x9, L_str23@PAGEOFF
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
.L713:
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
    adrp    x9, L_str24@PAGE
    add     x9, x9, L_str24@PAGEOFF
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
    adrp    x9, L_str25@PAGE
    add     x9, x9, L_str25@PAGEOFF
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
.L714:
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
    adrp    x9, L_str26@PAGE
    add     x9, x9, L_str26@PAGEOFF
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
    adrp    x9, L_str27@PAGE
    add     x9, x9, L_str27@PAGEOFF
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
.L715:
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
    cbz     w11, .L465
    adrp    x9, L_str28@PAGE
    add     x9, x9, L_str28@PAGEOFF
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
    adrp    x9, L_str29@PAGE
    add     x9, x9, L_str29@PAGEOFF
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
    b       .L716
.L465:
    movz    x9, #0x0004
    str     x9, [sp, #112]
    mov     x9, #0
    str     x9, [sp, #120]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L466
    mov     x9, #0
    str     x9, [sp, #112]
    ldr     x9, [sp, #32]
    str     x9, [sp, #120]
.L466:
    ldr     x9, [sp, #112]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L467
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L468
    movz    x9, #0x0001
    str     x9, [sp, #112]
    ldr     x9, [sp, #48]
    str     x9, [sp, #120]
.L468:
.L467:
    ldr     x9, [sp, #112]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L469
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L470
    movz    x9, #0x0002
    str     x9, [sp, #112]
    ldr     x9, [sp, #64]
    str     x9, [sp, #120]
.L470:
.L469:
    ldr     x9, [sp, #112]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L471
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L472
    movz    x9, #0x0003
    str     x9, [sp, #112]
    ldr     x9, [sp, #72]
    str     x9, [sp, #120]
.L472:
.L471:
    adrp    x9, L_str30@PAGE
    add     x9, x9, L_str30@PAGEOFF
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
    adrp    x9, L_str31@PAGE
    add     x9, x9, L_str31@PAGEOFF
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
    cbz     w11, .L473
    adrp    x9, L_str32@PAGE
    add     x9, x9, L_str32@PAGEOFF
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
.L473:
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
.L474:
    ldr     x9, [sp, #176]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L475
    mov     x9, #0
    str     x9, [sp, #184]
    ldr     x9, [sp, #176]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L476
    ldr     x9, [sp, #48]
    str     x9, [sp, #184]
.L476:
    ldr     x9, [sp, #176]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L477
    ldr     x9, [sp, #64]
    str     x9, [sp, #184]
.L477:
    ldr     x9, [sp, #176]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L478
    ldr     x9, [sp, #72]
    str     x9, [sp, #184]
.L478:
    ldr     x9, [sp, #184]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L479
    adrp    x9, L_str33@PAGE
    add     x9, x9, L_str33@PAGEOFF
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
    adrp    x9, L_str34@PAGE
    add     x9, x9, L_str34@PAGEOFF
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
    adrp    x9, L_str35@PAGE
    add     x9, x9, L_str35@PAGEOFF
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
.L479:
    ldr     x9, [sp, #176]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #176]
    b       .L474
.L475:
.L716:
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
.L717:
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
    b       .L718
.L718:
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
    b       .L719
.L719:
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
    cbz     w11, .L480
    movz    x9, #0x0001
    mov     x0, x9
    b       .L720
.L480:
    mov     x9, #0
    mov     x0, x9
    b       .L720
.L720:
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
    cbz     w11, .L481
    ldr     x9, [sp, #24]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L721
.L481:
    movz    x9, #0x0010
    mov     x0, x9
    b       .L721
.L721:
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
    adrp    x9, L_str36@PAGE
    add     x9, x9, L_str36@PAGEOFF
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
    adrp    x9, L_str37@PAGE
    add     x9, x9, L_str37@PAGEOFF
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
    adrp    x9, L_str38@PAGE
    add     x9, x9, L_str38@PAGEOFF
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
.L722:
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
    adrp    x9, L_str39@PAGE
    add     x9, x9, L_str39@PAGEOFF
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
    adrp    x9, L_str40@PAGE
    add     x9, x9, L_str40@PAGEOFF
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
    adrp    x9, L_str41@PAGE
    add     x9, x9, L_str41@PAGEOFF
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
.L723:
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
    adrp    x9, L_str42@PAGE
    add     x9, x9, L_str42@PAGEOFF
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
    adrp    x9, L_str43@PAGE
    add     x9, x9, L_str43@PAGEOFF
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
.L724:
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
    adrp    x9, L_str44@PAGE
    add     x9, x9, L_str44@PAGEOFF
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
    adrp    x9, L_str45@PAGE
    add     x9, x9, L_str45@PAGEOFF
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
.L725:
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
.L726:
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
    cbz     w11, .L482
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
    b       .L727
.L482:
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
.L727:
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
    cbz     w11, .L483
    b       .L728
.L483:
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
.L728:
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
    cbz     w11, .L484
    ldr     x9, [sp, #40]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L729
.L484:
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
    b       .L729
.L729:
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
    cbz     w11, .L485
    ldr     x9, [sp, #40]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L730
.L485:
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
    b       .L730
.L730:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_binop_mnemonic
_out_binop_mnemonic:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #640
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L486
    adrp    x9, L_str46@PAGE
    add     x9, x9, L_str46@PAGEOFF
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
    str     x0, [sp, #192]
    b       .L731
.L486:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L487
    adrp    x9, L_str47@PAGE
    add     x9, x9, L_str47@PAGEOFF
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
    str     x0, [sp, #264]
    b       .L731
.L487:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L488
    adrp    x9, L_str48@PAGE
    add     x9, x9, L_str48@PAGEOFF
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
    str     x0, [sp, #336]
    b       .L731
.L488:
    ldr     x9, [sp, #8]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L489
    adrp    x9, L_str49@PAGE
    add     x9, x9, L_str49@PAGEOFF
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
    str     x0, [sp, #408]
    b       .L731
.L489:
    ldr     x9, [sp, #8]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L490
    adrp    x9, L_str50@PAGE
    add     x9, x9, L_str50@PAGEOFF
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
    str     x0, [sp, #480]
    b       .L731
.L490:
    ldr     x9, [sp, #8]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L491
    adrp    x9, L_str51@PAGE
    add     x9, x9, L_str51@PAGEOFF
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
    str     x0, [sp, #552]
    b       .L731
.L491:
    ldr     x9, [sp, #8]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L492
    adrp    x9, L_str52@PAGE
    add     x9, x9, L_str52@PAGEOFF
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
    str     x0, [sp, #624]
    b       .L731
.L492:
.L731:
    add     sp, sp, #640
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
.L732:
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
    cbz     w11, .L493
    adrp    x9, L_str53@PAGE
    add     x9, x9, L_str53@PAGEOFF
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
    adrp    x9, L_str54@PAGE
    add     x9, x9, L_str54@PAGEOFF
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
    adrp    x9, L_str55@PAGE
    add     x9, x9, L_str55@PAGEOFF
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
    adrp    x9, L_str56@PAGE
    add     x9, x9, L_str56@PAGEOFF
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
    adrp    x9, L_str57@PAGE
    add     x9, x9, L_str57@PAGEOFF
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
    b       .L733
.L493:
    adrp    x9, L_str58@PAGE
    add     x9, x9, L_str58@PAGEOFF
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
    adrp    x9, L_str59@PAGE
    add     x9, x9, L_str59@PAGEOFF
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
    adrp    x9, L_str60@PAGE
    add     x9, x9, L_str60@PAGEOFF
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
    adrp    x9, L_str61@PAGE
    add     x9, x9, L_str61@PAGEOFF
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
    adrp    x9, L_str62@PAGE
    add     x9, x9, L_str62@PAGEOFF
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
.L733:
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
    adrp    x9, L_str63@PAGE
    add     x9, x9, L_str63@PAGEOFF
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
    adrp    x9, L_str64@PAGE
    add     x9, x9, L_str64@PAGEOFF
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
.L734:
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
    cbz     w11, .L494
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
    b       .L495
.L494:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L496
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
    b       .L497
.L496:
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
.L497:
.L495:
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
.L735:
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
    cbz     w11, .L498
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L499
.L498:
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
.L499:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L500
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
    b       .L501
.L500:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L502
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
    b       .L503
.L502:
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
.L503:
.L501:
.L736:
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
    cbz     w11, .L504
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
    b       .L505
.L504:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L506
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
    b       .L507
.L506:
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
.L507:
.L505:
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
.L737:
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
    cbz     w11, .L508
    ldr     x9, [sp, #40]
    movz    x10, #0x0009
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L509
.L508:
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
.L509:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L510
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
    b       .L511
.L510:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L512
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
    b       .L513
.L512:
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
.L513:
.L511:
.L738:
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
    cbz     w11, .L514
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L514:
    mov     x9, #0
    str     x9, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L515
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
    b       .L516
.L515:
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
.L516:
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
    adrp    x9, L_str65@PAGE
    add     x9, x9, L_str65@PAGEOFF
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
    adrp    x9, L_str66@PAGE
    add     x9, x9, L_str66@PAGEOFF
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
    adrp    x9, L_str67@PAGE
    add     x9, x9, L_str67@PAGEOFF
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
.L739:
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
    cbz     w11, .L517
    adrp    x9, L_str68@PAGE
    add     x9, x9, L_str68@PAGEOFF
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
    b       .L740
.L517:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L518
    adrp    x9, L_str69@PAGE
    add     x9, x9, L_str69@PAGEOFF
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
    b       .L740
.L518:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L519
    adrp    x9, L_str70@PAGE
    add     x9, x9, L_str70@PAGEOFF
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
    b       .L740
.L519:
    ldr     x9, [sp, #8]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L520
    adrp    x9, L_str71@PAGE
    add     x9, x9, L_str71@PAGEOFF
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
    b       .L740
.L520:
    ldr     x9, [sp, #8]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L521
    adrp    x9, L_str72@PAGE
    add     x9, x9, L_str72@PAGEOFF
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
    b       .L740
.L521:
    ldr     x9, [sp, #8]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L522
    adrp    x9, L_str73@PAGE
    add     x9, x9, L_str73@PAGEOFF
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
    b       .L740
.L522:
.L740:
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
    cbz     w11, .L523
    movz    x9, #0x0001
    str     x9, [sp, #32]
.L523:
    mov     x9, #0
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L524
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
    b       .L525
.L524:
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
.L525:
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
    adrp    x9, L_str74@PAGE
    add     x9, x9, L_str74@PAGEOFF
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
    adrp    x9, L_str75@PAGE
    add     x9, x9, L_str75@PAGEOFF
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
    adrp    x9, L_str76@PAGE
    add     x9, x9, L_str76@PAGEOFF
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
.L741:
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
    cbz     w11, .L526
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
    b       .L527
.L526:
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
.L527:
    movz    x9, #0x0001
    str     x9, [sp, #56]
.L528:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #16]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L529
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
    b       .L528
.L529:
    adrp    x9, L_str77@PAGE
    add     x9, x9, L_str77@PAGEOFF
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
    cbz     w11, .L530
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
    b       .L742
.L530:
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
.L742:
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
    adrp    x9, L_str78@PAGE
    add     x9, x9, L_str78@PAGEOFF
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
    cbz     w10, .L531
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_syscall
    str     x0, [sp, #232]
    b       .L743
.L531:
    ldr     x9, [sp, #16]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L532:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #16]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L533
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
    b       .L532
.L533:
    adrp    x9, L_str79@PAGE
    add     x9, x9, L_str79@PAGEOFF
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
    cbz     w11, .L534
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
    b       .L743
.L534:
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
.L743:
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
    cbz     w11, .L535
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
    cbz     w11, .L536
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    movz    x9, #0x0008
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L537
    movz    x9, #0x0001
    str     x9, [sp, #32]
.L537:
.L536:
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
    cbz     w11, .L538
    ldr     x9, [sp, #56]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L539
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
    b       .L540
.L539:
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
.L540:
    b       .L541
.L538:
    ldr     x9, [sp, #56]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L542
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
    b       .L543
.L542:
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
.L543:
.L541:
.L535:
    adrp    x9, L_str80@PAGE
    add     x9, x9, L_str80@PAGEOFF
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
.L744:
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
    adrp    x9, L_str81@PAGE
    add     x9, x9, L_str81@PAGEOFF
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
.L745:
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
    adrp    x9, L_str82@PAGE
    add     x9, x9, L_str82@PAGEOFF
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
    adrp    x9, L_str83@PAGE
    add     x9, x9, L_str83@PAGEOFF
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
.L746:
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
    adrp    x9, L_str84@PAGE
    add     x9, x9, L_str84@PAGEOFF
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
    adrp    x9, L_str85@PAGE
    add     x9, x9, L_str85@PAGEOFF
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
.L747:
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
    cbz     w11, .L544
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_movi
    str     x0, [sp, #120]
    b       .L748
.L544:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L545
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_label_addr
    str     x0, [sp, #176]
    b       .L748
.L545:
    ldr     x9, [sp, #32]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L546
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_addr_local
    str     x0, [sp, #232]
    b       .L748
.L546:
    ldr     x9, [sp, #32]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L547
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_load_local
    str     x0, [sp, #288]
    b       .L748
.L547:
    ldr     x9, [sp, #32]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L548
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_store_local
    str     x0, [sp, #344]
    b       .L748
.L548:
    ldr     x9, [sp, #32]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L549
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_load_mem
    str     x0, [sp, #400]
    b       .L748
.L549:
    ldr     x9, [sp, #32]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L550
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_store_mem
    str     x0, [sp, #456]
    b       .L748
.L550:
    ldr     x9, [sp, #32]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L551
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_binop
    str     x0, [sp, #512]
    b       .L748
.L551:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L552
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
    b       .L748
.L552:
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L553
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
    b       .L748
.L553:
    ldr     x9, [sp, #32]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L554
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
    b       .L748
.L554:
    ldr     x9, [sp, #32]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L555
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
    b       .L748
.L555:
    ldr     x9, [sp, #32]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L556
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
    b       .L748
.L556:
    ldr     x9, [sp, #32]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L557
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
    b       .L748
.L557:
    ldr     x9, [sp, #32]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L558
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_call
    str     x0, [sp, #952]
    b       .L748
.L558:
    ldr     x9, [sp, #32]
    movz    x10, #0x000f
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L559
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
    b       .L748
.L559:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L560
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_i_jmp
    str     x0, [sp, #1064]
    b       .L748
.L560:
    ldr     x9, [sp, #32]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L561
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_jz
    str     x0, [sp, #1120]
    b       .L748
.L561:
    ldr     x9, [sp, #32]
    movz    x10, #0x0012
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L562
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_i_label
    str     x0, [sp, #1168]
    b       .L748
.L562:
.L748:
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
    cbz     w11, .L563
    ldr     x9, [sp, #0]
    movz    x10, #0x005f
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #72]
.L563:
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
.L749:
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
    adrp    x9, L_str86@PAGE
    add     x9, x9, L_str86@PAGEOFF
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
    adrp    x9, L_str87@PAGE
    add     x9, x9, L_str87@PAGEOFF
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
    cbz     w11, .L564
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0fff
    cmp     x9, x10
    cset    w11, ls
    cbz     w11, .L565
    adrp    x9, L_str88@PAGE
    add     x9, x9, L_str88@PAGEOFF
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
    b       .L566
.L565:
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
    adrp    x9, L_str89@PAGE
    add     x9, x9, L_str89@PAGEOFF
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
.L566:
.L564:
.L750:
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
    adrp    x9, L_str90@PAGE
    add     x9, x9, L_str90@PAGEOFF
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
    adrp    x9, L_str91@PAGE
    add     x9, x9, L_str91@PAGEOFF
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
    cbz     w11, .L567
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0fff
    cmp     x9, x10
    cset    w11, ls
    cbz     w11, .L568
    adrp    x9, L_str92@PAGE
    add     x9, x9, L_str92@PAGEOFF
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
    b       .L569
.L568:
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
    adrp    x9, L_str93@PAGE
    add     x9, x9, L_str93@PAGEOFF
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
.L569:
.L567:
    adrp    x9, L_str94@PAGE
    add     x9, x9, L_str94@PAGEOFF
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
.L751:
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
    cbz     w11, .L570
    adrp    x9, L_str95@PAGE
    add     x9, x9, L_str95@PAGEOFF
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
    b       .L752
.L570:
    adrp    x9, L_str96@PAGE
    add     x9, x9, L_str96@PAGEOFF
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
.L752:
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
    cbz     w11, .L571
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
    cbz     w11, .L572
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    str     x10, [sp, #48]
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L573
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L573:
    ldr     x9, [sp, #48]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L574
    movz    x9, #0x0004
    str     x9, [sp, #24]
.L574:
.L572:
.L571:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L575
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
    b       .L753
.L575:
    ldr     x9, [sp, #24]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L576
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
    b       .L753
.L576:
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
.L753:
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
.L577:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L578
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
    b       .L577
.L578:
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
.L579:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L580
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
    b       .L579
.L580:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_epilogue
    str     x0, [sp, #328]
.L754:
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
    adrp    x9, L_str97@PAGE
    add     x9, x9, L_str97@PAGEOFF
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
.L755:
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
    cbz     w11, .L581
    b       .L756
.L581:
    adrp    x9, L_str98@PAGE
    add     x9, x9, L_str98@PAGEOFF
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
.L582:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L583
    adrp    x9, L_str99@PAGE
    add     x9, x9, L_str99@PAGEOFF
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
    adrp    x9, L_str100@PAGE
    add     x9, x9, L_str100@PAGEOFF
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
.L584:
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #32]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L585
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
    b       .L584
.L585:
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
    b       .L582
.L583:
.L756:
    add     sp, sp, #592
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_macos_start
_emit_macos_start:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, L_str101@PAGE
    add     x9, x9, L_str101@PAGEOFF
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
.L757:
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
    cbz     w11, .L586
    b       .L758
.L586:
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
.L587:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L588
    adrp    x9, L_str102@PAGE
    add     x9, x9, L_str102@PAGEOFF
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
    adrp    x9, L_str103@PAGE
    add     x9, x9, L_str103@PAGEOFF
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
    adrp    x9, L_str104@PAGE
    add     x9, x9, L_str104@PAGEOFF
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
    b       .L587
.L588:
.L758:
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
    cbz     w11, .L589
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _emit_macos_start
    str     x0, [sp, #136]
.L589:
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    str     x9, [sp, #40]
.L590:
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L591
    ldr     x9, [sp, #40]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
.L592:
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L593
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0012
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L594
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L595
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
.L595:
.L594:
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L596
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L597
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
.L597:
.L596:
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L598
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L599
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
.L599:
.L598:
    ldr     x9, [sp, #48]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    b       .L592
.L593:
    ldr     x9, [sp, #40]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    b       .L590
.L591:
    ldr     x9, [sp, #32]
    str     x9, [sp, #56]
    ldr     x9, [sp, #24]
    str     x9, [sp, #64]
.L600:
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L601
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
    b       .L600
.L601:
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
.L759:
    add     sp, sp, #928
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
    cbz     w11, .L602
    mov     x9, #0
    mov     x0, x9
    b       .L760
.L602:
    mov     x9, #0
    str     x9, [sp, #32]
.L603:
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
    cbz     w11, .L605
    b       .L604
.L605:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L603
.L604:
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #224]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L760
.L760:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _main
_main:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #544
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L606
    movz    x9, #0x0002
    mov     w0, w9
    b       .L761
.L606:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0003
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0001
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #24]
    ldr     x9, [sp, #16]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    movz    x11, #0x0004, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _read_all
    mov     x12, x0
    str     x12, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L607
    movz    x9, #0x0003
    mov     w0, w9
    b       .L761
.L607:
    bl      _ast_init
    mov     x9, x0
    str     x9, [sp, #40]
    bl      _ir_init
    mov     x9, x0
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _parse
    mov     x12, x0
    str     x12, [sp, #56]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    bl      _lower
    mov     x11, x0
    str     x11, [sp, #64]
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _io_open_write
    mov     x10, x0
    str     x10, [sp, #72]
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L608
    movz    x9, #0x0004
    mov     w0, w9
    b       .L761
.L608:
    adrp    x9, _OUT_STORAGE@PAGE
    add     x9, x9, _OUT_STORAGE@PAGEOFF
    str     x9, [sp, #80]
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #72]
    adrp    x11, _OUT_BUF@PAGE
    add     x11, x11, _OUT_BUF@PAGEOFF
    movz    x12, #0x0001, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #472]
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    ldr     x11, [sp, #56]
    ldr     x12, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _codegen
    str     x0, [sp, #512]
    ldr     x9, [sp, #72]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #528]
    mov     x9, #0
    mov     w0, w9
    b       .L761
.L761:
    add     sp, sp, #544
    ldp     x29, x30, [sp], #16
    ret

    .section __TEXT,__cstring
    .balign  8
L_str0:
    .byte   0x66
    .byte   0x75
    .byte   0x6e
    .byte   0x00
    .balign  8
L_str1:
    .byte   0x6c
    .byte   0x65
    .byte   0x74
    .byte   0x00
    .balign  8
L_str2:
    .byte   0x63
    .byte   0x6f
    .byte   0x6e
    .byte   0x73
    .byte   0x74
    .byte   0x00
    .balign  8
L_str3:
    .byte   0x72
    .byte   0x65
    .byte   0x74
    .byte   0x75
    .byte   0x72
    .byte   0x6e
    .byte   0x00
    .balign  8
L_str4:
    .byte   0x69
    .byte   0x66
    .byte   0x00
    .balign  8
L_str5:
    .byte   0x65
    .byte   0x6c
    .byte   0x73
    .byte   0x65
    .byte   0x00
    .balign  8
L_str6:
    .byte   0x6c
    .byte   0x6f
    .byte   0x6f
    .byte   0x70
    .byte   0x00
    .balign  8
L_str7:
    .byte   0x77
    .byte   0x68
    .byte   0x69
    .byte   0x6c
    .byte   0x65
    .byte   0x00
    .balign  8
L_str8:
    .byte   0x62
    .byte   0x72
    .byte   0x65
    .byte   0x61
    .byte   0x6b
    .byte   0x00
    .balign  8
L_str9:
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x75
    .byte   0x63
    .byte   0x74
    .byte   0x00
    .balign  8
L_str10:
    .byte   0x62
    .byte   0x73
    .byte   0x73
    .byte   0x00
    .balign  8
L_str11:
    .byte   0x6e
    .byte   0x69
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str12:
    .byte   0x73
    .byte   0x69
    .byte   0x7a
    .byte   0x65
    .byte   0x6f
    .byte   0x66
    .byte   0x00
    .balign  8
L_str13:
    .byte   0x73
    .byte   0x79
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str14:
    .byte   0x70
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str15:
    .byte   0x6c
    .byte   0x65
    .byte   0x6e
    .byte   0x00
    .balign  8
L_str16:
    .byte   0x75
    .byte   0x38
    .byte   0x00
    .balign  8
L_str17:
    .byte   0x75
    .byte   0x33
    .byte   0x32
    .byte   0x00
    .balign  8
L_str18:
    .byte   0x75
    .byte   0x36
    .byte   0x34
    .byte   0x00
    .balign  8
L_str19:
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str20:
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
L_str21:
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
L_str22:
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
L_str23:
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
L_str24:
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
L_str25:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str26:
    .byte   0x2c
    .byte   0x20
    .byte   0x5b
    .byte   0x00
    .balign  8
L_str27:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str28:
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
L_str29:
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str30:
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
L_str31:
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x78
    .byte   0x00
    .balign  8
L_str32:
    .byte   0x2c
    .byte   0x20
    .byte   0x6c
    .byte   0x73
    .byte   0x6c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str33:
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
L_str34:
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x78
    .byte   0x00
    .balign  8
L_str35:
    .byte   0x2c
    .byte   0x20
    .byte   0x6c
    .byte   0x73
    .byte   0x6c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str36:
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
L_str37:
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
L_str38:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str39:
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
L_str40:
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
L_str41:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str42:
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
L_str43:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str44:
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
L_str45:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str46:
    .byte   0x61
    .byte   0x64
    .byte   0x64
    .byte   0x00
    .balign  8
L_str47:
    .byte   0x73
    .byte   0x75
    .byte   0x62
    .byte   0x00
    .balign  8
L_str48:
    .byte   0x6d
    .byte   0x75
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str49:
    .byte   0x75
    .byte   0x64
    .byte   0x69
    .byte   0x76
    .byte   0x00
    .balign  8
L_str50:
    .byte   0x61
    .byte   0x6e
    .byte   0x64
    .byte   0x00
    .balign  8
L_str51:
    .byte   0x6f
    .byte   0x72
    .byte   0x72
    .byte   0x00
    .balign  8
L_str52:
    .byte   0x65
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str53:
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
L_str54:
    .byte   0x2c
    .byte   0x20
    .byte   0x5f
    .byte   0x00
    .balign  8
L_str55:
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
L_str56:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str57:
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
L_str58:
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
L_str59:
    .byte   0x2c
    .byte   0x20
    .byte   0x4c
    .byte   0x5f
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str60:
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
L_str61:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str62:
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
L_str63:
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
L_str64:
    .byte   0x2c
    .byte   0x20
    .byte   0x73
    .byte   0x70
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str65:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str66:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str67:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str68:
    .byte   0x65
    .byte   0x71
    .byte   0x00
    .balign  8
L_str69:
    .byte   0x6e
    .byte   0x65
    .byte   0x00
    .balign  8
L_str70:
    .byte   0x6c
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str71:
    .byte   0x6c
    .byte   0x73
    .byte   0x00
    .balign  8
L_str72:
    .byte   0x68
    .byte   0x69
    .byte   0x00
    .balign  8
L_str73:
    .byte   0x68
    .byte   0x73
    .byte   0x00
    .balign  8
L_str74:
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
L_str75:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str76:
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
L_str77:
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
L_str78:
    .byte   0x73
    .byte   0x79
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str79:
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
L_str80:
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
L_str81:
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
L_str82:
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
L_str83:
    .byte   0x2c
    .byte   0x20
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str84:
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str85:
    .byte   0x3a
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str86:
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
L_str87:
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
L_str88:
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
L_str89:
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
L_str90:
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str91:
    .byte   0x3a
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str92:
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
L_str93:
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
L_str94:
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
L_str95:
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
L_str96:
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
L_str97:
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
L_str98:
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
L_str99:
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
L_str100:
    .byte   0x3a
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str101:
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
L_str102:
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
L_str103:
    .byte   0x2c
    .byte   0x00
    .balign  8
L_str104:
    .byte   0x2c
    .byte   0x33
    .byte   0x0a
    .byte   0x00

    .zerofill __DATA,__bss,_IO_BUF,16777216,3
    .zerofill __DATA,__bss,_DIGITS,32,3
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
