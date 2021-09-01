#include <stdio.h>
#include "selection.h"

#define n 10

int main() {
    int arr[] = { 5, 1, 3, 10, 6, 4, 9, 2, 8, 7 };
    selection_sort(n, arr);
    int *curr, *end;
    for (curr = arr, end = arr + n; curr != end; curr++) {
        printf("%d ", *curr);
    }
    return 0;
}

