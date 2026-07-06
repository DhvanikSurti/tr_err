#include<stdio.h>
struct s{
        char name[20];
        int age;
    };

int main()
{
    struct s s;
    printf("Size of struct is %zu bytes\n", sizeof(struct s));
    printf("Enter name: ");
    scanf("%s", s.name);
    printf("Enter age: ");
    scanf("%d", &s.age);
    printf("Stored in the struct is: Name: %s, Age: %d\n", s.name, s.age);
}