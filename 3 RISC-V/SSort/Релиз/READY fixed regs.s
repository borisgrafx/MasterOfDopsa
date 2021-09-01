.data
arr: 
    .word 1, 4, 3, 9, 2, 10, 6, 13, 15, 11

.rodata
array_length:
    .word 10

.text
__start:
.globl __start
        la a0, array_length
        lw a1, 0(a0) # Загрузка длины массива в регистр a1
        addi a1, a1, -1 # Длина массива - 1
        lw a0, 0(a0) # Загрузка длины массива в регистр a0
        la a2, arr # Указатель на массив
        add a5, x0, x0 # i = 0
loop1:
        add a6, x0, a5 # least = i
        addi a4, a5, 1 # j = i + 1
loop2:
        slli t2, a4, 2 # Логический сдвиг влево j на 2 разряда в регистре t2
        slli t3, a6, 2 # Логический сдвиг влево least на 2 разряда в регистре t3
        add t0, a2, t3 # Регистр t0 = arr[t3]
        lw t6, 0(t0) # Загрузка в t6 значения массива arr[t3]
        add t0, a2, t2 # Регистр t0 = arr[t2]
        lw t5, 0(t0) # Загрузка в t5 значения массива arr[t2]
        bge t5, t6, noswap # Если t5 >= t6, goto noswap
        add a6, x0, a4 # least = j
noswap:
        addi a4, a4, 1 # j = j + 1
        blt a4, a0, loop2 # Если j < array_length, goto loop2 
swap:
        slli t4, a5, 2 
        add t0, t4, a2 # t0 = arr[i]
        lw t5, 0(t0) # Загружаем arr[i] в t5
        slli t3, a6, 2 
        add t0, t3, a2 # t0 = arr[least]
        lw t6, 0(t0) # Загружаем arr[least] в t6
        add t0, t4, a2 
        sw t6, 0(t0) # arr[i] = t6 (tmp для arr[least])
        add t0, t3, a2 
        sw t5, 0(t0) # arr[least] = t5 (tmp для arr[i])
        addi a5, a5, 1 # i += 1
        blt a5, a1, loop1 # Если i < array_length - 1, goto loop1
finish:
        li a0, 10
        ecall