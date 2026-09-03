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
.L1067:
    add     sp, sp, #128
    ldp     x29, x30, [sp], #16
    ret

    .globl   _arena_take
_arena_take:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #496
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0007
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    cmp     x11, x9
    cset    w10, lo
    cbz     w10, .L0
    movz    x9, #0x0001
    movz    x10, #0x0046
    mov     x11, #0
    mov     x12, #0
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    str     x0, [sp, #120]
.L0:
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
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L1
    movz    x9, #0x0001
    movz    x10, #0x0046
    mov     x11, #0
    mov     x12, #0
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    str     x0, [sp, #304]
.L1:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #24]
    sub     x12, x10, x11
    cmp     x9, x12
    cset    w10, hi
    cbz     w10, .L2
    movz    x9, #0x0001
    movz    x10, #0x0046
    mov     x11, #0
    mov     x12, #0
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    str     x0, [sp, #384]
.L2:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #24]
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L1068
.L1068:
    add     sp, sp, #496
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
    b       .L1069
.L1069:
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
    b       .L1070
.L1070:
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
    b       .L1071
.L1071:
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
.L1072:
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
.L1073:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _io_getpid
_io_getpid:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    movz    x9, #0x0014
    mov     x10, #0
    mov     x11, #0
    mov     x12, #0
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    mov     x13, x0
    mov     x0, x13
    b       .L1074
.L1074:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _io_unlink
_io_unlink:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    movz    x9, #0x000a
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
    b       .L1075
.L1075:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _io_chdir
_io_chdir:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #48
    str     x0, [sp, #0]
    movz    x9, #0x000c
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
    b       .L1076
.L1076:
    add     sp, sp, #48
    ldp     x29, x30, [sp], #16
    ret

    .globl   _io_mkdir
_io_mkdir:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #64
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x9, #0x0088
    ldr     x10, [sp, #0]
    ldr     x11, [sp, #8]
    mov     x12, #0
    mov     x16, x9
    mov     x0, x10
    mov     x1, x11
    mov     x2, x12
    svc     #0x80
    mov     x13, x0
    mov     x0, x13
    b       .L1077
.L1077:
    add     sp, sp, #64
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
.L1078:
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
.L3:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L4
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L5
    mov     x9, #0
    mov     w0, w9
    b       .L1079
.L5:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L3
.L4:
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1079
.L1079:
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
.L6:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L7
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #24]
    add     x12, x9, x10
    ldrb    w9, [x12]
    uxtb    w9, w9
    strb    w9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L6
.L7:
.L1080:
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
.L1081:
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
    cbz     w11, .L8
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
.L8:
.L1082:
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
    cbz     w11, .L9
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #96]
.L9:
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
    uxtb    w9, w9
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
.L1083:
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
.L10:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L11
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #104]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L10
.L11:
.L1084:
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
    cbz     w11, .L12
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #72]
    b       .L1085
.L12:
    mov     x9, #0
    str     x9, [sp, #16]
.L13:
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L14
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
    b       .L13
.L14:
.L15:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L16
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
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #336]
    b       .L15
.L16:
.L1085:
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
    cbz     w11, .L17
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    ldr     x11, [sp, #8]
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_byte
    str     x0, [sp, #72]
    b       .L1086
.L17:
    ldr     x9, [sp, #0]
    movz    x10, #0x0057
    ldr     x11, [sp, #8]
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _out_byte
    str     x0, [sp, #112]
.L1086:
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
.L1087:
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
.L1088:
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
.L1089:
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
    cbz     w11, .L18
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
.L18:
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
.L1090:
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
    b       .L1091
.L1091:
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
    b       .L1092
.L1092:
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
.L1093:
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
    uxtb    w9, w9
    movz    x10, #0x0030
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L19
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0039
    cmp     w9, w10
    cset    w11, ls
    cbz     w11, .L20
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1094
.L20:
.L19:
    mov     x9, #0
    mov     w0, w9
    b       .L1094
.L1094:
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
    uxtb    w9, w9
    mov     x0, x9
    bl      _is_digit
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L21
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1095
.L21:
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0061
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L22
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0066
    cmp     w9, w10
    cset    w11, ls
    cbz     w11, .L23
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1095
.L23:
.L22:
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0041
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L24
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0046
    cmp     w9, w10
    cset    w11, ls
    cbz     w11, .L25
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1095
.L25:
.L24:
    mov     x9, #0
    mov     w0, w9
    b       .L1095
.L1095:
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
    uxtb    w9, w9
    mov     x0, x9
    bl      _is_digit
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L26
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0030
    sub     w11, w9, w10
    mov     w0, w11
    b       .L1096
.L26:
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0061
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L27
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0061
    sub     w11, w9, w10
    movz    x9, #0x000a
    add     w10, w11, w9
    mov     w0, w10
    b       .L1096
.L27:
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0041
    sub     w11, w9, w10
    movz    x9, #0x000a
    add     w10, w11, w9
    mov     w0, w10
    b       .L1096
.L1096:
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
    uxtb    w9, w9
    movz    x10, #0x005f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L28
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1097
.L28:
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0061
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L29
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x007a
    cmp     w9, w10
    cset    w11, ls
    cbz     w11, .L30
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1097
.L30:
.L29:
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x0041
    cmp     w9, w10
    cset    w11, hs
    cbz     w11, .L31
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    movz    x10, #0x005a
    cmp     w9, w10
    cset    w11, ls
    cbz     w11, .L32
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1097
.L32:
.L31:
    mov     x9, #0
    mov     w0, w9
    b       .L1097
.L1097:
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
    uxtb    w9, w9
    mov     x0, x9
    bl      _is_alpha
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L33
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1098
.L33:
    ldrb    w9, [sp, #0]
    uxtb    w9, w9
    mov     x0, x9
    bl      _is_digit
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L34
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1098
.L34:
    mov     x9, #0
    mov     w0, w9
    b       .L1098
.L1098:
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
    cbz     w11, .L35
    mov     x9, #0
    mov     w0, w9
    b       .L1099
.L35:
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
    uxtb    w9, w9
    mov     w0, w9
    b       .L1099
.L1099:
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
    cbz     w11, .L36
    mov     x9, #0
    mov     w0, w9
    b       .L1100
.L36:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    mov     w0, w9
    b       .L1100
.L1100:
    add     sp, sp, #176
    ldp     x29, x30, [sp], #16
    ret

    .globl   _skip_ws
_skip_ws:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #944
    str     x0, [sp, #0]
.L37:
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
    cbz     w11, .L38
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
    uxtb    w9, w9
    strb    w9, [sp, #8]
    ldrb    w9, [sp, #8]
    uxtb    w9, w9
    movz    x10, #0x0020
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
    uxtb    w9, w9
    movz    x10, #0x0009
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
    uxtb    w9, w9
    movz    x10, #0x000d
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
    b       .L44
.L43:
    ldrb    w9, [sp, #8]
    uxtb    w9, w9
    movz    x10, #0x000a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L45
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
    b       .L46
.L45:
    ldrb    w9, [sp, #8]
    uxtb    w9, w9
    movz    x10, #0x002f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L47
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x002f
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L48
.L49:
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
    cbz     w11, .L50
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
    uxtb    w9, w9
    strb    w9, [sp, #16]
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x000a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L51
    b       .L50
.L51:
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
    b       .L49
.L50:
    b       .L52
.L48:
    b       .L38
.L52:
    b       .L53
.L47:
    b       .L38
.L53:
.L46:
.L44:
.L42:
.L40:
    b       .L37
.L38:
.L1101:
    add     sp, sp, #944
    ldp     x29, x30, [sp], #16
    ret

    .globl   _kw_kind
_kw_kind:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1488
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
    movz    x9, #0x0008
    str     x9, [sp, #168]
    adrp    x9, L_str12@PAGE
    add     x9, x9, L_str12@PAGEOFF
    str     x9, [sp, #176]
    movz    x9, #0x0006
    str     x9, [sp, #184]
    adrp    x9, L_str13@PAGE
    add     x9, x9, L_str13@PAGEOFF
    str     x9, [sp, #192]
    movz    x9, #0x0003
    str     x9, [sp, #200]
    adrp    x9, L_str14@PAGE
    add     x9, x9, L_str14@PAGEOFF
    str     x9, [sp, #208]
    movz    x9, #0x0003
    str     x9, [sp, #216]
    adrp    x9, L_str15@PAGE
    add     x9, x9, L_str15@PAGEOFF
    str     x9, [sp, #224]
    movz    x9, #0x0006
    str     x9, [sp, #232]
    adrp    x9, L_str16@PAGE
    add     x9, x9, L_str16@PAGEOFF
    str     x9, [sp, #240]
    movz    x9, #0x0002
    str     x9, [sp, #248]
    ldr     x9, [sp, #8]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L54
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
    cbz     w10, .L55
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1102
.L55:
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
    cbz     w10, .L56
    movz    x9, #0x0002
    mov     w0, w9
    b       .L1102
.L56:
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
    cbz     w10, .L57
    movz    x9, #0x000b
    mov     w0, w9
    b       .L1102
.L57:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #208]
    movz    x11, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L58
    movz    x9, #0x000c
    mov     w0, w9
    b       .L1102
.L58:
.L54:
    ldr     x9, [sp, #8]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L59
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
    cbz     w10, .L60
    movz    x9, #0x0003
    mov     w0, w9
    b       .L1102
.L60:
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
    cbz     w10, .L61
    movz    x9, #0x0008
    mov     w0, w9
    b       .L1102
.L61:
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
    cbz     w10, .L62
    movz    x9, #0x0009
    mov     w0, w9
    b       .L1102
.L62:
.L59:
    ldr     x9, [sp, #8]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L63
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
    cbz     w10, .L64
    movz    x9, #0x0004
    mov     w0, w9
    b       .L1102
.L64:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #176]
    movz    x11, #0x0006
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L65
    movz    x9, #0x000a
    mov     w0, w9
    b       .L1102
.L65:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #224]
    movz    x11, #0x0006
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L66
    movz    x9, #0x000d
    mov     w0, w9
    b       .L1102
.L66:
.L63:
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L67
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #160]
    movz    x11, #0x0008
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L68
    movz    x9, #0x002d
    mov     w0, w9
    b       .L1102
.L68:
.L67:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L69
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
    cbz     w10, .L70
    movz    x9, #0x0005
    mov     w0, w9
    b       .L1102
.L70:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #240]
    movz    x11, #0x0002
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _bytes_eq
    mov     x12, x0
    movz    x9, #0x0001
    cmp     w12, w9
    cset    w10, eq
    cbz     w10, .L71
    movz    x9, #0x002e
    mov     w0, w9
    b       .L1102
.L71:
.L69:
    ldr     x9, [sp, #8]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L72
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
    cbz     w10, .L73
    movz    x9, #0x0006
    mov     w0, w9
    b       .L1102
.L73:
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
    cbz     w10, .L74
    movz    x9, #0x0007
    mov     w0, w9
    b       .L1102
.L74:
.L72:
    movz    x9, #0x000e
    mov     w0, w9
    b       .L1102
.L1102:
    add     sp, sp, #1488
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
    uxtb    w9, w9
    strb    w9, [sp, #24]
    ldrb    w9, [sp, #24]
    uxtb    w9, w9
    movz    x10, #0x0030
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L75
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x0078
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L76
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
.L76:
.L75:
    mov     x9, #0
    str     x9, [sp, #32]
.L77:
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
    cbz     w11, .L78
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
    uxtb    w9, w9
    strb    w9, [sp, #40]
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L79
    ldrb    w9, [sp, #40]
    uxtb    w9, w9
    mov     x0, x9
    bl      _is_hex
    mov     x10, x0
    mov     x9, #0
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L80
    b       .L78
.L80:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    mul     x16, x9, x10
    str     x16, [sp, #592]
    ldrb    w9, [sp, #40]
    uxtb    w9, w9
    mov     x0, x9
    bl      _hex_val
    mov     x10, x0
    ldr     x16, [sp, #592]
    add     x9, x16, x10
    str     x9, [sp, #32]
    b       .L81
.L79:
    ldrb    w9, [sp, #40]
    uxtb    w9, w9
    mov     x0, x9
    bl      _is_digit
    mov     x10, x0
    mov     x9, #0
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L82
    b       .L78
.L82:
    ldr     x9, [sp, #32]
    movz    x10, #0x000a
    mul     x11, x9, x10
    ldrb    w9, [sp, #40]
    uxtb    w9, w9
    movz    x10, #0x0030
    sub     w12, w9, w10
    add     x9, x11, x12
    str     x9, [sp, #32]
.L81:
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
    b       .L77
.L78:
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
.L1103:
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
.L83:
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
    cbz     w11, .L84
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
    uxtb    w9, w9
    mov     x0, x9
    bl      _is_alnum
    mov     x10, x0
    mov     x9, #0
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L85
    b       .L84
.L85:
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
    b       .L83
.L84:
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
.L1104:
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
.L86:
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
    cbz     w11, .L87
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
    uxtb    w9, w9
    strb    w9, [sp, #16]
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L88
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
    b       .L87
.L88:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x005c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L89
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
    b       .L90
.L89:
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
.L90:
    b       .L86
.L87:
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
.L1105:
    add     sp, sp, #704
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lex_next
_lex_next:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    movz    x16, #0x1090
    sub     sp, sp, x16
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
    cbz     w11, .L91
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
    b       .L1106
.L91:
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
    uxtb    w9, w9
    strb    w9, [sp, #16]
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    mov     x0, x9
    bl      _is_digit
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L92
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_number
    str     x0, [sp, #416]
    b       .L1106
.L92:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    mov     x0, x9
    bl      _is_alpha
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L93
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_ident
    str     x0, [sp, #472]
    b       .L1106
.L93:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L94
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_string
    str     x0, [sp, #520]
    b       .L1106
.L94:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x002d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L95
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003e
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L96
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
    b       .L1106
.L96:
.L95:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x003d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L97
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003d
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L98
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
    b       .L1106
.L98:
.L97:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x0021
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L99
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003d
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L100
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
    b       .L1106
.L100:
.L99:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x003c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L101
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003d
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L102
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
    b       .L1106
.L102:
.L101:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x003e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L103
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003d
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L104
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
    b       .L1106
.L104:
.L103:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x003c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L105
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003c
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L106
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
    b       .L1106
.L106:
.L105:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x003e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L107
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x003e
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L108
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
    b       .L1106
.L108:
.L107:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x0026
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L109
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x0026
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L110
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0031
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
    b       .L1106
.L110:
.L109:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x007c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L111
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _peek1
    mov     x10, x0
    movz    x9, #0x007c
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L112
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0032
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
    b       .L1106
.L112:
.L111:
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
    uxtb    w9, w9
    movz    x10, #0x0028
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L113
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0011
    str     w9, [x11]
    b       .L1106
.L113:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x0029
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L114
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0012
    str     w9, [x11]
    b       .L1106
.L114:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x007b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L115
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0013
    str     w9, [x11]
    b       .L1106
.L115:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x007d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L116
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0014
    str     w9, [x11]
    b       .L1106
.L116:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x005b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L117
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0015
    str     w9, [x11]
    b       .L1106
.L117:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x005d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L118
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0016
    str     w9, [x11]
    b       .L1106
.L118:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x002a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L119
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0017
    str     w9, [x11]
    b       .L1106
.L119:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x002b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L120
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0018
    str     w9, [x11]
    b       .L1106
.L120:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x002d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L121
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0019
    str     w9, [x11]
    b       .L1106
.L121:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x002f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L122
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001a
    str     w9, [x11]
    b       .L1106
.L122:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x0025
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L123
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x002f
    str     w9, [x11]
    b       .L1106
.L123:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x0021
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L124
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0030
    str     w9, [x11]
    b       .L1106
.L124:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x0026
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L125
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001b
    str     w9, [x11]
    b       .L1106
.L125:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x007c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L126
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001c
    str     w9, [x11]
    b       .L1106
.L126:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x005e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L127
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001d
    str     w9, [x11]
    b       .L1106
.L127:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x003d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L128
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x001e
    str     w9, [x11]
    b       .L1106
.L128:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x003b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L129
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0025
    str     w9, [x11]
    b       .L1106
.L129:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x002c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L130
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0026
    str     w9, [x11]
    b       .L1106
.L130:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x003a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L131
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0027
    str     w9, [x11]
    b       .L1106
.L131:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x002e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L132
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0028
    str     w9, [x11]
    b       .L1106
.L132:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x0040
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L133
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x002a
    str     w9, [x11]
    b       .L1106
.L133:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x003c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L134
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0021
    str     w9, [x11]
    b       .L1106
.L134:
    ldrb    w9, [sp, #16]
    uxtb    w9, w9
    movz    x10, #0x003e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L135
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0023
    str     w9, [x11]
    b       .L1106
.L135:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    mov     x9, #0
    str     w9, [x11]
.L1106:
    movz    x16, #0x1090
    add     sp, sp, x16
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_prim
_mk_prim:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    str     x1, [sp, #8]
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
    mov     x0, x9
    b       .L1107
.L1107:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_ptr
_mk_ptr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    str     x1, [sp, #8]
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
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L1108
.L1108:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_array
_mk_array:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0020
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x000a
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1109
.L1109:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _type_width
_type_width:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #816
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L136
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1110
.L136:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L137
    movz    x9, #0x0004
    mov     x0, x9
    b       .L1110
.L137:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L138
    movz    x9, #0x0008
    mov     x0, x9
    b       .L1110
.L138:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L139
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1110
.L139:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L140
    movz    x9, #0x0004
    mov     x0, x9
    b       .L1110
.L140:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L141
    movz    x9, #0x0008
    mov     x0, x9
    b       .L1110
.L141:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L142
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1110
.L142:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L143
    movz    x9, #0x0008
    mov     x0, x9
    b       .L1110
.L143:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L144
    movz    x9, #0x0010
    mov     x0, x9
    b       .L1110
.L144:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L145
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x16, [x11]
    str     x16, [sp, #592]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    ldr     x16, [sp, #592]
    mul     x9, x16, x10
    mov     x0, x9
    b       .L1110
.L145:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L146
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L147
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    mul     x11, x9, x10
    mov     x0, x11
    b       .L1110
.L147:
.L146:
    movz    x9, #0x0008
    mov     x0, x9
    b       .L1110
.L1110:
    add     sp, sp, #816
    ldp     x29, x30, [sp], #16
    ret

    .globl   _type_is_signed
_type_is_signed:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #224
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L148
    mov     x9, #0
    mov     x0, x9
    b       .L1111
.L148:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L149
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1111
.L149:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L150
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1111
.L150:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L151
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1111
.L151:
    mov     x9, #0
    mov     x0, x9
    b       .L1111
.L1111:
    add     sp, sp, #224
    ldp     x29, x30, [sp], #16
    ret

    .globl   _type_is_scalar
_type_is_scalar:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #496
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L152
    mov     x9, #0
    mov     x0, x9
    b       .L1112
.L152:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L153
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1112
.L153:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L154
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1112
.L154:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L155
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1112
.L155:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L156
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1112
.L156:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L157
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1112
.L157:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L158
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1112
.L158:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L159
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1112
.L159:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L160
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1112
.L160:
    mov     x9, #0
    mov     x0, x9
    b       .L1112
.L1112:
    add     sp, sp, #496
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
.L1113:
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
.L1114:
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
    b       .L1115
.L1115:
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
.L1116:
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
    b       .L1117
.L1117:
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
    cbz     w11, .L161
    mov     x9, #0
    mov     w0, w9
    b       .L1118
.L161:
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
    b       .L1118
.L1118:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _add_local
_add_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1680
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
    movz    x10, #0x0028
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
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
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
    cbz     w11, .L162
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L163
    movz    x9, #0x0001
    str     x9, [sp, #64]
.L163:
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L164
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    movz    x9, #0x0008
    cmp     x10, x9
    cset    w11, ne
    cbz     w11, .L165
    adrp    x9, L_str17@PAGE
    add     x9, x9, L_str17@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x0029
    str     x9, [sp, #80]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #80]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #696]
.L165:
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L166
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    sub     x11, x9, x10
    str     x11, [sp, #64]
.L166:
.L164:
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L167
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #88]
    ldr     x9, [sp, #88]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L168
    ldr     x9, [sp, #88]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L169
    ldr     x9, [sp, #88]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    sub     x11, x9, x10
    str     x11, [sp, #64]
.L169:
.L168:
.L167:
.L162:
    mov     x9, #0
    str     x9, [sp, #96]
.L170:
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #64]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L171
    ldr     x9, [sp, #0]
    movz    x10, #0x0028
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #104]
    ldr     x9, [sp, #104]
    mov     x10, #0
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #104]
    movz    x10, #0x0008
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #104]
    movz    x10, #0x0010
    add     x16, x9, x10
    str     x16, [sp, #1136]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1136]
    str     x11, [x17]
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L172
    ldr     x9, [sp, #104]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
.L172:
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L173
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #96]
    movz    x11, #0x0001
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _struct_field_type
    mov     x10, x0
    str     x10, [sp, #112]
    ldr     x9, [sp, #112]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L174
    ldr     x9, [sp, #104]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #112]
    str     x9, [x11]
.L174:
.L173:
    ldr     x9, [sp, #104]
    movz    x10, #0x0018
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
    ldr     x9, [sp, #104]
    movz    x10, #0x0020
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #8]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #104]
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
    ldr     x9, [sp, #96]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #96]
    b       .L170
.L171:
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L1119
.L1119:
    add     sp, sp, #1680
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lookup_local
_lookup_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #400
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
.L175:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L176
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
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L177
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
    cbz     w10, .L178
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L1120
.L178:
.L177:
    b       .L175
.L176:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1120
.L1120:
    add     sp, sp, #400
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mark_local_initialized
_mark_local_initialized:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #448
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
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
    movz    x9, #0x0001
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L179
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    str     x10, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L180
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    udiv     x11, x9, x10
    str     x11, [sp, #32]
.L180:
.L179:
    mov     x9, #0
    str     x9, [sp, #48]
.L181:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L182
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #48]
    add     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #56]
    ldr     x9, [sp, #56]
    movz    x10, #0x0020
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L181
.L182:
.L1121:
    add     sp, sp, #448
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
.L183:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L184
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
    cbz     w10, .L185
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1122
.L185:
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L183
.L184:
    mov     x9, #0
    mov     x0, x9
    b       .L1122
.L1122:
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
.L186:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L187
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
    cbz     w10, .L188
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1123
.L188:
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L186
.L187:
    mov     x9, #0
    mov     x0, x9
    b       .L1123
.L1123:
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
.L189:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L190
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
    cbz     w10, .L191
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1124
.L191:
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L189
.L190:
    mov     x9, #0
    mov     x0, x9
    b       .L1124
.L1124:
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
.L192:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L193
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
    cbz     w10, .L194
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1125
.L194:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L192
.L193:
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    b       .L1125
.L1125:
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
.L195:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L196
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L197
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    b       .L1126
.L197:
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #16]
    ldr     x9, [sp, #24]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L195
.L196:
    mov     x9, #0
    mov     x0, x9
    b       .L1126
.L1126:
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
.L1127:
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
    cbz     w11, .L198
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
    b       .L199
.L198:
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
.L199:
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
    b       .L1128
.L1128:
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
.L200:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L201
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    strb    w9, [sp, #56]
    ldrb    w9, [sp, #56]
    uxtb    w9, w9
    movz    x10, #0x005c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L202
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    strb    w9, [sp, #64]
    mov     x9, #0
    str     x9, [sp, #72]
    ldrb    w9, [sp, #64]
    uxtb    w9, w9
    movz    x10, #0x006e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L203
    movz    x9, #0x000a
    str     x9, [sp, #72]
.L203:
    ldrb    w9, [sp, #64]
    uxtb    w9, w9
    movz    x10, #0x0074
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L204
    movz    x9, #0x0009
    str     x9, [sp, #72]
.L204:
    ldrb    w9, [sp, #64]
    uxtb    w9, w9
    movz    x10, #0x005c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L205
    movz    x9, #0x005c
    str     x9, [sp, #72]
.L205:
    ldrb    w9, [sp, #64]
    uxtb    w9, w9
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L206
    movz    x9, #0x0027
    str     x9, [sp, #72]
.L206:
    ldrb    w9, [sp, #64]
    uxtb    w9, w9
    movz    x10, #0x0078
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L207
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    movz    x11, #0x0001
    add     x12, x10, x11
    add     x10, x9, x12
    ldrb    w9, [x10]
    uxtb    w9, w9
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
    uxtb    w9, w9
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
.L207:
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
    b       .L208
.L202:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #48]
    add     x11, x9, x10
    ldrb    w9, [sp, #56]
    uxtb    w9, w9
    strb    w9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #48]
.L208:
    b       .L200
.L201:
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
.L1129:
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
.L1130:
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
.L1131:
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
    mov     w9, w9
    mov     w0, w9
    b       .L1132
.L1132:
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
    b       .L1133
.L1133:
    add     sp, sp, #608
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_primary
_parse_primary:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #2976
    str     x0, [sp, #0]
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     w9, [x11]
    mov     w9, w9
    str     w9, [sp, #16]
    ldr     w9, [sp, #16]
    mov     w9, w9
    movz    x10, #0x000f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L209
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
    str     x16, [sp, #440]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #440]
    str     x11, [x17]
    bl      _ps_advance
    str     x0, [sp, #472]
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1134
.L209:
    ldr     w9, [sp, #16]
    mov     w9, w9
    movz    x10, #0x000c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L210
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
    str     x16, [sp, #584]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #584]
    str     x11, [x17]
    bl      _ps_advance
    str     x0, [sp, #616]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L1134
.L210:
    ldr     w9, [sp, #16]
    mov     w9, w9
    movz    x10, #0x000d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L211
    bl      _ps_advance
    str     x0, [sp, #656]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #672]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    str     x10, [sp, #40]
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #704]
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
    str     x16, [sp, #752]
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    ldr     x17, [sp, #752]
    str     x10, [x17]
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #792]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #792]
    str     x11, [x17]
    ldr     x9, [sp, #48]
    mov     x0, x9
    b       .L1134
.L211:
    ldr     w9, [sp, #16]
    mov     w9, w9
    movz    x10, #0x0011
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L212
    bl      _ps_advance
    str     x0, [sp, #856]
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
    str     x0, [sp, #896]
    ldr     x9, [sp, #56]
    mov     x0, x9
    b       .L1134
.L212:
    ldr     w9, [sp, #16]
    mov     w9, w9
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L213
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
    str     x0, [sp, #1000]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0011
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L214
    bl      _ps_advance
    str     x0, [sp, #1032]
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
.L215:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L216
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
    cbz     w11, .L217
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #104]
    str     x9, [x10]
.L217:
    ldr     x9, [sp, #96]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #96]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L218
    movz    x9, #0x0026
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1368]
.L218:
    b       .L215
.L216:
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1384]
    ldr     x9, [sp, #96]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L219
    adrp    x9, L_str18@PAGE
    add     x9, x9, L_str18@PAGEOFF
    str     x9, [sp, #112]
    movz    x9, #0x0014
    str     x9, [sp, #120]
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #120]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #1448]
.L219:
    ldr     x9, [sp, #80]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
    adrp    x9, L_str19@PAGE
    add     x9, x9, L_str19@PAGEOFF
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
    cbz     w10, .L220
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1576]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1576]
    str     x11, [x17]
    b       .L221
.L220:
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1624]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1624]
    str     x11, [x17]
.L221:
    ldr     x9, [sp, #80]
    mov     x0, x9
    b       .L1134
.L214:
    bl      _cur_func
    mov     x9, x0
    str     x9, [sp, #144]
    ldr     x9, [sp, #144]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L222
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
    cbz     w11, .L223
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
    b       .L1134
.L223:
.L222:
    bl      _cur_prog
    mov     x9, x0
    str     x9, [sp, #184]
    ldr     x9, [sp, #184]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L224
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
    cbz     w11, .L225
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
    b       .L1134
.L225:
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
    cbz     w11, .L226
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
    str     x16, [sp, #2432]
    ldr     x16, [sp, #0]
    str     x16, [sp, #2440]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #2440]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x17, [sp, #2432]
    str     x9, [x17]
    ldr     x9, [sp, #216]
    mov     x0, x9
    b       .L1134
.L226:
.L224:
    adrp    x9, L_str20@PAGE
    add     x9, x9, L_str20@PAGEOFF
    str     x9, [sp, #224]
    movz    x9, #0x0019
    str     x9, [sp, #232]
    ldr     x9, [sp, #224]
    ldr     x10, [sp, #232]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2520]
    mov     x9, #0
    mov     x0, x9
    b       .L1134
.L213:
    ldr     w9, [sp, #16]
    mov     w9, w9
    movz    x10, #0x0010
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L227
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #240]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #248]
    ldr     x9, [sp, #0]
    movz    x10, #0x000b
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #256]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #256]
    ldr     x11, [sp, #248]
    mov     x12, #0
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #240]
    movz    x13, #0x0008
    add     x14, x12, x13
    ldr     x12, [x14]
    add     x13, x11, x12
    movz    x11, #0x0001
    add     x12, x13, x11
    ldr     x11, [sp, #240]
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
    str     x0, [sp, #2752]
    ldr     x9, [sp, #256]
    movz    x10, #0x0080
    add     x16, x9, x10
    str     x16, [sp, #2776]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #256]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #256]
    movz    x12, #0x0070
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _str_table_add
    mov     x12, x0
    ldr     x17, [sp, #2776]
    str     x12, [x17]
    ldr     x9, [sp, #256]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #2880]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #2880]
    str     x11, [x17]
    bl      _ps_advance
    str     x0, [sp, #2912]
    ldr     x9, [sp, #256]
    mov     x0, x9
    b       .L1134
.L227:
    adrp    x9, L_str21@PAGE
    add     x9, x9, L_str21@PAGEOFF
    str     x9, [sp, #264]
    movz    x9, #0x001b
    str     x9, [sp, #272]
    ldr     x9, [sp, #264]
    ldr     x10, [sp, #272]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2960]
    mov     x9, #0
    mov     x0, x9
    b       .L1134
.L1134:
    add     sp, sp, #2976
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_postfix
_parse_postfix:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    movz    x16, #0x1000
    sub     sp, sp, x16
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_primary
    mov     x10, x0
    str     x10, [sp, #8]
.L228:
    movz    x9, #0x0001
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L229
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #16]
    ldr     w9, [sp, #16]
    mov     w9, w9
    movz    x10, #0x0028
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L230
    bl      _ps_advance
    str     x0, [sp, #496]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L231
    adrp    x9, L_str22@PAGE
    add     x9, x9, L_str22@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0020
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #560]
.L231:
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
    str     x0, [sp, #640]
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
    cbz     w11, .L232
    ldr     x9, [sp, #64]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L233
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L234
    adrp    x9, L_str23@PAGE
    add     x9, x9, L_str23@PAGEOFF
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
    cbz     w10, .L235
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
    str     x16, [sp, #976]
    ldr     x16, [sp, #0]
    str     x16, [sp, #984]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #984]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x17, [sp, #976]
    str     x9, [x17]
    ldr     x9, [sp, #96]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #72]
.L235:
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L236
    adrp    x9, L_str24@PAGE
    add     x9, x9, L_str24@PAGEOFF
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
    cbz     w10, .L237
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
    str     x16, [sp, #1248]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1248]
    str     x11, [x17]
    ldr     x9, [sp, #120]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #72]
.L237:
.L236:
.L234:
.L233:
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L238
    ldr     x9, [sp, #64]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L239
    ldr     x9, [sp, #64]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #128]
    ldr     x9, [sp, #128]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L240
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L241
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
    cbz     w11, .L242
    adrp    x9, L_str25@PAGE
    add     x9, x9, L_str25@PAGEOFF
    str     x9, [sp, #144]
    movz    x9, #0x001b
    str     x9, [sp, #152]
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #152]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #1584]
.L242:
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
    str     x16, [sp, #1704]
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    bl      _struct_field_type
    mov     x11, x0
    ldr     x17, [sp, #1704]
    str     x11, [x17]
    ldr     x9, [sp, #160]
    str     x9, [sp, #8]
    movz    x9, #0x0001
    str     x9, [sp, #72]
.L241:
.L240:
.L239:
.L238:
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L243
    ldr     x9, [sp, #64]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L244
    ldr     x9, [sp, #64]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #168]
    ldr     x9, [sp, #168]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L245
    ldr     x9, [sp, #168]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L246
    ldr     x9, [sp, #168]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #176]
    ldr     x9, [sp, #176]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L247
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
    cbz     w11, .L248
    adrp    x9, L_str26@PAGE
    add     x9, x9, L_str26@PAGEOFF
    str     x9, [sp, #192]
    movz    x9, #0x001b
    str     x9, [sp, #200]
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #200]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2096]
.L248:
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
    str     x16, [sp, #2216]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #2216]
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
    str     x16, [sp, #2384]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #208]
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ptr
    mov     x11, x0
    ldr     x17, [sp, #2384]
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
.L247:
.L246:
.L245:
.L244:
.L243:
.L232:
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L249
    adrp    x9, L_str27@PAGE
    add     x9, x9, L_str27@PAGEOFF
    str     x9, [sp, #240]
    movz    x9, #0x0014
    str     x9, [sp, #248]
    ldr     x9, [sp, #240]
    ldr     x10, [sp, #248]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2576]
.L249:
    b       .L250
.L230:
    ldr     w9, [sp, #16]
    mov     w9, w9
    movz    x10, #0x002e
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L251
    bl      _ps_advance
    str     x0, [sp, #2608]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    str     x10, [sp, #256]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_is_scalar
    mov     x10, x0
    mov     x9, #0
    cmp     x10, x9
    cset    w11, eq
    cbz     w11, .L252
    adrp    x9, L_str28@PAGE
    add     x9, x9, L_str28@PAGEOFF
    str     x9, [sp, #264]
    movz    x9, #0x001c
    str     x9, [sp, #272]
    ldr     x9, [sp, #264]
    ldr     x10, [sp, #272]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2720]
.L252:
    ldr     x9, [sp, #256]
    mov     x0, x9
    bl      _type_is_scalar
    mov     x10, x0
    mov     x9, #0
    cmp     x10, x9
    cset    w11, eq
    cbz     w11, .L253
    adrp    x9, L_str29@PAGE
    add     x9, x9, L_str29@PAGEOFF
    str     x9, [sp, #280]
    movz    x9, #0x001d
    str     x9, [sp, #288]
    ldr     x9, [sp, #280]
    ldr     x10, [sp, #288]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2792]
.L253:
    ldr     x9, [sp, #0]
    movz    x10, #0x000e
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #296]
    ldr     x9, [sp, #296]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #296]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #256]
    str     x9, [x11]
    ldr     x9, [sp, #296]
    str     x9, [sp, #8]
    b       .L254
.L251:
    ldr     w9, [sp, #16]
    mov     w9, w9
    movz    x10, #0x0015
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L255
    bl      _ps_advance
    str     x0, [sp, #2920]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #304]
    movz    x9, #0x0016
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #2960]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #312]
    ldr     x9, [sp, #312]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L256
    adrp    x9, L_str30@PAGE
    add     x9, x9, L_str30@PAGEOFF
    str     x9, [sp, #320]
    movz    x9, #0x001e
    str     x9, [sp, #328]
    ldr     x9, [sp, #320]
    ldr     x10, [sp, #328]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #3056]
.L256:
    ldr     x9, [sp, #312]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L257
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L258
    adrp    x9, L_str31@PAGE
    add     x9, x9, L_str31@PAGEOFF
    str     x9, [sp, #336]
    movz    x9, #0x0022
    str     x9, [sp, #344]
    ldr     x9, [sp, #336]
    ldr     x10, [sp, #344]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #3192]
.L258:
    ldr     x9, [sp, #0]
    movz    x10, #0x000c
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #352]
    ldr     x9, [sp, #352]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #352]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #3272]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #312]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ptr
    mov     x11, x0
    ldr     x17, [sp, #3272]
    str     x11, [x17]
    ldr     x9, [sp, #352]
    str     x9, [sp, #8]
    ldr     x9, [sp, #352]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #312]
.L257:
    ldr     x9, [sp, #312]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L259
    adrp    x9, L_str32@PAGE
    add     x9, x9, L_str32@PAGEOFF
    str     x9, [sp, #360]
    movz    x9, #0x0016
    str     x9, [sp, #368]
    ldr     x9, [sp, #360]
    ldr     x10, [sp, #368]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #3448]
.L259:
    ldr     x9, [sp, #312]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    str     x10, [sp, #376]
    ldr     x9, [sp, #304]
    str     x9, [sp, #384]
    ldr     x9, [sp, #376]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L260
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #392]
    ldr     x9, [sp, #392]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #376]
    str     x9, [x11]
    ldr     x9, [sp, #392]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #3600]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #3600]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #400]
    ldr     x9, [sp, #400]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #400]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #304]
    str     x9, [x11]
    ldr     x9, [sp, #400]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #392]
    str     x9, [x11]
    ldr     x9, [sp, #400]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #3768]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #3768]
    str     x11, [x17]
    ldr     x9, [sp, #400]
    str     x9, [sp, #384]
.L260:
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #408]
    ldr     x9, [sp, #408]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #408]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #408]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #384]
    str     x9, [x11]
    ldr     x9, [sp, #408]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #312]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #416]
    ldr     x9, [sp, #416]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #408]
    str     x9, [x11]
    ldr     x9, [sp, #416]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #312]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #416]
    str     x9, [sp, #8]
    b       .L261
.L255:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L1135
.L261:
.L254:
.L250:
    b       .L228
.L229:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L1135
.L1135:
    movz    x16, #0x1000
    add     sp, sp, x16
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_unary
_parse_unary:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1232
    str     x0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #8]
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x0030
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L262
    bl      _ps_advance
    str     x0, [sp, #136]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_unary
    mov     x10, x0
    str     x10, [sp, #16]
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
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #32]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #376]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #376]
    str     x11, [x17]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L1136
.L262:
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x0019
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L263
    bl      _ps_advance
    str     x0, [sp, #440]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_unary
    mov     x10, x0
    str     x10, [sp, #40]
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #48]
    ldr     x9, [sp, #48]
    movz    x10, #0x0010
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #56]
    ldr     x9, [sp, #56]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
    ldr     x9, [sp, #56]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    str     x9, [x11]
    ldr     x9, [sp, #56]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    str     x9, [x11]
    ldr     x9, [sp, #56]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #56]
    mov     x0, x9
    b       .L1136
.L263:
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x002a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L264
    bl      _ps_advance
    str     x0, [sp, #784]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_unary
    mov     x10, x0
    str     x10, [sp, #64]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #72]
    ldr     x9, [sp, #72]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    ldr     x9, [sp, #64]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #80]
    ldr     x9, [sp, #80]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L265
    ldr     x9, [sp, #80]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L266
    ldr     x9, [sp, #72]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
.L266:
.L265:
    ldr     x9, [sp, #72]
    mov     x0, x9
    b       .L1136
.L264:
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x001b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L267
    bl      _ps_advance
    str     x0, [sp, #1056]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_unary
    mov     x10, x0
    str     x10, [sp, #88]
    ldr     x9, [sp, #0]
    movz    x10, #0x000c
    mov     x0, x9
    mov     x1, x10
    bl      _mk_expr
    mov     x11, x0
    str     x11, [sp, #96]
    ldr     x9, [sp, #96]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    str     x9, [x11]
    ldr     x9, [sp, #96]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1152]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ptr
    mov     x11, x0
    ldr     x17, [sp, #1152]
    str     x11, [x17]
    ldr     x9, [sp, #96]
    mov     x0, x9
    b       .L1136
.L267:
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_postfix
    mov     x10, x0
    mov     x0, x10
    b       .L1136
.L1136:
    add     sp, sp, #1232
    ldp     x29, x30, [sp], #16
    ret

    .globl   _bin_prec
_bin_prec:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #592
    str     w0, [sp, #0]
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x0017
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L268
    movz    x9, #0x0008
    mov     x0, x9
    b       .L1137
.L268:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x001a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L269
    movz    x9, #0x0008
    mov     x0, x9
    b       .L1137
.L269:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x002f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L270
    movz    x9, #0x0008
    mov     x0, x9
    b       .L1137
.L270:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x0018
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L271
    movz    x9, #0x0007
    mov     x0, x9
    b       .L1137
.L271:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x0019
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L272
    movz    x9, #0x0007
    mov     x0, x9
    b       .L1137
.L272:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x002b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L273
    movz    x9, #0x0007
    mov     x0, x9
    b       .L1137
.L273:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x002c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L274
    movz    x9, #0x0007
    mov     x0, x9
    b       .L1137
.L274:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x001b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L275
    movz    x9, #0x0006
    mov     x0, x9
    b       .L1137
.L275:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x001d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L276
    movz    x9, #0x0005
    mov     x0, x9
    b       .L1137
.L276:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x001c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L277
    movz    x9, #0x0004
    mov     x0, x9
    b       .L1137
.L277:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x001f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L278
    movz    x9, #0x0003
    mov     x0, x9
    b       .L1137
.L278:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x0020
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L279
    movz    x9, #0x0003
    mov     x0, x9
    b       .L1137
.L279:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x0021
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L280
    movz    x9, #0x0003
    mov     x0, x9
    b       .L1137
.L280:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x0022
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L281
    movz    x9, #0x0003
    mov     x0, x9
    b       .L1137
.L281:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x0023
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L282
    movz    x9, #0x0003
    mov     x0, x9
    b       .L1137
.L282:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x0024
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L283
    movz    x9, #0x0003
    mov     x0, x9
    b       .L1137
.L283:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x0031
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L284
    movz    x9, #0x0002
    mov     x0, x9
    b       .L1137
.L284:
    ldr     w9, [sp, #0]
    mov     w9, w9
    movz    x10, #0x0032
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L285
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1137
.L285:
    mov     x9, #0
    mov     x0, x9
    b       .L1137
.L1137:
    add     sp, sp, #592
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_expr
_parse_expr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1440
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_unary
    mov     x10, x0
    str     x10, [sp, #16]
.L286:
    bl      _ps_kind
    mov     x9, x0
    mov     x0, x9
    bl      _bin_prec
    mov     x10, x0
    ldr     x9, [sp, #8]
    cmp     x10, x9
    cset    w11, hs
    cbz     w11, .L287
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #24]
    ldr     w9, [sp, #24]
    mov     w9, w9
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
    mov     w9, w9
    movz    x10, #0x0017
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L288
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
.L288:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x001a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L289
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0003
    str     x9, [x11]
.L289:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x002f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L290
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0009
    str     x9, [x11]
.L290:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x0018
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L291
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
.L291:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x0019
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L292
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
.L292:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x001b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L293
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0004
    str     x9, [x11]
.L293:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x001d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L294
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0006
    str     x9, [x11]
.L294:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x001c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L295
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0005
    str     x9, [x11]
.L295:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x002b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L296
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0007
    str     x9, [x11]
.L296:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x002c
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L297
    ldr     x9, [sp, #48]
    movz    x10, #0x0040
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
.L297:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x0031
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L298
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x000f
    str     x9, [x11]
.L298:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x0032
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L299
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0010
    str     x9, [x11]
.L299:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x001f
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L300
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0005
    str     x9, [x11]
.L300:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x0020
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L301
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0006
    str     x9, [x11]
.L301:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x0021
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L302
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0007
    str     x9, [x11]
.L302:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x0022
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L303
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
.L303:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x0023
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L304
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x0009
    str     x9, [x11]
.L304:
    ldr     w9, [sp, #24]
    mov     w9, w9
    movz    x10, #0x0024
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L305
    ldr     x9, [sp, #48]
    mov     x10, #0
    add     x11, x9, x10
    movz    x9, #0x000a
    str     x9, [x11]
.L305:
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
    cbz     w11, .L306
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    b       .L307
.L306:
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x16, x9, x10
    str     x16, [sp, #1392]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x17, [sp, #1392]
    str     x11, [x17]
.L307:
    ldr     x9, [sp, #48]
    str     x9, [sp, #16]
    b       .L286
.L287:
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L1138
.L1138:
    add     sp, sp, #1440
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
    b       .L1139
.L1139:
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
    mov     w10, w10
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L308
    adrp    x9, L_str33@PAGE
    add     x9, x9, L_str33@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x0011
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #80]
.L308:
    bl      _ps_advance
    str     x0, [sp, #88]
.L1140:
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
    mov     w10, w10
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L309
    bl      _ps_advance
    str     x0, [sp, #32]
    movz    x9, #0x0001
    mov     w0, w9
    b       .L1141
.L309:
    mov     x9, #0
    mov     w0, w9
    b       .L1141
.L1141:
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
    cbz     w11, .L310
    mov     x9, #0
    mov     w0, w9
    b       .L1142
.L310:
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
    b       .L1142
.L1142:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_type
_parse_type:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #2032
    str     x0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0015
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L311
    bl      _ps_advance
    str     x0, [sp, #272]
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #8]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000f
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L312
    adrp    x9, L_str34@PAGE
    add     x9, x9, L_str34@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0021
    str     x9, [sp, #24]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #344]
.L312:
    ldr     x9, [sp, #8]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L313
    adrp    x9, L_str35@PAGE
    add     x9, x9, L_str35@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0018
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #440]
.L313:
    bl      _ps_advance
    str     x0, [sp, #448]
    movz    x9, #0x0016
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #464]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    str     x10, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _mk_array
    mov     x12, x0
    mov     x0, x12
    b       .L1143
.L311:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0017
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L314
    bl      _ps_advance
    str     x0, [sp, #544]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    str     x10, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ptr
    mov     x11, x0
    mov     x0, x11
    b       .L1143
.L314:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L315
    adrp    x9, L_str36@PAGE
    add     x9, x9, L_str36@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x0010
    str     x9, [sp, #80]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #648]
.L315:
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #88]
    adrp    x9, L_str37@PAGE
    add     x9, x9, L_str37@PAGEOFF
    str     x9, [sp, #96]
    movz    x9, #0x0002
    str     x9, [sp, #104]
    adrp    x9, L_str38@PAGE
    add     x9, x9, L_str38@PAGEOFF
    str     x9, [sp, #112]
    movz    x9, #0x0003
    str     x9, [sp, #120]
    adrp    x9, L_str39@PAGE
    add     x9, x9, L_str39@PAGEOFF
    str     x9, [sp, #128]
    movz    x9, #0x0003
    str     x9, [sp, #136]
    adrp    x9, L_str40@PAGE
    add     x9, x9, L_str40@PAGEOFF
    str     x9, [sp, #144]
    movz    x9, #0x0002
    str     x9, [sp, #152]
    adrp    x9, L_str41@PAGE
    add     x9, x9, L_str41@PAGEOFF
    str     x9, [sp, #160]
    movz    x9, #0x0003
    str     x9, [sp, #168]
    adrp    x9, L_str42@PAGE
    add     x9, x9, L_str42@PAGEOFF
    str     x9, [sp, #176]
    movz    x9, #0x0003
    str     x9, [sp, #184]
    adrp    x9, L_str43@PAGE
    add     x9, x9, L_str43@PAGEOFF
    str     x9, [sp, #192]
    movz    x9, #0x0004
    str     x9, [sp, #200]
    adrp    x9, L_str44@PAGE
    add     x9, x9, L_str44@PAGEOFF
    str     x9, [sp, #208]
    movz    x9, #0x0003
    str     x9, [sp, #216]
    mov     x9, #0
    str     x9, [sp, #224]
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #88]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #96]
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
    cbz     w10, .L316
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #224]
.L316:
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #88]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #112]
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
    cbz     w10, .L317
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #224]
.L317:
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #88]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #128]
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
    cbz     w10, .L318
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #224]
.L318:
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #88]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #144]
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
    cbz     w10, .L319
    ldr     x9, [sp, #0]
    movz    x10, #0x0006
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #224]
.L319:
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #88]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #160]
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
    cbz     w10, .L320
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #224]
.L320:
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #88]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #176]
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
    cbz     w10, .L321
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #224]
.L321:
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #88]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #192]
    movz    x12, #0x0004
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_at
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L322
    ldr     x9, [sp, #0]
    movz    x10, #0x0009
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #224]
.L322:
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #88]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #208]
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
    cbz     w10, .L323
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #224]
.L323:
    ldr     x9, [sp, #224]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L324
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    str     x11, [sp, #224]
    bl      _cur_prog
    mov     x9, x0
    str     x9, [sp, #232]
    ldr     x9, [sp, #232]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L325
    ldr     x9, [sp, #232]
    ldr     x10, [sp, #88]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #88]
    movz    x12, #0x0010
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lookup_struct
    mov     x12, x0
    str     x12, [sp, #240]
    ldr     x9, [sp, #224]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #240]
    str     x9, [x11]
.L325:
.L324:
    bl      _ps_advance
    str     x0, [sp, #2016]
    ldr     x9, [sp, #224]
    mov     x0, x9
    b       .L1143
.L1143:
    add     sp, sp, #2032
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_block
_parse_block:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #560
    str     x0, [sp, #0]
    bl      _cur_func
    mov     x9, x0
    str     x9, [sp, #8]
    mov     x9, #0
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L326
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
.L326:
    movz    x9, #0x0013
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #152]
    mov     x9, #0
    str     x9, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
.L327:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0014
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L328
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_stmt
    mov     x10, x0
    str     x10, [sp, #40]
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L329
    ldr     x9, [sp, #40]
    str     x9, [sp, #24]
    b       .L330
.L329:
    ldr     x9, [sp, #32]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    str     x9, [x11]
.L330:
    ldr     x9, [sp, #40]
    str     x9, [sp, #32]
.L331:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0025
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L332
    bl      _ps_advance
    str     x0, [sp, #312]
    b       .L331
.L332:
    b       .L327
.L328:
    movz    x9, #0x0014
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #328]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L333
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    ldr     x9, [sp, #16]
    str     x9, [sp, #56]
.L334:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #8]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L335
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #64]
    ldr     x9, [sp, #64]
    movz    x10, #0x0018
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L334
.L335:
.L333:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1144
.L1144:
    add     sp, sp, #560
    ldp     x29, x30, [sp], #16
    ret

    .globl   _require_initialized
_require_initialized:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #720
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L336
    b       .L1145
.L336:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L337
    b       .L1145
.L337:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L338
    bl      _cur_func
    mov     x9, x0
    str     x9, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0078
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L339
    adrp    x9, L_str45@PAGE
    add     x9, x9, L_str45@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x0020
    str     x9, [sp, #40]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #376]
.L339:
    b       .L1145
.L338:
    ldr     x9, [sp, #0]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #416]
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #456]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #496]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L340
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    mov     x9, #0
    str     x9, [sp, #56]
.L341:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #0]
    movz    x11, #0x0050
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L342
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #688]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L341
.L342:
.L340:
.L1145:
    add     sp, sp, #720
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_stmt
_parse_stmt:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #2896
    str     x0, [sp, #0]
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #8]
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x0002
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L343
    bl      _ps_advance
    str     x0, [sp, #216]
    adrp    x9, _TOK_CUR@PAGE
    add     x9, x9, _TOK_CUR@PAGEOFF
    str     x9, [sp, #16]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L344
    adrp    x9, L_str46@PAGE
    add     x9, x9, L_str46@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x001a
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #288]
.L344:
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
    str     x0, [sp, #432]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L345
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x16, x9, x10
    str     x16, [sp, #488]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #488]
    str     x10, [x17]
.L345:
    movz    x9, #0x001e
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L346
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L347
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L348
    adrp    x9, L_str47@PAGE
    add     x9, x9, L_str47@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0023
    str     x9, [sp, #56]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #696]
.L348:
.L347:
    ldr     x9, [sp, #40]
    movz    x10, #0x0020
    add     x16, x9, x10
    str     x16, [sp, #720]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #720]
    str     x11, [x17]
    ldr     x9, [sp, #40]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #784]
.L346:
    bl      _cur_func
    mov     x9, x0
    str     x9, [sp, #64]
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L349
    ldr     x9, [sp, #40]
    movz    x10, #0x0058
    add     x16, x9, x10
    str     x16, [sp, #840]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
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
    ldr     x17, [sp, #840]
    str     x14, [x17]
    ldr     x9, [sp, #40]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L350
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #40]
    movz    x11, #0x0058
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _mark_local_initialized
    str     x0, [sp, #1056]
.L350:
.L349:
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L1146
.L343:
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x0004
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L351
    bl      _ps_advance
    str     x0, [sp, #1096]
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #72]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0025
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L352
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0014
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L353
    ldr     x9, [sp, #72]
    movz    x10, #0x0040
    add     x16, x9, x10
    str     x16, [sp, #1192]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #1192]
    str     x11, [x17]
    ldr     x9, [sp, #72]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #1256]
.L353:
.L352:
    ldr     x9, [sp, #72]
    mov     x0, x9
    b       .L1146
.L351:
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x0005
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L354
    bl      _ps_advance
    str     x0, [sp, #1296]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    str     w10, [sp, #80]
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #88]
    ldr     x9, [sp, #88]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #1360]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #1360]
    str     x11, [x17]
    ldr     x9, [sp, #88]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #1424]
    ldr     w9, [sp, #80]
    mov     w9, w9
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L355
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1464]
.L355:
    ldr     x9, [sp, #88]
    movz    x10, #0x0030
    add     x16, x9, x10
    str     x16, [sp, #1488]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1488]
    str     x10, [x17]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0006
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L356
    bl      _ps_advance
    str     x0, [sp, #1536]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0005
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L357
    ldr     x9, [sp, #88]
    movz    x10, #0x0038
    add     x16, x9, x10
    str     x16, [sp, #1584]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_stmt
    mov     x10, x0
    ldr     x17, [sp, #1584]
    str     x10, [x17]
    b       .L358
.L357:
    ldr     x9, [sp, #88]
    movz    x10, #0x0038
    add     x16, x9, x10
    str     x16, [sp, #1624]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1624]
    str     x10, [x17]
.L358:
.L356:
    ldr     x9, [sp, #88]
    mov     x0, x9
    b       .L1146
.L354:
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x0008
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L359
    bl      _ps_advance
    str     x0, [sp, #1680]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    str     w10, [sp, #96]
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #104]
    ldr     x9, [sp, #104]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #1744]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    ldr     x17, [sp, #1744]
    str     x11, [x17]
    ldr     x9, [sp, #104]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #1808]
    ldr     w9, [sp, #96]
    mov     w9, w9
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L360
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1848]
.L360:
    ldr     x9, [sp, #104]
    movz    x10, #0x0030
    add     x16, x9, x10
    str     x16, [sp, #1872]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1872]
    str     x10, [x17]
    ldr     x9, [sp, #104]
    mov     x0, x9
    b       .L1146
.L359:
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x0007
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L361
    bl      _ps_advance
    str     x0, [sp, #1928]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #112]
    ldr     x9, [sp, #112]
    movz    x10, #0x0030
    add     x16, x9, x10
    str     x16, [sp, #1976]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1976]
    str     x10, [x17]
    ldr     x9, [sp, #112]
    mov     x0, x9
    b       .L1146
.L361:
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x0009
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L362
    bl      _ps_advance
    str     x0, [sp, #2032]
    ldr     x9, [sp, #0]
    movz    x10, #0x0006
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    mov     x0, x11
    b       .L1146
.L362:
    ldr     w9, [sp, #8]
    mov     w9, w9
    movz    x10, #0x002d
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L363
    bl      _ps_advance
    str     x0, [sp, #2088]
    ldr     x9, [sp, #0]
    movz    x10, #0x0009
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    mov     x0, x11
    b       .L1146
.L363:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #120]
    movz    x9, #0x001e
    mov     x0, x9
    bl      _ps_accept
    mov     x10, x0
    movz    x9, #0x0001
    cmp     w10, w9
    cset    w11, eq
    cbz     w11, .L364
    ldr     x9, [sp, #120]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L365
    ldr     x9, [sp, #120]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L366
    adrp    x9, L_str48@PAGE
    add     x9, x9, L_str48@PAGEOFF
    str     x9, [sp, #128]
    movz    x9, #0x0020
    str     x9, [sp, #136]
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #2328]
.L366:
.L365:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _parse_expr
    mov     x11, x0
    str     x11, [sp, #144]
    ldr     x9, [sp, #144]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #2368]
    ldr     x9, [sp, #120]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L367
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #152]
    ldr     x9, [sp, #152]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #120]
    movz    x10, #0x0028
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #152]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #144]
    str     x9, [x11]
    ldr     x9, [sp, #152]
    mov     x0, x9
    b       .L1146
.L367:
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #160]
    ldr     x9, [sp, #160]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #120]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #144]
    str     x9, [x11]
    ldr     x9, [sp, #120]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L368
    ldr     x9, [sp, #160]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #120]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    bl      _cur_func
    mov     x9, x0
    str     x9, [sp, #168]
    ldr     x9, [sp, #168]
    ldr     x10, [sp, #120]
    movz    x11, #0x0078
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _mark_local_initialized
    str     x0, [sp, #2784]
    b       .L369
.L368:
    ldr     x9, [sp, #120]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #2800]
.L369:
    ldr     x9, [sp, #160]
    mov     x0, x9
    b       .L1146
.L364:
    ldr     x9, [sp, #120]
    mov     x0, x9
    bl      _require_initialized
    str     x0, [sp, #2824]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _mk_stmt
    mov     x11, x0
    str     x11, [sp, #176]
    ldr     x9, [sp, #176]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #120]
    str     x9, [x11]
    ldr     x9, [sp, #176]
    mov     x0, x9
    b       .L1146
.L1146:
    add     sp, sp, #2896
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
    b       .L1147
.L1147:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse_fun
_parse_fun:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1616
    str     x0, [sp, #0]
    movz    x9, #0x0001
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #112]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L370
    adrp    x9, L_str49@PAGE
    add     x9, x9, L_str49@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x001a
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #176]
.L370:
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
    str     x16, [sp, #504]
    ldr     x9, [sp, #0]
    movz    x10, #0x0800
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    ldr     x17, [sp, #504]
    str     x11, [x17]
    ldr     x9, [sp, #32]
    movz    x10, #0x0040
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #32]
    mov     x0, x9
    bl      _cur_func_set
    str     x0, [sp, #576]
    bl      _ps_advance
    str     x0, [sp, #584]
    movz    x9, #0x0011
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #600]
    mov     x9, #0
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L371:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L372
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L373
    adrp    x9, L_str50@PAGE
    add     x9, x9, L_str50@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0020
    str     x9, [sp, #64]
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #704]
.L373:
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
    str     x0, [sp, #888]
    movz    x9, #0x0027
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #904]
    ldr     x9, [sp, #80]
    movz    x10, #0x0010
    add     x16, x9, x10
    str     x16, [sp, #928]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #928]
    str     x10, [x17]
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L374
    ldr     x9, [sp, #80]
    str     x9, [sp, #40]
    b       .L375
.L374:
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
.L375:
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
    cbz     w11, .L376
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
    b       .L377
.L376:
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
.L377:
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
    mov     x14, x0
    str     x14, [sp, #96]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    bl      _mark_local_initialized
    str     x0, [sp, #1384]
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0012
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L378
    movz    x9, #0x0026
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1424]
.L378:
    b       .L371
.L372:
    movz    x9, #0x0012
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #1440]
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
    cbz     w11, .L379
    bl      _ps_advance
    str     x0, [sp, #1504]
    ldr     x9, [sp, #32]
    movz    x10, #0x0020
    add     x16, x9, x10
    str     x16, [sp, #1528]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_type
    mov     x10, x0
    ldr     x17, [sp, #1528]
    str     x10, [x17]
.L379:
    ldr     x9, [sp, #32]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #1568]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_block
    mov     x10, x0
    ldr     x17, [sp, #1568]
    str     x10, [x17]
    mov     x9, #0
    mov     x0, x9
    bl      _cur_func_set
    str     x0, [sp, #1600]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L1148
.L1148:
    add     sp, sp, #1616
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
    cbz     w11, .L380
    adrp    x9, L_str51@PAGE
    add     x9, x9, L_str51@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x001c
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #136]
.L380:
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
    cbz     w11, .L381
    adrp    x9, L_str52@PAGE
    add     x9, x9, L_str52@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x001b
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #456]
.L381:
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
    b       .L1149
.L1149:
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
    cbz     w11, .L382
    adrp    x9, L_str53@PAGE
    add     x9, x9, L_str53@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x001a
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #136]
.L382:
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
    cbz     w11, .L383
    adrp    x9, L_str54@PAGE
    add     x9, x9, L_str54@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0014
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #400]
.L383:
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
    b       .L1150
.L1150:
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
    cbz     w11, .L384
    adrp    x9, L_str55@PAGE
    add     x9, x9, L_str55@PAGEOFF
    str     x9, [sp, #8]
    movz    x9, #0x001d
    str     x9, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #176]
.L384:
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
    cbz     w11, .L385
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L386
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
    b       .L387
.L386:
    ldr     x9, [sp, #40]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
.L388:
    ldr     x9, [sp, #48]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L389
    ldr     x9, [sp, #48]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    b       .L388
.L389:
    ldr     x9, [sp, #48]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    str     x9, [x11]
.L387:
.L385:
    movz    x9, #0x0013
    mov     x0, x9
    bl      _ps_expect
    str     x0, [sp, #696]
    mov     x9, #0
    str     x9, [sp, #56]
    mov     x9, #0
    str     x9, [sp, #64]
.L390:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0014
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L391
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x000e
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L392
    adrp    x9, L_str56@PAGE
    add     x9, x9, L_str56@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x001c
    str     x9, [sp, #80]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    bl      _die_here
    str     x0, [sp, #800]
.L392:
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
    cbz     w11, .L393
    ldr     x9, [sp, #96]
    str     x9, [sp, #56]
    b       .L394
.L393:
    ldr     x9, [sp, #64]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
.L394:
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
    cbz     w11, .L395
    bl      _ps_advance
    str     x0, [sp, #1248]
.L395:
    b       .L390
.L391:
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
    b       .L1151
.L1151:
    add     sp, sp, #1312
    ldp     x29, x30, [sp], #16
    ret

    .globl   _resolve_call_types_expr
_resolve_call_types_expr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #912
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L396
    b       .L1152
.L396:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L397
    adrp    x9, L_str57@PAGE
    add     x9, x9, L_str57@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0007
    str     x9, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    movz    x11, #0x0060
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #16]
    movz    x12, #0x0007
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_at
    mov     x13, x0
    mov     x9, #0
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L398
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
.L399:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L400
    ldr     x9, [sp, #32]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0058
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #8]
    movz    x13, #0x0060
    add     x14, x12, x13
    ldr     x12, [x14]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _bytes_eq_off
    mov     x13, x0
    movz    x9, #0x0001
    cmp     w13, w9
    cset    w10, eq
    cbz     w10, .L401
    ldr     x9, [sp, #32]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L402
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #32]
    movz    x10, #0x0020
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
.L402:
    b       .L400
.L401:
    ldr     x9, [sp, #32]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L399
.L400:
.L398:
    mov     x9, #0
    str     x9, [sp, #40]
.L403:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #8]
    movz    x11, #0x0050
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L404
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #40]
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x10, x13
    ldr     x10, [x11]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_expr
    str     x0, [sp, #736]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L403
.L404:
.L397:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_expr
    str     x0, [sp, #808]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_expr
    str     x0, [sp, #856]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_expr
    str     x0, [sp, #904]
.L1152:
    add     sp, sp, #912
    ldp     x29, x30, [sp], #16
    ret

    .globl   _resolve_call_types_stmt
_resolve_call_types_stmt:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #384
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    str     x9, [sp, #16]
.L405:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L406
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0020
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_expr
    str     x0, [sp, #96]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_expr
    str     x0, [sp, #144]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_expr
    str     x0, [sp, #192]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_expr
    str     x0, [sp, #240]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_stmt
    str     x0, [sp, #288]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_stmt
    str     x0, [sp, #336]
    ldr     x9, [sp, #16]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    b       .L405
.L406:
.L1153:
    add     sp, sp, #384
    ldp     x29, x30, [sp], #16
    ret

    .globl   _parse
_parse:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1120
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _ps_init
    str     x0, [sp, #128]
    bl      _str_table_init
    str     x0, [sp, #136]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _mk_program
    mov     x10, x0
    str     x10, [sp, #24]
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _cur_prog_set
    str     x0, [sp, #168]
    mov     x9, #0
    str     x9, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L407:
    bl      _ps_kind
    mov     x9, x0
    mov     x10, #0
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L408
.L409:
    bl      _ps_kind
    mov     x9, x0
    movz    x10, #0x0025
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L410
    bl      _ps_advance
    str     x0, [sp, #248]
    b       .L409
.L410:
    bl      _ps_kind
    mov     x9, x0
    mov     x10, #0
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L411
    b       .L408
.L411:
    bl      _ps_kind
    mov     x9, x0
    str     w9, [sp, #56]
    ldr     w9, [sp, #56]
    mov     w9, w9
    movz    x10, #0x0001
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L412
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
    cbz     w11, .L413
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    b       .L414
.L413:
    ldr     x9, [sp, #32]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
.L414:
    ldr     x9, [sp, #64]
    str     x9, [sp, #32]
.L412:
    ldr     w9, [sp, #56]
    mov     w9, w9
    movz    x10, #0x0003
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L415
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
    cbz     w11, .L416
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    b       .L417
.L416:
    ldr     x9, [sp, #40]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
.L417:
    ldr     x9, [sp, #72]
    str     x9, [sp, #40]
.L415:
    ldr     w9, [sp, #56]
    mov     w9, w9
    movz    x10, #0x000b
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L418
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
    cbz     w11, .L419
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
    b       .L420
.L419:
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
.L420:
    ldr     x9, [sp, #80]
    str     x9, [sp, #48]
.L418:
    ldr     w9, [sp, #56]
    mov     w9, w9
    movz    x10, #0x000a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L421
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _parse_struct_decl
    str     x0, [sp, #800]
.L421:
    b       .L407
.L408:
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
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #104]
.L422:
    ldr     x9, [sp, #104]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L423
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #104]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _resolve_call_types_stmt
    str     x0, [sp, #1064]
    ldr     x9, [sp, #104]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #104]
    b       .L422
.L423:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1154
.L1154:
    add     sp, sp, #1120
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
    b       .L1155
.L1155:
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
    cbz     w11, .L424
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L1156
.L424:
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    mov     x0, x10
    b       .L1156
.L1156:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_ins
_mk_ins:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #576
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0080
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
    mov     x0, x9
    b       .L1157
.L1157:
    add     sp, sp, #576
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
    b       .L1158
.L1158:
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
    cbz     w11, .L425
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
    b       .L1159
.L425:
    ldr     x9, [sp, #0]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    ldr     x9, [sp, #16]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    str     x9, [x11]
.L1159:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _mk_builder
_mk_builder:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #480
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0050
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
    ldr     x9, [sp, #0]
    movz    x10, #0x0080
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #40]
    ldr     x9, [sp, #16]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [sp, #40]
    str     x9, [x11]
    ldr     x9, [sp, #16]
    movz    x10, #0x0048
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L1160
.L1160:
    add     sp, sp, #480
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
    cbz     w11, .L426
    ldr     x9, [sp, #0]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
.L426:
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
    b       .L1161
.L1161:
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
    b       .L1162
.L1162:
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
.L1163:
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
.L1164:
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
.L1165:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_expr
_lower_expr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    movz    x16, #0x1c50
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
    cbz     w11, .L427
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
    str     x0, [sp, #664]
    ldr     x9, [sp, #16]
    mov     x0, x9
    b       .L1166
.L427:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L428
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
    str     x16, [sp, #960]
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
    ldr     x17, [sp, #960]
    str     x11, [x17]
    ldr     x9, [sp, #40]
    movz    x10, #0x0070
    add     x16, x9, x10
    str     x16, [sp, #1072]
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #8]
    movz    x11, #0x0078
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    bl      _type_is_signed
    mov     x10, x0
    ldr     x17, [sp, #1072]
    str     x10, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1200]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L1166
.L428:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L429
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
    str     x0, [sp, #1488]
    ldr     x9, [sp, #56]
    mov     x0, x9
    b       .L1166
.L429:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000f
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L430
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_logical
    mov     x12, x0
    mov     x0, x12
    b       .L1166
.L430:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L431
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0001
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_logical
    mov     x12, x0
    mov     x0, x12
    b       .L1166
.L431:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L432
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
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L433
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    str     x11, [sp, #88]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_is_signed
    mov     x10, x0
    str     x10, [sp, #96]
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
    movz    x10, #0x0007
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
    ldr     x9, [sp, #112]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #112]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
    ldr     x9, [sp, #112]
    movz    x10, #0x0048
    add     x11, x9, x10
    movz    x9, #0x0003
    str     x9, [x11]
    ldr     x9, [sp, #112]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    str     x9, [x11]
    ldr     x9, [sp, #112]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #2272]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #120]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #128]
    ldr     x9, [sp, #128]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #120]
    str     x9, [x11]
    ldr     x9, [sp, #128]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #104]
    str     x9, [x11]
    ldr     x9, [sp, #128]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
    ldr     x9, [sp, #128]
    movz    x10, #0x0048
    add     x11, x9, x10
    movz    x9, #0x0002
    str     x9, [x11]
    ldr     x9, [sp, #128]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    str     x9, [x11]
    ldr     x9, [sp, #128]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #2608]
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
    movz    x10, #0x0007
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
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #144]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #120]
    str     x9, [x11]
    ldr     x9, [sp, #144]
    movz    x10, #0x0048
    add     x11, x9, x10
    movz    x9, #0x0001
    str     x9, [x11]
    ldr     x9, [sp, #144]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [sp, #88]
    str     x9, [x11]
    ldr     x9, [sp, #144]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [sp, #96]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #144]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #2944]
    ldr     x9, [sp, #136]
    mov     x0, x9
    b       .L1166
.L433:
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
    movz    x10, #0x0007
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
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #80]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #160]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #3224]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #3224]
    str     x11, [x17]
    ldr     x9, [sp, #160]
    movz    x10, #0x0070
    add     x16, x9, x10
    str     x16, [sp, #3296]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_is_signed
    mov     x10, x0
    ldr     x17, [sp, #3296]
    str     x10, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #3384]
    ldr     x9, [sp, #152]
    mov     x0, x9
    b       .L1166
.L432:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L434
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #168]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #176]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0013
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #184]
    ldr     x9, [sp, #184]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #176]
    str     x9, [x11]
    ldr     x9, [sp, #184]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #168]
    str     x9, [x11]
    ldr     x9, [sp, #184]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #3672]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #3672]
    str     x11, [x17]
    ldr     x9, [sp, #184]
    movz    x10, #0x0070
    add     x16, x9, x10
    str     x16, [sp, #3744]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_is_signed
    mov     x10, x0
    ldr     x17, [sp, #3744]
    str     x10, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #184]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #3832]
    ldr     x9, [sp, #176]
    mov     x0, x9
    b       .L1166
.L434:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L435
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L1166
.L435:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L436
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0009
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L1166
.L436:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L437
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000a
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L1166
.L437:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L438
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000b
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L1166
.L438:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L439
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000c
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L1166
.L439:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L440
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x000d
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _lower_cmp
    mov     x12, x0
    mov     x0, x12
    b       .L1166
.L440:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L441
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #192]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #200]
    ldr     x9, [sp, #200]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #192]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #208]
    ldr     x9, [sp, #200]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #208]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #200]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #4632]
    ldr     x9, [sp, #192]
    mov     x0, x9
    b       .L1166
.L441:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L442
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #216]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #224]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #232]
    ldr     x9, [sp, #232]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #224]
    str     x9, [x11]
    ldr     x9, [sp, #232]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #216]
    str     x9, [x11]
    ldr     x9, [sp, #232]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #4920]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #4920]
    str     x11, [x17]
    ldr     x9, [sp, #232]
    movz    x10, #0x0070
    add     x16, x9, x10
    str     x16, [sp, #4992]
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_is_signed
    mov     x10, x0
    ldr     x17, [sp, #4992]
    str     x10, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #232]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #5080]
    ldr     x9, [sp, #224]
    mov     x0, x9
    b       .L1166
.L442:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L443
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #240]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
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
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #248]
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
    ldr     x10, [sp, #248]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #5424]
    ldr     x9, [sp, #240]
    mov     x0, x9
    b       .L1166
.L443:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L444
    ldr     x9, [sp, #8]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #256]
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #264]
    ldr     x9, [sp, #256]
    movz    x10, #0x0010
    mul     x11, x9, x10
    str     x11, [sp, #272]
    ldr     x9, [sp, #272]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L445
    movz    x9, #0x0008
    str     x9, [sp, #272]
.L445:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #272]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #280]
    mov     x9, #0
    str     x9, [sp, #288]
    mov     x9, #0
    str     x9, [sp, #296]
.L446:
    ldr     x9, [sp, #296]
    ldr     x10, [sp, #256]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L447
    ldr     x9, [sp, #264]
    ldr     x10, [sp, #296]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #304]
    mov     x9, #0
    str     x9, [sp, #312]
    ldr     x9, [sp, #304]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #320]
    ldr     x9, [sp, #320]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L448
    ldr     x9, [sp, #320]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L449
    ldr     x9, [sp, #304]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L450
    movz    x9, #0x0001
    str     x9, [sp, #312]
.L450:
.L449:
.L448:
    ldr     x9, [sp, #312]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L451
    ldr     x16, [sp, #0]
    str     x16, [sp, #5936]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x16, [x11]
    str     x16, [sp, #5968]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #5968]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x0, [sp, #5936]
    mov     x1, x9
    bl      _ir_new_slot
    mov     x10, x0
    str     x10, [sp, #328]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #336]
    ldr     x9, [sp, #336]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #328]
    str     x9, [x11]
    ldr     x9, [sp, #336]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #304]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #336]
    movz    x10, #0x0028
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #336]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #6248]
    ldr     x9, [sp, #280]
    ldr     x10, [sp, #288]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #328]
    str     x9, [x10]
    ldr     x9, [sp, #288]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #288]
    ldr     x16, [sp, #0]
    str     x16, [sp, #6328]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #6328]
    mov     x1, x11
    bl      _ir_new_slot
    mov     x9, x0
    str     x9, [sp, #344]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #352]
    ldr     x9, [sp, #352]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #344]
    str     x9, [x11]
    ldr     x9, [sp, #352]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [sp, #304]
    movz    x10, #0x0078
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    add     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #352]
    movz    x10, #0x0028
    add     x11, x9, x10
    movz    x9, #0x0008
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #352]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #6616]
    ldr     x9, [sp, #280]
    ldr     x10, [sp, #288]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #344]
    str     x9, [x10]
    ldr     x9, [sp, #288]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #288]
    b       .L452
.L451:
    ldr     x9, [sp, #280]
    ldr     x10, [sp, #288]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x16, x9, x12
    str     x16, [sp, #6728]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #304]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    ldr     x17, [sp, #6728]
    str     x11, [x17]
    ldr     x9, [sp, #288]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #288]
.L452:
    ldr     x9, [sp, #296]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #296]
    b       .L446
.L447:
    ldr     x9, [sp, #288]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L453
    adrp    x9, L_str58@PAGE
    add     x9, x9, L_str58@PAGEOFF
    str     x9, [sp, #360]
    movz    x9, #0x0016
    str     x9, [sp, #368]
    ldr     x9, [sp, #360]
    ldr     x10, [sp, #368]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #6872]
.L453:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #376]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #384]
    ldr     x9, [sp, #384]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #376]
    str     x9, [x11]
    ldr     x9, [sp, #384]
    movz    x10, #0x0050
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #384]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    movz    x10, #0x0060
    add     x12, x9, x10
    ldr     x9, [x12]
    str     x9, [x11]
    ldr     x9, [sp, #384]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [sp, #280]
    str     x9, [x11]
    ldr     x9, [sp, #384]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [sp, #288]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #384]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #7224]
    ldr     x9, [sp, #376]
    mov     x0, x9
    b       .L1166
.L444:
    mov     x9, #0
    mov     x0, x9
    b       .L1166
.L1166:
    movz    x16, #0x1c50
    add     sp, sp, x16
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_logical
_lower_logical:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1184
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #32]
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #304]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #40]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _ir_new_label
    mov     x10, x0
    str     x10, [sp, #48]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L454
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _ir_new_label
    mov     x10, x0
    str     x10, [sp, #56]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ir_emit_jz
    str     x0, [sp, #440]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_jmp
    str     x0, [sp, #464]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #488]
    b       .L455
.L454:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _ir_emit_jz
    str     x0, [sp, #520]
.L455:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    mov     x11, x0
    str     x11, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_new_slot
    mov     x11, x0
    str     x11, [sp, #72]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #80]
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #80]
    movz    x10, #0x0030
    add     x11, x9, x10
    mov     x9, #0
    str     x9, [x11]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #776]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    mov     x0, x9
    mov     x1, x10
    bl      _mk_ins
    mov     x11, x0
    str     x11, [sp, #88]
    ldr     x9, [sp, #88]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    str     x9, [x11]
    ldr     x9, [sp, #88]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [sp, #64]
    str     x9, [x11]
    ldr     x9, [sp, #88]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [sp, #72]
    str     x9, [x11]
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #96]
    ldr     x9, [sp, #88]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #976]
    ldr     x9, [sp, #96]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #976]
    str     x11, [x17]
    ldr     x9, [sp, #88]
    movz    x10, #0x0070
    add     x16, x9, x10
    str     x16, [sp, #1048]
    ldr     x9, [sp, #96]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_is_signed
    mov     x10, x0
    ldr     x17, [sp, #1048]
    str     x10, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #1136]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #1160]
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1167
.L1167:
    add     sp, sp, #1184
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_cmp
_lower_cmp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #576
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
    ldr     x9, [sp, #48]
    movz    x10, #0x0070
    add     x16, x9, x10
    str     x16, [sp, #472]
    ldr     x9, [sp, #56]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _type_is_signed
    mov     x10, x0
    ldr     x17, [sp, #472]
    str     x10, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #560]
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L1168
.L1168:
    add     sp, sp, #576
    ldp     x29, x30, [sp], #16
    ret

    .globl   _lower_stmt
_lower_stmt:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    movz    x16, #0x16b0
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
    cbz     w11, .L456
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L457
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
    cbz     w11, .L458
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L459
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
    cbz     w11, .L460
    movz    x9, #0x0001
    str     x9, [sp, #32]
.L460:
.L459:
.L458:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L461
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    ldr     x16, [sp, #0]
    str     x16, [sp, #792]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x16, [x11]
    str     x16, [sp, #824]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #824]
    mov     x1, x11
    bl      _mk_ptr
    mov     x9, x0
    ldr     x0, [sp, #792]
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
    str     x0, [sp, #1072]
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
    str     x0, [sp, #1288]
    ldr     x16, [sp, #0]
    str     x16, [sp, #1296]
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    mov     x0, x9
    mov     x1, x10
    bl      _mk_prim
    mov     x11, x0
    ldr     x0, [sp, #1296]
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
    str     x0, [sp, #1536]
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
    str     x0, [sp, #1768]
    b       .L1169
.L461:
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
    str     x16, [sp, #1976]
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #1976]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #2048]
.L457:
    b       .L1169
.L456:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L462
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L463
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
    str     x16, [sp, #2384]
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
    ldr     x17, [sp, #2384]
    str     x11, [x17]
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #2520]
.L463:
    b       .L1169
.L462:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L464
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
    cbz     w11, .L465
    ldr     x9, [sp, #176]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L466
    ldr     x9, [sp, #160]
    movz    x10, #0x0028
    add     x16, x9, x10
    str     x16, [sp, #2968]
    ldr     x9, [sp, #176]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    mov     x0, x9
    mov     x1, x10
    bl      _ir_width_of
    mov     x11, x0
    ldr     x17, [sp, #2968]
    str     x11, [x17]
.L466:
.L465:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit
    str     x0, [sp, #3064]
    b       .L1169
.L464:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L467
    ldr     x9, [sp, #8]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L468
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
    str     x0, [sp, #3336]
    b       .L1169
.L468:
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
    str     x0, [sp, #3496]
    b       .L1169
.L467:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L469
    ldr     x9, [sp, #8]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L470
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_expr
    str     x0, [sp, #3640]
.L470:
    b       .L1169
.L469:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L471
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
    str     x0, [sp, #3784]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0030
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_block
    str     x0, [sp, #3832]
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L472
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #3904]
    b       .L1169
.L472:
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
    str     x0, [sp, #3944]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #216]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #3968]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0038
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _lower_block
    str     x0, [sp, #4016]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #224]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #4040]
    b       .L1169
.L471:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L473
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
    str     x0, [sp, #4144]
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
    str     x0, [sp, #4224]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #256]
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #264]
    ldr     x9, [sp, #256]
    ldr     x10, [sp, #0]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #240]
    str     x9, [x10]
    ldr     x9, [sp, #264]
    ldr     x10, [sp, #0]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #232]
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
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
    str     x0, [sp, #4552]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
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
    str     x0, [sp, #4648]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #240]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #4672]
    b       .L1169
.L473:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L474
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _ir_new_label
    mov     x10, x0
    str     x10, [sp, #272]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _ir_new_label
    mov     x10, x0
    str     x10, [sp, #280]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #272]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #4776]
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #288]
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #296]
    ldr     x9, [sp, #288]
    ldr     x10, [sp, #0]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #280]
    str     x9, [x10]
    ldr     x9, [sp, #296]
    ldr     x10, [sp, #0]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #272]
    str     x9, [x10]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
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
    str     x0, [sp, #5104]
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x12, x9, x10
    ldr     x9, [x12]
    movz    x10, #0x0001
    sub     x12, x9, x10
    str     x12, [x11]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #272]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_jmp
    str     x0, [sp, #5200]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #280]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_label
    str     x0, [sp, #5224]
    b       .L1169
.L474:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L475
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L476
    adrp    x9, L_str59@PAGE
    add     x9, x9, L_str59@PAGEOFF
    str     x9, [sp, #304]
    movz    x9, #0x0013
    str     x9, [sp, #312]
    ldr     x9, [sp, #304]
    ldr     x10, [sp, #312]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #5368]
.L476:
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #320]
    ldr     x9, [sp, #320]
    ldr     x10, [sp, #0]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0001
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #328]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #328]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_jmp
    str     x0, [sp, #5512]
    b       .L1169
.L475:
    ldr     x9, [sp, #8]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L477
    ldr     x9, [sp, #0]
    movz    x10, #0x0048
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L478
    adrp    x9, L_str60@PAGE
    add     x9, x9, L_str60@PAGEOFF
    str     x9, [sp, #336]
    movz    x9, #0x0016
    str     x9, [sp, #344]
    ldr     x9, [sp, #336]
    ldr     x10, [sp, #344]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #5656]
.L478:
    ldr     x9, [sp, #0]
    movz    x10, #0x0040
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #352]
    ldr     x9, [sp, #352]
    ldr     x10, [sp, #0]
    movz    x11, #0x0048
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0001
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #360]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #360]
    mov     x0, x9
    mov     x1, x10
    bl      _ir_emit_jmp
    str     x0, [sp, #5800]
    b       .L1169
.L477:
.L1169:
    movz    x16, #0x16b0
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
.L479:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L480
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
    b       .L479
.L480:
.L1170:
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
.L481:
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L482
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
    b       .L481
.L482:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #80]
    ldr     x9, [sp, #80]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L483
    movz    x9, #0x0008
    str     x9, [sp, #80]
.L483:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #88]
    mov     x9, #0
    str     x9, [sp, #64]
.L484:
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L485
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
    b       .L484
.L485:
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
    b       .L1171
.L1171:
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
.L486:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L487
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #8]
    ldr     x9, [sp, #16]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    b       .L486
.L487:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L1172
.L1172:
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
    cbz     w11, .L488
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L488:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L489
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L489:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L490
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L490:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L491
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L491:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L492
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L492:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L493
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L493:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L494
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L494:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L495
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L495:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L496
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L496:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L497
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L497:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L498
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L498:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L499
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L499:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L500
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1173
.L500:
    mov     x9, #0
    mov     x0, x9
    b       .L1173
.L1173:
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
    cbz     w11, .L501
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
    b       .L1174
.L501:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L502
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
    b       .L1174
.L502:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L503
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
    b       .L1174
.L503:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L504
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
    b       .L1174
.L504:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L505
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
    b       .L1174
.L505:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L506
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
    b       .L1174
.L506:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L507
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
    b       .L1174
.L507:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L508
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
    b       .L1174
.L508:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L509
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
    b       .L1174
.L509:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L510
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
    b       .L1174
.L510:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L511
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
    b       .L1174
.L511:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000f
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L512
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L513
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
    b       .L1174
.L513:
    mov     x9, #0
    mov     x0, x9
    b       .L1174
.L512:
    ldr     x9, [sp, #0]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L514
    mov     x9, #0
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L515:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #0]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L516
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
    b       .L515
.L516:
    ldr     x9, [sp, #0]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    b       .L1174
.L514:
    mov     x9, #0
    mov     x0, x9
    b       .L1174
.L1174:
    add     sp, sp, #2496
    ldp     x29, x30, [sp], #16
    ret

    .globl   _regalloc
_regalloc:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #3920
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
    cbz     w11, .L517
    movz    x9, #0x0008
    str     x9, [sp, #32]
.L517:
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
.L518:
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L519
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
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    b       .L518
.L519:
    ldr     x9, [sp, #24]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #64]
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L520
    movz    x9, #0x0008
    str     x9, [sp, #64]
.L520:
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
.L521:
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L522
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
    b       .L521
.L522:
    ldr     x9, [sp, #16]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #104]
    ldr     x9, [sp, #104]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L523
    movz    x9, #0x0008
    str     x9, [sp, #104]
.L523:
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
.L524:
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L525
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
    cbz     w11, .L526
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
.L526:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #128]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L527
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
.L527:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #128]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L528
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
.L528:
    ldr     x9, [sp, #128]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #128]
    b       .L524
.L525:
    ldr     x9, [sp, #0]
    movz    x10, #0x0080
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #136]
    ldr     x9, [sp, #16]
    str     x9, [sp, #128]
.L529:
    ldr     x9, [sp, #128]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L530
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
.L531:
    ldr     x9, [sp, #152]
    ldr     x10, [sp, #144]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L532
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
    cbz     w11, .L533
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #160]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #128]
    str     x9, [x10]
.L533:
    ldr     x9, [sp, #152]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #152]
    b       .L531
.L532:
    b       .L529
.L530:
    mov     x9, #0
    str     x9, [sp, #128]
.L534:
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L535
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
    cmp     x10, x9
    cset    w11, ne
    cbz     w11, .L536
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
    cbz     w11, .L537
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #176]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #128]
    str     x9, [x10]
.L537:
.L536:
    ldr     x9, [sp, #128]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #128]
    b       .L534
.L535:
    mov     x9, #0
    str     x9, [sp, #96]
.L538:
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L539
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L540
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L541
    mov     x9, #0
    str     x9, [sp, #184]
.L542:
    ldr     x9, [sp, #184]
    ldr     x10, [sp, #120]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L543
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
    cbz     w11, .L544
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #96]
    movz    x12, #0x0008
    mul     x13, x11, x12
    add     x11, x10, x13
    ldr     x10, [x11]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L545
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #96]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0001
    str     x9, [x10]
.L545:
.L544:
    ldr     x9, [sp, #184]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #184]
    b       .L542
.L543:
.L541:
.L540:
    ldr     x9, [sp, #96]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #96]
    b       .L538
.L539:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    bl      _arena_take
    mov     x11, x0
    str     x11, [sp, #200]
    mov     x9, #0
    str     x9, [sp, #96]
.L546:
    ldr     x9, [sp, #96]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L547
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
    b       .L546
.L547:
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
.L548:
    ldr     x9, [sp, #224]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L549
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
    b       .L548
.L549:
    mov     x9, #0
    str     x9, [sp, #128]
.L550:
    ldr     x9, [sp, #128]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L551
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
    cmp     x10, x9
    cset    w11, ne
    cbz     w11, .L552
    ldr     x9, [sp, #232]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #240]
    ldr     x9, [sp, #240]
    ldr     x10, [sp, #208]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L553
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #240]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L554
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #240]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L555
    mov     x9, #0
    str     x9, [sp, #248]
    movz    x9, #0x0007
    str     x9, [sp, #256]
.L556:
    ldr     x9, [sp, #248]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L557
    ldr     x9, [sp, #216]
    ldr     x10, [sp, #248]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L558
    ldr     x9, [sp, #256]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L559
    ldr     x9, [sp, #248]
    str     x9, [sp, #256]
.L559:
.L558:
    ldr     x9, [sp, #248]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #248]
    b       .L556
.L557:
    ldr     x9, [sp, #256]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L560
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
.L560:
.L555:
.L554:
.L553:
.L552:
    ldr     x9, [sp, #232]
    ldr     x10, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    bl      _collect_uses
    mov     x11, x0
    str     x11, [sp, #264]
    mov     x9, #0
    str     x9, [sp, #272]
.L561:
    ldr     x9, [sp, #272]
    ldr     x10, [sp, #264]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L562
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
    cbz     w11, .L563
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
    cbz     w11, .L564
    ldr     x9, [sp, #216]
    ldr     x10, [sp, #288]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    movz    x9, #0x0001
    str     x9, [x10]
.L564:
.L563:
    ldr     x9, [sp, #272]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #272]
    b       .L561
.L562:
    ldr     x9, [sp, #128]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #128]
    b       .L550
.L551:
.L1175:
    add     sp, sp, #3920
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
.L1176:
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
.L565:
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L566
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
    cbz     w11, .L567
    ldr     x9, [sp, #48]
    str     x9, [sp, #24]
    ldr     x9, [sp, #48]
    str     x9, [sp, #32]
    b       .L568
.L567:
    ldr     x9, [sp, #32]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [sp, #48]
    str     x9, [x11]
    ldr     x9, [sp, #48]
    str     x9, [sp, #32]
.L568:
    ldr     x9, [sp, #40]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    b       .L565
.L566:
    ldr     x9, [sp, #24]
    mov     x0, x9
    b       .L1177
.L1177:
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
.L569:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L570
    adrp    x9, L_str61@PAGE
    add     x9, x9, L_str61@PAGEOFF
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
    adrp    x9, L_str62@PAGE
    add     x9, x9, L_str62@PAGEOFF
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
    adrp    x9, L_str63@PAGE
    add     x9, x9, L_str63@PAGEOFF
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
    adrp    x9, L_str64@PAGE
    add     x9, x9, L_str64@PAGEOFF
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
.L571:
    ldr     x9, [sp, #96]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L572
    adrp    x9, L_str65@PAGE
    add     x9, x9, L_str65@PAGEOFF
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
    adrp    x9, L_str66@PAGE
    add     x9, x9, L_str66@PAGEOFF
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
    adrp    x9, L_str67@PAGE
    add     x9, x9, L_str67@PAGEOFF
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
    adrp    x9, L_str68@PAGE
    add     x9, x9, L_str68@PAGEOFF
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
    adrp    x9, L_str69@PAGE
    add     x9, x9, L_str69@PAGEOFF
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
    adrp    x9, L_str70@PAGE
    add     x9, x9, L_str70@PAGEOFF
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
    adrp    x9, L_str71@PAGE
    add     x9, x9, L_str71@PAGEOFF
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
    adrp    x9, L_str72@PAGE
    add     x9, x9, L_str72@PAGEOFF
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
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #96]
    b       .L571
.L572:
    ldr     x9, [sp, #24]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L569
.L570:
.L1178:
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
.L1179:
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
    b       .L1180
.L1180:
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
.L1181:
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
.L1182:
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
.L1183:
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
.L1184:
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
    cbz     w11, .L573
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #64]
    b       .L1185
.L573:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #88]
.L1185:
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
    cbz     w11, .L574
    adrp    x9, L_str73@PAGE
    add     x9, x9, L_str73@PAGEOFF
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
    b       .L1186
.L574:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L575
    adrp    x9, L_str74@PAGE
    add     x9, x9, L_str74@PAGEOFF
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
    b       .L1186
.L575:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L576
    adrp    x9, L_str75@PAGE
    add     x9, x9, L_str75@PAGEOFF
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
    b       .L1186
.L576:
    adrp    x9, L_str76@PAGE
    add     x9, x9, L_str76@PAGEOFF
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
.L1186:
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
    adrp    x9, L_str77@PAGE
    add     x9, x9, L_str77@PAGEOFF
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
    adrp    x9, L_str78@PAGE
    add     x9, x9, L_str78@PAGEOFF
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
.L1187:
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
    adrp    x9, L_str79@PAGE
    add     x9, x9, L_str79@PAGEOFF
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
    adrp    x9, L_str80@PAGE
    add     x9, x9, L_str80@PAGEOFF
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
.L1188:
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
    cbz     w11, .L577
    adrp    x9, L_str81@PAGE
    add     x9, x9, L_str81@PAGEOFF
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
    adrp    x9, L_str82@PAGE
    add     x9, x9, L_str82@PAGEOFF
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
    b       .L1189
.L577:
    movz    x9, #0x0004
    str     x9, [sp, #112]
    mov     x9, #0
    str     x9, [sp, #120]
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L578
    mov     x9, #0
    str     x9, [sp, #112]
    ldr     x9, [sp, #32]
    str     x9, [sp, #120]
.L578:
    ldr     x9, [sp, #112]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L579
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L580
    movz    x9, #0x0001
    str     x9, [sp, #112]
    ldr     x9, [sp, #48]
    str     x9, [sp, #120]
.L580:
.L579:
    ldr     x9, [sp, #112]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L581
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L582
    movz    x9, #0x0002
    str     x9, [sp, #112]
    ldr     x9, [sp, #64]
    str     x9, [sp, #120]
.L582:
.L581:
    ldr     x9, [sp, #112]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L583
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L584
    movz    x9, #0x0003
    str     x9, [sp, #112]
    ldr     x9, [sp, #72]
    str     x9, [sp, #120]
.L584:
.L583:
    adrp    x9, L_str83@PAGE
    add     x9, x9, L_str83@PAGEOFF
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
    adrp    x9, L_str84@PAGE
    add     x9, x9, L_str84@PAGEOFF
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
    cbz     w11, .L585
    adrp    x9, L_str85@PAGE
    add     x9, x9, L_str85@PAGEOFF
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
.L585:
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
.L586:
    ldr     x9, [sp, #176]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L587
    mov     x9, #0
    str     x9, [sp, #184]
    ldr     x9, [sp, #176]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L588
    ldr     x9, [sp, #48]
    str     x9, [sp, #184]
.L588:
    ldr     x9, [sp, #176]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L589
    ldr     x9, [sp, #64]
    str     x9, [sp, #184]
.L589:
    ldr     x9, [sp, #176]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L590
    ldr     x9, [sp, #72]
    str     x9, [sp, #184]
.L590:
    ldr     x9, [sp, #184]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L591
    adrp    x9, L_str86@PAGE
    add     x9, x9, L_str86@PAGEOFF
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
    adrp    x9, L_str87@PAGE
    add     x9, x9, L_str87@PAGEOFF
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
    adrp    x9, L_str88@PAGE
    add     x9, x9, L_str88@PAGEOFF
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
.L591:
    ldr     x9, [sp, #176]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #176]
    b       .L586
.L587:
.L1189:
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
.L1190:
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
    b       .L1191
.L1191:
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
    b       .L1192
.L1192:
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
    cbz     w11, .L592
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1193
.L592:
    mov     x9, #0
    mov     x0, x9
    b       .L1193
.L1193:
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
    cbz     w11, .L593
    ldr     x9, [sp, #24]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L1194
.L593:
    movz    x9, #0x0010
    mov     x0, x9
    b       .L1194
.L1194:
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
    adrp    x9, L_str89@PAGE
    add     x9, x9, L_str89@PAGEOFF
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
    adrp    x9, L_str90@PAGE
    add     x9, x9, L_str90@PAGEOFF
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
    adrp    x9, L_str91@PAGE
    add     x9, x9, L_str91@PAGEOFF
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
.L1195:
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
    adrp    x9, L_str92@PAGE
    add     x9, x9, L_str92@PAGEOFF
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
    adrp    x9, L_str93@PAGE
    add     x9, x9, L_str93@PAGEOFF
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
    adrp    x9, L_str94@PAGE
    add     x9, x9, L_str94@PAGEOFF
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
.L1196:
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
    adrp    x9, L_str95@PAGE
    add     x9, x9, L_str95@PAGEOFF
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
    adrp    x9, L_str96@PAGE
    add     x9, x9, L_str96@PAGEOFF
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
.L1197:
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
    adrp    x9, L_str97@PAGE
    add     x9, x9, L_str97@PAGEOFF
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
    adrp    x9, L_str98@PAGE
    add     x9, x9, L_str98@PAGEOFF
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
.L1198:
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
.L1199:
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
    cbz     w11, .L594
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
    b       .L1200
.L594:
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
.L1200:
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
    cbz     w11, .L595
    b       .L1201
.L595:
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
.L1201:
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
    cbz     w11, .L596
    ldr     x9, [sp, #40]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L1202
.L596:
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
    b       .L1202
.L1202:
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
    cbz     w11, .L597
    ldr     x9, [sp, #40]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L1203
.L597:
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
    b       .L1203
.L1203:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_binop_mnemonic
_out_binop_mnemonic:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #912
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L598
    adrp    x9, L_str99@PAGE
    add     x9, x9, L_str99@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0003
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #248]
    b       .L1204
.L598:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L599
    adrp    x9, L_str100@PAGE
    add     x9, x9, L_str100@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0003
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #320]
    b       .L1204
.L599:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L600
    adrp    x9, L_str101@PAGE
    add     x9, x9, L_str101@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0003
    str     x9, [sp, #64]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #392]
    b       .L1204
.L600:
    ldr     x9, [sp, #8]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L601
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L602
    adrp    x9, L_str102@PAGE
    add     x9, x9, L_str102@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x0004
    str     x9, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #488]
    b       .L1204
.L602:
    adrp    x9, L_str103@PAGE
    add     x9, x9, L_str103@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x0004
    str     x9, [sp, #96]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #536]
    b       .L1204
.L601:
    ldr     x9, [sp, #8]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L603
    adrp    x9, L_str104@PAGE
    add     x9, x9, L_str104@PAGEOFF
    str     x9, [sp, #104]
    movz    x9, #0x0003
    str     x9, [sp, #112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #104]
    ldr     x11, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #608]
    b       .L1204
.L603:
    ldr     x9, [sp, #8]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L604
    adrp    x9, L_str105@PAGE
    add     x9, x9, L_str105@PAGEOFF
    str     x9, [sp, #120]
    movz    x9, #0x0003
    str     x9, [sp, #128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #120]
    ldr     x11, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #680]
    b       .L1204
.L604:
    ldr     x9, [sp, #8]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L605
    adrp    x9, L_str106@PAGE
    add     x9, x9, L_str106@PAGEOFF
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
    str     x0, [sp, #752]
    b       .L1204
.L605:
    ldr     x9, [sp, #8]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L606
    adrp    x9, L_str107@PAGE
    add     x9, x9, L_str107@PAGEOFF
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
    str     x0, [sp, #824]
    b       .L1204
.L606:
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L607
    adrp    x9, L_str108@PAGE
    add     x9, x9, L_str108@PAGEOFF
    str     x9, [sp, #168]
    movz    x9, #0x0003
    str     x9, [sp, #176]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #168]
    ldr     x11, [sp, #176]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #896]
    b       .L1204
.L607:
.L1204:
    add     sp, sp, #912
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
.L1205:
    add     sp, sp, #208
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_label_addr
_emit_i_label_addr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #2000
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
    cbz     w11, .L608
    adrp    x9, L_str109@PAGE
    add     x9, x9, L_str109@PAGEOFF
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
    str     x0, [sp, #416]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #440]
    adrp    x9, L_str110@PAGE
    add     x9, x9, L_str110@PAGEOFF
    str     x9, [sp, #48]
    movz    x9, #0x0003
    str     x9, [sp, #56]
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L609
    adrp    x9, L_str111@PAGE
    add     x9, x9, L_str111@PAGEOFF
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
    str     x0, [sp, #528]
    b       .L610
.L609:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #560]
.L610:
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
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
    str     x0, [sp, #688]
    adrp    x9, L_str112@PAGE
    add     x9, x9, L_str112@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x0012
    str     x9, [sp, #96]
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L611
    adrp    x9, L_str113@PAGE
    add     x9, x9, L_str113@PAGEOFF
    str     x9, [sp, #104]
    movz    x9, #0x000d
    str     x9, [sp, #112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #104]
    ldr     x11, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #776]
    b       .L612
.L611:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #808]
.L612:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #832]
    adrp    x9, L_str114@PAGE
    add     x9, x9, L_str114@PAGEOFF
    str     x9, [sp, #120]
    movz    x9, #0x0002
    str     x9, [sp, #128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #120]
    ldr     x11, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #880]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #904]
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L613
    adrp    x9, L_str115@PAGE
    add     x9, x9, L_str115@PAGEOFF
    str     x9, [sp, #136]
    movz    x9, #0x0008
    str     x9, [sp, #144]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #136]
    ldr     x11, [sp, #144]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #976]
    b       .L614
.L613:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1008]
.L614:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
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
    str     x0, [sp, #1128]
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L615
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #1176]
    b       .L616
.L615:
    adrp    x9, L_str116@PAGE
    add     x9, x9, L_str116@PAGEOFF
    str     x9, [sp, #152]
    movz    x9, #0x0009
    str     x9, [sp, #160]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #152]
    ldr     x11, [sp, #160]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1224]
.L616:
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
    str     x0, [sp, #1288]
    b       .L1206
.L608:
    adrp    x9, L_str117@PAGE
    add     x9, x9, L_str117@PAGEOFF
    str     x9, [sp, #168]
    movz    x9, #0x000c
    str     x9, [sp, #176]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #168]
    ldr     x11, [sp, #176]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1336]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #1360]
    adrp    x9, L_str118@PAGE
    add     x9, x9, L_str118@PAGEOFF
    str     x9, [sp, #184]
    movz    x9, #0x0007
    str     x9, [sp, #192]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #184]
    ldr     x11, [sp, #192]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1408]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #1456]
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L617
    adrp    x9, L_str119@PAGE
    add     x9, x9, L_str119@PAGEOFF
    str     x9, [sp, #200]
    movz    x9, #0x000d
    str     x9, [sp, #208]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #200]
    ldr     x11, [sp, #208]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1528]
    b       .L618
.L617:
    adrp    x9, L_str120@PAGE
    add     x9, x9, L_str120@PAGEOFF
    str     x9, [sp, #216]
    movz    x9, #0x0012
    str     x9, [sp, #224]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #216]
    ldr     x11, [sp, #224]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1576]
.L618:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #1600]
    adrp    x9, L_str121@PAGE
    add     x9, x9, L_str121@PAGEOFF
    str     x9, [sp, #232]
    movz    x9, #0x0002
    str     x9, [sp, #240]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #232]
    ldr     x11, [sp, #240]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1648]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #1672]
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L619
    adrp    x9, L_str122@PAGE
    add     x9, x9, L_str122@PAGEOFF
    str     x9, [sp, #248]
    movz    x9, #0x000d
    str     x9, [sp, #256]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #248]
    ldr     x11, [sp, #256]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1744]
    b       .L620
.L619:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #184]
    ldr     x11, [sp, #192]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1776]
.L620:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0040
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #1824]
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L621
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #1872]
    b       .L622
.L621:
    adrp    x9, L_str123@PAGE
    add     x9, x9, L_str123@PAGEOFF
    str     x9, [sp, #264]
    movz    x9, #0x0009
    str     x9, [sp, #272]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #264]
    ldr     x11, [sp, #272]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #1920]
.L622:
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
    str     x0, [sp, #1984]
.L1206:
    add     sp, sp, #2000
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
    adrp    x9, L_str124@PAGE
    add     x9, x9, L_str124@PAGEOFF
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
    adrp    x9, L_str125@PAGE
    add     x9, x9, L_str125@PAGEOFF
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
.L1207:
    add     sp, sp, #384
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_normalize
_emit_normalize:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #768
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L623
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L624
    adrp    x9, L_str126@PAGE
    add     x9, x9, L_str126@PAGEOFF
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
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #240]
    adrp    x9, L_str127@PAGE
    add     x9, x9, L_str127@PAGEOFF
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
    str     x0, [sp, #288]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #312]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #336]
    b       .L1208
.L624:
    adrp    x9, L_str128@PAGE
    add     x9, x9, L_str128@PAGEOFF
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
    str     x0, [sp, #384]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #408]
    adrp    x9, L_str129@PAGE
    add     x9, x9, L_str129@PAGEOFF
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
    str     x0, [sp, #456]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #480]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #504]
    b       .L1208
.L623:
    ldr     x9, [sp, #16]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L625
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L626
    adrp    x9, L_str130@PAGE
    add     x9, x9, L_str130@PAGEOFF
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
    str     x0, [sp, #600]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_x_n
    str     x0, [sp, #624]
    adrp    x9, L_str131@PAGE
    add     x9, x9, L_str131@PAGEOFF
    str     x9, [sp, #112]
    movz    x9, #0x0002
    str     x9, [sp, #120]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #112]
    ldr     x11, [sp, #120]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #672]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #696]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #720]
    b       .L1208
.L626:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_mov_w_w
    str     x0, [sp, #752]
.L625:
.L1208:
    add     sp, sp, #768
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_load_local
_emit_i_load_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #624
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
    cbz     w11, .L627
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
    b       .L628
.L627:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L629
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
    b       .L630
.L629:
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
.L630:
.L628:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #16]
    movz    x12, #0x0028
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #16]
    movz    x13, #0x0070
    add     x14, x12, x13
    ldr     x12, [x14]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_normalize
    str     x0, [sp, #552]
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
    str     x0, [sp, #616]
.L1209:
    add     sp, sp, #624
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
    cbz     w11, .L631
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L632
.L631:
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
.L632:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L633
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
    b       .L634
.L633:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L635
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
    b       .L636
.L635:
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
.L636:
.L634:
.L1210:
    add     sp, sp, #672
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_load_mem
_emit_i_load_mem:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #624
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
    cbz     w11, .L637
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
    b       .L638
.L637:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L639
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
    b       .L640
.L639:
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
.L640:
.L638:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #16]
    movz    x12, #0x0028
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #16]
    movz    x13, #0x0070
    add     x14, x12, x13
    ldr     x12, [x14]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_normalize
    str     x0, [sp, #544]
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
    str     x0, [sp, #608]
.L1211:
    add     sp, sp, #624
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_cast
_emit_i_cast:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #368
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
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L641
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_mov_x_x
    str     x0, [sp, #200]
.L641:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #16]
    movz    x12, #0x0028
    add     x13, x11, x12
    ldr     x11, [x13]
    ldr     x12, [sp, #16]
    movz    x13, #0x0070
    add     x14, x12, x13
    ldr     x12, [x14]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _emit_normalize
    str     x0, [sp, #288]
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
    str     x0, [sp, #352]
.L1212:
    add     sp, sp, #368
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
    cbz     w11, .L642
    ldr     x9, [sp, #40]
    movz    x10, #0x0009
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L643
.L642:
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
.L643:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L644
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
    b       .L645
.L644:
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L646
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
    b       .L647
.L646:
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
.L647:
.L645:
.L1213:
    add     sp, sp, #672
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_binop
_emit_i_binop:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #960
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
    cbz     w11, .L648
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L648:
    mov     x9, #0
    str     x9, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L649
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
    b       .L650
.L649:
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
.L650:
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
    adrp    x9, L_str132@PAGE
    add     x9, x9, L_str132@PAGEOFF
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
    ldr     x11, [sp, #16]
    movz    x12, #0x0070
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_binop_mnemonic
    str     x0, [sp, #632]
    adrp    x9, L_str133@PAGE
    add     x9, x9, L_str133@PAGEOFF
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
    str     x0, [sp, #680]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #712]
    adrp    x9, L_str134@PAGE
    add     x9, x9, L_str134@PAGEOFF
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
    str     x0, [sp, #760]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #792]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #824]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #856]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #880]
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
    str     x0, [sp, #944]
.L1214:
    add     sp, sp, #960
    ldp     x29, x30, [sp], #16
    ret

    .globl   _out_cc
_out_cc:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #896
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L651
    adrp    x9, L_str135@PAGE
    add     x9, x9, L_str135@PAGEOFF
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
    str     x0, [sp, #240]
    b       .L1215
.L651:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L652
    adrp    x9, L_str136@PAGE
    add     x9, x9, L_str136@PAGEOFF
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
    str     x0, [sp, #312]
    b       .L1215
.L652:
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L653
    adrp    x9, L_str137@PAGE
    add     x9, x9, L_str137@PAGEOFF
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
    str     x0, [sp, #384]
    b       .L1215
.L653:
    ldr     x9, [sp, #8]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L654
    adrp    x9, L_str138@PAGE
    add     x9, x9, L_str138@PAGEOFF
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
    str     x0, [sp, #456]
    b       .L1215
.L654:
    ldr     x9, [sp, #8]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L655
    adrp    x9, L_str139@PAGE
    add     x9, x9, L_str139@PAGEOFF
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
    str     x0, [sp, #528]
    b       .L1215
.L655:
    ldr     x9, [sp, #8]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L656
    adrp    x9, L_str140@PAGE
    add     x9, x9, L_str140@PAGEOFF
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
    str     x0, [sp, #600]
    b       .L1215
.L656:
    ldr     x9, [sp, #8]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L657
    adrp    x9, L_str141@PAGE
    add     x9, x9, L_str141@PAGEOFF
    str     x9, [sp, #112]
    movz    x9, #0x0002
    str     x9, [sp, #120]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #112]
    ldr     x11, [sp, #120]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #672]
    b       .L1215
.L657:
    ldr     x9, [sp, #8]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L658
    adrp    x9, L_str142@PAGE
    add     x9, x9, L_str142@PAGEOFF
    str     x9, [sp, #128]
    movz    x9, #0x0002
    str     x9, [sp, #136]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #128]
    ldr     x11, [sp, #136]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #744]
    b       .L1215
.L658:
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L659
    adrp    x9, L_str143@PAGE
    add     x9, x9, L_str143@PAGEOFF
    str     x9, [sp, #144]
    movz    x9, #0x0002
    str     x9, [sp, #152]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #144]
    ldr     x11, [sp, #152]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #816]
    b       .L1215
.L659:
    ldr     x9, [sp, #8]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L660
    adrp    x9, L_str144@PAGE
    add     x9, x9, L_str144@PAGEOFF
    str     x9, [sp, #160]
    movz    x9, #0x0002
    str     x9, [sp, #168]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #160]
    ldr     x11, [sp, #168]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #888]
    b       .L1215
.L660:
.L1215:
    add     sp, sp, #896
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_cmp
_emit_i_cmp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1104
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    ldr     x9, [sp, #16]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L661
    ldr     x9, [sp, #24]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L662
    movz    x9, #0x0006
    str     x9, [sp, #24]
.L662:
    ldr     x9, [sp, #24]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L663
    movz    x9, #0x0007
    str     x9, [sp, #24]
.L663:
    ldr     x9, [sp, #24]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L664
    movz    x9, #0x0008
    str     x9, [sp, #24]
.L664:
    ldr     x9, [sp, #24]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L665
    movz    x9, #0x0009
    str     x9, [sp, #24]
.L665:
.L661:
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #16]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L666
    movz    x9, #0x0001
    str     x9, [sp, #32]
.L666:
    mov     x9, #0
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L667
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
    b       .L668
.L667:
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
.L668:
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
    adrp    x9, L_str145@PAGE
    add     x9, x9, L_str145@PAGEOFF
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
    str     x0, [sp, #736]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #768]
    adrp    x9, L_str146@PAGE
    add     x9, x9, L_str146@PAGEOFF
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
    str     x0, [sp, #816]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #848]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #872]
    adrp    x9, L_str147@PAGE
    add     x9, x9, L_str147@PAGEOFF
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
    str     x0, [sp, #920]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #56]
    mov     x0, x9
    mov     x1, x10
    bl      _out_w_n
    str     x0, [sp, #944]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #976]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _out_cc
    str     x0, [sp, #1000]
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #1024]
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
    str     x0, [sp, #1088]
.L1216:
    add     sp, sp, #1104
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_syscall
_emit_i_syscall:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #896
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
    cbz     w11, .L669
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    ldr     x11, [sp, #48]
    movz    x12, #0x0009
    add     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_mov_x_x
    str     x0, [sp, #328]
    b       .L670
.L669:
    ldr     x9, [sp, #0]
    movz    x10, #0x0010
    ldr     x11, [sp, #40]
    movz    x12, #0x0008
    mul     x13, x11, x12
    mov     x0, x9
    mov     x1, x10
    mov     x2, x13
    bl      _emit_ldr_x
    str     x0, [sp, #376]
.L670:
    movz    x9, #0x0001
    str     x9, [sp, #56]
.L671:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #16]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L672
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
    str     x0, [sp, #528]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L671
.L672:
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L673
    adrp    x9, L_str148@PAGE
    add     x9, x9, L_str148@PAGEOFF
    str     x9, [sp, #64]
    movz    x9, #0x0013
    str     x9, [sp, #72]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #64]
    ldr     x11, [sp, #72]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #624]
    b       .L674
.L673:
    adrp    x9, L_str149@PAGE
    add     x9, x9, L_str149@PAGEOFF
    str     x9, [sp, #80]
    movz    x9, #0x0012
    str     x9, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #672]
.L674:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #96]
    ldr     x9, [sp, #96]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L675
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x10, #0
    mov     x0, x9
    mov     x1, x12
    mov     x2, x10
    bl      _emit_mov_x_x
    str     x0, [sp, #816]
    b       .L1217
.L675:
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
    str     x0, [sp, #888]
.L1217:
    add     sp, sp, #896
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
    adrp    x9, L_str150@PAGE
    add     x9, x9, L_str150@PAGEOFF
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
    cbz     w10, .L676
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_syscall
    str     x0, [sp, #232]
    b       .L1218
.L676:
    ldr     x9, [sp, #16]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L677:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #16]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L678
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
    b       .L677
.L678:
    adrp    x9, L_str151@PAGE
    add     x9, x9, L_str151@PAGEOFF
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
    cbz     w11, .L679
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
    b       .L1218
.L679:
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
.L1218:
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
    cbz     w11, .L680
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
    cbz     w11, .L681
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    movz    x9, #0x0008
    cmp     x10, x9
    cset    w11, eq
    cbz     w11, .L682
    movz    x9, #0x0001
    str     x9, [sp, #32]
.L682:
.L681:
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
    cbz     w11, .L683
    ldr     x9, [sp, #56]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L684
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
    b       .L685
.L684:
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
.L685:
    b       .L686
.L683:
    ldr     x9, [sp, #56]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L687
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
    b       .L688
.L687:
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
.L688:
.L686:
.L680:
    adrp    x9, L_str152@PAGE
    add     x9, x9, L_str152@PAGEOFF
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
.L1219:
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
    adrp    x9, L_str153@PAGE
    add     x9, x9, L_str153@PAGEOFF
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
.L1220:
    add     sp, sp, #160
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_jz
_emit_i_jz:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #592
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    mov     x9, #0
    str     x9, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    movz    x9, #0x0008
    cmp     x10, x9
    cset    w11, eq
    cbz     w11, .L689
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L689:
    mov     x9, #0
    str     x9, [sp, #40]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L690
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
    b       .L691
.L690:
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
.L691:
    adrp    x9, L_str154@PAGE
    add     x9, x9, L_str154@PAGEOFF
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
    str     x0, [sp, #424]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_reg_wx
    str     x0, [sp, #456]
    adrp    x9, L_str155@PAGE
    add     x9, x9, L_str155@PAGEOFF
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
    str     x0, [sp, #504]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0038
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
.L1221:
    add     sp, sp, #592
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_i_label
_emit_i_label:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #192
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    adrp    x9, L_str156@PAGE
    add     x9, x9, L_str156@PAGEOFF
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
    adrp    x9, L_str157@PAGE
    add     x9, x9, L_str157@PAGEOFF
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
.L1222:
    add     sp, sp, #192
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_instr
_emit_instr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1232
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
    cbz     w11, .L692
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_movi
    str     x0, [sp, #120]
    b       .L1223
.L692:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L693
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_label_addr
    str     x0, [sp, #176]
    b       .L1223
.L693:
    ldr     x9, [sp, #32]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L694
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_addr_local
    str     x0, [sp, #232]
    b       .L1223
.L694:
    ldr     x9, [sp, #32]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L695
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_load_local
    str     x0, [sp, #288]
    b       .L1223
.L695:
    ldr     x9, [sp, #32]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L696
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_store_local
    str     x0, [sp, #344]
    b       .L1223
.L696:
    ldr     x9, [sp, #32]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L697
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_load_mem
    str     x0, [sp, #400]
    b       .L1223
.L697:
    ldr     x9, [sp, #32]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L698
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_store_mem
    str     x0, [sp, #456]
    b       .L1223
.L698:
    ldr     x9, [sp, #32]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L699
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_binop
    str     x0, [sp, #512]
    b       .L1223
.L699:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L700
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
    b       .L1223
.L700:
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L701
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
    b       .L1223
.L701:
    ldr     x9, [sp, #32]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L702
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
    b       .L1223
.L702:
    ldr     x9, [sp, #32]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L703
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
    b       .L1223
.L703:
    ldr     x9, [sp, #32]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L704
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
    b       .L1223
.L704:
    ldr     x9, [sp, #32]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L705
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
    b       .L1223
.L705:
    ldr     x9, [sp, #32]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L706
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_call
    str     x0, [sp, #952]
    b       .L1223
.L706:
    ldr     x9, [sp, #32]
    movz    x10, #0x000f
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L707
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
    b       .L1223
.L707:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L708
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_i_jmp
    str     x0, [sp, #1064]
    b       .L1223
.L708:
    ldr     x9, [sp, #32]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L709
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_jz
    str     x0, [sp, #1120]
    b       .L1223
.L709:
    ldr     x9, [sp, #32]
    movz    x10, #0x0012
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L710
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_i_label
    str     x0, [sp, #1168]
    b       .L1223
.L710:
    ldr     x9, [sp, #32]
    movz    x10, #0x0013
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L711
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_i_cast
    str     x0, [sp, #1224]
    b       .L1223
.L711:
.L1223:
    add     sp, sp, #1232
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
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L712
    ldr     x9, [sp, #0]
    movz    x10, #0x005f
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #72]
.L712:
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
.L1224:
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
    adrp    x9, L_str158@PAGE
    add     x9, x9, L_str158@PAGEOFF
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
    adrp    x9, L_str159@PAGE
    add     x9, x9, L_str159@PAGEOFF
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
    cbz     w11, .L713
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0fff
    cmp     x9, x10
    cset    w11, ls
    cbz     w11, .L714
    adrp    x9, L_str160@PAGE
    add     x9, x9, L_str160@PAGEOFF
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
    b       .L715
.L714:
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
    adrp    x9, L_str161@PAGE
    add     x9, x9, L_str161@PAGEOFF
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
.L715:
.L713:
.L1225:
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
    adrp    x9, L_str162@PAGE
    add     x9, x9, L_str162@PAGEOFF
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
    adrp    x9, L_str163@PAGE
    add     x9, x9, L_str163@PAGEOFF
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
    cbz     w11, .L716
    ldr     x9, [sp, #8]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0fff
    cmp     x9, x10
    cset    w11, ls
    cbz     w11, .L717
    adrp    x9, L_str164@PAGE
    add     x9, x9, L_str164@PAGEOFF
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
    b       .L718
.L717:
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
    adrp    x9, L_str165@PAGE
    add     x9, x9, L_str165@PAGEOFF
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
.L718:
.L716:
    adrp    x9, L_str166@PAGE
    add     x9, x9, L_str166@PAGEOFF
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
.L1226:
    add     sp, sp, #592
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_text_section
_emit_text_section:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #256
    str     x0, [sp, #0]
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L719
    adrp    x9, L_str167@PAGE
    add     x9, x9, L_str167@PAGEOFF
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
    str     x0, [sp, #120]
    b       .L1227
.L719:
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L720
    adrp    x9, L_str168@PAGE
    add     x9, x9, L_str168@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x000a
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #192]
    b       .L1227
.L720:
    adrp    x9, L_str169@PAGE
    add     x9, x9, L_str169@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0018
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #240]
.L1227:
    add     sp, sp, #256
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
    cbz     w11, .L721
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
    cbz     w11, .L722
    ldr     x9, [sp, #40]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    str     x10, [sp, #48]
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L723
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L723:
    ldr     x9, [sp, #48]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L724
    movz    x9, #0x0004
    str     x9, [sp, #24]
.L724:
.L722:
.L721:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L725
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
    b       .L1228
.L725:
    ldr     x9, [sp, #24]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L726
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
    b       .L1228
.L726:
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
.L1228:
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
.L727:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L728
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
    b       .L727
.L728:
    ldr     x9, [sp, #8]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
.L729:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L730
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
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L729
.L730:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_epilogue
    str     x0, [sp, #328]
.L1229:
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
    adrp    x9, L_str170@PAGE
    add     x9, x9, L_str170@PAGEOFF
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
.L1230:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_strings
_emit_strings:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #672
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L731
    b       .L1231
.L731:
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L732
    adrp    x9, L_str171@PAGE
    add     x9, x9, L_str171@PAGEOFF
    str     x9, [sp, #16]
    movz    x9, #0x0016
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #208]
    b       .L733
.L732:
    adrp    x9, L_str172@PAGE
    add     x9, x9, L_str172@PAGEOFF
    str     x9, [sp, #32]
    movz    x9, #0x001f
    str     x9, [sp, #40]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #256]
.L733:
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
.L734:
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L735
    adrp    x9, L_str173@PAGE
    add     x9, x9, L_str173@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x0014
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
    ldr     x10, [sp, #48]
    mov     x11, #0
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #408]
    adrp    x9, L_str174@PAGE
    add     x9, x9, L_str174@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x0002
    str     x9, [sp, #80]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #456]
    mov     x9, #0
    str     x9, [sp, #88]
.L736:
    ldr     x9, [sp, #88]
    ldr     x10, [sp, #48]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L737
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #48]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #88]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _emit_string_byte
    str     x0, [sp, #584]
    ldr     x9, [sp, #88]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #88]
    b       .L736
.L737:
    ldr     x9, [sp, #0]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _emit_string_byte
    str     x0, [sp, #632]
    ldr     x9, [sp, #48]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    b       .L734
.L735:
.L1231:
    add     sp, sp, #672
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_macos_start
_emit_macos_start:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #80
    str     x0, [sp, #0]
    adrp    x9, L_str175@PAGE
    add     x9, x9, L_str175@PAGEOFF
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
.L1232:
    add     sp, sp, #80
    ldp     x29, x30, [sp], #16
    ret

    .globl   _emit_bsses
_emit_bsses:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #992
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L738
    b       .L1233
.L738:
    ldr     x9, [sp, #0]
    movz    x10, #0x000a
    mov     x0, x9
    mov     x1, x10
    bl      _out_byte
    str     x0, [sp, #200]
    ldr     x9, [sp, #8]
    movz    x10, #0x0010
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
.L739:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L740
    bl      _get_target
    mov     x9, x0
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L741
    adrp    x9, L_str176@PAGE
    add     x9, x9, L_str176@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x000a
    str     x9, [sp, #32]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #328]
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
    str     x0, [sp, #456]
    adrp    x9, L_str177@PAGE
    add     x9, x9, L_str177@PAGEOFF
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
    str     x0, [sp, #504]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #552]
    adrp    x9, L_str178@PAGE
    add     x9, x9, L_str178@PAGEOFF
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
    str     x0, [sp, #600]
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    b       .L739
.L741:
    adrp    x9, L_str179@PAGE
    add     x9, x9, L_str179@PAGEOFF
    str     x9, [sp, #80]
    movz    x9, #0x001c
    str     x9, [sp, #88]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #80]
    ldr     x11, [sp, #88]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #680]
    adrp    x9, _LX_STATE@PAGE
    add     x9, x9, _LX_STATE@PAGEOFF
    str     x9, [sp, #96]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #96]
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
    str     x0, [sp, #808]
    adrp    x9, L_str180@PAGE
    add     x9, x9, L_str180@PAGEOFF
    str     x9, [sp, #104]
    movz    x9, #0x0001
    str     x9, [sp, #112]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #104]
    ldr     x11, [sp, #112]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #856]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #904]
    adrp    x9, L_str181@PAGE
    add     x9, x9, L_str181@PAGEOFF
    str     x9, [sp, #120]
    movz    x9, #0x0003
    str     x9, [sp, #128]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #120]
    ldr     x11, [sp, #128]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _out_bytes
    str     x0, [sp, #952]
    ldr     x9, [sp, #16]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    b       .L739
.L740:
.L1233:
    add     sp, sp, #992
    ldp     x29, x30, [sp], #16
    ret

    .globl   _codegen
_codegen:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #960
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    str     x4, [sp, #32]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _set_target
    str     x0, [sp, #88]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _emit_text_section
    str     x0, [sp, #104]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L742
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L743
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _emit_macos_start
    str     x0, [sp, #168]
.L743:
.L742:
    mov     x9, #0
    str     x9, [sp, #40]
    ldr     x9, [sp, #32]
    str     x9, [sp, #48]
.L744:
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L745
    ldr     x9, [sp, #48]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #56]
.L746:
    ldr     x9, [sp, #56]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L747
    ldr     x9, [sp, #56]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0012
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L748
    ldr     x9, [sp, #56]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #40]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L749
    ldr     x9, [sp, #56]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
.L749:
.L748:
    ldr     x9, [sp, #56]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L750
    ldr     x9, [sp, #56]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #40]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L751
    ldr     x9, [sp, #56]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
.L751:
.L750:
    ldr     x9, [sp, #56]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L752
    ldr     x9, [sp, #56]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #40]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L753
    ldr     x9, [sp, #56]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
.L753:
.L752:
    ldr     x9, [sp, #56]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #56]
    b       .L746
.L747:
    ldr     x9, [sp, #48]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    b       .L744
.L745:
    ldr     x9, [sp, #40]
    str     x9, [sp, #64]
    ldr     x9, [sp, #32]
    str     x9, [sp, #72]
.L754:
    ldr     x9, [sp, #72]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L755
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _emit_fn
    str     x0, [sp, #832]
    ldr     x9, [sp, #64]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #64]
    ldr     x9, [sp, #72]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #72]
    b       .L754
.L755:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_strings
    str     x0, [sp, #912]
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    bl      _emit_bsses
    str     x0, [sp, #936]
    ldr     x9, [sp, #0]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #952]
.L1234:
    add     sp, sp, #960
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
    b       .L1235
.L1235:
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
.L1236:
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
.L1237:
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
    uxtb    w9, w9
    str     x9, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    str     x9, [sp, #24]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
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
    b       .L1238
.L1238:
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
.L1239:
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
.L756:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L757
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
    b       .L756
.L757:
    movz    x9, #0x0010
    str     x9, [sp, #32]
.L758:
    ldr     x9, [sp, #32]
    movz    x10, #0x0040
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L759
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
    b       .L758
.L759:
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
.L760:
    ldr     x9, [sp, #32]
    movz    x10, #0x0040
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L761
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
    b       .L760
.L761:
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
.L1240:
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
.L762:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L763
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
    b       .L762
.L763:
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
.L764:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #40]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L765
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
    uxtb    w9, w9
    strb    w9, [x11]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L764
.L765:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    movz    x9, #0x0080
    strb    w9, [x11]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
.L766:
    ldr     x9, [sp, #56]
    movz    x10, #0x0040
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L767
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    add     x11, x9, x10
    mov     x9, #0
    strb    w9, [x11]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L766
.L767:
    ldr     x9, [sp, #8]
    movz    x10, #0x0008
    mul     x11, x9, x10
    str     x11, [sp, #64]
    ldr     x9, [sp, #40]
    movz    x10, #0x0038
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L768
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _sha256_block
    str     x0, [sp, #624]
    mov     x9, #0
    str     x9, [sp, #56]
.L769:
    ldr     x9, [sp, #56]
    movz    x10, #0x0040
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L770
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #56]
    add     x11, x9, x10
    mov     x9, #0
    strb    w9, [x11]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L769
.L770:
.L768:
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
.L771:
    ldr     x9, [sp, #80]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L772
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
    b       .L771
.L772:
.L1241:
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
    b       .L1242
.L1242:
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
    b       .L1243
.L1243:
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
    b       .L1244
.L1244:
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
    b       .L1245
.L1245:
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
    b       .L1246
.L1246:
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
    b       .L1247
.L1247:
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
    b       .L1248
.L1248:
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
    b       .L1249
.L1249:
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
    b       .L1250
.L1250:
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
    b       .L1251
.L1251:
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
    b       .L1252
.L1252:
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
    b       .L1253
.L1253:
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
    b       .L1254
.L1254:
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
    b       .L1255
.L1255:
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
    b       .L1256
.L1256:
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
    b       .L1257
.L1257:
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
    b       .L1258
.L1258:
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
    b       .L1259
.L1259:
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
    b       .L1260
.L1260:
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
    b       .L1261
.L1261:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_sdiv
_enc_sdiv:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #144
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    movz    x16, #0x0c00
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
    b       .L1262
.L1262:
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
    b       .L1263
.L1263:
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
    b       .L1264
.L1264:
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
    b       .L1265
.L1265:
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
    b       .L1266
.L1266:
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
    b       .L1267
.L1267:
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
    b       .L1268
.L1268:
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
    b       .L1269
.L1269:
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
    b       .L1270
.L1270:
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
    b       .L1271
.L1271:
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
    b       .L1272
.L1272:
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
    b       .L1273
.L1273:
    add     sp, sp, #144
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_sxtb
_enc_sxtb:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x16, #0x1c00
    movk    x16, #0x9340, lsl #16
    str     x16, [sp, #16]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
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
    b       .L1274
.L1274:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_sxtw
_enc_sxtw:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x16, #0x7c00
    movk    x16, #0x9340, lsl #16
    str     x16, [sp, #16]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
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
    b       .L1275
.L1275:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_uxtb
_enc_uxtb:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x16, #0x1c00
    movk    x16, #0x5300, lsl #16
    str     x16, [sp, #16]
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _m5
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
    b       .L1276
.L1276:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_uxtw
_enc_uxtw:
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
    movz    x9, #0xffff
    movk    x9, #0x7fff, lsl #16
    and     w10, w11, w9
    mov     x0, x10
    b       .L1277
.L1277:
    add     sp, sp, #64
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
    b       .L1278
.L1278:
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
    b       .L1279
.L1279:
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
    b       .L1280
.L1280:
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
    b       .L1281
.L1281:
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
    b       .L1282
.L1282:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _enc_cbz_x
_enc_cbz_x:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #96
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    movz    x16, #0xb400, lsl #16
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
    b       .L1283
.L1283:
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
    b       .L1284
.L1284:
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
    b       .L1285
.L1285:
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
    b       .L1286
.L1286:
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
    b       .L1287
.L1287:
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
    b       .L1288
.L1288:
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
.L773:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L774
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #32]
    add     x12, x9, x10
    ldrb    w9, [x12]
    uxtb    w9, w9
    strb    w9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L773
.L774:
    ldr     x9, [sp, #24]
    movz    x10, #0x0006
    add     x11, x9, x10
    ldr     x9, [sp, #24]
    movz    x10, #0x0006
    add     x12, x9, x10
    ldrb    w9, [x12]
    uxtb    w9, w9
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
    uxtb    w9, w9
    movz    x10, #0x003f
    and     w12, w9, w10
    movz    x9, #0x0080
    orr     w10, w12, w9
    strb    w10, [x11]
.L1289:
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
.L775:
    ldr     x9, [sp, #16]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L776
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #104]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #16]
    b       .L775
.L776:
.L1290:
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
    b       .L1291
.L1291:
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
.L1292:
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
.L1293:
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
.L1294:
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
.L1295:
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
.L1296:
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
.L1297:
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
.L777:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L778
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
    b       .L777
.L778:
.L1298:
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
.L779:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L780
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #104]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L779
.L780:
.L781:
    ldr     x9, [sp, #24]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L782
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
    b       .L781
.L782:
.L1299:
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
    adrp    x9, L_str182@PAGE
    add     x9, x9, L_str182@PAGEOFF
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
    adrp    x9, L_str183@PAGE
    add     x9, x9, L_str183@PAGEOFF
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
    adrp    x9, L_str184@PAGE
    add     x9, x9, L_str184@PAGEOFF
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
    adrp    x9, L_str185@PAGE
    add     x9, x9, L_str185@PAGEOFF
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
    adrp    x9, L_str186@PAGE
    add     x9, x9, L_str186@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x000d
    str     x9, [sp, #96]
    mov     x9, #0
    str     x9, [sp, #104]
.L783:
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #96]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L784
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #104]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #1648]
    ldr     x9, [sp, #104]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #104]
    b       .L783
.L784:
.L785:
    ldr     x9, [sp, #104]
    movz    x10, #0x0014
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L786
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
    b       .L785
.L786:
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
.L1300:
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
    cbz     w10, .L787
    movz    x9, #0x0048
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #112]
.L787:
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
.L788:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L789
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #40]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #264]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L788
.L789:
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
.L1301:
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
.L1302:
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
    cbz     w10, .L790
    movz    x9, #0x0047
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #248]
.L790:
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
.L791:
    ldr     x9, [sp, #64]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L792
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
    b       .L791
.L792:
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
.L1303:
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
.L1304:
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
    adrp    x9, L_str187@PAGE
    add     x9, x9, L_str187@PAGEOFF
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
    adrp    x9, L_str188@PAGE
    add     x9, x9, L_str188@PAGEOFF
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
    adrp    x9, L_str189@PAGE
    add     x9, x9, L_str189@PAGEOFF
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
    adrp    x9, L_str190@PAGE
    add     x9, x9, L_str190@PAGEOFF
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
    adrp    x9, L_str191@PAGE
    add     x9, x9, L_str191@PAGEOFF
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
    adrp    x9, L_str192@PAGE
    add     x9, x9, L_str192@PAGEOFF
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
    adrp    x9, L_str193@PAGE
    add     x9, x9, L_str193@PAGEOFF
    str     x9, [sp, #168]
    movz    x9, #0x000d
    str     x9, [sp, #176]
    mov     x9, #0
    str     x9, [sp, #184]
.L793:
    ldr     x9, [sp, #184]
    ldr     x10, [sp, #176]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L794
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #168]
    ldr     x11, [sp, #184]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #2448]
    ldr     x9, [sp, #184]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #184]
    b       .L793
.L794:
.L795:
    ldr     x9, [sp, #184]
    movz    x10, #0x0014
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L796
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
    b       .L795
.L796:
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
.L1305:
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
    b       .L1306
.L1306:
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
.L1307:
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
.L1308:
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
.L1309:
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
    b       .L1310
.L1310:
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
.L1311:
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
    b       .L1312
.L1312:
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
.L1313:
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
    b       .L1314
.L1314:
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
    cbz     w11, .L797
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
    b       .L1315
.L797:
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
    cbz     w11, .L798
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
.L798:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L799
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L800
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
    b       .L801
.L800:
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
.L801:
.L799:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L802
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L803
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
    b       .L804
.L803:
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
.L804:
.L802:
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L805
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L806
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
    b       .L807
.L806:
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
.L807:
.L805:
.L1315:
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
.L1316:
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
.L1317:
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
.L1318:
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
.L1319:
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
.L1320:
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
.L1321:
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
.L1322:
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
.L1323:
    add     sp, sp, #64
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_normalize
_cgb_normalize:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #256
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L808
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L809
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #0]
    mov     x0, x9
    mov     x1, x10
    bl      _enc_sxtb
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #96]
    b       .L810
.L809:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #0]
    mov     x0, x9
    mov     x1, x10
    bl      _enc_uxtb
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #128]
.L810:
    b       .L1324
.L808:
    ldr     x9, [sp, #8]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L811
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L812
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #0]
    mov     x0, x9
    mov     x1, x10
    bl      _enc_sxtw
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #208]
    b       .L813
.L812:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #0]
    mov     x0, x9
    mov     x1, x10
    bl      _enc_uxtw
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #240]
.L813:
.L811:
.L1324:
    add     sp, sp, #256
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
    cbz     w11, .L814
    ldr     x9, [sp, #24]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L1325
.L814:
    movz    x9, #0x0010
    mov     x0, x9
    b       .L1325
.L1325:
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
    cbz     w11, .L815
    b       .L1326
.L815:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_str_x
    str     x0, [sp, #160]
.L1326:
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
    cbz     w11, .L816
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L1327
.L816:
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
    b       .L1327
.L1327:
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
    cbz     w11, .L817
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x0, x11
    b       .L1328
.L817:
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
    b       .L1328
.L1328:
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
    cbz     w11, .L818
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #32]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_mov_x
    str     x0, [sp, #176]
    b       .L1329
.L818:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_x
    str     x0, [sp, #216]
.L1329:
    add     sp, sp, #224
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_alu
_cgb_alu:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #688
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    str     x3, [sp, #24]
    str     x4, [sp, #32]
    str     x5, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
    ldr     x9, [sp, #0]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L819
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_add_reg
    mov     x12, x0
    str     x12, [sp, #48]
.L819:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L820
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_sub_reg
    mov     x12, x0
    str     x12, [sp, #48]
.L820:
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L821
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_mul
    mov     x12, x0
    str     x12, [sp, #48]
.L821:
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L822
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L823
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_sdiv
    mov     x12, x0
    str     x12, [sp, #48]
    b       .L824
.L823:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_udiv
    mov     x12, x0
    str     x12, [sp, #48]
.L824:
.L822:
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L825
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_and
    mov     x12, x0
    str     x12, [sp, #48]
.L825:
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L826
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_orr
    mov     x12, x0
    str     x12, [sp, #48]
.L826:
    ldr     x9, [sp, #0]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L827
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_eor
    mov     x12, x0
    str     x12, [sp, #48]
.L827:
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L828
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_lslv
    mov     x12, x0
    str     x12, [sp, #48]
.L828:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L829
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _enc_lsrv
    mov     x12, x0
    str     x12, [sp, #48]
.L829:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L830
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _cb_word
    str     x0, [sp, #656]
    b       .L831
.L830:
    ldr     x9, [sp, #48]
    mov     x0, x9
    bl      _w32
    mov     x10, x0
    mov     x0, x10
    bl      _cb_word
    str     x0, [sp, #680]
.L831:
.L1330:
    add     sp, sp, #688
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_invcond
_cgb_invcond:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #304
    str     x0, [sp, #0]
    ldr     x9, [sp, #0]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L832
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1331
.L832:
    ldr     x9, [sp, #0]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L833
    mov     x9, #0
    mov     x0, x9
    b       .L1331
.L833:
    ldr     x9, [sp, #0]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L834
    movz    x9, #0x0002
    mov     x0, x9
    b       .L1331
.L834:
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L835
    movz    x9, #0x0008
    mov     x0, x9
    b       .L1331
.L835:
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L836
    movz    x9, #0x0009
    mov     x0, x9
    b       .L1331
.L836:
    ldr     x9, [sp, #0]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L837
    movz    x9, #0x0003
    mov     x0, x9
    b       .L1331
.L837:
    ldr     x9, [sp, #0]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L838
    movz    x9, #0x000a
    mov     x0, x9
    b       .L1331
.L838:
    ldr     x9, [sp, #0]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L839
    movz    x9, #0x000c
    mov     x0, x9
    b       .L1331
.L839:
    ldr     x9, [sp, #0]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L840
    movz    x9, #0x000d
    mov     x0, x9
    b       .L1331
.L840:
    movz    x9, #0x000b
    mov     x0, x9
    b       .L1331
.L1331:
    add     sp, sp, #304
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
.L1332:
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
.L1333:
    add     sp, sp, #208
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_load_local
_cgb_i_load_local:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #496
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
    cbz     w11, .L841
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
    b       .L842
.L841:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L843
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
    b       .L844
.L843:
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
.L844:
.L842:
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #8]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0070
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_normalize
    str     x0, [sp, #432]
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
    str     x0, [sp, #488]
.L1334:
    add     sp, sp, #496
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
    cbz     w11, .L845
    ldr     x9, [sp, #24]
    movz    x10, #0x0009
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L846
.L845:
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
.L846:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L847
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
    b       .L848
.L847:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L849
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
    b       .L850
.L849:
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
.L850:
.L848:
.L1335:
    add     sp, sp, #560
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_load_mem
_cgb_i_load_mem:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #496
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
    cbz     w11, .L851
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
    b       .L852
.L851:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L853
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
    b       .L854
.L853:
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
.L854:
.L852:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0070
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_normalize
    str     x0, [sp, #424]
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
    str     x0, [sp, #480]
.L1336:
    add     sp, sp, #496
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_cast
_cgb_i_cast:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #320
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
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L855
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    bl      _b_mov_x
    str     x0, [sp, #176]
.L855:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0028
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #8]
    movz    x12, #0x0070
    add     x13, x11, x12
    ldr     x11, [x13]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_normalize
    str     x0, [sp, #256]
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
    str     x0, [sp, #312]
.L1337:
    add     sp, sp, #320
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
    cbz     w11, .L856
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L857
.L856:
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
.L857:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L858
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
    b       .L859
.L858:
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L860
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
    b       .L861
.L860:
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
.L861:
.L859:
.L1338:
    add     sp, sp, #544
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_binop
_cgb_i_binop:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #592
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
    cbz     w11, .L862
    movz    x9, #0x0001
    str     x9, [sp, #16]
.L862:
    mov     x9, #0
    str     x9, [sp, #24]
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L863
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
    b       .L864
.L863:
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
.L864:
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
    ldr     x14, [sp, #8]
    movz    x15, #0x0070
    add     x16, x14, x15
    str     x16, [sp, #504]
    ldr     x17, [sp, #504]
    ldr     x14, [x17]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    mov     x4, x13
    mov     x5, x14
    bl      _cgb_alu
    str     x0, [sp, #520]
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
    str     x0, [sp, #576]
.L1339:
    add     sp, sp, #592
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_cmp
_cgb_i_cmp:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #800
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    str     x2, [sp, #16]
    ldr     x9, [sp, #8]
    movz    x10, #0x0070
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L865
    ldr     x9, [sp, #16]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L866
    movz    x9, #0x0006
    str     x9, [sp, #16]
.L866:
    ldr     x9, [sp, #16]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L867
    movz    x9, #0x0007
    str     x9, [sp, #16]
.L867:
    ldr     x9, [sp, #16]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L868
    movz    x9, #0x0008
    str     x9, [sp, #16]
.L868:
    ldr     x9, [sp, #16]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L869
    movz    x9, #0x0009
    str     x9, [sp, #16]
.L869:
.L865:
    mov     x9, #0
    str     x9, [sp, #24]
    ldr     x9, [sp, #8]
    movz    x10, #0x0028
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L870
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L870:
    mov     x9, #0
    str     x9, [sp, #32]
    mov     x9, #0
    str     x9, [sp, #40]
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L871
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
    b       .L872
.L871:
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
.L872:
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
    cbz     w11, .L873
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    mov     x0, x9
    mov     x1, x10
    bl      _enc_cmp_reg
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #656]
    b       .L874
.L873:
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
    str     x0, [sp, #696]
.L874:
    ldr     x16, [sp, #48]
    str     x16, [sp, #704]
    ldr     x9, [sp, #16]
    mov     x0, x9
    bl      _cgb_invcond
    mov     x10, x0
    ldr     x0, [sp, #704]
    mov     x1, x10
    bl      _enc_cset
    mov     x9, x0
    mov     x0, x9
    bl      _cb_word
    str     x0, [sp, #736]
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
    str     x0, [sp, #792]
.L1340:
    add     sp, sp, #800
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
    cbz     w11, .L875
    movz    x9, #0x0010
    ldr     x10, [sp, #40]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_mov_x
    str     x0, [sp, #280]
    b       .L876
.L875:
    movz    x9, #0x0010
    ldr     x10, [sp, #32]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_ldr_x
    str     x0, [sp, #320]
.L876:
    movz    x9, #0x0001
    str     x9, [sp, #48]
.L877:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #8]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L878
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
    b       .L877
.L878:
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
    cbz     w11, .L879
    ldr     x9, [sp, #56]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x9, #0
    mov     x0, x11
    mov     x1, x9
    bl      _b_mov_x
    str     x0, [sp, #648]
    b       .L1341
.L879:
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
.L1341:
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
    adrp    x9, L_str194@PAGE
    add     x9, x9, L_str194@PAGEOFF
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
    cbz     w10, .L880
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_syscall
    str     x0, [sp, #216]
    b       .L1342
.L880:
    ldr     x9, [sp, #8]
    movz    x10, #0x0060
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    mov     x9, #0
    str     x9, [sp, #48]
.L881:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #8]
    movz    x11, #0x0068
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L882
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
    b       .L881
.L882:
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
    cbz     w11, .L883
    ldr     x9, [sp, #72]
    movz    x10, #0x0009
    add     x11, x9, x10
    mov     x9, #0
    mov     x0, x11
    mov     x1, x9
    bl      _b_mov_x
    str     x0, [sp, #704]
    b       .L1342
.L883:
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
.L1342:
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
    cbz     w11, .L884
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
    b       .L1343
.L884:
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
.L1343:
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
    cbz     w11, .L885
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
    cbz     w11, .L886
    ldr     x9, [sp, #32]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    movz    x9, #0x0008
    cmp     x10, x9
    cset    w11, eq
    cbz     w11, .L887
    movz    x9, #0x0001
    str     x9, [sp, #24]
.L887:
.L886:
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
    cbz     w11, .L888
    ldr     x9, [sp, #48]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L889
    mov     x9, #0
    ldr     x10, [sp, #48]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_mov_x
    str     x0, [sp, #392]
    b       .L890
.L889:
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
.L890:
    b       .L891
.L888:
    ldr     x9, [sp, #48]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L892
    mov     x9, #0
    ldr     x10, [sp, #48]
    movz    x11, #0x0009
    add     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_mov_w
    str     x0, [sp, #520]
    b       .L893
.L892:
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
.L893:
.L891:
.L885:
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
.L1344:
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
.L1345:
    add     sp, sp, #96
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_i_jz
_cgb_i_jz:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #480
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    mov     x9, #0
    str     x9, [sp, #16]
    ldr     x9, [sp, #0]
    movz    x10, #0x0030
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #8]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    movz    x9, #0x0008
    cmp     x10, x9
    cset    w11, eq
    cbz     w11, .L894
    movz    x9, #0x0001
    str     x9, [sp, #16]
.L894:
    mov     x9, #0
    str     x9, [sp, #32]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L895
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
    b       .L896
.L895:
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
.L896:
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
    str     x0, [sp, #376]
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L897
    ldr     x9, [sp, #32]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _enc_cbz_x
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #432]
    b       .L898
.L897:
    ldr     x9, [sp, #32]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _enc_cbz_w
    mov     x11, x0
    mov     x0, x11
    bl      _cb_word
    str     x0, [sp, #464]
.L898:
.L1346:
    add     sp, sp, #480
    ldp     x29, x30, [sp], #16
    ret

    .globl   _cgb_instr
_cgb_instr:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #1120
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
    cbz     w11, .L899
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_movi
    str     x0, [sp, #112]
    b       .L1347
.L899:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L900
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_label_addr
    str     x0, [sp, #160]
    b       .L1347
.L900:
    ldr     x9, [sp, #32]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L901
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_addr_local
    str     x0, [sp, #208]
    b       .L1347
.L901:
    ldr     x9, [sp, #32]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L902
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_load_local
    str     x0, [sp, #256]
    b       .L1347
.L902:
    ldr     x9, [sp, #32]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L903
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_store_local
    str     x0, [sp, #304]
    b       .L1347
.L903:
    ldr     x9, [sp, #32]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L904
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_load_mem
    str     x0, [sp, #352]
    b       .L1347
.L904:
    ldr     x9, [sp, #32]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L905
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_store_mem
    str     x0, [sp, #400]
    b       .L1347
.L905:
    ldr     x9, [sp, #32]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L906
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_binop
    str     x0, [sp, #448]
    b       .L1347
.L906:
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L907
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #504]
    b       .L1347
.L907:
    ldr     x9, [sp, #32]
    movz    x10, #0x0009
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L908
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0001
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #560]
    b       .L1347
.L908:
    ldr     x9, [sp, #32]
    movz    x10, #0x000a
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L909
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0002
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #616]
    b       .L1347
.L909:
    ldr     x9, [sp, #32]
    movz    x10, #0x000b
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L910
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0003
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #672]
    b       .L1347
.L910:
    ldr     x9, [sp, #32]
    movz    x10, #0x000c
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L911
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0004
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #728]
    b       .L1347
.L911:
    ldr     x9, [sp, #32]
    movz    x10, #0x000d
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L912
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    movz    x11, #0x0005
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_cmp
    str     x0, [sp, #784]
    b       .L1347
.L912:
    ldr     x9, [sp, #32]
    movz    x10, #0x000e
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L913
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_call
    str     x0, [sp, #840]
    b       .L1347
.L913:
    ldr     x9, [sp, #32]
    movz    x10, #0x000f
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L914
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #16]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cgb_i_ret
    str     x0, [sp, #896]
    b       .L1347
.L914:
    ldr     x9, [sp, #32]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L915
    ldr     x9, [sp, #8]
    mov     x0, x9
    bl      _cgb_i_jmp
    str     x0, [sp, #936]
    b       .L1347
.L915:
    ldr     x9, [sp, #32]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L916
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_jz
    str     x0, [sp, #984]
    b       .L1347
.L916:
    ldr     x9, [sp, #32]
    movz    x10, #0x0012
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L917
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
    b       .L1347
.L917:
    ldr     x9, [sp, #32]
    movz    x10, #0x0013
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L918
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_i_cast
    str     x0, [sp, #1104]
    b       .L1347
.L918:
.L1347:
    add     sp, sp, #1120
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
    cbz     w11, .L919
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0fff
    cmp     x9, x10
    cset    w11, ls
    cbz     w11, .L920
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
    b       .L921
.L920:
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
.L921:
.L919:
.L1348:
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
    cbz     w11, .L922
    ldr     x9, [sp, #0]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0fff
    cmp     x9, x10
    cset    w11, ls
    cbz     w11, .L923
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
    b       .L924
.L923:
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
.L924:
.L922:
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
.L1349:
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
    cbz     w11, .L925
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
    cbz     w11, .L926
    ldr     x9, [sp, #32]
    mov     x0, x9
    bl      _type_width
    mov     x10, x0
    str     x10, [sp, #40]
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L927
    movz    x9, #0x0001
    str     x9, [sp, #16]
.L927:
    ldr     x9, [sp, #40]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L928
    movz    x9, #0x0004
    str     x9, [sp, #16]
.L928:
.L926:
.L925:
    ldr     x9, [sp, #16]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L929
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_strb
    str     x0, [sp, #320]
    b       .L1350
.L929:
    ldr     x9, [sp, #16]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L930
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_str_w
    str     x0, [sp, #384]
    b       .L1350
.L930:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #8]
    movz    x11, #0x0008
    mul     x12, x10, x11
    mov     x0, x9
    mov     x1, x12
    bl      _b_str_x
    str     x0, [sp, #424]
.L1350:
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
.L931:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #0]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L932
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
    b       .L931
.L932:
    ldr     x9, [sp, #0]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
.L933:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L934
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
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L933
.L934:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    mov     x0, x9
    mov     x1, x10
    bl      _cgb_epilogue
    str     x0, [sp, #304]
.L1351:
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
.L935:
    ldr     x9, [sp, #48]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L936
    ldr     x9, [sp, #48]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L937
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
    cbz     w10, .L938
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L1352
.L938:
.L937:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #48]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #48]
    b       .L935
.L936:
    mov     x9, #0
    mov     x0, x9
    b       .L1352
.L1352:
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
    uxtb    w9, w9
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0001
    add     x13, x11, x12
    add     x11, x10, x13
    ldrb    w10, [x11]
    uxtb    w10, w10
    movz    x11, #0x0008
    lsl     w12, w10, w11
    orr     w10, w9, w12
    ldr     x9, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0002
    add     x13, x11, x12
    add     x11, x9, x13
    ldrb    w9, [x11]
    uxtb    w9, w9
    movz    x11, #0x0010
    lsl     w12, w9, w11
    orr     w9, w10, w12
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0003
    add     x13, x11, x12
    add     x11, x10, x13
    ldrb    w10, [x11]
    uxtb    w10, w10
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
.L1353:
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
.L939:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L940
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
    cbz     w11, .L941
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
.L941:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L942
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
.L942:
    ldr     x9, [sp, #40]
    movz    x10, #0x0002
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L943
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
.L943:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L939
.L940:
.L1354:
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
.L944:
    ldr     x9, [sp, #16]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L945
    ldr     x9, [sp, #16]
    movz    x10, #0x0058
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
.L946:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L947
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0012
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L948
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L949
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #8]
.L949:
.L948:
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0010
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L950
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L951
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #8]
.L951:
.L950:
    ldr     x9, [sp, #24]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0011
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L952
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, hs
    cbz     w11, .L953
    ldr     x9, [sp, #24]
    movz    x10, #0x0038
    add     x11, x9, x10
    ldr     x9, [x11]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #8]
.L953:
.L952:
    ldr     x9, [sp, #24]
    movz    x10, #0x0078
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #24]
    b       .L946
.L947:
    ldr     x9, [sp, #16]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #16]
    b       .L944
.L945:
    ldr     x9, [sp, #8]
    mov     x0, x9
    b       .L1355
.L1355:
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
.L1356:
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
    b       .L1357
.L1357:
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
    adrp    x9, L_str195@PAGE
    add     x9, x9, L_str195@PAGEOFF
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
.L954:
    ldr     x9, [sp, #80]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L955
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
    b       .L954
.L955:
    bl      _cgb_resolve_branches
    str     x0, [sp, #616]
.L1358:
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
    b       .L1359
.L1359:
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
    uxtb    w9, w9
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0001
    add     x13, x11, x12
    add     x11, x10, x13
    ldrb    w10, [x11]
    uxtb    w10, w10
    movz    x11, #0x0008
    lsl     w12, w10, w11
    orr     w10, w9, w12
    ldr     x9, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0002
    add     x13, x11, x12
    add     x11, x9, x13
    ldrb    w9, [x11]
    uxtb    w9, w9
    movz    x11, #0x0010
    lsl     w12, w9, w11
    orr     w9, w10, w12
    ldr     x10, [sp, #16]
    ldr     x11, [sp, #0]
    movz    x12, #0x0003
    add     x13, x11, x12
    add     x11, x10, x13
    ldrb    w10, [x11]
    uxtb    w10, w10
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
.L1360:
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
.L956:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L957
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
    b       .L956
.L957:
    ldr     x9, [sp, #16]
    movz    x10, #0x0228
    sub     x11, x9, x10
    mov     x0, x11
    b       .L1361
.L1361:
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
.L958:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L959
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
    cbz     w11, .L960
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
.L960:
    ldr     x9, [sp, #40]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L961
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
.L961:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L958
.L959:
.L1362:
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
    cbz     w10, .L962
    movz    x9, #0x0048
    mov     x0, x9
    bl      _io_exit
    str     x0, [sp, #176]
.L962:
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
.L963:
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L964
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #48]
    ldr     x11, [sp, #56]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #336]
    ldr     x9, [sp, #56]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #56]
    b       .L963
.L964:
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #64]
.L965:
    ldr     x9, [sp, #64]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L966
    ldr     x9, [sp, #64]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _cgb_stroff_get
    mov     x10, x0
    str     x10, [sp, #72]
.L967:
    bl      _mc_get
    mov     x9, x0
    ldr     x10, [sp, #72]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L968
    ldr     x9, [sp, #32]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #504]
    b       .L967
.L968:
    mov     x9, #0
    str     x9, [sp, #80]
.L969:
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #64]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L970
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #64]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #80]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #632]
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #80]
    b       .L969
.L970:
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
    b       .L965
.L966:
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
.L1363:
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
.L971:
    ldr     x9, [sp, #40]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L972
    ldr     x9, [sp, #40]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L973
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
    cbz     w10, .L974
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L1364
.L974:
.L973:
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
    ldr     x9, [sp, #40]
    movz    x10, #0x0068
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #40]
    b       .L971
.L972:
    mov     x9, #0
    mov     x0, x9
    b       .L1364
.L1364:
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
.L1365:
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
    b       .L1366
.L1366:
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
.L1367:
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
    b       .L1368
.L1368:
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
.L975:
    ldr     x9, [sp, #8]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L976
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
    b       .L975
.L976:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L977
    mov     x9, #0
    mov     x0, x9
    b       .L1369
.L977:
    ldr     x9, [sp, #24]
    movz    x10, #0x3fff
    add     x11, x9, x10
    movz    x9, #0x4000
    udiv     x10, x11, x9
    movz    x9, #0x4000
    mul     x11, x10, x9
    mov     x0, x11
    b       .L1369
.L1369:
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
.L978:
    ldr     x9, [sp, #32]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L979
    ldr     x9, [sp, #32]
    movz    x10, #0x0008
    add     x11, x9, x10
    ldr     x9, [x11]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L980
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
    cbz     w11, .L981
    ldr     x9, [sp, #40]
    mov     x0, x9
    b       .L1370
.L981:
.L980:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    ldr     x9, [sp, #32]
    movz    x10, #0x0018
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #32]
    b       .L978
.L979:
    mov     x9, #0
    mov     x0, x9
    b       .L1370
.L1370:
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
.L982:
    ldr     x9, [sp, #24]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L983
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
    b       .L982
.L983:
    ldr     x9, [sp, #16]
    movz    x10, #0x02c0
    sub     x11, x9, x10
    mov     x0, x11
    b       .L1371
.L1371:
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
.L984:
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L985
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
    cbz     w11, .L986
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
.L986:
    ldr     x9, [sp, #56]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L987
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
.L987:
    ldr     x9, [sp, #56]
    movz    x10, #0x0005
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L988
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
.L988:
    ldr     x9, [sp, #56]
    movz    x10, #0x0006
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L989
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
.L989:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L984
.L985:
.L1372:
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
    cbz     w11, .L990
    movz    x9, #0x4000
    str     x9, [sp, #64]
.L990:
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
.L991:
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L992
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #424]
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #80]
    b       .L991
.L992:
    ldr     x9, [sp, #8]
    movz    x10, #0x0020
    add     x11, x9, x10
    ldr     x9, [x11]
    str     x9, [sp, #88]
.L993:
    ldr     x9, [sp, #88]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, ne
    cbz     w11, .L994
    ldr     x9, [sp, #88]
    mov     x10, #0
    add     x11, x9, x10
    ldr     x9, [x11]
    mov     x0, x9
    bl      _cgb_stroff_get
    mov     x10, x0
    str     x10, [sp, #96]
.L995:
    bl      _mc_get
    mov     x9, x0
    ldr     x10, [sp, #96]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L996
    ldr     x9, [sp, #40]
    mov     x10, #0
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #592]
    b       .L995
.L996:
    mov     x9, #0
    str     x9, [sp, #104]
.L997:
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #88]
    movz    x11, #0x0010
    add     x12, x10, x11
    ldr     x10, [x12]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L998
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #88]
    movz    x11, #0x0008
    add     x12, x10, x11
    ldr     x10, [x12]
    ldr     x11, [sp, #104]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _e8
    str     x0, [sp, #720]
    ldr     x9, [sp, #104]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #104]
    b       .L997
.L998:
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
    b       .L993
.L994:
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
.L1373:
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
    b       .L1374
.L1374:
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
    b       .L1375
.L1375:
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
    b       .L1376
.L1376:
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
.L999:
    ldr     x9, [sp, #48]
    ldr     x10, [sp, #24]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1000
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L1001
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
    cbz     w10, .L1002
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1377
.L1002:
.L1001:
    ldr     x9, [sp, #48]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #48]
    b       .L999
.L1000:
    mov     x9, #0
    mov     x0, x9
    b       .L1377
.L1377:
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
    cbz     w11, .L1003
    adrp    x9, L_str196@PAGE
    add     x9, x9, L_str196@PAGEOFF
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
.L1003:
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
.L1378:
    add     sp, sp, #368
    ldp     x29, x30, [sp], #16
    ret

    .globl   _pp_out_append
_pp_out_append:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #512
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
    bl      _pp_out_cap
    mov     x9, x0
    str     x9, [sp, #32]
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    cmp     x9, x10
    cset    w11, hi
    cbz     w11, .L1004
    adrp    x9, L_str197@PAGE
    add     x9, x9, L_str197@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x002a
    str     x9, [sp, #48]
    ldr     x9, [sp, #40]
    ldr     x10, [sp, #48]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #216]
.L1004:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #32]
    ldr     x11, [sp, #24]
    sub     x12, x10, x11
    cmp     x9, x12
    cset    w10, hi
    cbz     w10, .L1005
    adrp    x9, L_str198@PAGE
    add     x9, x9, L_str198@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x002a
    str     x9, [sp, #64]
    ldr     x9, [sp, #56]
    ldr     x10, [sp, #64]
    mov     x11, #0
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _die_line
    str     x0, [sp, #304]
.L1005:
    adrp    x9, _PP_OUT@PAGE
    add     x9, x9, _PP_OUT@PAGEOFF
    str     x9, [sp, #72]
    mov     x9, #0
    str     x9, [sp, #80]
.L1006:
    ldr     x9, [sp, #80]
    ldr     x10, [sp, #8]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1007
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #80]
    add     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #0]
    ldr     x11, [sp, #80]
    add     x12, x9, x11
    ldrb    w9, [x12]
    uxtb    w9, w9
    strb    w9, [x10]
    ldr     x9, [sp, #80]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #80]
    b       .L1006
.L1007:
    ldr     x9, [sp, #16]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [sp, #24]
    ldr     x11, [sp, #8]
    add     x12, x9, x11
    str     x12, [x10]
.L1379:
    add     sp, sp, #512
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
    adrp    x9, L_str199@PAGE
    add     x9, x9, L_str199@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x0007
    str     x9, [sp, #32]
    ldr     x9, [sp, #8]
    movz    x10, #0x0007
    add     x11, x9, x10
    ldr     x9, [sp, #16]
    cmp     x11, x9
    cset    w10, hi
    cbz     w10, .L1008
    mov     x9, #0
    mov     x0, x9
    b       .L1380
.L1008:
    mov     x9, #0
    str     x9, [sp, #40]
.L1009:
    ldr     x9, [sp, #40]
    movz    x10, #0x0007
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1010
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #40]
    add     x12, x10, x11
    add     x10, x9, x12
    ldrb    w9, [x10]
    uxtb    w9, w9
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #40]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L1011
    mov     x9, #0
    mov     x0, x9
    b       .L1380
.L1011:
    ldr     x9, [sp, #40]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #40]
    b       .L1009
.L1010:
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1380
.L1380:
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
    cmp     x11, x9
    cset    w10, eq
    cbz     w10, .L1012
    b       .L1381
.L1012:
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
.L1013:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1014
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    add     x11, x9, x10
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #32]
    add     x12, x9, x10
    ldrb    w9, [x12]
    uxtb    w9, w9
    strb    w9, [x11]
    ldr     x9, [sp, #32]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L1013
.L1014:
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
    cbz     w11, .L1015
    b       .L1381
.L1015:
    mov     x9, #0
    str     x9, [sp, #72]
.L1016:
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
    cbz     w11, .L1018
    b       .L1017
.L1018:
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #80]
    add     x11, x9, x10
    str     x11, [sp, #72]
    b       .L1016
.L1017:
    ldr     x9, [sp, #64]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #664]
    ldr     x9, [sp, #72]
    ldr     x10, [sp, #40]
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L1019
    adrp    x9, L_str200@PAGE
    add     x9, x9, L_str200@PAGEOFF
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
.L1019:
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
.L1020:
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #72]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1021
    ldr     x9, [sp, #112]
    str     x9, [sp, #120]
.L1022:
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #72]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1023
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #112]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    movz    x10, #0x000a
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L1024
    b       .L1023
.L1024:
    ldr     x9, [sp, #112]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #112]
    b       .L1022
.L1023:
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
    cmp     x12, x9
    cset    w10, eq
    cbz     w10, .L1025
    ldr     x9, [sp, #120]
    movz    x10, #0x0007
    add     x11, x9, x10
    str     x11, [sp, #136]
.L1026:
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #128]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1027
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #136]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L1028
    b       .L1027
.L1028:
    ldr     x9, [sp, #136]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #136]
    b       .L1026
.L1027:
    ldr     x9, [sp, #136]
    ldr     x10, [sp, #128]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1029
    ldr     x9, [sp, #136]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #144]
.L1030:
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #128]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1031
    ldr     x9, [sp, #104]
    ldr     x10, [sp, #144]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    movz    x10, #0x0027
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L1032
    b       .L1031
.L1032:
    ldr     x9, [sp, #144]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #144]
    b       .L1030
.L1031:
    ldr     x9, [sp, #144]
    ldr     x10, [sp, #128]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1033
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
.L1034:
    ldr     x9, [sp, #168]
    ldr     x10, [sp, #152]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1035
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
    uxtb    w9, w9
    strb    w9, [x11]
    ldr     x9, [sp, #168]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #168]
    b       .L1034
.L1035:
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
.L1033:
.L1029:
    b       .L1036
.L1025:
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
    cbz     w11, .L1037
    ldr     x9, [sp, #176]
    movz    x10, #0x0001
    mov     x0, x9
    mov     x1, x10
    bl      _pp_out_append
    str     x0, [sp, #1736]
.L1037:
.L1036:
    ldr     x9, [sp, #112]
    ldr     x10, [sp, #72]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1038
    ldr     x9, [sp, #112]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #112]
.L1038:
    b       .L1020
.L1021:
.L1381:
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
.L1039:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    bl      _lex_next
    str     x0, [sp, #168]
    adrp    x9, L_str201@PAGE
    add     x9, x9, L_str201@PAGEOFF
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
    mov     w10, w10
    mov     x0, x9
    mov     x1, x10
    bl      _out_u64
    str     x0, [sp, #264]
    adrp    x9, L_str202@PAGE
    add     x9, x9, L_str202@PAGEOFF
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
    adrp    x9, L_str203@PAGE
    add     x9, x9, L_str203@PAGEOFF
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
    adrp    x9, L_str204@PAGE
    add     x9, x9, L_str204@PAGEOFF
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
    mov     w9, w9
    mov     x10, #0
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L1041
    b       .L1040
.L1041:
    b       .L1039
.L1040:
.L1382:
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
    cbz     w11, .L1042
    mov     x9, #0
    mov     x0, x9
    b       .L1383
.L1042:
    mov     x9, #0
    str     x9, [sp, #32]
.L1043:
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
    cbz     w11, .L1045
    b       .L1044
.L1045:
    ldr     x9, [sp, #32]
    ldr     x10, [sp, #40]
    add     x11, x9, x10
    str     x11, [sp, #32]
    b       .L1043
.L1044:
    ldr     x9, [sp, #24]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #224]
    ldr     x9, [sp, #32]
    mov     x0, x9
    b       .L1383
.L1383:
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
.L1046:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1047
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L1048
    mov     x9, #0
    mov     x0, x9
    b       .L1384
.L1048:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L1046
.L1047:
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1384
.L1384:
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
.L1049:
    ldr     x9, [sp, #24]
    ldr     x10, [sp, #16]
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1050
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #24]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    ldr     x10, [sp, #8]
    ldr     x11, [sp, #24]
    add     x12, x10, x11
    ldrb    w10, [x12]
    uxtb    w10, w10
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L1051
    mov     x9, #0
    mov     x0, x9
    b       .L1385
.L1051:
    ldr     x9, [sp, #24]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #24]
    b       .L1049
.L1050:
    ldr     x9, [sp, #0]
    ldr     x10, [sp, #16]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    mov     x10, #0
    cmp     w9, w10
    cset    w11, ne
    cbz     w11, .L1052
    mov     x9, #0
    mov     x0, x9
    b       .L1385
.L1052:
    movz    x9, #0x0001
    mov     x0, x9
    b       .L1385
.L1385:
    add     sp, sp, #240
    ldp     x29, x30, [sp], #16
    ret

    .globl   _main
_main:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    sub     sp, sp, #2048
    str     x0, [sp, #0]
    str     x1, [sp, #8]
    ldr     x9, [sp, #0]
    movz    x10, #0x0003
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1053
    movz    x9, #0x0002
    mov     w0, w9
    b       .L1386
.L1053:
    ldr     x9, [sp, #8]
    movz    x10, #0x0001
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #16]
    adrp    x9, L_str205@PAGE
    add     x9, x9, L_str205@PAGEOFF
    str     x9, [sp, #24]
    movz    x9, #0x000d
    str     x9, [sp, #32]
    adrp    x9, L_str206@PAGE
    add     x9, x9, L_str206@PAGEOFF
    str     x9, [sp, #40]
    movz    x9, #0x0009
    str     x9, [sp, #48]
    adrp    x9, L_str207@PAGE
    add     x9, x9, L_str207@PAGEOFF
    str     x9, [sp, #56]
    movz    x9, #0x000c
    str     x9, [sp, #64]
    adrp    x9, L_str208@PAGE
    add     x9, x9, L_str208@PAGEOFF
    str     x9, [sp, #72]
    movz    x9, #0x000a
    str     x9, [sp, #80]
    adrp    x9, L_str209@PAGE
    add     x9, x9, L_str209@PAGEOFF
    str     x9, [sp, #88]
    movz    x9, #0x000e
    str     x9, [sp, #96]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #24]
    ldr     x11, [sp, #32]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cstr_eq
    mov     x12, x0
    str     x12, [sp, #104]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #40]
    ldr     x11, [sp, #48]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cstr_eq
    mov     x12, x0
    str     x12, [sp, #112]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #56]
    ldr     x11, [sp, #64]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cstr_eq
    mov     x12, x0
    str     x12, [sp, #120]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #72]
    ldr     x11, [sp, #80]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cstr_eq
    mov     x12, x0
    str     x12, [sp, #128]
    ldr     x9, [sp, #16]
    ldr     x10, [sp, #88]
    ldr     x11, [sp, #96]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _cstr_eq
    mov     x12, x0
    str     x12, [sp, #136]
    ldr     x9, [sp, #104]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L1054
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #144]
    ldr     x9, [sp, #144]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    movz    x11, #0x0004, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _read_all
    mov     x12, x0
    str     x12, [sp, #152]
    ldr     x9, [sp, #152]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L1055
    movz    x9, #0x0003
    mov     w0, w9
    b       .L1386
.L1055:
    adrp    x9, _OUT_STORAGE@PAGE
    add     x9, x9, _OUT_STORAGE@PAGEOFF
    str     x9, [sp, #160]
    ldr     x9, [sp, #160]
    movz    x10, #0x0001
    adrp    x11, _OUT_BUF@PAGE
    add     x11, x11, _OUT_BUF@PAGEOFF
    movz    x12, #0x0001, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #856]
    ldr     x9, [sp, #160]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    ldr     x11, [sp, #152]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _dump_tokens
    str     x0, [sp, #888]
    ldr     x9, [sp, #160]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #904]
    mov     x9, #0
    mov     w0, w9
    b       .L1386
.L1054:
    ldr     x9, [sp, #112]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L1056
    ldr     x9, [sp, #8]
    movz    x10, #0x0002
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #168]
    ldr     x9, [sp, #168]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    movz    x11, #0x0004, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _read_all
    mov     x12, x0
    str     x12, [sp, #176]
    ldr     x9, [sp, #176]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L1057
    movz    x9, #0x0003
    mov     w0, w9
    b       .L1386
.L1057:
    bl      _ast_init
    mov     x9, x0
    str     x9, [sp, #184]
    bl      _ir_init
    mov     x9, x0
    str     x9, [sp, #192]
    ldr     x9, [sp, #184]
    adrp    x10, _SRC_BUF@PAGE
    add     x10, x10, _SRC_BUF@PAGEOFF
    ldr     x11, [sp, #176]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _parse
    mov     x12, x0
    str     x12, [sp, #200]
    ldr     x9, [sp, #192]
    ldr     x10, [sp, #200]
    mov     x0, x9
    mov     x1, x10
    bl      _lower
    mov     x11, x0
    str     x11, [sp, #208]
    adrp    x9, _OUT_STORAGE@PAGE
    add     x9, x9, _OUT_STORAGE@PAGEOFF
    str     x9, [sp, #216]
    ldr     x9, [sp, #216]
    movz    x10, #0x0001
    adrp    x11, _OUT_BUF@PAGE
    add     x11, x11, _OUT_BUF@PAGEOFF
    movz    x12, #0x0001, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #1168]
    ldr     x9, [sp, #216]
    ldr     x10, [sp, #208]
    mov     x0, x9
    mov     x1, x10
    bl      _dump_ir
    str     x0, [sp, #1192]
    ldr     x9, [sp, #216]
    mov     x0, x9
    bl      _out_flush
    str     x0, [sp, #1208]
    mov     x9, #0
    mov     w0, w9
    b       .L1386
.L1056:
    ldr     x9, [sp, #0]
    movz    x10, #0x0004
    cmp     x9, x10
    cset    w11, lo
    cbz     w11, .L1058
    movz    x9, #0x0002
    mov     w0, w9
    b       .L1386
.L1058:
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0003
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #224]
    ldr     x9, [sp, #8]
    ldr     x10, [sp, #0]
    movz    x11, #0x0001
    sub     x12, x10, x11
    movz    x10, #0x0008
    mul     x11, x12, x10
    add     x10, x9, x11
    ldr     x9, [x10]
    str     x9, [sp, #232]
    bl      _pp_arena_init
    mov     x9, x0
    str     x9, [sp, #240]
    mov     x9, #0
    str     x9, [sp, #248]
.L1059:
    ldr     x9, [sp, #224]
    ldr     x10, [sp, #248]
    add     x11, x9, x10
    ldrb    w9, [x11]
    uxtb    w9, w9
    mov     x10, #0
    cmp     w9, w10
    cset    w11, eq
    cbz     w11, .L1061
    b       .L1060
.L1061:
    ldr     x9, [sp, #248]
    movz    x10, #0x0001
    add     x11, x9, x10
    str     x11, [sp, #248]
    b       .L1059
.L1060:
    ldr     x9, [sp, #240]
    ldr     x10, [sp, #224]
    ldr     x11, [sp, #248]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _pp_expand
    str     x0, [sp, #1496]
    adrp    x9, _PP_OUT_LEN@PAGE
    add     x9, x9, _PP_OUT_LEN@PAGEOFF
    str     x9, [sp, #256]
    ldr     x9, [sp, #256]
    mov     x10, #0
    movz    x11, #0x0008
    mul     x12, x10, x11
    add     x10, x9, x12
    ldr     x9, [x10]
    str     x9, [sp, #264]
    ldr     x9, [sp, #264]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L1062
    movz    x9, #0x0003
    mov     w0, w9
    b       .L1386
.L1062:
    adrp    x9, _PP_OUT@PAGE
    add     x9, x9, _PP_OUT@PAGEOFF
    str     x9, [sp, #272]
    bl      _ast_init
    mov     x9, x0
    str     x9, [sp, #280]
    bl      _ir_init
    mov     x9, x0
    str     x9, [sp, #288]
    ldr     x9, [sp, #280]
    ldr     x10, [sp, #272]
    ldr     x11, [sp, #264]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    bl      _parse
    mov     x12, x0
    str     x12, [sp, #296]
    ldr     x9, [sp, #288]
    ldr     x10, [sp, #296]
    mov     x0, x9
    mov     x1, x10
    bl      _lower
    mov     x11, x0
    str     x11, [sp, #304]
    ldr     x9, [sp, #232]
    mov     x0, x9
    bl      _io_open_write
    mov     x10, x0
    str     x10, [sp, #312]
    ldr     x9, [sp, #312]
    mov     x10, #0
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L1063
    movz    x9, #0x0004
    mov     w0, w9
    b       .L1386
.L1063:
    ldr     x9, [sp, #120]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L1064
    ldr     x9, [sp, #296]
    mov     x0, x9
    bl      _cgb_bss_layout
    mov     x10, x0
    str     x10, [sp, #320]
    ldr     x9, [sp, #296]
    ldr     x10, [sp, #304]
    mov     x0, x9
    mov     x1, x10
    bl      _codegen_bytes
    str     x0, [sp, #1776]
    bl      _cb_pos
    mov     x9, x0
    str     x9, [sp, #328]
    adrp    x9, _CG_ENTRY@PAGE
    add     x9, x9, _CG_ENTRY@PAGEOFF
    str     x9, [sp, #336]
    ldr     x9, [sp, #312]
    ldr     x10, [sp, #296]
    ldr     x11, [sp, #328]
    ldr     x12, [sp, #336]
    mov     x13, #0
    movz    x14, #0x0008
    mul     x15, x13, x14
    add     x13, x12, x15
    ldr     x12, [x13]
    ldr     x13, [sp, #320]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    mov     x4, x13
    bl      _emit_macho_code_bss
    str     x0, [sp, #1880]
    b       .L1065
.L1064:
    adrp    x9, _OUT_STORAGE@PAGE
    add     x9, x9, _OUT_STORAGE@PAGEOFF
    str     x9, [sp, #344]
    ldr     x9, [sp, #344]
    ldr     x10, [sp, #312]
    adrp    x11, _OUT_BUF@PAGE
    add     x11, x11, _OUT_BUF@PAGEOFF
    movz    x12, #0x0001, lsl #16
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    bl      _out_init
    str     x0, [sp, #1928]
    movz    x9, #0x0001
    str     x9, [sp, #352]
    ldr     x9, [sp, #136]
    movz    x10, #0x0001
    cmp     x9, x10
    cset    w11, eq
    cbz     w11, .L1066
    movz    x9, #0x0002
    str     x9, [sp, #352]
.L1066:
    ldr     x9, [sp, #344]
    ldr     x10, [sp, #352]
    ldr     x11, [sp, #128]
    ldr     x12, [sp, #296]
    ldr     x13, [sp, #304]
    mov     x0, x9
    mov     x1, x10
    mov     x2, x11
    mov     x3, x12
    mov     x4, x13
    bl      _codegen
    str     x0, [sp, #2016]
.L1065:
    ldr     x9, [sp, #312]
    mov     x0, x9
    bl      _io_close
    str     x0, [sp, #2032]
    mov     x9, #0
    mov     w0, w9
    b       .L1386
.L1386:
    add     sp, sp, #2048
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
    .byte   0x63
    .byte   0x6f
    .byte   0x6e
    .byte   0x74
    .byte   0x69
    .byte   0x6e
    .byte   0x75
    .byte   0x65
    .byte   0x00
    .balign  8
L_str12:
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x75
    .byte   0x63
    .byte   0x74
    .byte   0x00
    .balign  8
L_str13:
    .byte   0x62
    .byte   0x73
    .byte   0x73
    .byte   0x00
    .balign  8
L_str14:
    .byte   0x6e
    .byte   0x69
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str15:
    .byte   0x73
    .byte   0x69
    .byte   0x7a
    .byte   0x65
    .byte   0x6f
    .byte   0x66
    .byte   0x00
    .balign  8
L_str16:
    .byte   0x61
    .byte   0x73
    .byte   0x00
    .balign  8
L_str17:
    .byte   0x61
    .byte   0x72
    .byte   0x72
    .byte   0x61
    .byte   0x79
    .byte   0x20
    .byte   0x6c
    .byte   0x6f
    .byte   0x63
    .byte   0x61
    .byte   0x6c
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
    .byte   0x65
    .byte   0x6c
    .byte   0x65
    .byte   0x6d
    .byte   0x65
    .byte   0x6e
    .byte   0x74
    .byte   0x6f
    .byte   0x73
    .byte   0x20
    .byte   0x64
    .byte   0x65
    .byte   0x20
    .byte   0x38
    .byte   0x20
    .byte   0x62
    .byte   0x79
    .byte   0x74
    .byte   0x65
    .byte   0x73
    .byte   0x00
    .balign  8
L_str18:
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
L_str19:
    .byte   0x73
    .byte   0x79
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str20:
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
    .byte   0x6e
    .byte   0x6f
    .byte   0x20
    .byte   0x72
    .byte   0x65
    .byte   0x73
    .byte   0x75
    .byte   0x65
    .byte   0x6c
    .byte   0x74
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str21:
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
L_str22:
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
L_str23:
    .byte   0x70
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str24:
    .byte   0x6c
    .byte   0x65
    .byte   0x6e
    .byte   0x00
    .balign  8
L_str25:
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
L_str26:
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
L_str27:
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
L_str28:
    .byte   0x63
    .byte   0x61
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
    .byte   0x6f
    .byte   0x72
    .byte   0x69
    .byte   0x67
    .byte   0x65
    .byte   0x6e
    .byte   0x20
    .byte   0x65
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x61
    .byte   0x72
    .byte   0x00
    .balign  8
L_str29:
    .byte   0x63
    .byte   0x61
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
    .byte   0x64
    .byte   0x65
    .byte   0x73
    .byte   0x74
    .byte   0x69
    .byte   0x6e
    .byte   0x6f
    .byte   0x20
    .byte   0x65
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x61
    .byte   0x72
    .byte   0x00
    .balign  8
L_str30:
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
L_str31:
    .byte   0x69
    .byte   0x6e
    .byte   0x64
    .byte   0x65
    .byte   0x78
    .byte   0x61
    .byte   0x63
    .byte   0x69
    .byte   0x6f
    .byte   0x6e
    .byte   0x20
    .byte   0x64
    .byte   0x65
    .byte   0x20
    .byte   0x61
    .byte   0x72
    .byte   0x72
    .byte   0x61
    .byte   0x79
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
    .byte   0x6c
    .byte   0x6f
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str32:
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
L_str33:
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
L_str34:
    .byte   0x61
    .byte   0x72
    .byte   0x72
    .byte   0x61
    .byte   0x79
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
    .byte   0x6c
    .byte   0x6f
    .byte   0x6e
    .byte   0x67
    .byte   0x69
    .byte   0x74
    .byte   0x75
    .byte   0x64
    .byte   0x20
    .byte   0x63
    .byte   0x6f
    .byte   0x6e
    .byte   0x73
    .byte   0x74
    .byte   0x61
    .byte   0x6e
    .byte   0x74
    .byte   0x65
    .byte   0x00
    .balign  8
L_str35:
    .byte   0x61
    .byte   0x72
    .byte   0x72
    .byte   0x61
    .byte   0x79
    .byte   0x20
    .byte   0x76
    .byte   0x61
    .byte   0x63
    .byte   0x69
    .byte   0x6f
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
L_str36:
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
L_str37:
    .byte   0x75
    .byte   0x38
    .byte   0x00
    .balign  8
L_str38:
    .byte   0x75
    .byte   0x33
    .byte   0x32
    .byte   0x00
    .balign  8
L_str39:
    .byte   0x75
    .byte   0x36
    .byte   0x34
    .byte   0x00
    .balign  8
L_str40:
    .byte   0x69
    .byte   0x38
    .byte   0x00
    .balign  8
L_str41:
    .byte   0x69
    .byte   0x33
    .byte   0x32
    .byte   0x00
    .balign  8
L_str42:
    .byte   0x69
    .byte   0x36
    .byte   0x34
    .byte   0x00
    .balign  8
L_str43:
    .byte   0x62
    .byte   0x6f
    .byte   0x6f
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str44:
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str45:
    .byte   0x6c
    .byte   0x65
    .byte   0x63
    .byte   0x74
    .byte   0x75
    .byte   0x72
    .byte   0x61
    .byte   0x20
    .byte   0x64
    .byte   0x65
    .byte   0x20
    .byte   0x6c
    .byte   0x6f
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x20
    .byte   0x6e
    .byte   0x6f
    .byte   0x20
    .byte   0x69
    .byte   0x6e
    .byte   0x69
    .byte   0x63
    .byte   0x69
    .byte   0x61
    .byte   0x6c
    .byte   0x69
    .byte   0x7a
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str46:
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
L_str47:
    .byte   0x69
    .byte   0x6e
    .byte   0x69
    .byte   0x63
    .byte   0x69
    .byte   0x61
    .byte   0x6c
    .byte   0x69
    .byte   0x7a
    .byte   0x61
    .byte   0x64
    .byte   0x6f
    .byte   0x72
    .byte   0x20
    .byte   0x64
    .byte   0x65
    .byte   0x20
    .byte   0x61
    .byte   0x72
    .byte   0x72
    .byte   0x61
    .byte   0x79
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
L_str48:
    .byte   0x61
    .byte   0x73
    .byte   0x69
    .byte   0x67
    .byte   0x6e
    .byte   0x61
    .byte   0x63
    .byte   0x69
    .byte   0x6f
    .byte   0x6e
    .byte   0x20
    .byte   0x64
    .byte   0x65
    .byte   0x20
    .byte   0x61
    .byte   0x72
    .byte   0x72
    .byte   0x61
    .byte   0x79
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
    .byte   0x61
    .byte   0x00
    .balign  8
L_str49:
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
L_str50:
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
L_str51:
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
L_str52:
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
L_str53:
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
L_str54:
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
L_str55:
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
L_str56:
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
L_str57:
    .byte   0x73
    .byte   0x79
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str58:
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
L_str59:
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
L_str60:
    .byte   0x63
    .byte   0x6f
    .byte   0x6e
    .byte   0x74
    .byte   0x69
    .byte   0x6e
    .byte   0x75
    .byte   0x65
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
L_str61:
    .byte   0x66
    .byte   0x6e
    .byte   0x20
    .byte   0x00
    .balign  8
L_str62:
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
L_str63:
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
L_str64:
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
L_str65:
    .byte   0x20
    .byte   0x20
    .byte   0x6f
    .byte   0x70
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str66:
    .byte   0x20
    .byte   0x64
    .byte   0x73
    .byte   0x74
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str67:
    .byte   0x20
    .byte   0x61
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str68:
    .byte   0x20
    .byte   0x62
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str69:
    .byte   0x20
    .byte   0x6c
    .byte   0x6f
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str70:
    .byte   0x20
    .byte   0x69
    .byte   0x6d
    .byte   0x6d
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str71:
    .byte   0x20
    .byte   0x6c
    .byte   0x61
    .byte   0x62
    .byte   0x65
    .byte   0x6c
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str72:
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
L_str73:
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
L_str76:
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
L_str77:
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
L_str78:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str79:
    .byte   0x2c
    .byte   0x20
    .byte   0x5b
    .byte   0x00
    .balign  8
L_str80:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str81:
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
L_str82:
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str83:
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
L_str84:
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x78
    .byte   0x00
    .balign  8
L_str85:
    .byte   0x2c
    .byte   0x20
    .byte   0x6c
    .byte   0x73
    .byte   0x6c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str86:
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
L_str87:
    .byte   0x2c
    .byte   0x20
    .byte   0x23
    .byte   0x30
    .byte   0x78
    .byte   0x00
    .balign  8
L_str88:
    .byte   0x2c
    .byte   0x20
    .byte   0x6c
    .byte   0x73
    .byte   0x6c
    .byte   0x20
    .byte   0x23
    .byte   0x00
    .balign  8
L_str89:
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
L_str90:
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
L_str91:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str92:
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
L_str93:
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
L_str94:
    .byte   0x5d
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str95:
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
L_str96:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str97:
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
L_str98:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str99:
    .byte   0x61
    .byte   0x64
    .byte   0x64
    .byte   0x00
    .balign  8
L_str100:
    .byte   0x73
    .byte   0x75
    .byte   0x62
    .byte   0x00
    .balign  8
L_str101:
    .byte   0x6d
    .byte   0x75
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str102:
    .byte   0x73
    .byte   0x64
    .byte   0x69
    .byte   0x76
    .byte   0x00
    .balign  8
L_str103:
    .byte   0x75
    .byte   0x64
    .byte   0x69
    .byte   0x76
    .byte   0x00
    .balign  8
L_str104:
    .byte   0x61
    .byte   0x6e
    .byte   0x64
    .byte   0x00
    .balign  8
L_str105:
    .byte   0x6f
    .byte   0x72
    .byte   0x72
    .byte   0x00
    .balign  8
L_str106:
    .byte   0x65
    .byte   0x6f
    .byte   0x72
    .byte   0x00
    .balign  8
L_str107:
    .byte   0x6c
    .byte   0x73
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str108:
    .byte   0x6c
    .byte   0x73
    .byte   0x72
    .byte   0x00
    .balign  8
L_str109:
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
L_str110:
    .byte   0x2c
    .byte   0x20
    .byte   0x5f
    .byte   0x00
    .balign  8
L_str111:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str112:
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
L_str113:
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
L_str114:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str115:
    .byte   0x2c
    .byte   0x20
    .byte   0x3a
    .byte   0x6c
    .byte   0x6f
    .byte   0x31
    .byte   0x32
    .byte   0x3a
    .byte   0x00
    .balign  8
L_str116:
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
L_str117:
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
L_str118:
    .byte   0x2c
    .byte   0x20
    .byte   0x4c
    .byte   0x5f
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str119:
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
L_str120:
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
L_str121:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str122:
    .byte   0x2c
    .byte   0x20
    .byte   0x3a
    .byte   0x6c
    .byte   0x6f
    .byte   0x31
    .byte   0x32
    .byte   0x3a
    .byte   0x4c
    .byte   0x5f
    .byte   0x73
    .byte   0x74
    .byte   0x72
    .byte   0x00
    .balign  8
L_str123:
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
L_str124:
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
L_str125:
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
    .byte   0x78
    .byte   0x74
    .byte   0x62
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str127:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str128:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x75
    .byte   0x78
    .byte   0x74
    .byte   0x62
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str129:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str130:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x73
    .byte   0x78
    .byte   0x74
    .byte   0x77
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str131:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str132:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str133:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x00
    .balign  8
L_str134:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str135:
    .byte   0x65
    .byte   0x71
    .byte   0x00
    .balign  8
L_str136:
    .byte   0x6e
    .byte   0x65
    .byte   0x00
    .balign  8
L_str137:
    .byte   0x6c
    .byte   0x6f
    .byte   0x00
    .balign  8
L_str138:
    .byte   0x6c
    .byte   0x73
    .byte   0x00
    .balign  8
L_str139:
    .byte   0x68
    .byte   0x69
    .byte   0x00
    .balign  8
L_str140:
    .byte   0x68
    .byte   0x73
    .byte   0x00
    .balign  8
L_str141:
    .byte   0x6c
    .byte   0x74
    .byte   0x00
    .balign  8
L_str142:
    .byte   0x6c
    .byte   0x65
    .byte   0x00
    .balign  8
L_str143:
    .byte   0x67
    .byte   0x74
    .byte   0x00
    .balign  8
L_str144:
    .byte   0x67
    .byte   0x65
    .byte   0x00
    .balign  8
L_str145:
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
L_str146:
    .byte   0x2c
    .byte   0x20
    .byte   0x00
    .balign  8
L_str147:
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
L_str148:
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
    .byte   0x74
    .byte   0x74
    .byte   0x5f
    .byte   0x73
    .byte   0x79
    .byte   0x73
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str149:
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
L_str150:
    .byte   0x73
    .byte   0x79
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str151:
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
L_str152:
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
L_str153:
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
L_str154:
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
L_str155:
    .byte   0x2c
    .byte   0x20
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str156:
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str157:
    .byte   0x3a
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str158:
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
L_str159:
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
L_str160:
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
L_str161:
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
L_str162:
    .byte   0x2e
    .byte   0x4c
    .byte   0x00
    .balign  8
L_str163:
    .byte   0x3a
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str164:
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
L_str165:
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
L_str166:
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
L_str167:
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
L_str168:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x74
    .byte   0x65
    .byte   0x78
    .byte   0x74
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str169:
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
L_str170:
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
L_str171:
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
    .byte   0x2e
    .byte   0x72
    .byte   0x6f
    .byte   0x64
    .byte   0x61
    .byte   0x74
    .byte   0x61
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str172:
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
L_str173:
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
L_str174:
    .byte   0x3a
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str175:
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
L_str176:
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x20
    .byte   0x2e
    .byte   0x63
    .byte   0x6f
    .byte   0x6d
    .byte   0x6d
    .byte   0x20
    .byte   0x00
    .balign  8
L_str177:
    .byte   0x2c
    .byte   0x00
    .balign  8
L_str178:
    .byte   0x2c
    .byte   0x38
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str179:
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
L_str180:
    .byte   0x2c
    .byte   0x00
    .balign  8
L_str181:
    .byte   0x2c
    .byte   0x33
    .byte   0x0a
    .byte   0x00
    .balign  8
L_str182:
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
L_str183:
    .byte   0x5f
    .byte   0x5f
    .byte   0x54
    .byte   0x45
    .byte   0x58
    .byte   0x54
    .byte   0x00
    .balign  8
L_str184:
    .byte   0x5f
    .byte   0x5f
    .byte   0x74
    .byte   0x65
    .byte   0x78
    .byte   0x74
    .byte   0x00
    .balign  8
L_str185:
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
L_str186:
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
L_str187:
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
L_str188:
    .byte   0x5f
    .byte   0x5f
    .byte   0x54
    .byte   0x45
    .byte   0x58
    .byte   0x54
    .byte   0x00
    .balign  8
L_str189:
    .byte   0x5f
    .byte   0x5f
    .byte   0x74
    .byte   0x65
    .byte   0x78
    .byte   0x74
    .byte   0x00
    .balign  8
L_str190:
    .byte   0x5f
    .byte   0x5f
    .byte   0x44
    .byte   0x41
    .byte   0x54
    .byte   0x41
    .byte   0x00
    .balign  8
L_str191:
    .byte   0x5f
    .byte   0x5f
    .byte   0x62
    .byte   0x73
    .byte   0x73
    .byte   0x00
    .balign  8
L_str192:
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
L_str193:
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
L_str194:
    .byte   0x73
    .byte   0x79
    .byte   0x73
    .byte   0x63
    .byte   0x61
    .byte   0x6c
    .byte   0x6c
    .byte   0x00
    .balign  8
L_str195:
    .byte   0x6d
    .byte   0x61
    .byte   0x69
    .byte   0x6e
    .byte   0x00
    .balign  8
L_str196:
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
L_str197:
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
L_str198:
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
L_str199:
    .byte   0x69
    .byte   0x6d
    .byte   0x70
    .byte   0x6f
    .byte   0x72
    .byte   0x74
    .byte   0x20
    .byte   0x00
    .balign  8
L_str200:
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
L_str201:
    .byte   0x6b
    .byte   0x69
    .byte   0x6e
    .byte   0x64
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str202:
    .byte   0x20
    .byte   0x73
    .byte   0x74
    .byte   0x61
    .byte   0x72
    .byte   0x74
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str203:
    .byte   0x20
    .byte   0x6c
    .byte   0x65
    .byte   0x6e
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str204:
    .byte   0x20
    .byte   0x6c
    .byte   0x69
    .byte   0x6e
    .byte   0x65
    .byte   0x3d
    .byte   0x00
    .balign  8
L_str205:
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
L_str206:
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
L_str207:
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
    .balign  8
L_str208:
    .byte   0x2d
    .byte   0x2d
    .byte   0x65
    .byte   0x6d
    .byte   0x69
    .byte   0x74
    .byte   0x3d
    .byte   0x6f
    .byte   0x62
    .byte   0x6a
    .byte   0x00
    .balign  8
L_str209:
    .byte   0x2d
    .byte   0x2d
    .byte   0x74
    .byte   0x61
    .byte   0x72
    .byte   0x67
    .byte   0x65
    .byte   0x74
    .byte   0x3d
    .byte   0x6c
    .byte   0x69
    .byte   0x6e
    .byte   0x75
    .byte   0x78
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
