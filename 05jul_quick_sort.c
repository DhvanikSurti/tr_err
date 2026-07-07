#include <stdio.h>

int partition(int a[], int low, int high)
{
    int pivot = a[high]; // Choosing the last element as the pivot
    printf("Pivot is %d\n", pivot); // Debugging statement to show the pivot value
    int i = low - 1;

    for(int j = low; j < high; j++)
    {
        if(a[j] < pivot)
        {
            i++;

            int temp = a[i];
            a[i] = a[j];
            a[j] = temp;
        }
    }

    int temp = a[i + 1]; // Swapping the pivot element to its correct position
    a[i + 1] = a[high];
    a[high] = temp;

    return i + 1;
}

void quickSort(int a[], int low, int high) // Recursive function to perform quicksort
{
    if(low < high)
    {
        int p = partition(a, low, high);

        quickSort(a, low, p - 1);

        quickSort(a, p + 1, high);
    }
}

void printArray(int a[], int n)
{
    for(int i = 0; i < n; i++)
    {
        printf("%d ", a[i]);
    }
}

int main()
{
    int a[] = {45,12,89,7,34,23,90};

    int n = sizeof(a) / sizeof(a[0]);

    quickSort(a, 0, n - 1);

    printf("Sorted array:\n");

    printArray(a, n);

    return 0;
}