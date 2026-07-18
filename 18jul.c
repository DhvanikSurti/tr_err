#include <stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<signal.h>
int main()
{
    pid_t pid = fork();
    if(pid==0){
        printf("Child process %d\n",getpid());
        printf("After signal of termination \n");
        
    } 
    kill(pid,SIGINT);
    printf("Child process %d\n",getpid(pid));
    pid_t pid2=fork();
    if(pid2){
    printf("Child process %d\n",getpid(pid2));
    }
    return 0;
}