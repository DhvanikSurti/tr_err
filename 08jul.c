#include<stdio.h>
#include<stdlib.h>
struct student{
    char name[20];
    int age;
    struct address{
        char city[20];
        int pin;
    }addr;
};

int main(){
    struct student s ;
    int n;
    
    printf("Enter number of students : ");
    scanf("%d",&n);

    size_t size = sizeof(struct student) * n;
    struct student *students = malloc(size);
    
    printf("size of struct is %zu\n ",sizeof(struct student));
    for(int i=0;i<n;i++){
         printf("Enter name of %dth student : ",i+1);
         scanf("%s",s.name);
         printf("Enter age of %dth student : ",i+1);
         scanf("%d",&s.age); 
         printf("Enter city of %dth student : ",i+1);
         scanf("%s",s.addr.city);      
         printf("Enter pin of %dth student : ",i+1);
         scanf("%d",&s.addr.pin);
    }
    free(students);
    return 0;
}


