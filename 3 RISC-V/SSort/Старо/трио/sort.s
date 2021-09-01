# sort.s
.text
sort:
.globl sort
        mv x1, t1
        mv x8, t2
        mv x3, t3
        add x15, x0, x0 # i = 0
L1:
        add x16, x0, x15 # least = i
        addi x6, x15, 1 # j = i + 1
L2:
        slli x7, x6, 2 # Логический сдвиг влево j на 2 разряда в ячейке x7
        slli x28, x16, 2 # Логический сдвиг влево least на 2 разряда в ячейке x28
        add x5, x8, x28 # Ячейка x5 = arr[x28]
        lw x31, 0(x5) # Загрузка в x31 значения массива arr[x28]
        add x5, x8, x7 # Ячейка x5 = arr[x7]
        lw x30, 0(x5) # Загрузка в x30 значения массива arr[x7]
        bge x30, x31, nochange # Если x30 >= x31, goto nochange
        add x16, x0, x6 # least = j
nochange:
        addi x6, x6, 1 # j = j + 1
        blt x6, x3, L2 # Если j < array_len, goto L2 
swap:
        slli x29, x15, 2 # Логический сдвиг влево i на 2 разряда в ячейке x29
        add x5, x29, x8 # Ячейка x5 = arr[x29] 
        lw x30, 0(x5) # Загрузка в x30 значения массива arr[x29] (a[i])
        slli x28, x16, 2 # Логический сдвиг влево least на 2 разряда в ячейке x28
        add x5, x28, x8 # Ячейка x5 = arr[x28]
        lw x31, 0(x5) # Загрузка в x31 значения массива arr[x28] (a[least])
        add x5, x29, x8 # Ячейка x5 = arr[x29]
        sw x31, 0(x5) # Загрузка в x31 значения массива arr[x29] (a[i])
        add x5, x28, x8 # Ячейка x5 = arr[x28]
        sw x30, 0(x5) # Загрузка в x30 значения массива arr[x28] (a[least])
        addi x15, x15, 1 # i += 1
        blt x15, x1, L1 # Если i < array_len - 1, goto L1
finish:
        mv t2, x8
        ret