// #include<stdio.h>
// struct s{
//         char name[20];
//         int age;
//     };

// int main()
// {
//     struct s s;
//     printf("Size of struct is %zu bytes\n", sizeof(struct s));
//     printf("Enter name: ");
//     scanf("%s", s.name);
//     printf("Enter age: ");
//     scanf("%d", &s.age);
//     printf("Stored in the struct is: Name: %s, Age: %d\n", s.name, s.age);
// }


#include<stdio.h>
#include<stdlib.h>
struct s{
    char *name;
    int *age;
};
int main (){
    struct s s;
    int new;
    s.name=(char *)malloc(20*sizeof(char));
    s.age=(int *)malloc(sizeof(int));

    printf("Size of struct is %zu bytes\n", sizeof(struct s));
    printf("Enter name: ");
    scanf("%s", s.name);  
    printf("Enter age: ");
    scanf("%d", s.age);  

    printf("Addree of stuct members are  %p and %p\n",&s.name,&s.age);

    printf("Dereference operator(address of that stored value,malloc)  value is %s and %d\n",s.name,*s.age);

    printf("before free pointers address is : name=%p, age=%p\n", s.name, s.age); 

    printf("Difference beyween pointers is : %ld\n", (char *)s.age - (char *)s.name); // Print difference
    free(s.name);
    free(s.age);    
}