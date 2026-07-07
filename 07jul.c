#include <stdio.h>

struct Address
{
    char city[20];
    int pin;
};

struct Student
{
    char name[20];
    int age;
    struct Address addr;
};

int main()
{
    struct Student s =
    {
        "Alice",
        22,
        {"Ahmedabad", 380015}
    };

    printf("Name : %s\n", s.name);
    printf("Age  : %d\n", s.age);
    printf("City : %s\n", s.addr.city);
    printf("Pin  : %d\n", s.addr.pin);

    return 0;
}