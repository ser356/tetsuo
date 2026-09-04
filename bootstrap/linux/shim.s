    .text
    .globl tt_sys
    .globl _tt_sys
tt_sys:
_tt_sys:
    cmp x16, #1
    b.eq .Lsys_exit
    cmp x16, #3
    b.eq .Lsys_read
    cmp x16, #4
    b.eq .Lsys_write
    cmp x16, #5
    b.eq .Lsys_open
    cmp x16, #6
    b.eq .Lsys_close
    cmp x16, #20
    b.eq .Lsys_getpid
    mov x0, #86
    mov x8, #93
    svc #0
.Lsys_exit:
    mov x8, #93
    svc #0
    ret
.Lsys_read:
    mov x8, #63
    svc #0
    b .Lsys_result
.Lsys_write:
    mov x8, #64
    svc #0
    b .Lsys_result
.Lsys_open:
    cmp x1, #0
    b.eq .Lsys_open2
    mov x1, #0x241
.Lsys_open2:
    mov x3, x2
    mov x2, x1
    mov x1, x0
    mov x0, #-100
    mov x8, #56
    svc #0
    b .Lsys_result
.Lsys_close:
    mov x8, #57
    svc #0
    b .Lsys_result
.Lsys_getpid:
    mov x8, #172
    svc #0
    b .Lsys_result
.Lsys_result:
    tbnz x0, #63, .Lsys_error
    cmp xzr, #1
    ret
.Lsys_error:
    neg x0, x0
    cmp xzr, #0
    ret

    .globl _linux_start
_linux_start:
    ldr x0, [sp]
    add x1, sp, #8
    bl _main
    mov x8, #93
    svc #0
