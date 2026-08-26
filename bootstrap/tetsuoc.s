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
.L901:
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
    b       .L902
.L902:
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
    b       .L903
.L903:
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
    b       .L904
.L904:
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
    b       .L905
.L905:
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
.L906:
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
.L907:
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
.L908:
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
    b       .L909
.L3:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L1
.L2:
    movz    x9, #0x0001
    mov     w0, w9
    b       .L909
.L909:
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
.L910:
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
.L911:
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
.L912:
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
.L913:
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
.L914:
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
    b       .L915
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
.L915:
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
    b       .L916
.L15:
    ldr     x9, [sp, #0]
    movz    x10, #0x0057
    ldr     x11, [sp, #8]
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_byte
    str     x0, [sp, #112]
.L916:
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
.L917:
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
.L918:
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
.L919:
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
.L920:
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
    b       .L921
.L921:
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
    b       .L922
.L922:
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
.L923:
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
    b       .L924
.L18:
.L17:
    mov     x9, #0
    mov     w0, w9
    b       .L924
.L924:
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
    b       .L925
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
    b       .L925
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
    b       .L925
.L23:
.L22:
    mov     x9, #0
    mov     w0, w9
    b       .L925
.L925:
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
    b       .L926
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
    b       .L926
.L25:
    ldrb    w9, [sp, #0]
    movz    x10, #0x0041
    sub     w11, w9, w10
    movz    x9, #0x000a
    add     w10, w11, w9
    mov     w0, w10
    b       .L926
.L926:
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
    b       .L927
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
    b       .L927
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
    b       .L927
.L30:
.L29:
    mov     x9, #0
    mov     w0, w9
    b       .L927
.L927:
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
    b       .L928
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
    b       .L928
.L32:
    mov     x9, #0
    mov     w0, w9
    b       .L928
.L928:
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
    b       .L929
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
    b       .L929
.L929:
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
    b       .L930
.L34:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    add     x11, x9, x10
    ldrb    w9, [x11]
    mov     w0, w9
    b       .L930
.L930:
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
.L931:
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
    b       .L932
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
    b       .L932
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
    b       .L932
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
    b       .L932
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
    b       .L932
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
    b       .L932
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
    b       .L932
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
    b       .L932
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
    b       .L932
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
    b       .L932
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
    b       .L932
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
    b       .L932
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
    b       .L932
.L69:
.L67:
    movz    x9, #0x000e
    mov     w0, w9
    b       .L932
.L932:
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
.L933:
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
.L934:
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
.L935:
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
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
    b       .L936
.L124:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    mov     x9, #0
    str     w9, [x11]
.L936:
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
    b       .L937
.L937:
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
    b       .L938
.L938:
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
    b       .L939
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
    b       .L939
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
    b       .L939
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
    b       .L939
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
    b       .L939
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
    b       .L939
.L131:
.L130:
    movz    x9, #0x0008
    mov     x0, x9
    b       .L939
.L939:
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
.L940:
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
.L941:
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
    b       .L942
.L942:
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
.L943:
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
    b       .L944
.L944:
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
    b       .L945
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
    b       .L945
.L945:
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
    b       .L946
.L946:
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
    b       .L947
.L144:
    b       .L142
.L143:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L947
.L947:
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
    b       .L948
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
    b       .L948
.L948:
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
    b       .L949
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
    b       .L949
.L949:
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
    b       .L950
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
    b       .L950
.L950:
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
    b       .L951
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
    b       .L951
.L951:
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
    b       .L952
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
    b       .L952
.L952:
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
.L953:
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
    b       .L954
.L954:
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
.L955:
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
.L956:
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
.L957:
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
    b       .L958
.L958:
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
    b       .L959
.L959:
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
    b       .L960
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
    b       .L960
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
    b       .L960
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
    b       .L960
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
    b       .L960
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
    b       .L960
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
    b       .L960
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
    b       .L960
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
    b       .L960
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
    b       .L960
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
    b       .L960
.L960:
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
    b       .L961
.L217:
.L212:
    b       .L190
.L191:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L961
.L961:
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
    b       .L962
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
    b       .L962
.L221:
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_postfix
    mov     x10, x0
    mov     x0, x10
    b       .L962
.L962:
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
    b       .L963
.L222:
    ldr     w9, [sp, #0]
    movz    x10, #0x001a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L223
    movz    x9, #0x0006
    mov     x0, x9
    b       .L963
.L223:
    ldr     w9, [sp, #0]
    movz    x10, #0x0018
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L224
    movz    x9, #0x0005
    mov     x0, x9
    b       .L963
.L224:
    ldr     w9, [sp, #0]
    movz    x10, #0x0019
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L225
    movz    x9, #0x0005
    mov     x0, x9
    b       .L963
.L225:
    ldr     w9, [sp, #0]
    movz    x10, #0x002b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L226
    movz    x9, #0x0005
    mov     x0, x9
    b       .L963
.L226:
    ldr     w9, [sp, #0]
    movz    x10, #0x002c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L227
    movz    x9, #0x0005
    mov     x0, x9
    b       .L963
.L227:
    ldr     w9, [sp, #0]
    movz    x10, #0x001b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L228
    movz    x9, #0x0004
    mov     x0, x9
    b       .L963
.L228:
    ldr     w9, [sp, #0]
    movz    x10, #0x001d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L229
    movz    x9, #0x0003
    mov     x0, x9
    b       .L963
.L229:
    ldr     w9, [sp, #0]
    movz    x10, #0x001c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L230
    movz    x9, #0x0002
    mov     x0, x9
    b       .L963
.L230:
    ldr     w9, [sp, #0]
    movz    x10, #0x001f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L231
    movz    x9, #0x0001
    mov     x0, x9
    b       .L963
.L231:
    ldr     w9, [sp, #0]
    movz    x10, #0x0020
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L232
    movz    x9, #0x0001
    mov     x0, x9
    b       .L963
.L232:
    ldr     w9, [sp, #0]
    movz    x10, #0x0021
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L233
    movz    x9, #0x0001
    mov     x0, x9
    b       .L963
.L233:
    ldr     w9, [sp, #0]
    movz    x10, #0x0022
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L234
    movz    x9, #0x0001
    mov     x0, x9
    b       .L963
.L234:
    ldr     w9, [sp, #0]
    movz    x10, #0x0023
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L235
    movz    x9, #0x0001
    mov     x0, x9
    b       .L963
.L235:
    ldr     w9, [sp, #0]
    movz    x10, #0x0024
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L236
    movz    x9, #0x0001
    mov     x0, x9
    b       .L963
.L236:
    mov     x9, #0
    mov     x0, x9
    b       .L963
.L963:
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
    b       .L964
.L964:
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
    b       .L965
.L965:
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
.L966:
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
    b       .L967
.L257:
    mov     x9, #0
    mov     w0, w9
    b       .L967
.L967:
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
    b       .L968
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
    b       .L968
.L968:
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
    b       .L969
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
    b       .L969
.L969:
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
    b       .L970
.L970:
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
    b       .L971
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
    b       .L971
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
    b       .L971
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
    b       .L971
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
    b       .L971
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
    b       .L971
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
    b       .L971
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
    b       .L971
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
    b       .L971
.L971:
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
    b       .L972
.L972:
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
    b       .L973
.L973:
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
    b       .L974
.L974:
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
    b       .L975
.L975:
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
    b       .L976
.L976:
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
    b       .L977
.L977:
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
    b       .L978
.L978:
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
    b       .L979
.L334:
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    mov     x0, x10
    b       .L979
.L979:
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
    b       .L980
.L980:
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
    b       .L981
.L981:
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
    b       .L982
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
.L982:
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
    b       .L983
.L983:
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
    b       .L984
.L984:
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
    b       .L985
.L985:
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
.L986:
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
.L987:
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
.L988:
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
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
    b       .L989
.L350:
    mov     x9, #0
    mov     x0, x9
    b       .L989
.L989:
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
    b       .L990
.L990:
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
    b       .L991
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
    b       .L991
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
    b       .L991
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
    b       .L991
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
    b       .L991
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
    b       .L991
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
    b       .L991
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
    b       .L991
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
    b       .L991
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
    b       .L991
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
    b       .L991
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
    b       .L991
.L379:
.L991:
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
.L992:
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
    b       .L993
.L993:
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
    b       .L994
.L994:
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
    b       .L995
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
    b       .L995
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
    b       .L995
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
    b       .L995
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
    b       .L995
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
    b       .L995
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
    b       .L995
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
    b       .L995
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
    b       .L995
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
    b       .L995
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
    b       .L995
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
    b       .L995
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
    b       .L995
.L402:
    mov     x9, #0
    mov     x0, x9
    b       .L995
.L995:
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
    b       .L996
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
    b       .L996
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
    b       .L996
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
    b       .L996
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
    b       .L996
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
    b       .L996
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
    b       .L996
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
    b       .L996
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
    b       .L996
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
    b       .L996
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
    b       .L996
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
    b       .L996
.L415:
    mov     x9, #0
    mov     x0, x9
    b       .L996
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
    b       .L996
.L416:
    mov     x9, #0
    mov     x0, x9
    b       .L996
.L996:
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
.L997:
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
.L998:
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
    b       .L999
.L999:
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
.L1000:
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
.L1001:
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
    b       .L1002
.L1002:
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
.L1003:
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
.L1004:
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
.L1005:
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
.L1006:
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
    b       .L1007
.L473:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #88]
.L1007:
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
    b       .L1008
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
    b       .L1008
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
    b       .L1008
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
.L1008:
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
.L1009:
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
.L1010:
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
    b       .L1011
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
.L1011:
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
.L1012:
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
    b       .L1013
.L1013:
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
    b       .L1014
.L1014:
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
    b       .L1015
.L492:
    mov     x9, #0
    mov     x0, x9
    b       .L1015
.L1015:
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
    b       .L1016
.L493:
    movz    x9, #0x0010
    mov     x0, x9
    b       .L1016
.L1016:
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
.L1017:
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
.L1018:
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
.L1019:
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
.L1020:
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
.L1021:
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
    b       .L1022
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
.L1022:
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
    b       .L1023
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
.L1023:
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
    b       .L1024
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
    b       .L1024
.L1024:
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
    b       .L1025
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
    b       .L1025
.L1025:
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
    b       .L1026
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
    b       .L1026
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
    b       .L1026
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
    b       .L1026
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
    b       .L1026
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
    b       .L1026
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
    b       .L1026
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
    b       .L1026
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
    b       .L1026
.L506:
.L1026:
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
.L1027:
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
    b       .L1028
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
.L1028:
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
.L1029:
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
.L1030:
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
.L1031:
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
.L1032:
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
.L1033:
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
.L1034:
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
    b       .L1035
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
    b       .L1035
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
    b       .L1035
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
    b       .L1035
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
    b       .L1035
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
    b       .L1035
.L536:
.L1035:
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
.L1036:
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
    b       .L1037
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
.L1037:
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
    b       .L1038
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
    b       .L1038
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
.L1038:
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
.L1039:
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
.L1040:
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
.L1041:
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
.L1042:
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
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
    b       .L1043
.L576:
.L1043:
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
.L1044:
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
.L1045:
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
.L1046:
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
    b       .L1047
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
.L1047:
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
    b       .L1048
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
    b       .L1048
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
.L1048:
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
.L1049:
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
.L1050:
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
    b       .L1051
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
.L1051:
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
.L1052:
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
    b       .L1053
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
.L1053:
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
.L1054:
    add     sp, sp, #928
    ldp     x29, x30, [sp], #16
    ret

    .globl   _sha_rotr
_sha_rotr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #112
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    lsr     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    ldr     x12, [sp, #8]
    sub     x13, x10, x12
    lsl     x10, x9, x13
    orr     x9, x11, x10
    movz    x10, #0xffff
    movk    x10, #0xffff, lsl #16
    and     x11, x9, x10
    mov     x0, x11
    b       .L1055
.L1055:
    add     sp, sp, #112
    ldp     x29, x30, [sp], #16
    ret

    .globl   _sha_k_init
_sha_k_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #3088
    adrp    x9, _SHA_K@PAGE
    add     x9, x9, _SHA_K@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x2f98
    movk    x9, #0x428a, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x4491
    movk    x9, #0x7137, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xfbcf
    movk    x9, #0xb5c0, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xdba5
    movk    x9, #0xe9b5, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xc25b
    movk    x9, #0x3956, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x11f1
    movk    x9, #0x59f1, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0006
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x82a4
    movk    x9, #0x923f, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x5ed5
    movk    x9, #0xab1c, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xaa98
    movk    x9, #0xd807, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0009
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x5b01
    movk    x9, #0x1283, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x85be
    movk    x9, #0x2431, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x7dc3
    movk    x9, #0x550c, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x000c
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x5d74
    movk    x9, #0x72be, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x000d
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xb1fe
    movk    x9, #0x80de, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x000e
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x06a7
    movk    x9, #0x9bdc, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x000f
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xf174
    movk    x9, #0xc19b, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x69c1
    movk    x9, #0xe49b, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0011
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x4786
    movk    x9, #0xefbe, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0012
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x9dc6
    movk    x9, #0x0fc1, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0013
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xa1cc
    movk    x9, #0x240c, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0014
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x2c6f
    movk    x9, #0x2de9, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0015
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x84aa
    movk    x9, #0x4a74, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0016
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xa9dc
    movk    x9, #0x5cb0, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0017
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x88da
    movk    x9, #0x76f9, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x5152
    movk    x9, #0x983e, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0019
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xc66d
    movk    x9, #0xa831, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x001a
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x27c8
    movk    x9, #0xb003, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x001b
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x7fc7
    movk    x9, #0xbf59, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x001c
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0bf3
    movk    x9, #0xc6e0, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x001d
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x9147
    movk    x9, #0xd5a7, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x001e
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x6351
    movk    x9, #0x06ca, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x001f
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x2967
    movk    x9, #0x1429, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0a85
    movk    x9, #0x27b7, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0021
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x2138
    movk    x9, #0x2e1b, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0022
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x6dfc
    movk    x9, #0x4d2c, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0023
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0d13
    movk    x9, #0x5338, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0024
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x7354
    movk    x9, #0x650a, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0025
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0abb
    movk    x9, #0x766a, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0026
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xc92e
    movk    x9, #0x81c2, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0027
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x2c85
    movk    x9, #0x9272, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0028
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xe8a1
    movk    x9, #0xa2bf, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0029
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x664b
    movk    x9, #0xa81a, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x002a
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x8b70
    movk    x9, #0xc24b, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x002b
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x51a3
    movk    x9, #0xc76c, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x002c
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xe819
    movk    x9, #0xd192, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x002d
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0624
    movk    x9, #0xd699, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x002e
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x3585
    movk    x9, #0xf40e, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x002f
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xa070
    movk    x9, #0x106a, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xc116
    movk    x9, #0x19a4, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0031
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x6c08
    movk    x9, #0x1e37, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0032
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x774c
    movk    x9, #0x2748, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0033
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xbcb5
    movk    x9, #0x34b0, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0034
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0cb3
    movk    x9, #0x391c, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0035
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xaa4a
    movk    x9, #0x4ed8, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0036
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xca4f
    movk    x9, #0x5b9c, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0037
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x6ff3
    movk    x9, #0x682e, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x82ee
    movk    x9, #0x748f, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0039
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x636f
    movk    x9, #0x78a5, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x003a
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x7814
    movk    x9, #0x84c8, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x003b
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0208
    movk    x9, #0x8cc7, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x003c
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xfffa
    movk    x9, #0x90be, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x003d
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x6ceb
    movk    x9, #0xa450, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x003e
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xa3f7
    movk    x9, #0xbef9, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x003f
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x78f2
    movk    x9, #0xc671, lsl #16
    str     x9, [x10]
.L1056:
    add     sp, sp, #3088
    ldp     x29, x30, [sp], #16
    ret

    .globl   _sha_h_init
_sha_h_init:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #400
    adrp    x9, _SHA_H@PAGE
    add     x9, x9, _SHA_H@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xe667
    movk    x9, #0x6a09, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xae85
    movk    x9, #0xbb67, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xf372
    movk    x9, #0x3c6e, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xf53a
    movk    x9, #0xa54f, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x527f
    movk    x9, #0x510e, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x688c
    movk    x9, #0x9b05, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0006
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xd9ab
    movk    x9, #0x1f83, lsl #16
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0xcd19
    movk    x9, #0x5be0, lsl #16
    str     x9, [x10]
.L1057:
    add     sp, sp, #400
    ldp     x29, x30, [sp], #16
    ret

    .globl   _sha_w32be
_sha_w32be:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #272
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldrb    w9, [x11]
    str     x9, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    add     x11, x9, x10
    ldrb    w9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    add     x11, x9, x10
    ldrb    w9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    add     x11, x9, x10
    ldrb    w9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    lsl     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    lsl     x12, x9, x10
    orr     x9, x11, x12
    ldr     x10, [sp, #24]
    movz    x11, #0x0008
    lsl     x12, x10, x11
    orr     x10, x9, x12
    ldr     x9, [sp, #32]
    orr     x11, x10, x9
    mov     x0, x11
    b       .L1058
.L1058:
    add     sp, sp, #272
    ldp     x29, x30, [sp], #16
    ret

    .globl   _sha_put_be64
_sha_put_be64:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #656
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x11, #0
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    movz    x11, #0x0038
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0001
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    movz    x11, #0x0030
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0002
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    movz    x11, #0x0028
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0003
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    movz    x11, #0x0020
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0004
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    movz    x11, #0x0018
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0005
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    movz    x11, #0x0010
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0006
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    movz    x11, #0x0008
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0007
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    movz    x11, #0x00ff
    and     x12, x9, x11
    strb    w12, [x10]
.L1059:
    add     sp, sp, #656
    ldp     x29, x30, [sp], #16
    ret

    .globl   _sha256_block
_sha256_block:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #3104
    str     x0, [sp, #0]
    adrp    x9, _SHA_W@PAGE
    add     x9, x9, _SHA_W@PAGEOFF
    str     x9, [sp, #8]
    adrp    x9, _SHA_K@PAGE
    add     x9, x9, _SHA_K@PAGEOFF
    str     x9, [sp, #16]
    adrp    x9, _SHA_H@PAGE
    add     x9, x9, _SHA_H@PAGEOFF
    str     x9, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
.L616:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L617
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x16, x9, x12
    str     x16, [sp, #272]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    movz    x11, #0x0004
    mul     x12, x10, x11
    add     x10, x9, x12
    mov     x0, x10
    bl      _sha_w32be
    mov     x9, x0
    ldr     x17, [sp, #272]
    str     x9, [x17]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L616
.L617:
    movz    x9, #0x0010
    str     x9, [sp, #32]
.L618:
    ldr     x9, [sp, #32]
    movz    x10, #0x0040
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L619
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #32]
    movz    x11, #0x000f
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0007
    mov     x0, x9
    mov     x1, x10
    bl      _sha_rotr
    str     x0, [sp, #464]
    ldr     x9, [sp, #40]
    movz    x10, #0x0012
    mov     x0, x9
    mov     x1, x10
    bl      _sha_rotr
    mov     x11, x0
    ldr     w16, [sp, #464]
    eor     w9, w16, w11
    ldr     x10, [sp, #40]
    movz    x11, #0x0003
    lsr     x12, x10, x11
    eor     w10, w9, w12
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     w11, w10, w9
    str     x11, [sp, #48]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #32]
    movz    x11, #0x0002
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #56]
    ldr     x9, [sp, #56]
    movz    x10, #0x0011
    mov     x0, x9
    mov     x1, x10
    bl      _sha_rotr
    str     x0, [sp, #632]
    ldr     x9, [sp, #56]
    movz    x10, #0x0013
    mov     x0, x9
    mov     x1, x10
    bl      _sha_rotr
    mov     x11, x0
    ldr     w16, [sp, #632]
    eor     w9, w16, w11
    ldr     x10, [sp, #56]
    movz    x11, #0x000a
    lsr     x12, x10, x11
    eor     w10, w9, w12
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     w11, w10, w9
    str     x11, [sp, #64]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #8]
    ldr     x11, [sp, #32]
    movz    x12, #0x0010
    sub     x13, x11, x12
    movz    x11, #0x0008
    mul     x12, x13, x11
    add     x11, x9, x12
    ldr     x9, [x11]
    ldr     x11, [sp, #48]
    add     x12, x9, x11
    ldr     x9, [sp, #8]
    ldr     x11, [sp, #32]
    movz    x13, #0x0007
    sub     x14, x11, x13
    movz    x11, #0x0008
    mul     x13, x14, x11
    add     x11, x9, x13
    ldr     x9, [x11]
    add     x11, x12, x9
    ldr     x9, [sp, #64]
    add     x12, x11, x9
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x12, x9
    str     x11, [x10]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L618
.L619:
    ldr     x9, [sp, #24]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #72]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #80]
    ldr     x9, [sp, #24]
    movz    x10, #0x0002
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #88]
    ldr     x9, [sp, #24]
    movz    x10, #0x0003
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #96]
    ldr     x9, [sp, #24]
    movz    x10, #0x0004
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #104]
    ldr     x9, [sp, #24]
    movz    x10, #0x0005
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #112]
    ldr     x9, [sp, #24]
    movz    x10, #0x0006
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #120]
    ldr     x9, [sp, #24]
    movz    x10, #0x0007
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #128]
    mov     x9, #0
    str     x9, [sp, #32]
.L620:
    ldr     x9, [sp, #32]
    movz    x10, #0x0040
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L621
    ldr     x9, [sp, #104]
    movz    x10, #0x0006
    mov     x0, x9
    mov     x1, x10
    bl      _sha_rotr
    str     x0, [sp, #1400]
    ldr     x9, [sp, #104]
    movz    x10, #0x000b
    mov     x0, x9
    mov     x1, x10
    bl      _sha_rotr
    mov     x11, x0
    ldr     w16, [sp, #1400]
    eor     w16, w16, w11
    str     x16, [sp, #1432]
    ldr     x9, [sp, #104]
    movz    x10, #0x0019
    mov     x0, x9
    mov     x1, x10
    bl      _sha_rotr
    mov     x11, x0
    ldr     w16, [sp, #1432]
    eor     w9, w16, w11
    movz    x10, #0xffff
    movk    x10, #0xffff, lsl #16
    and     w11, w9, w10
    str     x11, [sp, #136]
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #112]
    and     x11, x9, x10
    ldr     x9, [sp, #104]
    movz    x10, #0xffff
    movk    x10, #0xffff, lsl #16
    eor     x12, x9, x10
    ldr     x9, [sp, #120]
    and     x10, x12, x9
    eor     x9, x11, x10
    movz    x10, #0xffff
    movk    x10, #0xffff, lsl #16
    and     x11, x9, x10
    str     x11, [sp, #144]
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #136]
    add     x11, x9, x10
    ldr     x9, [sp, #144]
    add     x10, x11, x9
    ldr     x9, [sp, #16]
    ldr     x11, [sp, #32]
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x9, x13
    ldr     x9, [x11]
    add     x11, x10, x9
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #32]
    movz    x12, #0x0008
    mul     x13, x10, x12
    add     x10, x9, x13
    ldr     x9, [x10]
    add     x10, x11, x9
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x10, x9
    str     x11, [sp, #152]
    ldr     x9, [sp, #72]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _sha_rotr
    str     x0, [sp, #1760]
    ldr     x9, [sp, #72]
    movz    x10, #0x000d
    mov     x0, x9
    mov     x1, x10
    bl      _sha_rotr
    mov     x11, x0
    ldr     w16, [sp, #1760]
    eor     w16, w16, w11
    str     x16, [sp, #1792]
    ldr     x9, [sp, #72]
    movz    x10, #0x0016
    mov     x0, x9
    mov     x1, x10
    bl      _sha_rotr
    mov     x11, x0
    ldr     w16, [sp, #1792]
    eor     w9, w16, w11
    movz    x10, #0xffff
    movk    x10, #0xffff, lsl #16
    and     w11, w9, w10
    str     x11, [sp, #160]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #80]
    and     x11, x9, x10
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #88]
    and     x12, x9, x10
    eor     x9, x11, x12
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #88]
    and     x12, x10, x11
    eor     x10, x9, x12
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x10, x9
    str     x11, [sp, #168]
    ldr     x9, [sp, #160]
    ldr     x10, [sp, #168]
    add     x11, x9, x10
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x10, x11, x9
    str     x10, [sp, #176]
    ldr     x9, [sp, #120]
    str     x9, [sp, #128]
    ldr     x9, [sp, #112]
    str     x9, [sp, #120]
    ldr     x9, [sp, #104]
    str     x9, [sp, #112]
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #152]
    add     x11, x9, x10
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x10, x11, x9
    str     x10, [sp, #104]
    ldr     x9, [sp, #88]
    str     x9, [sp, #96]
    ldr     x9, [sp, #80]
    str     x9, [sp, #88]
    ldr     x9, [sp, #72]
    str     x9, [sp, #80]
    ldr     x9, [sp, #152]
    ldr     x10, [sp, #176]
    add     x11, x9, x10
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x10, x11, x9
    str     x10, [sp, #72]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L620
.L621:
    ldr     x9, [sp, #24]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    mov     x11, #0
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x9, x13
    ldr     x9, [x11]
    ldr     x11, [sp, #72]
    add     x12, x9, x11
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x12, x9
    str     x11, [x10]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0001
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x9, x13
    ldr     x9, [x11]
    ldr     x11, [sp, #80]
    add     x12, x9, x11
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x12, x9
    str     x11, [x10]
    ldr     x9, [sp, #24]
    movz    x10, #0x0002
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0002
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x9, x13
    ldr     x9, [x11]
    ldr     x11, [sp, #88]
    add     x12, x9, x11
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x12, x9
    str     x11, [x10]
    ldr     x9, [sp, #24]
    movz    x10, #0x0003
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0003
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x9, x13
    ldr     x9, [x11]
    ldr     x11, [sp, #96]
    add     x12, x9, x11
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x12, x9
    str     x11, [x10]
    ldr     x9, [sp, #24]
    movz    x10, #0x0004
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0004
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x9, x13
    ldr     x9, [x11]
    ldr     x11, [sp, #104]
    add     x12, x9, x11
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x12, x9
    str     x11, [x10]
    ldr     x9, [sp, #24]
    movz    x10, #0x0005
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0005
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x9, x13
    ldr     x9, [x11]
    ldr     x11, [sp, #112]
    add     x12, x9, x11
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x12, x9
    str     x11, [x10]
    ldr     x9, [sp, #24]
    movz    x10, #0x0006
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0006
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x9, x13
    ldr     x9, [x11]
    ldr     x11, [sp, #120]
    add     x12, x9, x11
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x12, x9
    str     x11, [x10]
    ldr     x9, [sp, #24]
    movz    x10, #0x0007
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0007
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x9, x13
    ldr     x9, [x11]
    ldr     x11, [sp, #128]
    add     x12, x9, x11
    movz    x9, #0xffff
    movk    x9, #0xffff, lsl #16
    and     x11, x12, x9
    str     x11, [x10]
.L1060:
    add     sp, sp, #3104
    ldp     x29, x30, [sp], #16
    ret

    .globl   _sha256
_sha256:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1248
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    bl      _sha_k_init
    str     x0, [sp, #96]
    bl      _sha_h_init
    str     x0, [sp, #104]
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    udiv     x11, x9, x10
    str     x11, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
.L622:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L623
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    movz    x11, #0x0040
    mul     x12, x10, x11
    add     x10, x9, x12
    mov     x0, x10
    bl      _sha256_block
    str     x0, [sp, #208]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L622
.L623:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    movz    x11, #0x0040
    mul     x12, x10, x11
    sub     x10, x9, x12
    str     x10, [sp, #40]
    adrp    x9, _SHA_BLK@PAGE
    add     x9, x9, _SHA_BLK@PAGEOFF
    str     x9, [sp, #48]
    mov     x9, #0
    str     x9, [sp, #56]
.L624:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #40]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L625
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    movz    x12, #0x0040
    mul     x13, x10, x12
    ldr     x10, [sp, #56]
    add     x12, x13, x10
    add     x10, x9, x12
    ldrb    w9, [x10]
    strb    w9, [x11]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L624
.L625:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    movz    x9, #0x0080
    strb    w9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
.L626:
    ldr     x9, [sp, #56]
    movz    x10, #0x0040
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L627
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    add     x11, x9, x10
    mov     x9, #0
    strb    w9, [x11]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L626
.L627:
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #64]
    ldr     x9, [sp, #40]
    movz    x10, #0x0038
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L628
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _sha256_block
    str     x0, [sp, #624]
    mov     x9, #0
    str     x9, [sp, #56]
.L629:
    ldr     x9, [sp, #56]
    movz    x10, #0x0040
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L630
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    add     x11, x9, x10
    mov     x9, #0
    strb    w9, [x11]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L629
.L630:
.L628:
    ldr     x9, [sp, #48]
    movz    x10, #0x0038
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _sha_put_be64
    str     x0, [sp, #744]
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _sha256_block
    str     x0, [sp, #760]
    adrp    x9, _SHA_H@PAGE
    add     x9, x9, _SHA_H@PAGEOFF
    str     x9, [sp, #72]
    mov     x9, #0
    str     x9, [sp, #80]
.L631:
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L632
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #80]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #88]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #80]
    movz    x11, #0x0004
    mul     x12, x10, x11
    mov     x10, #0
    add     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [sp, #88]
    movz    x11, #0x0018
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #80]
    movz    x11, #0x0004
    mul     x12, x10, x11
    movz    x10, #0x0001
    add     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [sp, #88]
    movz    x11, #0x0010
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #80]
    movz    x11, #0x0004
    mul     x12, x10, x11
    movz    x10, #0x0002
    add     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [sp, #88]
    movz    x11, #0x0008
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #80]
    movz    x11, #0x0004
    mul     x12, x10, x11
    movz    x10, #0x0003
    add     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [sp, #88]
    movz    x11, #0x00ff
    and     x12, x9, x11
    strb    w12, [x10]
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #80]
    b       .L631
.L632:
.L1061:
    add     sp, sp, #1248
    ldp     x29, x30, [sp], #16
    ret

    .globl   _m5
_m5:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #32
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x001f
    and     x11, x9, x10
    mov     x0, x11
    b       .L1062
.L1062:
    add     sp, sp, #32
    ldp     x29, x30, [sp], #16
    ret

    .globl   _m7
_m7:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #32
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x007f
    and     x11, x9, x10
    mov     x0, x11
    b       .L1063
.L1063:
    add     sp, sp, #32
    ldp     x29, x30, [sp], #16
    ret

    .globl   _m12
_m12:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #32
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x0fff
    and     x11, x9, x10
    mov     x0, x11
    b       .L1064
.L1064:
    add     sp, sp, #32
    ldp     x29, x30, [sp], #16
    ret

    .globl   _m16
_m16:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #32
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0xffff
    and     x11, x9, x10
    mov     x0, x11
    b       .L1065
.L1065:
    add     sp, sp, #32
    ldp     x29, x30, [sp], #16
    ret

    .globl   _m19
_m19:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #32
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0xffff
    movk    x10, #0x0007, lsl #16
    and     x11, x9, x10
    mov     x0, x11
    b       .L1066
.L1066:
    add     sp, sp, #32
    ldp     x29, x30, [sp], #16
    ret

    .globl   _m21
_m21:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #32
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0xffff
    movk    x10, #0x001f, lsl #16
    and     x11, x9, x10
    mov     x0, x11
    b       .L1067
.L1067:
    add     sp, sp, #32
    ldp     x29, x30, [sp], #16
    ret

    .globl   _m26
_m26:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #32
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0xffff
    movk    x10, #0x03ff, lsl #16
    and     x11, x9, x10
    mov     x0, x11
    b       .L1068
.L1068:
    add     sp, sp, #32
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_movz
_enc_movz:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0xd280, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0015
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m16
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1069
.L1069:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_movk
_enc_movk:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0xf280, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0015
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m16
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1070
.L1070:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_mov_reg
_enc_mov_reg:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #128
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x16, #0xaa00, lsl #16
    str     x16, [sp, #16]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #16]
    orr     x9, x16, x11
    movz    x10, #0x001f
    movz    x11, #0x0005
    lsl     x12, x10, x11
    orr     x16, x9, x12
    str     x16, [sp, #88]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #88]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1071
.L1071:
    add     sp, sp, #128
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_stp_pre
_enc_stp_pre:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    movz    x16, #0xa980, lsl #16
    str     x16, [sp, #32]
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _m7
    mov     x10, x0
    movz    x9, #0x000f
    lsl     w11, w10, w9
    ldr     x16, [sp, #32]
    orr     x16, x16, x11
    str     x16, [sp, #72]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x000a
    lsl     w11, w10, w9
    ldr     x16, [sp, #72]
    orr     x16, x16, x11
    str     x16, [sp, #112]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #112]
    orr     x16, x16, x11
    str     x16, [sp, #152]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #152]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1072
.L1072:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_ldp_post
_enc_ldp_post:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    movz    x16, #0xa8c0, lsl #16
    str     x16, [sp, #32]
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _m7
    mov     x10, x0
    movz    x9, #0x000f
    lsl     w11, w10, w9
    ldr     x16, [sp, #32]
    orr     x16, x16, x11
    str     x16, [sp, #72]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x000a
    lsl     w11, w10, w9
    ldr     x16, [sp, #72]
    orr     x16, x16, x11
    str     x16, [sp, #112]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #112]
    orr     x16, x16, x11
    str     x16, [sp, #152]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #152]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1073
.L1073:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_add_imm
_enc_add_imm:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0x9100, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m12
    mov     x10, x0
    movz    x9, #0x000a
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1074
.L1074:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_sub_imm
_enc_sub_imm:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0xd100, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m12
    mov     x10, x0
    movz    x9, #0x000a
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1075
.L1075:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_add_reg
_enc_add_reg:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0x8b00, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1076
.L1076:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_sub_reg
_enc_sub_reg:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0xcb00, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1077
.L1077:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_sub_ext_sp
_enc_sub_ext_sp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    movz    x16, #0x63ff
    movk    x16, #0xcb20, lsl #16
    str     x16, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #8]
    orr     x9, x16, x11
    mov     x0, x9
    b       .L1078
.L1078:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_add_ext_sp
_enc_add_ext_sp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    movz    x16, #0x63ff
    movk    x16, #0x8b20, lsl #16
    str     x16, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #8]
    orr     x9, x16, x11
    mov     x0, x9
    b       .L1079
.L1079:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_mul
_enc_mul:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0x7c00
    movk    x16, #0x9b00, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x9, x16, x11
    movz    x10, #0x001f
    movz    x11, #0x000a
    lsl     x12, x10, x11
    orr     x16, x9, x12
    str     x16, [sp, #96]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #96]
    orr     x16, x16, x11
    str     x16, [sp, #136]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #136]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1080
.L1080:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_udiv
_enc_udiv:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0x0800
    movk    x16, #0x9ac0, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1081
.L1081:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_and
_enc_and:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0x8a00, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1082
.L1082:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_orr
_enc_orr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0xaa00, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1083
.L1083:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_eor
_enc_eor:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0xca00, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1084
.L1084:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_lslv
_enc_lslv:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0x2000
    movk    x16, #0x9ac0, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1085
.L1085:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_lsrv
_enc_lsrv:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0x2400
    movk    x16, #0x9ac0, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1086
.L1086:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_ldr_x
_enc_ldr_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0xf940, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m12
    mov     x10, x0
    movz    x9, #0x000a
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1087
.L1087:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_ldr_w
_enc_ldr_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0xb940, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m12
    mov     x10, x0
    movz    x9, #0x000a
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1088
.L1088:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_ldrb
_enc_ldrb:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0x3940, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m12
    mov     x10, x0
    movz    x9, #0x000a
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1089
.L1089:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_str_x
_enc_str_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0xf900, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m12
    mov     x10, x0
    movz    x9, #0x000a
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1090
.L1090:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_str_w
_enc_str_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0xb900, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m12
    mov     x10, x0
    movz    x9, #0x000a
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1091
.L1091:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_strb
_enc_strb:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0x3900, lsl #16
    str     x16, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _m12
    mov     x10, x0
    movz    x9, #0x000a
    lsl     w11, w10, w9
    ldr     x16, [sp, #24]
    orr     x16, x16, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #64]
    orr     x16, x16, x11
    str     x16, [sp, #104]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #104]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1092
.L1092:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_adrp
_enc_adrp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #208
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m21
    mov     x10, x0
    str     x10, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0003
    and     x11, x9, x10
    str     x11, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0002
    lsr     x11, x9, x10
    str     x11, [sp, #32]
    movz    x9, #0x9000, lsl #16
    ldr     x10, [sp, #24]
    movz    x11, #0x001d
    lsl     x12, x10, x11
    orr     x10, x9, x12
    ldr     x9, [sp, #32]
    movz    x11, #0x0005
    lsl     x12, x9, x11
    orr     x16, x10, x12
    str     x16, [sp, #168]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #168]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1093
.L1093:
    add     sp, sp, #208
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_add_pageoff
_enc_add_pageoff:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_add_imm
    mov     x12, x0
    mov     x0, x12
    b       .L1094
.L1094:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_bl
_enc_bl:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    movz    x16, #0x9400, lsl #16
    str     x16, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m26
    mov     x10, x0
    ldr     x16, [sp, #8]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1095
.L1095:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_b
_enc_b:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    movz    x16, #0x1400, lsl #16
    str     x16, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m26
    mov     x10, x0
    ldr     x16, [sp, #8]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1096
.L1096:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_cbz_w
_enc_cbz_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x16, #0x3400, lsl #16
    str     x16, [sp, #16]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m19
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #16]
    orr     x16, x16, x11
    str     x16, [sp, #56]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #56]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1097
.L1097:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_cmp_reg
_enc_cmp_reg:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #128
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x16, #0xeb00, lsl #16
    str     x16, [sp, #16]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0010
    lsl     w11, w10, w9
    ldr     x16, [sp, #16]
    orr     x16, x16, x11
    str     x16, [sp, #56]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #56]
    orr     x9, x16, x11
    movz    x10, #0x001f
    orr     x11, x9, x10
    mov     x0, x11
    b       .L1098
.L1098:
    add     sp, sp, #128
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_cset
_enc_cset:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x9, #0x07e0
    movk    x9, #0x1a9f, lsl #16
    ldr     x10, [sp, #8]
    movz    x11, #0x000f
    and     x12, x10, x11
    movz    x10, #0x000c
    lsl     x11, x12, x10
    orr     x16, x9, x11
    str     x16, [sp, #64]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m5
    mov     x10, x0
    ldr     x16, [sp, #64]
    orr     x9, x16, x10
    mov     x0, x9
    b       .L1099
.L1099:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_svc
_enc_svc:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    movz    x16, #0x0001
    movk    x16, #0xd400, lsl #16
    str     x16, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _m16
    mov     x10, x0
    movz    x9, #0x0005
    lsl     w11, w10, w9
    ldr     x16, [sp, #8]
    orr     x9, x16, x11
    mov     x0, x9
    b       .L1100
.L1100:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_ret
_enc_ret:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    movz    x9, #0x03c0
    movk    x9, #0xd65f, lsl #16
    movz    x10, #0x001e
    movz    x11, #0x0005
    lsl     x12, x10, x11
    orr     x10, x9, x12
    mov     x0, x10
    b       .L1101
.L1101:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_img_cap
_mo_img_cap:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #16
    movz    x9, #0x0010, lsl #16
    mov     x0, x9
    b       .L1102
.L1102:
    add     sp, sp, #16
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_uuid_from_code
_mo_uuid_from_code:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #384
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _MO_DIGEST@PAGE
    add     x9, x9, _MO_DIGEST@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _sha256
    str     x0, [sp, #72]
    adrp    x9, _MO_UUID@PAGE
    add     x9, x9, _MO_UUID@PAGEOFF
    str     x9, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
.L633:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L634
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #32]
    add     x12, x9, x10
    ldrb    w9, [x12]
    strb    w9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L633
.L634:
    ldr     x9, [sp, #24]
    movz    x10, #0x0006
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0006
    add     x12, x9, x10
    ldrb    w9, [x12]
    movz    x10, #0x000f
    and     w12, w9, w10
    movz    x9, #0x0040
    orr     w10, w12, w9
    strb    w10, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldrb    w9, [x12]
    movz    x10, #0x003f
    and     w12, w9, w10
    movz    x9, #0x0080
    orr     w10, w12, w9
    strb    w10, [x11]
.L1103:
    add     sp, sp, #384
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_emit_uuid
_mo_emit_uuid:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    adrp    x9, _MO_UUID@PAGE
    add     x9, x9, _MO_UUID@PAGEOFF
    str     x9, [sp, #8]
    mov     x9, #0
    str     x9, [sp, #16]
.L635:
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L636
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #104]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #16]
    b       .L635
.L636:
.L1104:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mc_get
_mc_get:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _MO_CUR@PAGE
    add     x9, x9, _MO_CUR@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L1105
.L1105:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mc_set
_mc_set:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _MO_CUR@PAGE
    add     x9, x9, _MO_CUR@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    str     x9, [x10]
.L1106:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _e8
_e8:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #112
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    bl      _mc_get
    mov     x9, x0
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x00ff
    and     x12, x9, x10
    strb    w12, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    mov     x0, x11
    bl      _mc_set
    str     x0, [sp, #104]
.L1107:
    add     sp, sp, #112
    ldp     x29, x30, [sp], #16
    ret

    .globl   _e32
_e32:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    lsr     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _e8
    str     x0, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    lsr     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _e8
    str     x0, [sp, #112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0018
    lsr     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _e8
    str     x0, [sp, #152]
.L1108:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _e64
_e64:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    lsr     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _e32
    str     x0, [sp, #72]
.L1109:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _eb32
_eb32:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #160
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0018
    lsr     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _e8
    str     x0, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    lsr     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _e8
    str     x0, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    lsr     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _e8
    str     x0, [sp, #128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #152]
.L1110:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _eb64
_eb64:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    lsr     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _eb32
    str     x0, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #72]
.L1111:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ezeros
_ezeros:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #112
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    mov     x9, #0
    str     x9, [sp, #16]
.L637:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L638
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #72]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #16]
    b       .L637
.L638:
.L1112:
    add     sp, sp, #112
    ldp     x29, x30, [sp], #16
    ret

    .globl   _ename16
_ename16:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #208
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
.L639:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L640
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #104]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L639
.L640:
.L641:
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L642
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #176]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L641
.L642:
.L1113:
    add     sp, sp, #208
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_emit_headers
_mo_emit_headers:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #2384
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0xfacf
    movk    x10, #0xfeed, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #128]
    ldr     x9, [sp, #0]
    movz    x10, #0x000c
    movk    x10, #0x0100, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #152]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #176]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #200]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #224]
    ldr     x9, [sp, #0]
    movz    x10, #0x0208
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #248]
    ldr     x9, [sp, #0]
    movz    x10, #0x0085
    movk    x10, #0x0020, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #272]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #296]
    ldr     x9, [sp, #0]
    movz    x10, #0x0019
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #320]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #344]
    adrp    x9, L_str142@PAGE
    add     x9, x9, L_str142@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x000a
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #392]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #416]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001, lsl #32
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #440]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #464]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #488]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #512]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #536]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #560]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #584]
    ldr     x9, [sp, #0]
    movz    x10, #0x0019
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #608]
    ldr     x9, [sp, #0]
    movz    x10, #0x0098
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #632]
    adrp    x9, L_str143@PAGE
    add     x9, x9, L_str143@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0006
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #680]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001, lsl #32
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #704]
    ldr     x9, [sp, #0]
    movz    x10, #0x4000
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #728]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #752]
    ldr     x9, [sp, #0]
    movz    x10, #0x4000
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #776]
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #800]
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #824]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #848]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #872]
    adrp    x9, L_str144@PAGE
    add     x9, x9, L_str144@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0006
    str     x9, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #920]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #952]
    ldr     x9, [sp, #0]
    movz    x10, #0x0228
    movk    x10, #0x0001, lsl #32
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #976]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1000]
    ldr     x9, [sp, #0]
    movz    x10, #0x0228
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1024]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1048]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1072]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1096]
    ldr     x9, [sp, #0]
    movz    x10, #0x0400
    movk    x10, #0x8000, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1120]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1144]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1168]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1192]
    ldr     x9, [sp, #0]
    movz    x10, #0x0019
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1216]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1240]
    adrp    x9, L_str145@PAGE
    add     x9, x9, L_str145@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x000a
    str     x9, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #1288]
    ldr     x9, [sp, #0]
    movz    x10, #0x4000
    movk    x10, #0x0001, lsl #32
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1312]
    ldr     x9, [sp, #0]
    movz    x10, #0x4000
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1336]
    ldr     x9, [sp, #0]
    movz    x10, #0x4000
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1360]
    ldr     x9, [sp, #0]
    movz    x10, #0x00ee
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1384]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1408]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1432]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1456]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1480]
    ldr     x9, [sp, #0]
    movz    x10, #0x000e
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1504]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1528]
    ldr     x9, [sp, #0]
    movz    x10, #0x000c
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1552]
    adrp    x9, L_str146@PAGE
    add     x9, x9, L_str146@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x000d
    str     x9, [sp, #96]
    mov     x9, #0
    str     x9, [sp, #104]
.L643:
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #96]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L644
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #104]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #1648]
    ldr     x9, [sp, #104]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #104]
    b       .L643
.L644:
.L645:
    ldr     x9, [sp, #104]
    movz    x10, #0x0014
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L646
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #1720]
    ldr     x9, [sp, #104]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #104]
    b       .L645
.L646:
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1768]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1792]
    ldr     x9, [sp, #0]
    movz    x10, #0x4000
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1816]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1840]
    ldr     x9, [sp, #0]
    movz    x10, #0x4000
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1864]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1888]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1912]
    ldr     x9, [sp, #0]
    movz    x10, #0x0050
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1936]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    mov     x0, x9
    mov     x1, x10
    bl      _ezeros
    str     x0, [sp, #1960]
    ldr     x9, [sp, #0]
    movz    x10, #0x001b
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1984]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2008]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _mo_emit_uuid
    str     x0, [sp, #2024]
    ldr     x9, [sp, #0]
    movz    x10, #0x0032
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2048]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2072]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2096]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2120]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2144]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2168]
    ldr     x9, [sp, #0]
    movz    x10, #0x0028
    movk    x10, #0x8000, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2192]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2216]
    ldr     x9, [sp, #0]
    movz    x10, #0x0228
    ldr     x11, [sp, #16]
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _e64
    str     x0, [sp, #2256]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #2280]
    ldr     x9, [sp, #0]
    movz    x10, #0x001d
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2304]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2328]
    ldr     x9, [sp, #0]
    movz    x10, #0x4000
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2352]
    ldr     x9, [sp, #0]
    movz    x10, #0x00ee
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2376]
.L1114:
    add     sp, sp, #2384
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_macho_image
_emit_macho_image:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #368
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    adrp    x9, _MO_IMG@PAGE
    add     x9, x9, _MO_IMG@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0228
    ldr     x10, [sp, #16]
    add     x11, x9, x10
    movz    x9, #0x4000
    cmp     x11, x9
    cset    w10, hi
    cbz     w10, .L647
    movz    x9, #0x0048
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #112]
.L647:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _mo_uuid_from_code
    str     x0, [sp, #136]
    mov     x9, #0
    mov     x0, x9
    bl      _mc_set
    str     x0, [sp, #152]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _mo_emit_headers
    str     x0, [sp, #184]
    mov     x9, #0
    str     x9, [sp, #40]
.L648:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L649
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #40]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #264]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L648
.L649:
    bl      _mc_get
    mov     x9, x0
    str     x9, [sp, #48]
    ldr     x9, [sp, #32]
    movz    x10, #0x4000
    ldr     x11, [sp, #48]
    sub     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _ezeros
    str     x0, [sp, #336]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _mo_sign_and_write
    str     x0, [sp, #360]
.L1115:
    add     sp, sp, #368
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_sign_and_write
_mo_sign_and_write:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0001
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _mo_sign_and_write_n
    str     x0, [sp, #40]
.L1116:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_sign_and_write_n
_mo_sign_and_write_n:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1216
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0004
    mul     x11, x9, x10
    str     x11, [sp, #24]
    movz    x9, #0x0058
    movz    x10, #0x0002
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    mul     x12, x9, x10
    add     x9, x11, x12
    str     x9, [sp, #32]
    movz    x9, #0x0014
    ldr     x10, [sp, #32]
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #16]
    movz    x10, #0x4000
    mul     x11, x9, x10
    str     x11, [sp, #48]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #40]
    add     x16, x9, x10
    str     x16, [sp, #216]
    bl      _mo_img_cap
    mov     x9, x0
    ldr     x16, [sp, #216]
    cmp     x16, x9
    cset    w10, hi
    cbz     w10, .L650
    movz    x9, #0x0047
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #248]
.L650:
    ldr     x9, [sp, #8]
    movz    x10, #0x0cc0
    movk    x10, #0xfade, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #272]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #296]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #320]
    ldr     x9, [sp, #8]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #344]
    ldr     x9, [sp, #8]
    movz    x10, #0x0014
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #368]
    ldr     x9, [sp, #8]
    movz    x10, #0x0c02
    movk    x10, #0xfade, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #392]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #416]
    ldr     x9, [sp, #8]
    movz    x10, #0x0400
    movk    x10, #0x0002, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #440]
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #464]
    ldr     x9, [sp, #8]
    movz    x10, #0x005a
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #488]
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #512]
    ldr     x9, [sp, #8]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #536]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #560]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #584]
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #608]
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #632]
    ldr     x9, [sp, #8]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #656]
    ldr     x9, [sp, #8]
    movz    x10, #0x000c
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #680]
    ldr     x9, [sp, #8]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #704]
    ldr     x9, [sp, #8]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #728]
    ldr     x9, [sp, #8]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #752]
    ldr     x9, [sp, #8]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _eb32
    str     x0, [sp, #776]
    ldr     x9, [sp, #8]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _eb64
    str     x0, [sp, #800]
    ldr     x9, [sp, #8]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _eb64
    str     x0, [sp, #824]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _eb64
    str     x0, [sp, #848]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _eb64
    str     x0, [sp, #872]
    ldr     x9, [sp, #8]
    movz    x10, #0x0061
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #896]
    ldr     x9, [sp, #8]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #920]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    movz    x11, #0x0020
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _ezeros
    str     x0, [sp, #960]
    ldr     x9, [sp, #48]
    movz    x10, #0x006e
    add     x11, x9, x10
    str     x11, [sp, #56]
    mov     x9, #0
    str     x9, [sp, #64]
.L651:
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L652
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #64]
    movz    x11, #0x1000
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x1000
    ldr     x11, [sp, #8]
    ldr     x12, [sp, #56]
    add     x13, x11, x12
    ldr     x11, [sp, #64]
    movz    x12, #0x0020
    mul     x14, x11, x12
    add     x11, x13, x14
    mov     x0, x10
    mov     x1, x9
    mov     x2, x11
    bl      _sha256
    str     x0, [sp, #1128]
    ldr     x9, [sp, #64]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #64]
    b       .L651
.L652:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #48]
    ldr     x12, [sp, #40]
    add     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _io_write
    str     x0, [sp, #1200]
.L1117:
    add     sp, sp, #1216
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_macho_signed
_emit_macho_signed:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #896
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _MO_CODE@PAGE
    add     x9, x9, _MO_CODE@PAGEOFF
    str     x9, [sp, #16]
    mov     x9, #0
    ldr     x10, [sp, #8]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movz
    mov     x12, x0
    str     x12, [sp, #24]
    movz    x9, #0x0010
    movz    x10, #0x0001
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movz
    mov     x12, x0
    str     x12, [sp, #32]
    movz    x9, #0x0080
    mov     x0, x9
    bl      _enc_svc
    mov     x10, x0
    str     x10, [sp, #40]
    ldr     x9, [sp, #16]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x00ff
    and     x12, x9, x10
    strb    w12, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    lsr     x12, x9, x10
    movz    x9, #0x00ff
    and     x10, x12, x9
    strb    w10, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0002
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    lsr     x12, x9, x10
    movz    x9, #0x00ff
    and     x10, x12, x9
    strb    w10, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0003
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    lsr     x12, x9, x10
    movz    x9, #0x00ff
    and     x10, x12, x9
    strb    w10, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0004
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x00ff
    and     x12, x9, x10
    strb    w12, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0005
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    lsr     x12, x9, x10
    movz    x9, #0x00ff
    and     x10, x12, x9
    strb    w10, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0006
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    lsr     x12, x9, x10
    movz    x9, #0x00ff
    and     x10, x12, x9
    strb    w10, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0007
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    lsr     x12, x9, x10
    movz    x9, #0x00ff
    and     x10, x12, x9
    strb    w10, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    movz    x10, #0x00ff
    and     x12, x9, x10
    strb    w12, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0009
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    lsr     x12, x9, x10
    movz    x9, #0x00ff
    and     x10, x12, x9
    strb    w10, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x000a
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    movz    x10, #0x0010
    lsr     x12, x9, x10
    movz    x9, #0x00ff
    and     x10, x12, x9
    strb    w10, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x000b
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    lsr     x12, x9, x10
    movz    x9, #0x00ff
    and     x10, x12, x9
    strb    w10, [x11]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x000c
    mov     x12, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_macho_image
    str     x0, [sp, #888]
.L1118:
    add     sp, sp, #896
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_emit_headers_bss
_mo_emit_headers_bss:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #3184
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    str     x4, [sp, #32]
    ldr     x9, [sp, #16]
    movz    x10, #0x4000
    mul     x11, x9, x10
    str     x11, [sp, #40]
    movz    x9, #0x0001, lsl #32
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    str     x11, [sp, #48]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #32]
    add     x11, x9, x10
    str     x11, [sp, #56]
    movz    x9, #0x006e
    ldr     x10, [sp, #16]
    movz    x11, #0x0080
    mul     x12, x10, x11
    add     x10, x9, x12
    str     x10, [sp, #64]
    ldr     x9, [sp, #0]
    movz    x10, #0xfacf
    movk    x10, #0xfeed, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #320]
    ldr     x9, [sp, #0]
    movz    x10, #0x000c
    movk    x10, #0x0100, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #344]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #368]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #392]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #416]
    ldr     x9, [sp, #0]
    movz    x10, #0x02a0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #440]
    ldr     x9, [sp, #0]
    movz    x10, #0x0085
    movk    x10, #0x0020, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #464]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #488]
    ldr     x9, [sp, #0]
    movz    x10, #0x0019
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #512]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #536]
    adrp    x9, L_str147@PAGE
    add     x9, x9, L_str147@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x000a
    str     x9, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #584]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #608]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001, lsl #32
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #632]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #656]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #680]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #704]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #728]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #752]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #776]
    ldr     x9, [sp, #0]
    movz    x10, #0x0019
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #800]
    ldr     x9, [sp, #0]
    movz    x10, #0x0098
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #824]
    adrp    x9, L_str148@PAGE
    add     x9, x9, L_str148@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x0006
    str     x9, [sp, #96]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #872]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001, lsl #32
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #896]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #920]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #944]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #968]
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #992]
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1016]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1040]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1064]
    adrp    x9, L_str149@PAGE
    add     x9, x9, L_str149@PAGEOFF
    str     x9, [sp, #104]
    movz    x9, #0x0006
    str     x9, [sp, #112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #104]
    ldr     x11, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #1112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #1144]
    ldr     x9, [sp, #0]
    movz    x10, #0x02c0
    movk    x10, #0x0001, lsl #32
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1168]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1192]
    ldr     x9, [sp, #0]
    movz    x10, #0x02c0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1216]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1240]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1264]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1288]
    ldr     x9, [sp, #0]
    movz    x10, #0x0400
    movk    x10, #0x8000, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1312]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1336]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1360]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1384]
    ldr     x9, [sp, #0]
    movz    x10, #0x0019
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1408]
    ldr     x9, [sp, #0]
    movz    x10, #0x0098
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1432]
    adrp    x9, L_str150@PAGE
    add     x9, x9, L_str150@PAGEOFF
    str     x9, [sp, #120]
    movz    x9, #0x0006
    str     x9, [sp, #128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #120]
    ldr     x11, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #1480]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1504]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1528]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1552]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1576]
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1600]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1624]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1648]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1672]
    adrp    x9, L_str151@PAGE
    add     x9, x9, L_str151@PAGEOFF
    str     x9, [sp, #136]
    movz    x9, #0x0005
    str     x9, [sp, #144]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #136]
    ldr     x11, [sp, #144]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #1720]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #120]
    ldr     x11, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #1752]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1776]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #1800]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1824]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1848]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1872]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1896]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1920]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1944]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1968]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #1992]
    ldr     x9, [sp, #0]
    movz    x10, #0x0019
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2016]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2040]
    adrp    x9, L_str152@PAGE
    add     x9, x9, L_str152@PAGEOFF
    str     x9, [sp, #152]
    movz    x9, #0x000a
    str     x9, [sp, #160]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #152]
    ldr     x11, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ename16
    str     x0, [sp, #2088]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #2112]
    ldr     x9, [sp, #0]
    movz    x10, #0x4000
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #2136]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #2160]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #2184]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2208]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2232]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2256]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2280]
    ldr     x9, [sp, #0]
    movz    x10, #0x000e
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2304]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2328]
    ldr     x9, [sp, #0]
    movz    x10, #0x000c
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2352]
    adrp    x9, L_str153@PAGE
    add     x9, x9, L_str153@PAGEOFF
    str     x9, [sp, #168]
    movz    x9, #0x000d
    str     x9, [sp, #176]
    mov     x9, #0
    str     x9, [sp, #184]
.L653:
    ldr     x9, [sp, #184]
    ldr     x10, [sp, #176]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L654
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #168]
    ldr     x11, [sp, #184]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #2448]
    ldr     x9, [sp, #184]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #184]
    b       .L653
.L654:
.L655:
    ldr     x9, [sp, #184]
    movz    x10, #0x0014
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L656
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #2520]
    ldr     x9, [sp, #184]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #184]
    b       .L655
.L656:
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2568]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2592]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2616]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2640]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2664]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2688]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2712]
    ldr     x9, [sp, #0]
    movz    x10, #0x0050
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2736]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    mov     x0, x9
    mov     x1, x10
    bl      _ezeros
    str     x0, [sp, #2760]
    ldr     x9, [sp, #0]
    movz    x10, #0x001b
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2784]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2808]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _mo_emit_uuid
    str     x0, [sp, #2824]
    ldr     x9, [sp, #0]
    movz    x10, #0x0032
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2848]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2872]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2896]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2920]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2944]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2968]
    ldr     x9, [sp, #0]
    movz    x10, #0x0028
    movk    x10, #0x8000, lsl #16
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #2992]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #3016]
    ldr     x9, [sp, #0]
    movz    x10, #0x02c0
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _e64
    str     x0, [sp, #3056]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e64
    str     x0, [sp, #3080]
    ldr     x9, [sp, #0]
    movz    x10, #0x001d
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #3104]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #3128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #3152]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _e32
    str     x0, [sp, #3176]
.L1119:
    add     sp, sp, #3184
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cb_pos
_cb_pos:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _CB_POS@PAGE
    add     x9, x9, _CB_POS@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L1120
.L1120:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cb_set
_cb_set:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _CB_POS@PAGE
    add     x9, x9, _CB_POS@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    str     x9, [x10]
.L1121:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cb_word
_cb_word:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #384
    str     x0, [sp, #0]
    adrp    x9, _CB@PAGE
    add     x9, x9, _CB@PAGEOFF
    str     x9, [sp, #8]
    bl      _cb_pos
    mov     x9, x0
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x11, #0
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x00ff
    and     x12, x9, x11
    strb    w12, [x10]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0001
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0008
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0002
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0010
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    movz    x11, #0x0003
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    movz    x11, #0x0018
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #16]
    movz    x10, #0x0004
    add     x11, x9, x10
    mov     x0, x11
    bl      _cb_set
    str     x0, [sp, #368]
.L1122:
    add     sp, sp, #384
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lbl_set
_lbl_set:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _CG_LBL@PAGE
    add     x9, x9, _CG_LBL@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #8]
    str     x9, [x10]
.L1123:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lbl_get
_lbl_get:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _CG_LBL@PAGE
    add     x9, x9, _CG_LBL@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L1124
.L1124:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _fnoff_set
_fnoff_set:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _CG_FNOFF@PAGE
    add     x9, x9, _CG_FNOFF@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #8]
    str     x9, [x10]
.L1125:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _fnoff_get
_fnoff_get:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _CG_FNOFF@PAGE
    add     x9, x9, _CG_FNOFF@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L1126
.L1126:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _fix_add
_fix_add:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #416
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, _CG_FIXN@PAGE
    add     x9, x9, _CG_FIXN@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    adrp    x9, _CG_FIX@PAGE
    add     x9, x9, _CG_FIX@PAGEOFF
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #32]
    movz    x11, #0x0003
    mul     x12, x10, x11
    mov     x10, #0
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    str     x9, [x10]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #32]
    movz    x11, #0x0003
    mul     x12, x10, x11
    movz    x10, #0x0001
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [sp, #8]
    str     x9, [x10]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #32]
    movz    x11, #0x0003
    mul     x12, x10, x11
    movz    x10, #0x0002
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [sp, #16]
    str     x9, [x10]
    ldr     x9, [sp, #24]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #32]
    movz    x11, #0x0001
    add     x12, x9, x11
    str     x12, [x10]
.L1127:
    add     sp, sp, #416
    ldp     x29, x30, [sp], #16
    ret

    .globl   _w32
_w32:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #32
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0xffff
    movk    x10, #0x7fff, lsl #16
    and     x11, x9, x10
    mov     x0, x11
    b       .L1128
.L1128:
    add     sp, sp, #32
    ldp     x29, x30, [sp], #16
    ret

    .globl   _b_movi
_b_movi:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #752
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L657
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movz
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #112]
    b       .L1129
.L657:
    ldr     x9, [sp, #8]
    movz    x10, #0xffff
    and     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    lsr     x11, x9, x10
    movz    x9, #0xffff
    and     x10, x11, x9
    str     x10, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    lsr     x11, x9, x10
    movz    x9, #0xffff
    and     x10, x11, x9
    str     x10, [sp, #32]
    ldr     x9, [sp, #8]
    movz    x10, #0x0030
    lsr     x11, x9, x10
    movz    x9, #0xffff
    and     x10, x11, x9
    str     x10, [sp, #40]
    movz    x9, #0x0001
    str     x9, [sp, #48]
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L658
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movz
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #328]
    mov     x9, #0
    str     x9, [sp, #48]
.L658:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L659
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L660
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    movz    x11, #0x0001
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movz
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #424]
    mov     x9, #0
    str     x9, [sp, #48]
    b       .L661
.L660:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    movz    x11, #0x0001
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movk
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #472]
.L661:
.L659:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L662
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L663
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    movz    x11, #0x0002
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movz
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #560]
    mov     x9, #0
    str     x9, [sp, #48]
    b       .L664
.L663:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    movz    x11, #0x0002
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movk
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #608]
.L664:
.L662:
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L665
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L666
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    movz    x11, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movz
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #696]
    mov     x9, #0
    str     x9, [sp, #48]
    b       .L667
.L666:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    movz    x11, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movk
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #744]
.L667:
.L665:
.L1129:
    add     sp, sp, #752
    ldp     x29, x30, [sp], #16
    ret

    .globl   _b_mov_x
_b_mov_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _enc_mov_reg
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #40]
.L1130:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _b_mov_w
_b_mov_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _enc_mov_reg
    mov     x11, x0
    mov     x0, x11
    bl      _w32
    mov     x9, x0
    mov     x0, x9
    bl      _cb_word
    str     x0, [sp, #48]
.L1131:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _b_ldr_x
_b_ldr_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x001f
    ldr     x11, [sp, #8]
    movz    x12, #0x0008
    udiv     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _enc_ldr_x
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #64]
.L1132:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _b_str_x
_b_str_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x001f
    ldr     x11, [sp, #8]
    movz    x12, #0x0008
    udiv     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _enc_str_x
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #64]
.L1133:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _b_ldr_w
_b_ldr_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x001f
    ldr     x11, [sp, #8]
    movz    x12, #0x0004
    udiv     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _enc_ldr_w
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #64]
.L1134:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _b_str_w
_b_str_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x001f
    ldr     x11, [sp, #8]
    movz    x12, #0x0004
    udiv     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _enc_str_w
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #64]
.L1135:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _b_ldrb
_b_ldrb:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x001f
    ldr     x11, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_ldrb
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #48]
.L1136:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _b_strb
_b_strb:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x001f
    ldr     x11, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_strb
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #48]
.L1137:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_dst_x
_cgb_dst_x:
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
    cbz     w11, .L668
    ldr     x9, [sp, #24]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L1138
.L668:
    movz    x9, #0x0010
    mov     x0, x9
    b       .L1138
.L1138:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_spill
_cgb_spill:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L669
    b       .L1139
.L669:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_str_x
    str     x0, [sp, #160]
.L1139:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_src_x
_cgb_src_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #224
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L670
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L1140
.L670:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_x
    str     x0, [sp, #200]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L1140
.L1140:
    add     sp, sp, #224
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_src_w
_cgb_src_w:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #224
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L671
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L1141
.L671:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_w
    str     x0, [sp, #200]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L1141
.L1141:
    add     sp, sp, #224
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_load_slot_x
_cgb_load_slot_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #224
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L672
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #32]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_mov_x
    str     x0, [sp, #176]
    b       .L1142
.L672:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_x
    str     x0, [sp, #216]
.L1142:
    add     sp, sp, #224
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_alu
_cgb_alu:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #624
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    str     x4, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L673
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_add_reg
    mov     x12, x0
    str     x12, [sp, #40]
.L673:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L674
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_sub_reg
    mov     x12, x0
    str     x12, [sp, #40]
.L674:
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L675
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_mul
    mov     x12, x0
    str     x12, [sp, #40]
.L675:
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L676
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_udiv
    mov     x12, x0
    str     x12, [sp, #40]
.L676:
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L677
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_and
    mov     x12, x0
    str     x12, [sp, #40]
.L677:
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L678
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_orr
    mov     x12, x0
    str     x12, [sp, #40]
.L678:
    ldr     x9, [sp, #0]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L679
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_eor
    mov     x12, x0
    str     x12, [sp, #40]
.L679:
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L680
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_lslv
    mov     x12, x0
    str     x12, [sp, #40]
.L680:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L681
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_lsrv
    mov     x12, x0
    str     x12, [sp, #40]
.L681:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L682
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _cb_word
    str     x0, [sp, #592]
    b       .L683
.L682:
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _w32
    mov     x10, x0
    mov     x0, x10
    bl      _cb_word
    str     x0, [sp, #616]
.L683:
.L1143:
    add     sp, sp, #624
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_invcond
_cgb_invcond:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L684
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1144
.L684:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L685
    mov     x9, #0
    mov     x0, x9
    b       .L1144
.L685:
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L686
    movz    x9, #0x0002
    mov     x0, x9
    b       .L1144
.L686:
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L687
    movz    x9, #0x0008
    mov     x0, x9
    b       .L1144
.L687:
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L688
    movz    x9, #0x0009
    mov     x0, x9
    b       .L1144
.L688:
    movz    x9, #0x0003
    mov     x0, x9
    b       .L1144
.L1144:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_movi
_cgb_i_movi:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_dst_x
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _b_movi
    str     x0, [sp, #112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_spill
    str     x0, [sp, #168]
.L1145:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_addr_local
_cgb_i_addr_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #208
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_dst_x
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x001f
    ldr     x11, [sp, #8]
    movz    x12, #0x0020
    add     x13, x11, x12
    ldr     x11, [x13]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _enc_add_imm
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #144]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_spill
    str     x0, [sp, #200]
.L1146:
    add     sp, sp, #208
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_load_local
_cgb_i_load_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #416
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_dst_x
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L689
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldrb
    str     x0, [sp, #176]
    b       .L690
.L689:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L691
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_w
    str     x0, [sp, #288]
    b       .L692
.L691:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_x
    str     x0, [sp, #352]
.L692:
.L690:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_spill
    str     x0, [sp, #408]
.L1147:
    add     sp, sp, #416
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_store_local
_cgb_i_store_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #560
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #24]
    movz    x9, #0x0010
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L693
    ldr     x9, [sp, #24]
    movz    x10, #0x0009
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L694
.L693:
    movz    x9, #0x0010
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_x
    str     x0, [sp, #256]
.L694:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L695
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_strb
    str     x0, [sp, #368]
    b       .L696
.L695:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L697
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_str_w
    str     x0, [sp, #480]
    b       .L698
.L697:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #8]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_str_x
    str     x0, [sp, #544]
.L698:
.L696:
.L1148:
    add     sp, sp, #560
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_load_mem
_cgb_i_load_mem:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #416
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_x
    mov     x12, x0
    str     x12, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_dst_x
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L699
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_ldrb
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #216]
    b       .L700
.L699:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L701
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_ldr_w
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #304]
    b       .L702
.L701:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_ldr_x
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #344]
.L702:
.L700:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_spill
    str     x0, [sp, #400]
.L1149:
    add     sp, sp, #416
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_store_mem
_cgb_i_store_mem:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #544
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_x
    mov     x12, x0
    str     x12, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0018
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
    cbz     w11, .L703
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L704
.L703:
    movz    x9, #0x0010
    ldr     x10, [sp, #8]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_x
    str     x0, [sp, #320]
.L704:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L705
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #16]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_strb
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #408]
    b       .L706
.L705:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L707
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #16]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_str_w
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #496]
    b       .L708
.L707:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #16]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_str_x
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #536]
.L708:
.L706:
.L1150:
    add     sp, sp, #544
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_binop
_cgb_i_binop:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #560
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    mov     x9, #0
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L709
    movz    x9, #0x0001
    str     x9, [sp, #16]
.L709:
    mov     x9, #0
    str     x9, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L710
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0010
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_x
    mov     x12, x0
    str     x12, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_x
    mov     x12, x0
    str     x12, [sp, #32]
    b       .L711
.L710:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0010
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_w
    mov     x12, x0
    str     x12, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_w
    mov     x12, x0
    str     x12, [sp, #32]
.L711:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_dst_x
    mov     x11, x0
    str     x11, [sp, #40]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #24]
    ldr     x12, [sp, #32]
    ldr     x13, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    mov     x4, x13
    bl      _cgb_alu
    str     x0, [sp, #488]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_spill
    str     x0, [sp, #544]
.L1151:
    add     sp, sp, #560
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_cmp
_cgb_i_cmp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #624
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L712
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L712:
    mov     x9, #0
    str     x9, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L713
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0010
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_x
    mov     x12, x0
    str     x12, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_x
    mov     x12, x0
    str     x12, [sp, #40]
    b       .L714
.L713:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0010
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_w
    mov     x12, x0
    str     x12, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0018
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0011
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_w
    mov     x12, x0
    str     x12, [sp, #40]
.L714:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_dst_x
    mov     x11, x0
    str     x11, [sp, #48]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L715
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _enc_cmp_reg
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #480]
    b       .L716
.L715:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _enc_cmp_reg
    mov     x11, x0
    mov     x0, x11
    bl      _w32
    mov     x9, x0
    mov     x0, x9
    bl      _cb_word
    str     x0, [sp, #520]
.L716:
    ldr     x16, [sp, #48]
    str     x16, [sp, #528]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _cgb_invcond
    mov     x10, x0
    ldr     x0, [sp, #528]
    mov     x1, x10
    bl      _enc_cset
    mov     x9, x0
    mov     x0, x9
    bl      _cb_word
    str     x0, [sp, #560]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_spill
    str     x0, [sp, #616]
.L1152:
    add     sp, sp, #624
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_syscall
_cgb_i_syscall:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #720
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L717
    movz    x9, #0x0010
    ldr     x10, [sp, #40]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_mov_x
    str     x0, [sp, #280]
    b       .L718
.L717:
    movz    x9, #0x0010
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_x
    str     x0, [sp, #320]
.L718:
    movz    x9, #0x0001
    str     x9, [sp, #48]
.L719:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #8]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L720
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #48]
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x10, x13
    ldr     x10, [x11]
    ldr     x11, [sp, #48]
    movz    x12, #0x0001
    sub     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _cgb_load_slot_x
    str     x0, [sp, #464]
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L719
.L720:
    movz    x9, #0x0080
    mov     x0, x9
    bl      _enc_svc
    mov     x10, x0
    mov     x0, x10
    bl      _cb_word
    str     x0, [sp, #512]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #56]
    ldr     x9, [sp, #56]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L721
    ldr     x9, [sp, #56]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x9, #0
    mov     x0, x11
    mov     x1, x9
    bl      _b_mov_x
    str     x0, [sp, #648]
    b       .L1153
.L721:
    mov     x9, #0
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_str_x
    str     x0, [sp, #712]
.L1153:
    add     sp, sp, #720
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_call
_cgb_i_call:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #784
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, L_str154@PAGE
    add     x9, x9, L_str154@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0007
    str     x9, [sp, #32]
    ldr     x9, [sp, #8]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
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
    cbz     w10, .L722
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_syscall
    str     x0, [sp, #216]
    b       .L1154
.L722:
    ldr     x9, [sp, #8]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L723:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #8]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L724
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x10, x13
    ldr     x10, [x11]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_load_slot_x
    str     x0, [sp, #376]
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L723
.L724:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0050
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0058
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _find_fn_index
    mov     x12, x0
    str     x12, [sp, #56]
    bl      _cb_pos
    mov     x9, x0
    movz    x10, #0x0002
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _fix_add
    str     x0, [sp, #512]
    mov     x9, #0
    mov     x0, x9
    bl      _enc_bl
    mov     x10, x0
    mov     x0, x10
    bl      _cb_word
    str     x0, [sp, #536]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #64]
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #72]
    ldr     x9, [sp, #72]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L725
    ldr     x9, [sp, #72]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x9, #0
    mov     x0, x11
    mov     x1, x9
    bl      _b_mov_x
    str     x0, [sp, #704]
    b       .L1154
.L725:
    mov     x9, #0
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_str_x
    str     x0, [sp, #768]
.L1154:
    add     sp, sp, #784
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_label_addr
_cgb_i_label_addr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #640
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_dst_x
    mov     x11, x0
    str     x11, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L726
    bl      _cgb_prog_get
    mov     x9, x0
    ldr     x10, [sp, #8]
    movz    x11, #0x0050
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0058
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_bss_index_by_name
    mov     x12, x0
    str     x12, [sp, #24]
    bl      _cb_pos
    mov     x9, x0
    movz    x10, #0x0005
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _fix_add
    str     x0, [sp, #232]
    ldr     x9, [sp, #16]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _enc_adrp
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #264]
    bl      _cb_pos
    mov     x9, x0
    movz    x10, #0x0006
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _fix_add
    str     x0, [sp, #296]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #16]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_add_pageoff
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #336]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_spill
    str     x0, [sp, #392]
    b       .L1155
.L726:
    bl      _cb_pos
    mov     x9, x0
    movz    x10, #0x0003
    ldr     x11, [sp, #8]
    movz    x12, #0x0040
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _fix_add
    str     x0, [sp, #448]
    ldr     x9, [sp, #16]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _enc_adrp
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #480]
    bl      _cb_pos
    mov     x9, x0
    movz    x10, #0x0004
    ldr     x11, [sp, #8]
    movz    x12, #0x0040
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _fix_add
    str     x0, [sp, #536]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #16]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_add_pageoff
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #576]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_spill
    str     x0, [sp, #632]
.L1155:
    add     sp, sp, #640
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_ret
_cgb_i_ret:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #656
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L727
    mov     x9, #0
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L728
    ldr     x9, [sp, #32]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    movz    x9, #0x0008
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L729
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L729:
.L728:
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #48]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L730
    ldr     x9, [sp, #48]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L731
    mov     x9, #0
    ldr     x10, [sp, #48]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_mov_x
    str     x0, [sp, #392]
    b       .L732
.L731:
    mov     x9, #0
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_x
    str     x0, [sp, #456]
.L732:
    b       .L733
.L730:
    ldr     x9, [sp, #48]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L734
    mov     x9, #0
    ldr     x10, [sp, #48]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_mov_w
    str     x0, [sp, #520]
    b       .L735
.L734:
    mov     x9, #0
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_w
    str     x0, [sp, #584]
.L735:
.L733:
.L727:
    bl      _cb_pos
    mov     x9, x0
    mov     x10, #0
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _fix_add
    str     x0, [sp, #616]
    mov     x9, #0
    mov     x0, x9
    bl      _enc_b
    mov     x10, x0
    mov     x0, x10
    bl      _cb_word
    str     x0, [sp, #640]
.L1156:
    add     sp, sp, #656
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_jmp
_cgb_i_jmp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     x0, [sp, #0]
    bl      _cb_pos
    mov     x9, x0
    mov     x10, #0
    ldr     x11, [sp, #0]
    movz    x12, #0x0038
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _fix_add
    str     x0, [sp, #56]
    mov     x9, #0
    mov     x0, x9
    bl      _enc_b
    mov     x10, x0
    mov     x0, x10
    bl      _cb_word
    str     x0, [sp, #80]
.L1157:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_jz
_cgb_i_jz:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #176
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0010
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_src_w
    mov     x12, x0
    str     x12, [sp, #16]
    bl      _cb_pos
    mov     x9, x0
    movz    x10, #0x0001
    ldr     x11, [sp, #8]
    movz    x12, #0x0038
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _fix_add
    str     x0, [sp, #128]
    ldr     x9, [sp, #16]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _enc_cbz_w
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #160]
.L1158:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_instr
_cgb_instr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1072
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L736
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_movi
    str     x0, [sp, #112]
    b       .L1159
.L736:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L737
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_label_addr
    str     x0, [sp, #160]
    b       .L1159
.L737:
    ldr     x9, [sp, #32]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L738
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_addr_local
    str     x0, [sp, #208]
    b       .L1159
.L738:
    ldr     x9, [sp, #32]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L739
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_load_local
    str     x0, [sp, #256]
    b       .L1159
.L739:
    ldr     x9, [sp, #32]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L740
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_store_local
    str     x0, [sp, #304]
    b       .L1159
.L740:
    ldr     x9, [sp, #32]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L741
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_load_mem
    str     x0, [sp, #352]
    b       .L1159
.L741:
    ldr     x9, [sp, #32]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L742
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_store_mem
    str     x0, [sp, #400]
    b       .L1159
.L742:
    ldr     x9, [sp, #32]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L743
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_binop
    str     x0, [sp, #448]
    b       .L1159
.L743:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L744
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #504]
    b       .L1159
.L744:
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L745
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0001
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #560]
    b       .L1159
.L745:
    ldr     x9, [sp, #32]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L746
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0002
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #616]
    b       .L1159
.L746:
    ldr     x9, [sp, #32]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L747
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #672]
    b       .L1159
.L747:
    ldr     x9, [sp, #32]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L748
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0004
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #728]
    b       .L1159
.L748:
    ldr     x9, [sp, #32]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L749
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0005
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #784]
    b       .L1159
.L749:
    ldr     x9, [sp, #32]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L750
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_call
    str     x0, [sp, #840]
    b       .L1159
.L750:
    ldr     x9, [sp, #32]
    movz    x10, #0x000f
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L751
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_ret
    str     x0, [sp, #896]
    b       .L1159
.L751:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L752
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _cgb_i_jmp
    str     x0, [sp, #936]
    b       .L1159
.L752:
    ldr     x9, [sp, #32]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L753
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_jz
    str     x0, [sp, #984]
    b       .L1159
.L753:
    ldr     x9, [sp, #32]
    movz    x10, #0x0012
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L754
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x16, [x11]
    str     x16, [sp, #1040]
    bl      _cb_pos
    mov     x9, x0
    ldr     x0, [sp, #1040]
    mov     x1, x9
    bl      _lbl_set
    str     x0, [sp, #1056]
    b       .L1159
.L754:
.L1159:
    add     sp, sp, #1072
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_prologue
_cgb_prologue:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #336
    str     x0, [sp, #0]
    movz    x9, #0x001d
    movz    x10, #0x001e
    movz    x11, #0x001f
    movz    x12, #0x007e
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _enc_stp_pre
    mov     x13, x0
    mov     x0, x13
    bl      _cb_word
    str     x0, [sp, #48]
    movz    x9, #0x001d
    movz    x10, #0x001f
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_add_imm
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #88]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L755
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0fff
    cmp     x9, x10
    cset    w11, ls
    cbz     w11, .L756
    movz    x9, #0x001f
    movz    x10, #0x001f
    ldr     x11, [sp, #0]
    movz    x12, #0x0038
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_sub_imm
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #248]
    b       .L757
.L756:
    movz    x9, #0x0010
    ldr     x10, [sp, #0]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _b_movi
    str     x0, [sp, #296]
    movz    x9, #0x0010
    mov     x0, x9
    bl      _enc_sub_ext_sp
    mov     x10, x0
    mov     x0, x10
    bl      _cb_word
    str     x0, [sp, #320]
.L757:
.L755:
.L1160:
    add     sp, sp, #336
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_epilogue
_cgb_epilogue:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #336
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x16, [sp, #8]
    str     x16, [sp, #16]
    bl      _cb_pos
    mov     x9, x0
    ldr     x0, [sp, #16]
    mov     x1, x9
    bl      _lbl_set
    str     x0, [sp, #32]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L758
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0fff
    cmp     x9, x10
    cset    w11, ls
    cbz     w11, .L759
    movz    x9, #0x001f
    movz    x10, #0x001f
    ldr     x11, [sp, #0]
    movz    x12, #0x0038
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_add_imm
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #192]
    b       .L760
.L759:
    movz    x9, #0x0010
    ldr     x10, [sp, #0]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _b_movi
    str     x0, [sp, #240]
    movz    x9, #0x0010
    mov     x0, x9
    bl      _enc_add_ext_sp
    mov     x10, x0
    mov     x0, x10
    bl      _cb_word
    str     x0, [sp, #264]
.L760:
.L758:
    movz    x9, #0x001d
    movz    x10, #0x001e
    movz    x11, #0x001f
    movz    x12, #0x0002
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _enc_ldp_post
    mov     x13, x0
    mov     x0, x13
    bl      _cb_word
    str     x0, [sp, #312]
    bl      _enc_ret
    mov     x9, x0
    mov     x0, x9
    bl      _cb_word
    str     x0, [sp, #328]
.L1161:
    add     sp, sp, #336
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_param_spill
_cgb_param_spill:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #432
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x9, #0x0008
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L761
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L762
    ldr     x9, [sp, #32]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    str     x10, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L763
    movz    x9, #0x0001
    str     x9, [sp, #16]
.L763:
    ldr     x9, [sp, #40]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L764
    movz    x9, #0x0004
    str     x9, [sp, #16]
.L764:
.L762:
.L761:
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L765
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_strb
    str     x0, [sp, #320]
    b       .L1162
.L765:
    ldr     x9, [sp, #16]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L766
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_str_w
    str     x0, [sp, #384]
    b       .L1162
.L766:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_str_x
    str     x0, [sp, #424]
.L1162:
    add     sp, sp, #432
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_fn
_cgb_fn:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #320
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _cgb_prologue
    str     x0, [sp, #48]
    mov     x9, #0
    str     x9, [sp, #24]
.L767:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L768
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_param_spill
    str     x0, [sp, #128]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L767
.L768:
    ldr     x9, [sp, #0]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
.L769:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L770
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #8]
    ldr     x12, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _cgb_instr
    str     x0, [sp, #248]
    ldr     x9, [sp, #32]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L769
.L770:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_epilogue
    str     x0, [sp, #304]
.L1163:
    add     sp, sp, #320
    ldp     x29, x30, [sp], #16
    ret

    .globl   _find_fn_index
_find_fn_index:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #384
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    add     x11, x9, x10
    str     x11, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    str     x9, [sp, #48]
.L771:
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L772
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L773
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #48]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    mov     x0, x11
    mov     x1, x9
    mov     x2, x10
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L774
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L1164
.L774:
.L773:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #48]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    b       .L771
.L772:
    mov     x9, #0
    mov     x0, x9
    b       .L1164
.L1164:
    add     sp, sp, #384
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cb_patch_or
_cb_patch_or:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #624
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _CB@PAGE
    add     x9, x9, _CB@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    add     x11, x9, x10
    ldrb    w9, [x11]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0001
    add     x13, x11, x12
    add     x11, x10, x13
    ldrb    w10, [x11]
    movz    x11, #0x0008
    lsl     w12, w10, w11
    orr     w10, w9, w12
    ldr     x9, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0002
    add     x13, x11, x12
    add     x11, x9, x13
    ldrb    w9, [x11]
    movz    x11, #0x0010
    lsl     w12, w9, w11
    orr     w9, w10, w12
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0003
    add     x13, x11, x12
    add     x11, x10, x13
    ldrb    w10, [x11]
    movz    x11, #0x0018
    lsl     w12, w10, w11
    orr     w10, w9, w12
    str     x10, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    orr     x11, x9, x10
    str     x11, [sp, #24]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    mov     x11, #0
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x00ff
    and     x12, x9, x11
    strb    w12, [x10]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0001
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0008
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0002
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0010
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0003
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0018
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
.L1165:
    add     sp, sp, #624
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_resolve_branches
_cgb_resolve_branches:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #800
    adrp    x9, _CG_FIXN@PAGE
    add     x9, x9, _CG_FIXN@PAGEOFF
    str     x9, [sp, #0]
    adrp    x9, _CG_FIX@PAGE
    add     x9, x9, _CG_FIX@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
.L775:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L776
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    movz    x11, #0x0003
    mul     x12, x10, x11
    mov     x10, #0
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    movz    x11, #0x0003
    mul     x12, x10, x11
    movz    x10, #0x0001
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #40]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    movz    x11, #0x0003
    mul     x12, x10, x11
    movz    x10, #0x0002
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L777
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _lbl_get
    mov     x10, x0
    ldr     x9, [sp, #32]
    sub     w11, w10, w9
    movz    x9, #0x0004
    udiv     w10, w11, w9
    str     x10, [sp, #56]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #56]
    movz    x11, #0xffff
    movk    x11, #0x03ff, lsl #16
    and     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _cb_patch_or
    str     x0, [sp, #520]
.L777:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L778
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _lbl_get
    mov     x10, x0
    ldr     x9, [sp, #32]
    sub     w11, w10, w9
    movz    x9, #0x0004
    udiv     w10, w11, w9
    str     x10, [sp, #64]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #64]
    movz    x11, #0xffff
    movk    x11, #0x0007, lsl #16
    and     x12, x10, x11
    movz    x10, #0x0005
    lsl     x11, x12, x10
    mov     x0, x9
    mov     x1, x11
    bl      _cb_patch_or
    str     x0, [sp, #648]
.L778:
    ldr     x9, [sp, #40]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L779
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _fnoff_get
    mov     x10, x0
    ldr     x9, [sp, #32]
    sub     w11, w10, w9
    movz    x9, #0x0004
    udiv     w10, w11, w9
    str     x10, [sp, #72]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #72]
    movz    x11, #0xffff
    movk    x11, #0x03ff, lsl #16
    and     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _cb_patch_or
    str     x0, [sp, #760]
.L779:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L775
.L776:
.L1166:
    add     sp, sp, #800
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_max_label
_cgb_max_label:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #640
    str     x0, [sp, #0]
    mov     x9, #0
    str     x9, [sp, #8]
    ldr     x9, [sp, #0]
    str     x9, [sp, #16]
.L780:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L781
    ldr     x9, [sp, #16]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L782:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L783
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0012
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L784
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L785
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #8]
.L785:
.L784:
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L786
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L787
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #8]
.L787:
.L786:
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L788
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L789
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #8]
.L789:
.L788:
    ldr     x9, [sp, #24]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L782
.L783:
    ldr     x9, [sp, #16]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    b       .L780
.L781:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L1167
.L1167:
    add     sp, sp, #640
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_stroff_set
_cgb_stroff_set:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _CG_STROFF@PAGE
    add     x9, x9, _CG_STROFF@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #8]
    str     x9, [x10]
.L1168:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_stroff_get
_cgb_stroff_get:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _CG_STROFF@PAGE
    add     x9, x9, _CG_STROFF@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L1169
.L1169:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _codegen_bytes
_codegen_bytes:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #624
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _cgb_prog_set
    str     x0, [sp, #96]
    movz    x9, #0x0001
    mov     x0, x9
    bl      _set_target
    str     x0, [sp, #112]
    mov     x9, #0
    mov     x0, x9
    bl      _cb_set
    str     x0, [sp, #128]
    adrp    x9, _CG_FIXN@PAGE
    add     x9, x9, _CG_FIXN@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    mov     x9, #0
    str     x9, [x10]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _cgb_max_label
    mov     x10, x0
    str     x10, [sp, #24]
    adrp    x9, _CG_ENTRY@PAGE
    add     x9, x9, _CG_ENTRY@PAGEOFF
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x16, x9, x12
    str     x16, [sp, #248]
    bl      _cb_pos
    mov     x9, x0
    ldr     x17, [sp, #248]
    str     x9, [x17]
    adrp    x9, L_str155@PAGE
    add     x9, x9, L_str155@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0004
    str     x9, [sp, #48]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #40]
    movz    x11, #0x0004
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _fn_index_by_name
    mov     x12, x0
    str     x12, [sp, #56]
    bl      _cb_pos
    mov     x9, x0
    movz    x10, #0x0002
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _fix_add
    str     x0, [sp, #336]
    mov     x9, #0
    mov     x0, x9
    bl      _enc_bl
    mov     x10, x0
    mov     x0, x10
    bl      _cb_word
    str     x0, [sp, #360]
    movz    x9, #0x0010
    movz    x10, #0x0001
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_movz
    mov     x12, x0
    mov     x0, x12
    bl      _cb_word
    str     x0, [sp, #400]
    movz    x9, #0x0080
    mov     x0, x9
    bl      _enc_svc
    mov     x10, x0
    mov     x0, x10
    bl      _cb_word
    str     x0, [sp, #424]
    ldr     x9, [sp, #24]
    str     x9, [sp, #64]
    mov     x9, #0
    str     x9, [sp, #72]
    ldr     x9, [sp, #8]
    str     x9, [sp, #80]
.L790:
    ldr     x9, [sp, #80]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L791
    ldr     x16, [sp, #72]
    str     x16, [sp, #480]
    bl      _cb_pos
    mov     x9, x0
    ldr     x0, [sp, #480]
    mov     x1, x9
    bl      _fnoff_set
    str     x0, [sp, #496]
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_fn
    str     x0, [sp, #528]
    ldr     x9, [sp, #64]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #64]
    ldr     x9, [sp, #72]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #72]
    ldr     x9, [sp, #80]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #80]
    b       .L790
.L791:
    bl      _cgb_resolve_branches
    str     x0, [sp, #616]
.L1170:
    add     sp, sp, #624
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_align8
_mo_align8:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    add     x11, x9, x10
    movz    x9, #0x0008
    udiv     x10, x11, x9
    movz    x9, #0x0008
    mul     x11, x10, x9
    mov     x0, x11
    b       .L1171
.L1171:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _img_or
_img_or:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #624
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _MO_IMG@PAGE
    add     x9, x9, _MO_IMG@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    add     x11, x9, x10
    ldrb    w9, [x11]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0001
    add     x13, x11, x12
    add     x11, x10, x13
    ldrb    w10, [x11]
    movz    x11, #0x0008
    lsl     w12, w10, w11
    orr     w10, w9, w12
    ldr     x9, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0002
    add     x13, x11, x12
    add     x11, x9, x13
    ldrb    w9, [x11]
    movz    x11, #0x0010
    lsl     w12, w9, w11
    orr     w9, w10, w12
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0003
    add     x13, x11, x12
    add     x11, x10, x13
    ldrb    w10, [x11]
    movz    x11, #0x0018
    lsl     w12, w10, w11
    orr     w10, w9, w12
    str     x10, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    orr     x11, x9, x10
    str     x11, [sp, #24]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    mov     x11, #0
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x00ff
    and     x12, x9, x11
    strb    w12, [x10]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0001
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0008
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0002
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0010
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0003
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    movz    x11, #0x0018
    lsr     x12, x9, x11
    movz    x9, #0x00ff
    and     x11, x12, x9
    strb    w11, [x10]
.L1172:
    add     sp, sp, #624
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_string_layout
_mo_string_layout:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #304
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x9, #0x0228
    ldr     x10, [sp, #8]
    add     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L792:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L793
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _mo_align8
    mov     x10, x0
    str     x10, [sp, #16]
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_stroff_set
    str     x0, [sp, #168]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    movz    x9, #0x0001
    add     x10, x11, x9
    str     x10, [sp, #16]
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L792
.L793:
    ldr     x9, [sp, #16]
    movz    x10, #0x0228
    sub     x11, x9, x10
    mov     x0, x11
    b       .L1173
.L1173:
    add     sp, sp, #304
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_resolve_strings
_mo_resolve_strings:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #864
    adrp    x9, _CG_FIXN@PAGE
    add     x9, x9, _CG_FIXN@PAGEOFF
    str     x9, [sp, #0]
    adrp    x9, _CG_FIX@PAGE
    add     x9, x9, _CG_FIX@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
.L794:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L795
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    movz    x11, #0x0003
    mul     x12, x10, x11
    mov     x10, #0
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    movz    x11, #0x0003
    mul     x12, x10, x11
    movz    x10, #0x0001
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #40]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    movz    x11, #0x0003
    mul     x12, x10, x11
    movz    x10, #0x0002
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L796
    movz    x9, #0x0228
    ldr     x10, [sp, #32]
    add     x11, x9, x10
    str     x11, [sp, #56]
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _cgb_stroff_get
    mov     x10, x0
    str     x10, [sp, #64]
    ldr     x9, [sp, #64]
    movz    x10, #0x1000
    udiv     x11, x9, x10
    ldr     x9, [sp, #56]
    movz    x10, #0x1000
    udiv     x12, x9, x10
    sub     x9, x11, x12
    movz    x10, #0xffff
    movk    x10, #0x001f, lsl #16
    and     x11, x9, x10
    str     x11, [sp, #72]
    ldr     x9, [sp, #72]
    movz    x10, #0x0003
    and     x11, x9, x10
    str     x11, [sp, #80]
    ldr     x9, [sp, #72]
    movz    x10, #0x0002
    lsr     x11, x9, x10
    movz    x9, #0xffff
    movk    x9, #0x0007, lsl #16
    and     x10, x11, x9
    str     x10, [sp, #88]
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #80]
    movz    x11, #0x001d
    lsl     x12, x10, x11
    ldr     x10, [sp, #88]
    movz    x11, #0x0005
    lsl     x13, x10, x11
    orr     x10, x12, x13
    mov     x0, x9
    mov     x1, x10
    bl      _img_or
    str     x0, [sp, #712]
.L796:
    ldr     x9, [sp, #40]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L797
    movz    x9, #0x0228
    ldr     x10, [sp, #32]
    add     x11, x9, x10
    str     x11, [sp, #96]
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _cgb_stroff_get
    mov     x10, x0
    str     x10, [sp, #104]
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #104]
    movz    x11, #0x0fff
    and     x12, x10, x11
    movz    x10, #0x000a
    lsl     x11, x12, x10
    mov     x0, x9
    mov     x1, x11
    bl      _img_or
    str     x0, [sp, #832]
.L797:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L794
.L795:
.L1174:
    add     sp, sp, #864
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_macho_code
_emit_macho_code:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #800
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    adrp    x9, _MO_IMG@PAGE
    add     x9, x9, _MO_IMG@PAGEOFF
    str     x9, [sp, #32]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _mo_string_layout
    mov     x11, x0
    str     x11, [sp, #40]
    movz    x9, #0x0228
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    movz    x9, #0x4000
    cmp     x11, x9
    cset    w10, hi
    cbz     w10, .L798
    movz    x9, #0x0048
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #176]
.L798:
    adrp    x9, _CB@PAGE
    add     x9, x9, _CB@PAGEOFF
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _mo_uuid_from_code
    str     x0, [sp, #200]
    mov     x9, #0
    mov     x0, x9
    bl      _mc_set
    str     x0, [sp, #216]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _mo_emit_headers
    str     x0, [sp, #248]
    adrp    x9, _CB@PAGE
    add     x9, x9, _CB@PAGEOFF
    str     x9, [sp, #48]
    mov     x9, #0
    str     x9, [sp, #56]
.L799:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L800
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #336]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L799
.L800:
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #64]
.L801:
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L802
    ldr     x9, [sp, #64]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _cgb_stroff_get
    mov     x10, x0
    str     x10, [sp, #72]
.L803:
    bl      _mc_get
    mov     x9, x0
    ldr     x10, [sp, #72]
    cmp     w9, w10
    cset    w11, lo
    cbz     w11, .L804
    ldr     x9, [sp, #32]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #504]
    b       .L803
.L804:
    mov     x9, #0
    str     x9, [sp, #80]
.L805:
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #64]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L806
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #64]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #80]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #632]
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #80]
    b       .L805
.L806:
    ldr     x9, [sp, #32]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #680]
    ldr     x9, [sp, #64]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #64]
    b       .L801
.L802:
    bl      _mo_resolve_strings
    str     x0, [sp, #720]
    bl      _mc_get
    mov     x9, x0
    str     x9, [sp, #88]
    ldr     x9, [sp, #32]
    movz    x10, #0x4000
    ldr     x11, [sp, #88]
    sub     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _ezeros
    str     x0, [sp, #768]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _mo_sign_and_write
    str     x0, [sp, #792]
.L1175:
    add     sp, sp, #800
    ldp     x29, x30, [sp], #16
    ret

    .globl   _fn_index_by_name
_fn_index_by_name:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #336
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    str     x9, [sp, #40]
.L807:
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L808
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L809
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #40]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x11
    mov     x1, x9
    mov     x2, x10
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L810
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L1176
.L810:
.L809:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
    ldr     x9, [sp, #40]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    b       .L807
.L808:
    mov     x9, #0
    mov     x0, x9
    b       .L1176
.L1176:
    add     sp, sp, #336
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_prog_set
_cgb_prog_set:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _CG_PROG@PAGE
    add     x9, x9, _CG_PROG@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    str     x9, [x10]
.L1177:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_prog_get
_cgb_prog_get:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    adrp    x9, _CG_PROG@PAGE
    add     x9, x9, _CG_PROG@PAGEOFF
    str     x9, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L1178
.L1178:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_bss_off_set
_cgb_bss_off_set:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, _CG_BSSOFF@PAGE
    add     x9, x9, _CG_BSSOFF@PAGEOFF
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #8]
    str     x9, [x10]
.L1179:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_bss_off_get
_cgb_bss_off_get:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, _CG_BSSOFF@PAGE
    add     x9, x9, _CG_BSSOFF@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    b       .L1180
.L1180:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_bss_layout
_cgb_bss_layout:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #368
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #8]
    mov     x9, #0
    str     x9, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
.L811:
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L812
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_bss_off_set
    str     x0, [sp, #120]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0007
    add     x12, x10, x11
    movz    x10, #0x0008
    udiv     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    str     x10, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #8]
    b       .L811
.L812:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L813
    mov     x9, #0
    mov     x0, x9
    b       .L1181
.L813:
    ldr     x9, [sp, #24]
    movz    x10, #0x3fff
    add     x11, x9, x10
    movz    x9, #0x4000
    udiv     x10, x11, x9
    movz    x9, #0x4000
    mul     x11, x10, x9
    mov     x0, x11
    b       .L1181
.L1181:
    add     sp, sp, #368
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_bss_index_by_name
_cgb_bss_index_by_name:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #400
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
.L814:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L815
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L816
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x12, x9, x10
    ldr     x9, [x12]
    ldr     x10, [sp, #8]
    add     x12, x9, x10
    ldr     x9, [sp, #16]
    mov     x0, x11
    mov     x1, x12
    mov     x2, x9
    bl      _bytes_eq
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L817
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L1182
.L817:
.L816:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L814
.L815:
    mov     x9, #0
    mov     x0, x9
    b       .L1182
.L1182:
    add     sp, sp, #400
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_string_layout_bss
_mo_string_layout_bss:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #304
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x9, #0x02c0
    ldr     x10, [sp, #8]
    add     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L818:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L819
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _mo_align8
    mov     x10, x0
    str     x10, [sp, #16]
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_stroff_set
    str     x0, [sp, #168]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    add     x11, x9, x10
    movz    x9, #0x0001
    add     x10, x11, x9
    str     x10, [sp, #16]
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L818
.L819:
    ldr     x9, [sp, #16]
    movz    x10, #0x02c0
    sub     x11, x9, x10
    mov     x0, x11
    b       .L1183
.L1183:
    add     sp, sp, #304
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mo_resolve_strings_bss
_mo_resolve_strings_bss:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1408
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    movz    x10, #0x4000
    mul     x11, x9, x10
    str     x11, [sp, #8]
    adrp    x9, _CG_FIXN@PAGE
    add     x9, x9, _CG_FIXN@PAGEOFF
    str     x9, [sp, #16]
    adrp    x9, _CG_FIX@PAGE
    add     x9, x9, _CG_FIX@PAGEOFF
    str     x9, [sp, #24]
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
.L820:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L821
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #40]
    movz    x11, #0x0003
    mul     x12, x10, x11
    mov     x10, #0
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #48]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #40]
    movz    x11, #0x0003
    mul     x12, x10, x11
    movz    x10, #0x0001
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #56]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #40]
    movz    x11, #0x0003
    mul     x12, x10, x11
    movz    x10, #0x0002
    add     x11, x12, x10
    movz    x10, #0x0008
    mul     x12, x11, x10
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #64]
    ldr     x9, [sp, #56]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L822
    movz    x9, #0x02c0
    ldr     x10, [sp, #48]
    add     x11, x9, x10
    str     x11, [sp, #72]
    ldr     x9, [sp, #64]
    mov     x0, x9
    bl      _cgb_stroff_get
    mov     x10, x0
    str     x10, [sp, #80]
    ldr     x9, [sp, #80]
    movz    x10, #0x1000
    udiv     x11, x9, x10
    ldr     x9, [sp, #72]
    movz    x10, #0x1000
    udiv     x12, x9, x10
    sub     x9, x11, x12
    movz    x10, #0xffff
    movk    x10, #0x001f, lsl #16
    and     x11, x9, x10
    str     x11, [sp, #88]
    ldr     x9, [sp, #88]
    movz    x10, #0x0003
    and     x11, x9, x10
    str     x11, [sp, #96]
    ldr     x9, [sp, #88]
    movz    x10, #0x0002
    lsr     x11, x9, x10
    movz    x9, #0xffff
    movk    x9, #0x0007, lsl #16
    and     x10, x11, x9
    str     x10, [sp, #104]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #96]
    movz    x11, #0x001d
    lsl     x12, x10, x11
    ldr     x10, [sp, #104]
    movz    x11, #0x0005
    lsl     x13, x10, x11
    orr     x10, x12, x13
    mov     x0, x9
    mov     x1, x10
    bl      _img_or
    str     x0, [sp, #816]
.L822:
    ldr     x9, [sp, #56]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L823
    movz    x9, #0x02c0
    ldr     x10, [sp, #48]
    add     x11, x9, x10
    str     x11, [sp, #112]
    ldr     x9, [sp, #64]
    mov     x0, x9
    bl      _cgb_stroff_get
    mov     x10, x0
    str     x10, [sp, #120]
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #120]
    movz    x11, #0x0fff
    and     x12, x10, x11
    movz    x10, #0x000a
    lsl     x11, x12, x10
    mov     x0, x9
    mov     x1, x11
    bl      _img_or
    str     x0, [sp, #936]
.L823:
    ldr     x9, [sp, #56]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L824
    movz    x9, #0x02c0
    ldr     x10, [sp, #48]
    add     x11, x9, x10
    str     x11, [sp, #128]
    ldr     x16, [sp, #8]
    str     x16, [sp, #992]
    ldr     x9, [sp, #64]
    mov     x0, x9
    bl      _cgb_bss_off_get
    mov     x10, x0
    ldr     x16, [sp, #992]
    add     x9, x16, x10
    movz    x10, #0x1000
    udiv     x11, x9, x10
    str     x11, [sp, #136]
    ldr     x9, [sp, #128]
    movz    x10, #0x1000
    udiv     x11, x9, x10
    str     x11, [sp, #144]
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #144]
    sub     x11, x9, x10
    movz    x9, #0xffff
    movk    x9, #0x001f, lsl #16
    and     x10, x11, x9
    str     x10, [sp, #152]
    ldr     x9, [sp, #152]
    movz    x10, #0x0003
    and     x11, x9, x10
    str     x11, [sp, #160]
    ldr     x9, [sp, #152]
    movz    x10, #0x0002
    lsr     x11, x9, x10
    movz    x9, #0xffff
    movk    x9, #0x0007, lsl #16
    and     x10, x11, x9
    str     x10, [sp, #168]
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #160]
    movz    x11, #0x001d
    lsl     x12, x10, x11
    ldr     x10, [sp, #168]
    movz    x11, #0x0005
    lsl     x13, x10, x11
    orr     x10, x12, x13
    mov     x0, x9
    mov     x1, x10
    bl      _img_or
    str     x0, [sp, #1232]
.L824:
    ldr     x9, [sp, #56]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L825
    movz    x9, #0x02c0
    ldr     x10, [sp, #48]
    add     x11, x9, x10
    str     x11, [sp, #176]
    ldr     x16, [sp, #8]
    str     x16, [sp, #1288]
    ldr     x9, [sp, #64]
    mov     x0, x9
    bl      _cgb_bss_off_get
    mov     x10, x0
    ldr     x16, [sp, #1288]
    add     x9, x16, x10
    str     x9, [sp, #184]
    ldr     x9, [sp, #176]
    ldr     x10, [sp, #184]
    movz    x11, #0x0fff
    and     x12, x10, x11
    movz    x10, #0x000a
    lsl     x11, x12, x10
    mov     x0, x9
    mov     x1, x11
    bl      _img_or
    str     x0, [sp, #1368]
.L825:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L820
.L821:
.L1184:
    add     sp, sp, #1408
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_macho_code_bss
_emit_macho_code_bss:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #928
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    str     x4, [sp, #32]
    adrp    x9, _MO_IMG@PAGE
    add     x9, x9, _MO_IMG@PAGEOFF
    str     x9, [sp, #40]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _mo_string_layout_bss
    mov     x11, x0
    str     x11, [sp, #48]
    movz    x9, #0x02c0
    ldr     x10, [sp, #48]
    add     x11, x9, x10
    movz    x9, #0x3fff
    add     x10, x11, x9
    movz    x9, #0x4000
    udiv     x11, x10, x9
    str     x11, [sp, #56]
    ldr     x9, [sp, #32]
    str     x9, [sp, #64]
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L826
    movz    x9, #0x4000
    str     x9, [sp, #64]
.L826:
    adrp    x9, _CB@PAGE
    add     x9, x9, _CB@PAGEOFF
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _mo_uuid_from_code
    str     x0, [sp, #272]
    mov     x9, #0
    mov     x0, x9
    bl      _mc_set
    str     x0, [sp, #288]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    ldr     x12, [sp, #24]
    ldr     x13, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    mov     x4, x13
    bl      _mo_emit_headers_bss
    str     x0, [sp, #336]
    adrp    x9, _CB@PAGE
    add     x9, x9, _CB@PAGEOFF
    str     x9, [sp, #72]
    mov     x9, #0
    str     x9, [sp, #80]
.L827:
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L828
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #424]
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #80]
    b       .L827
.L828:
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #88]
.L829:
    ldr     x9, [sp, #88]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L830
    ldr     x9, [sp, #88]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _cgb_stroff_get
    mov     x10, x0
    str     x10, [sp, #96]
.L831:
    bl      _mc_get
    mov     x9, x0
    ldr     x10, [sp, #96]
    cmp     w9, w10
    cset    w11, lo
    cbz     w11, .L832
    ldr     x9, [sp, #40]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #592]
    b       .L831
.L832:
    mov     x9, #0
    str     x9, [sp, #104]
.L833:
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #88]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L834
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #88]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #104]
    add     x12, x10, x11
    ldrb    w10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #720]
    ldr     x9, [sp, #104]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #104]
    b       .L833
.L834:
    ldr     x9, [sp, #40]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #768]
    ldr     x9, [sp, #88]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #88]
    b       .L829
.L830:
    ldr     x9, [sp, #56]
    mov     x0, x9
    bl      _mo_resolve_strings_bss
    str     x0, [sp, #816]
    bl      _mc_get
    mov     x9, x0
    str     x9, [sp, #112]
    ldr     x9, [sp, #56]
    movz    x10, #0x4000
    mul     x11, x9, x10
    str     x11, [sp, #120]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #120]
    ldr     x11, [sp, #112]
    sub     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _ezeros
    str     x0, [sp, #888]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _mo_sign_and_write_n
    str     x0, [sp, #920]
.L1185:
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
    movz    x11, #0x0100, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _arena_init
    str     x0, [sp, #40]
    ldr     x9, [sp, #0]
    mov     x0, x9
    b       .L1186
.L1186:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_file_cap
_pp_file_cap:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #16
    movz    x9, #0x0010, lsl #16
    mov     x0, x9
    b       .L1187
.L1187:
    add     sp, sp, #16
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_out_cap
_pp_out_cap:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #16
    movz    x9, #0x0010, lsl #16
    mov     x0, x9
    b       .L1188
.L1188:
    add     sp, sp, #16
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
.L835:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L836
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L837
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
    cbz     w10, .L838
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1189
.L838:
.L837:
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L835
.L836:
    mov     x9, #0
    mov     x0, x9
    b       .L1189
.L1189:
    add     sp, sp, #352
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_mark
_pp_mark:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #368
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
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L839
    adrp    x9, L_str156@PAGE
    add     x9, x9, L_str156@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x001a
    str     x9, [sp, #40]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #184]
.L839:
    adrp    x9, _PP_SEEN_PTRS@PAGE
    add     x9, x9, _PP_SEEN_PTRS@PAGEOFF
    str     x9, [sp, #48]
    adrp    x9, _PP_SEEN_LENS@PAGE
    add     x9, x9, _PP_SEEN_LENS@PAGEOFF
    str     x9, [sp, #56]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #24]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    str     x9, [x10]
    ldr     x9, [sp, #56]
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
.L1190:
    add     sp, sp, #368
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_out_append
_pp_out_append:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #416
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
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    add     x16, x9, x10
    str     x16, [sp, #136]
    bl      _pp_out_cap
    mov     x9, x0
    ldr     x16, [sp, #136]
    cmp     x16, x9
    cset    w10, hi
    cbz     w10, .L840
    adrp    x9, L_str157@PAGE
    add     x9, x9, L_str157@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x002a
    str     x9, [sp, #40]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #200]
.L840:
    adrp    x9, _PP_OUT@PAGE
    add     x9, x9, _PP_OUT@PAGEOFF
    str     x9, [sp, #48]
    mov     x9, #0
    str     x9, [sp, #56]
.L841:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L842
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #56]
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    ldr     x11, [sp, #56]
    add     x12, x9, x11
    ldrb    w9, [x12]
    strb    w9, [x10]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L841
.L842:
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    ldr     x11, [sp, #8]
    add     x12, x9, x11
    str     x12, [x10]
.L1191:
    add     sp, sp, #416
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
    adrp    x9, L_str158@PAGE
    add     x9, x9, L_str158@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0007
    str     x9, [sp, #32]
    ldr     x9, [sp, #8]
    movz    x10, #0x0007
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    cmp     x11, x9
    cset    w10, hi
    cbz     w10, .L843
    mov     x9, #0
    mov     x0, x9
    b       .L1192
.L843:
    mov     x9, #0
    str     x9, [sp, #40]
.L844:
    ldr     x9, [sp, #40]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L845
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
    cbz     w11, .L846
    mov     x9, #0
    mov     x0, x9
    b       .L1192
.L846:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L844
.L845:
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1192
.L1192:
    add     sp, sp, #272
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_expand
_pp_expand:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1792
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
    cbz     w10, .L847
    b       .L1193
.L847:
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
.L848:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L849
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
    b       .L848
.L849:
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
    str     x0, [sp, #424]
    bl      _pp_file_cap
    mov     x9, x0
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #56]
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _io_open_read
    mov     x10, x0
    str     x10, [sp, #64]
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L850
    b       .L1193
.L850:
    mov     x9, #0
    str     x9, [sp, #72]
.L851:
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #72]
    add     x12, x10, x11
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #72]
    sub     x13, x10, x11
    mov     x0, x9
    mov     x1, x12
    mov     x2, x13
    bl      _io_read
    mov     x10, x0
    str     x10, [sp, #80]
    ldr     x9, [sp, #80]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L853
    b       .L852
.L853:
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #80]
    add     x11, x9, x10
    str     x11, [sp, #72]
    b       .L851
.L852:
    ldr     x9, [sp, #64]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #664]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #40]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L854
    adrp    x9, L_str159@PAGE
    add     x9, x9, L_str159@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x002e
    str     x9, [sp, #96]
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #96]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #736]
.L854:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #72]
    movz    x12, #0x0007
    add     x13, x10, x12
    movz    x10, #0x0008
    udiv     x12, x13, x10
    movz    x10, #0x0008
    mul     x13, x12, x10
    add     x10, x9, x13
    str     x10, [x11]
    ldr     x9, [sp, #56]
    str     x9, [sp, #104]
    mov     x9, #0
    str     x9, [sp, #112]
.L855:
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #72]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L856
    ldr     x9, [sp, #112]
    str     x9, [sp, #120]
.L857:
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #72]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L858
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #112]
    add     x11, x9, x10
    ldrb    w9, [x11]
    movz    x10, #0x000a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L859
    b       .L858
.L859:
    ldr     x9, [sp, #112]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #112]
    b       .L857
.L858:
    ldr     x9, [sp, #112]
    str     x9, [sp, #128]
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #120]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _is_import_line
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L860
    ldr     x9, [sp, #120]
    movz    x10, #0x0007
    add     x11, x9, x10
    str     x11, [sp, #136]
.L861:
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #128]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L862
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #136]
    add     x11, x9, x10
    ldrb    w9, [x11]
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L863
    b       .L862
.L863:
    ldr     x9, [sp, #136]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #136]
    b       .L861
.L862:
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #128]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L864
    ldr     x9, [sp, #136]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #144]
.L865:
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #128]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L866
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #144]
    add     x11, x9, x10
    ldrb    w9, [x11]
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L867
    b       .L866
.L867:
    ldr     x9, [sp, #144]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #144]
    b       .L865
.L866:
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #128]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L868
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #136]
    sub     x11, x9, x10
    movz    x9, #0x0001
    sub     x10, x11, x9
    str     x10, [sp, #152]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #152]
    movz    x11, #0x0001
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _arena_take
    mov     x10, x0
    str     x10, [sp, #160]
    mov     x9, #0
    str     x9, [sp, #168]
.L869:
    ldr     x9, [sp, #168]
    ldr     x10, [sp, #152]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L870
    ldr     x9, [sp, #160]
    ldr     x10, [sp, #168]
    add     x11, x9, x10
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #136]
    movz    x12, #0x0001
    add     x13, x10, x12
    ldr     x10, [sp, #168]
    add     x12, x13, x10
    add     x10, x9, x12
    ldrb    w9, [x10]
    strb    w9, [x11]
    ldr     x9, [sp, #168]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #168]
    b       .L869
.L870:
    ldr     x9, [sp, #160]
    ldr     x10, [sp, #152]
    add     x11, x9, x10
    mov     x9, #0
    strb    w9, [x11]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #160]
    ldr     x11, [sp, #152]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _pp_expand
    str     x0, [sp, #1608]
.L868:
.L864:
    b       .L871
.L860:
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #120]
    add     x11, x9, x10
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #120]
    sub     x12, x9, x10
    mov     x0, x11
    mov     x1, x12
    bl      _pp_out_append
    str     x0, [sp, #1664]
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #128]
    add     x11, x9, x10
    str     x11, [sp, #176]
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #72]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L872
    ldr     x9, [sp, #176]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _pp_out_append
    str     x0, [sp, #1736]
.L872:
.L871:
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #72]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L873
    ldr     x9, [sp, #112]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #112]
.L873:
    b       .L855
.L856:
.L1193:
    add     sp, sp, #1792
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
.L874:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_next
    str     x0, [sp, #168]
    adrp    x9, L_str160@PAGE
    add     x9, x9, L_str160@PAGEOFF
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
    adrp    x9, L_str161@PAGE
    add     x9, x9, L_str161@PAGEOFF
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
    adrp    x9, L_str162@PAGE
    add     x9, x9, L_str162@PAGEOFF
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
    adrp    x9, L_str163@PAGE
    add     x9, x9, L_str163@PAGEOFF
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
    cbz     w11, .L876
    b       .L875
.L876:
    b       .L874
.L875:
.L1194:
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
    cbz     w11, .L877
    mov     x9, #0
    mov     x0, x9
    b       .L1195
.L877:
    mov     x9, #0
    str     x9, [sp, #32]
.L878:
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
    cbz     w11, .L880
    b       .L879
.L880:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L878
.L879:
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #224]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L1195
.L1195:
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
.L881:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L882
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
    cbz     w11, .L883
    mov     x9, #0
    mov     x0, x9
    b       .L1196
.L883:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L881
.L882:
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1196
.L1196:
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
.L884:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L885
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
    cbz     w11, .L886
    mov     x9, #0
    mov     x0, x9
    b       .L1197
.L886:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L884
.L885:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    add     x11, x9, x10
    ldrb    w9, [x11]
    mov     x10, #0
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L887
    mov     x9, #0
    mov     x0, x9
    b       .L1197
.L887:
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1197
.L1197:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _main
_main:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1856
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L888
    movz    x9, #0x0002
    mov     w0, w9
    b       .L1198
.L888:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #16]
    adrp    x9, L_str164@PAGE
    add     x9, x9, L_str164@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x000d
    str     x9, [sp, #32]
    adrp    x9, L_str165@PAGE
    add     x9, x9, L_str165@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0009
    str     x9, [sp, #48]
    adrp    x9, L_str166@PAGE
    add     x9, x9, L_str166@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x000c
    str     x9, [sp, #64]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cstr_eq
    mov     x12, x0
    str     x12, [sp, #72]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cstr_eq
    mov     x12, x0
    str     x12, [sp, #80]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cstr_eq
    mov     x12, x0
    str     x12, [sp, #88]
    ldr     x9, [sp, #72]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L889
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
    cbz     w11, .L890
    movz    x9, #0x0003
    mov     w0, w9
    b       .L1198
.L890:
    adrp    x9, _OUT_STORAGE@PAGE
    add     x9, x9, _OUT_STORAGE@PAGEOFF
    str     x9, [sp, #112]
    ldr     x9, [sp, #112]
    movz    x10, #0x0001
    adrp    x11, _OUT_BUF@PAGE
    add     x11, x11, _OUT_BUF@PAGEOFF
    movz    x12, #0x0001, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #704]
    ldr     x9, [sp, #112]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    ldr     x11, [sp, #104]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _dump_tokens
    str     x0, [sp, #736]
    ldr     x9, [sp, #112]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #752]
    mov     x9, #0
    mov     w0, w9
    b       .L1198
.L889:
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L891
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #120]
    ldr     x9, [sp, #120]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    movz    x11, #0x0004, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _read_all
    mov     x12, x0
    str     x12, [sp, #128]
    ldr     x9, [sp, #128]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L892
    movz    x9, #0x0003
    mov     w0, w9
    b       .L1198
.L892:
    bl      _ast_init
    mov     x9, x0
    str     x9, [sp, #136]
    bl      _ir_init
    mov     x9, x0
    str     x9, [sp, #144]
    ldr     x9, [sp, #136]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    ldr     x11, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _parse
    mov     x12, x0
    str     x12, [sp, #152]
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #152]
    mov     x0, x9
    mov     x1, x10
    bl      _lower
    mov     x11, x0
    str     x11, [sp, #160]
    adrp    x9, _OUT_STORAGE@PAGE
    add     x9, x9, _OUT_STORAGE@PAGEOFF
    str     x9, [sp, #168]
    ldr     x9, [sp, #168]
    movz    x10, #0x0001
    adrp    x11, _OUT_BUF@PAGE
    add     x11, x11, _OUT_BUF@PAGEOFF
    movz    x12, #0x0001, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #1016]
    ldr     x9, [sp, #168]
    ldr     x10, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    bl      _dump_ir
    str     x0, [sp, #1040]
    ldr     x9, [sp, #168]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #1056]
    mov     x9, #0
    mov     w0, w9
    b       .L1198
.L891:
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L893
    movz    x9, #0x0002
    mov     w0, w9
    b       .L1198
.L893:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0003
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #176]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0001
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #184]
    bl      _pp_arena_init
    mov     x9, x0
    str     x9, [sp, #192]
    mov     x9, #0
    str     x9, [sp, #200]
.L894:
    ldr     x9, [sp, #176]
    ldr     x10, [sp, #200]
    add     x11, x9, x10
    ldrb    w9, [x11]
    mov     x10, #0
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L896
    b       .L895
.L896:
    ldr     x9, [sp, #200]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #200]
    b       .L894
.L895:
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #176]
    ldr     x11, [sp, #200]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _pp_expand
    str     x0, [sp, #1344]
    adrp    x9, _PP_OUT_LEN@PAGE
    add     x9, x9, _PP_OUT_LEN@PAGEOFF
    str     x9, [sp, #208]
    ldr     x9, [sp, #208]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #216]
    ldr     x9, [sp, #216]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L897
    movz    x9, #0x0003
    mov     w0, w9
    b       .L1198
.L897:
    adrp    x9, _PP_OUT@PAGE
    add     x9, x9, _PP_OUT@PAGEOFF
    str     x9, [sp, #224]
    bl      _ast_init
    mov     x9, x0
    str     x9, [sp, #232]
    bl      _ir_init
    mov     x9, x0
    str     x9, [sp, #240]
    ldr     x9, [sp, #232]
    ldr     x10, [sp, #224]
    ldr     x11, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _parse
    mov     x12, x0
    str     x12, [sp, #248]
    ldr     x9, [sp, #240]
    ldr     x10, [sp, #248]
    mov     x0, x9
    mov     x1, x10
    bl      _lower
    mov     x11, x0
    str     x11, [sp, #256]
    ldr     x9, [sp, #184]
    mov     x0, x9
    bl      _io_open_write
    mov     x10, x0
    str     x10, [sp, #264]
    ldr     x9, [sp, #264]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L898
    movz    x9, #0x0004
    mov     w0, w9
    b       .L1198
.L898:
    ldr     x9, [sp, #88]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L899
    ldr     x9, [sp, #248]
    mov     x0, x9
    bl      _cgb_bss_layout
    mov     x10, x0
    str     x10, [sp, #272]
    ldr     x9, [sp, #248]
    ldr     x10, [sp, #256]
    mov     x0, x9
    mov     x1, x10
    bl      _codegen_bytes
    str     x0, [sp, #1624]
    bl      _cb_pos
    mov     x9, x0
    str     x9, [sp, #280]
    adrp    x9, _CG_ENTRY@PAGE
    add     x9, x9, _CG_ENTRY@PAGEOFF
    str     x9, [sp, #288]
    ldr     x9, [sp, #264]
    ldr     x10, [sp, #248]
    ldr     x11, [sp, #280]
    ldr     x12, [sp, #288]
    mov     x13, #0
    movz    x14, #0x0008
    mul     x15, x13, x14
    add     x13, x12, x15
    ldr     x12, [x13]
    ldr     x13, [sp, #272]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    mov     x4, x13
    bl      _emit_macho_code_bss
    str     x0, [sp, #1728]
    b       .L900
.L899:
    adrp    x9, _OUT_STORAGE@PAGE
    add     x9, x9, _OUT_STORAGE@PAGEOFF
    str     x9, [sp, #296]
    ldr     x9, [sp, #296]
    ldr     x10, [sp, #264]
    adrp    x11, _OUT_BUF@PAGE
    add     x11, x11, _OUT_BUF@PAGEOFF
    movz    x12, #0x0001, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #1776]
    ldr     x9, [sp, #296]
    movz    x10, #0x0001
    ldr     x11, [sp, #248]
    ldr     x12, [sp, #256]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _codegen
    str     x0, [sp, #1816]
.L900:
    ldr     x9, [sp, #264]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #1832]
    mov     x9, #0
    mov     w0, w9
    b       .L1198
.L1198:
    add     sp, sp, #1856
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
    .byte   0x5f
    .byte   0x5f
    .byte   0x50
    .byte   0x41
    .byte   0x47
    .byte   0x45
    .byte   0x5a
    .byte   0x45
    .byte   0x52
    .byte   0x4f
    .byte   0x00
    .balign  8
L_str143:
    .byte   0x5f
    .byte   0x5f
    .byte   0x54
    .byte   0x45
    .byte   0x58
    .byte   0x54
    .byte   0x00
    .balign  8
L_str144:
    .byte   0x5f
    .byte   0x5f
    .byte   0x74
    .byte   0x65
    .byte   0x78
    .byte   0x74
    .byte   0x00
    .balign  8
L_str145:
    .byte   0x5f
    .byte   0x5f
    .byte   0x4c
    .byte   0x49
    .byte   0x4e
    .byte   0x4b
    .byte   0x45
    .byte   0x44
    .byte   0x49
    .byte   0x54
    .byte   0x00
    .balign  8
L_str146:
    .byte   0x2f
    .byte   0x75
    .byte   0x73
    .byte   0x72
    .byte   0x2f
    .byte   0x6c
    .byte   0x69
    .byte   0x62
    .byte   0x2f
    .byte   0x64
    .byte   0x79
    .byte   0x6c
    .byte   0x64
    .byte   0x00
    .balign  8
L_str147:
    .byte   0x5f
    .byte   0x5f
    .byte   0x50
    .byte   0x41
    .byte   0x47
    .byte   0x45
    .byte   0x5a
    .byte   0x45
    .byte   0x52
    .byte   0x4f
    .byte   0x00
    .balign  8
L_str148:
    .byte   0x5f
    .byte   0x5f
    .byte   0x54
    .byte   0x45
    .byte   0x58
    .byte   0x54
    .byte   0x00
    .balign  8
L_str149:
    .byte   0x5f
    .byte   0x5f
    .byte   0x74
    .byte   0x65
    .byte   0x78
    .byte   0x74
    .byte   0x00
    .balign  8
L_str150:
    .byte   0x5f
    .byte   0x5f
    .byte   0x44
    .byte   0x41
    .byte   0x54
    .byte   0x41
    .byte   0x00
    .balign  8
L_str151:
    .byte   0x5f
    .byte   0x5f
    .byte   0x62
    .byte   0x73
    .byte   0x73
    .byte   0x00
    .balign  8
L_str152:
    .byte   0x5f
    .byte   0x5f
    .byte   0x4c
    .byte   0x49
    .byte   0x4e
    .byte   0x4b
    .byte   0x45
    .byte   0x44
    .byte   0x49
    .byte   0x54
    .byte   0x00
    .balign  8
L_str153:
    .byte   0x2f
    .byte   0x75
    .byte   0x73
    .byte   0x72
    .byte   0x2f
    .byte   0x6c
    .byte   0x69
    .byte   0x62
    .byte   0x2f
    .byte   0x64
    .byte   0x79
    .byte   0x6c
    .byte   0x64
    .byte   0x00
    .balign  8
L_str154:
    .byte   0x73
    .byte   0x79
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str155:
    .byte   0x6d
    .byte   0x61
    .byte   0x69
    .byte   0x6e
    .byte   0x00
    .balign  8
L_str156:
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
    .byte   0x69
    .byte   0x6d
    .byte   0x70
    .byte   0x6f
    .byte   0x72
    .byte   0x74
    .byte   0x20
    .byte   0x28
    .byte   0x6d
    .byte   0x61
    .byte   0x78
    .byte   0x20
    .byte   0x33
    .byte   0x32
    .byte   0x29
    .byte   0x00
    .balign  8
L_str157:
    .byte   0x66
    .byte   0x75
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x65
    .byte   0x20
    .byte   0x65
    .byte   0x78
    .byte   0x70
    .byte   0x61
    .byte   0x6e
    .byte   0x64
    .byte   0x69
    .byte   0x64
    .byte   0x61
    .byte   0x20
    .byte   0x64
    .byte   0x65
    .byte   0x6d
    .byte   0x61
    .byte   0x73
    .byte   0x69
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x20
    .byte   0x67
    .byte   0x72
    .byte   0x61
    .byte   0x6e
    .byte   0x64
    .byte   0x65
    .byte   0x20
    .byte   0x28
    .byte   0x50
    .byte   0x50
    .byte   0x5f
    .byte   0x4f
    .byte   0x55
    .byte   0x54
    .byte   0x29
    .byte   0x00
    .balign  8
L_str158:
    .byte   0x69
    .byte   0x6d
    .byte   0x70
    .byte   0x6f
    .byte   0x72
    .byte   0x74
    .byte   0x20
    .byte   0x00
    .balign  8
L_str159:
    .byte   0x66
    .byte   0x69
    .byte   0x63
    .byte   0x68
    .byte   0x65
    .byte   0x72
    .byte   0x6f
    .byte   0x20
    .byte   0x64
    .byte   0x65
    .byte   0x6d
    .byte   0x61
    .byte   0x73
    .byte   0x69
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x20
    .byte   0x67
    .byte   0x72
    .byte   0x61
    .byte   0x6e
    .byte   0x64
    .byte   0x65
    .byte   0x20
    .byte   0x70
    .byte   0x61
    .byte   0x72
    .byte   0x61
    .byte   0x20
    .byte   0x65
    .byte   0x6c
    .byte   0x20
    .byte   0x70
    .byte   0x72
    .byte   0x65
    .byte   0x70
    .byte   0x72
    .byte   0x6f
    .byte   0x63
    .byte   0x65
    .byte   0x73
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str160:
    .byte   0x6b
    .byte   0x69
    .byte   0x6e
    .byte   0x64
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str161:
    .byte   0x20
    .byte   0x73
    .byte   0x74
    .byte   0x61
    .byte   0x72
    .byte   0x74
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str162:
    .byte   0x20
    .byte   0x6c
    .byte   0x65
    .byte   0x6e
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str163:
    .byte   0x20
    .byte   0x6c
    .byte   0x69
    .byte   0x6e
    .byte   0x65
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str164:
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
L_str165:
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
    .balign  8
L_str166:
    .byte   0x2d
    .byte   0x2d
    .byte   0x65
    .byte   0x6d
    .byte   0x69
    .byte   0x74
    .byte   0x3d
    .byte   0x6d
    .byte   0x61
    .byte   0x63
    .byte   0x68
    .byte   0x6f
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
    .zerofill __DATA,__bss,_SHA_K,512,3
    .zerofill __DATA,__bss,_SHA_W,512,3
    .zerofill __DATA,__bss,_SHA_H,64,3
    .zerofill __DATA,__bss,_SHA_BLK,64,3
    .zerofill __DATA,__bss,_MO_IMG,1048576,3
    .zerofill __DATA,__bss,_MO_CUR,8,3
    .zerofill __DATA,__bss,_MO_UUID,16,3
    .zerofill __DATA,__bss,_MO_DIGEST,32,3
    .zerofill __DATA,__bss,_MO_CODE,64,3
    .zerofill __DATA,__bss,_CB,262144,3
    .zerofill __DATA,__bss,_CB_POS,8,3
    .zerofill __DATA,__bss,_CG_LBL,262144,3
    .zerofill __DATA,__bss,_CG_FNOFF,8192,3
    .zerofill __DATA,__bss,_CG_FIX,393216,3
    .zerofill __DATA,__bss,_CG_FIXN,8,3
    .zerofill __DATA,__bss,_CG_STROFF,65536,3
    .zerofill __DATA,__bss,_CG_ENTRY,8,3
    .zerofill __DATA,__bss,_CG_PROG,8,3
    .zerofill __DATA,__bss,_CG_BSSOFF,8192,3
    .zerofill __DATA,__bss,_SRC_BUF,262144,3
    .zerofill __DATA,__bss,_OUT_BUF,65536,3
    .zerofill __DATA,__bss,_OUT_STORAGE,64,3
    .zerofill __DATA,__bss,_DUMP_TOK_STORE,40,3
    .zerofill __DATA,__bss,_PP_OUT,1048576,3
    .zerofill __DATA,__bss,_PP_OUT_LEN,8,3
    .zerofill __DATA,__bss,_PP_ARENA_STORE,24,3
    .zerofill __DATA,__bss,_PP_ARENA_BUF,16777216,3
    .zerofill __DATA,__bss,_PP_SEEN_COUNT,8,3
    .zerofill __DATA,__bss,_PP_SEEN_PTRS,256,3
    .zerofill __DATA,__bss,_PP_SEEN_LENS,256,3
