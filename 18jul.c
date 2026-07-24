// #include <stdio.h>
// #include<stdlib.h>
// #include<sys/types.h>
// #include<signal.h>
// int main()
// {
//     pid_t pid = fork();
//     if(pid==0){
//         printf("Child process %d\n",getpid());
//         printf("After signal of termination \n");
        
//     } 
//     kill(pid,SIGINT);
//     printf("Child process %d\n",getpid(pid));
//     pid_t pid2=fork();
//     if(pid2){
//     printf("Child process %d\n",getpid(pid2));
//     }
//     return 0;
// }

// #include <stdio.h>
// #include<pthread.h>
// void *fun(void *args){
//     printf("hello from thread\n");
//     printf("value of args %d\n",*(int*)args);
//     return  NULL;
// }
// int main()
// {

//     pthread_t thread;
//     int *x=(int *)50;
//     pthread_create(&thread, NULL, fun, &x);

//     pthread_join(thread, NULL);
//     printf("hello from main thread\n");
    
//     return 0;
// }
