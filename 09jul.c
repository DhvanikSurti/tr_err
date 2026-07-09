// //Memory access in c 
// #include<stdio.h>
// #include<stdlib.h>
// int main(){
//     int *ptr;
//     ptr = calloc(4, sizeof(int));

//     *ptr =12;
//     ptr[1]=13;
//     ptr[2]=14;
//     ptr[3]=15;
//     printf("size of ptr is %zu\n", sizeof(*ptr));
//     printf("values are: %d %d %d %d\n", *ptr, ptr[1], ptr[2], ptr[3]);
//     free(ptr);
//     return 0;   
// }


//in this pointer points same location with different data types
#include <stdio.h>
#include <stdlib.h>

int main() {
  int *ptr1 = malloc(4);
  char *ptr2 = (char*) ptr1;
  ptr1[0] = 1684234849;
  printf("%d is %c %c %c %c", *ptr1, ptr2[0], ptr2[1], ptr2[2], ptr2[3]);

  return 0;
}