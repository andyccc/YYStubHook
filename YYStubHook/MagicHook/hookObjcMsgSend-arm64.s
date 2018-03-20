//
//  hookObjcMsgSend-arm64.s
//  YYStubHook
//
//  Created by yans on 2018/3/20.
//

#ifdef __arm64__
#include <arm/arch.h>


.macro ENTRY /* name */
    .text
    .align 5
    .private_extern    $0
$0:
.endmacro

.macro END_ENTRY /* name */
LExit$0:
.endmacro


.macro BACKUP_REGISTERS
    stp q6, q7, [sp, #-0x20]!
    stp q4, q5, [sp, #-0x20]!
    stp q2, q3, [sp, #-0x20]!
    stp q0, q1, [sp, #-0x20]!
    stp x6, x7, [sp, #-0x10]!
    stp x4, x5, [sp, #-0x10]!
    stp x2, x3, [sp, #-0x10]!
    stp x0, x1, [sp, #-0x10]!
    str x8,  [sp, #-0x10]!
.endmacro

.macro RESTORE_REGISTERS
    ldr x8,  [sp], #0x10
    ldp x0, x1, [sp], #0x10
    ldp x2, x3, [sp], #0x10
    ldp x4, x5, [sp], #0x10
    ldp x6, x7, [sp], #0x10
    ldp q0, q1, [sp], #0x20
    ldp q2, q3, [sp], #0x20
    ldp q4, q5, [sp], #0x20
    ldp q6, q7, [sp], #0x20
.endmacro

.macro CALL_HOOK_BEFORE
    BACKUP_REGISTERS
    mov x2, lr
    bl _hook_objc_msgSend_before
    RESTORE_REGISTERS
.endmacro

.macro CALL_HOOK_AFTER
    BACKUP_REGISTERS
    bl _hook_objc_msgSend_after
    mov lr, x0
    RESTORE_REGISTERS
.endmacro

# hookObjcMsgSend.py里定义了函数名为hook_msgSend，如果修改脚本里的函数名，这里的函数名，也需跟脚本保持一致
ENTRY _hook_msgSend

CALL_HOOK_BEFORE
bl _objc_msgSend
CALL_HOOK_AFTER
ret

END_ENTRY _hook_msgSend

// void hook_msgSend(...);
//ENTRY _hook_msgSend_stret
//b _hook_msgSend
//END_ENTRY _hook_msgSend_stret

#endif
