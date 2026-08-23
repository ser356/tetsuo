    .section .text.boot
    .globl   _start
_start:
    adrp    x0, __stack_top
    add     x0, x0, :lo12:__stack_top
    mov     sp, x0
    bl      main
1:
    b       1b

    .globl   putc
putc:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    movz    x1, #0x0900, lsl #16
    strb    w0, [x1]
    ldp     x29, x30, [sp], #16
    ret

    .globl   main
main:
    stp     x29, x30, [sp, #-16]!
    mov     x29, sp
    mov     w0, #104
    bl      putc
    mov     w0, #111
    bl      putc
    mov     w0, #108
    bl      putc
    mov     w0, #97
    bl      putc
1:
    b       1b
    ldp     x29, x30, [sp], #16
    ret
