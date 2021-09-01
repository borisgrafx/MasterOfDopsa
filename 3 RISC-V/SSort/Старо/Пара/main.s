# main.s
.text
__start:
.globl __start
	la x3, array_length
    	lw x1, 0(x3) # Загрузили длину массива в регистр t1
    	addi x1, x1, -1 # Длина массива - 1
    	lw x3, 0(x3) # Загрузили длину массива в регистр t3 
    	la x8, arr # Указатель  
	call sort
finish:
        li a0, 10               
        ecall
.data
arr: 
    .word 1, 4, 3, 9, 3, 2, 10, 6, 13, 15, 11, 1

.rodata
array_length:
    .word 12