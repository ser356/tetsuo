    .section .text.boot
    .globl   _start
_start:
    adrp    x0, .Lstr0
    add     x0, x0, :lo12:.Lstr0
    mov     x1, #5
    movz    x2, #0x0000
    movk    x2, #0x0900, lsl #16
.Lloop:
    cbz     x1, .Lhalt
    ldrb    w3, [x0], #1
    strb    w3, [x2]
    sub     x1, x1, #1
    b       .Lloop
.Lhalt:
    b       .Lhalt

    .section .rodata
    .balign  8
.Lstr0:
    .ascii "hola\n"
