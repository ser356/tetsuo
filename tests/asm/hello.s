    .section .text.boot
    .globl   _start
_start:
    movz    x0, #0x0900, lsl #16
    mov     w1, #65
    strb    w1, [x0]
1:  b       1b
