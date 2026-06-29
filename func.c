#include<stdio.h>
#include<stdlib.h>

int max(int a ,int b){
   if(a>b){
    return a;
   }
   else{
    return b;   
   }
}
int main (){
    int (*fp)(int,int);
    fp=max;
   // fp(10,20); 
    printf("The maximum value is %d",fp(10,20)); 
}