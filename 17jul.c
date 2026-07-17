//In this code done a code which make a child process using fork() system call and print the PID of both parent and child processes. The code includes necessary header files and handles errors in case the fork fails.
// #include<stdio.h>
// #include<stdlib.h>
// #include<sys/types.h>


// int main(){
//     pid_t pid = fork();

//     if(pid < 0) {
//         perror("Fork failed");
//         exit(1);
//     } else if (pid == 0) {
//         // Child process
//         printf("Child process: PID = %d, Parent PID = %d\n", getpid(), getppid());
//     } else {
//         // Parent process
//         printf("Parent process: PID = %d, Child PID = %d\n", getpid(), pid);
//     }
// }



