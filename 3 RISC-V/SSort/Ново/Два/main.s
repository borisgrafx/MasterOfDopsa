# main.s
.text
__start:
.globl __start
	la a0, array_length
        lw a1, 0(a0) # Загрузка длины массива в регистр a1
        addi a1, a1, -1 # Длина массива - 1
        lw a0, 0(a0) # Загрузка длины массива в регистр a0
        la a2, arr # Указатель на массив
	call sort
finish:
        li a0, 10               
        ecall
.data
arr: 
    .word 1, 4, 3, 9, 2, 10, 6, 13, 15, 11

.rodata
array_length:
    .word 10