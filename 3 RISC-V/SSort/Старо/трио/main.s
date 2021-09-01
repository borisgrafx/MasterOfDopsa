# main.s
.text
main:
.globl main
	la t3, array_length
    	lw t1, 0(t3) # Загрузили длину массива в регистр t1
    	addi t1, t1, -1 # Длина массива - 1
    	lw t3, 0(t3) # Загрузили длину массива в регистр t3 
    	la t2, arr # Указатель
	call sort
        li a0, 0               
        ret
.data
arr: 
    .word 1, 4, 3, 9, 3, 2, 10, 6, 13, 15, 11, 1

.rodata
array_length:
    .word 12