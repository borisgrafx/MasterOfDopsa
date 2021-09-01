#include "selection.h"

void selection_sort(int size, int *array) {
    for (int i = 0; i < size - 1; i++) {
        int least = i;
        for (int j = i + 1; j < size; j++)
            if (array[j] < array[least])
                least = j;
        int tmp = array[i];
        array[i] = array[least];
        array[least] = tmp;
    }
}
