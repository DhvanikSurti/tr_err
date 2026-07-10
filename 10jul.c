// #include<stdio.h>       
// #include<stdlib.h>
// int main(){
//     int *ptr1 , *ptr2, *ptr3;
//     int size = 4 * sizeof(int);
//     ptr1 = malloc(size);

//     printf("size is allocated is %d ptr values is  %p\n",size, ptr1);

//     size = 2 * sizeof(int); 
//     ptr2 = realloc(ptr1, size);
//     if (ptr2 == NULL) {
//         printf("Memory reallocation failed\n");
//         free(ptr1); // Free the original memory if realloc fails
//         return 1; // Exit with an error code
//     }
//     printf("size is allocated is %d ptr is %p\n",size, ptr2);
//     free(ptr2);
//     return 0;
// }

#include<stdio.h>   
#include<stdlib.h>
#include<string.h>

  struct student{
        char name[20];
        int age;
    };

int main(){
    struct student *ptr;
    ptr = malloc(sizeof(struct student));
    if(ptr == NULL){
        printf("Memory allocation failed\n");
        return 1; // Exit with an error code
    }

    ptr->age = 20;
    strcpy(ptr->name, "Alice");

    printf("Student Name: %s\n", ptr->name);
    printf("Student Age: %d\n", ptr->age);  
    free(ptr); // Free the allocated memory


}