#include<stdio.h>       
#include<stdlib.h>
int main(){
    int *ptr1 , *ptr2, *ptr3;
    int size = 4 * sizeof(int);
    ptr1 = malloc(size);

    printf("size is allocated is %d ptr values is  %p\n",size, ptr1);

    size = 2 * sizeof(int); 
    ptr2 = realloc(ptr1, size);

    printf("size is allocated is %d ptr is %p\n",size, ptr2);
    return 0;
}