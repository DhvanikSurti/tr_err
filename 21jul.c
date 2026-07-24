#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

int main(){

   int fd[2];
   char w[7]="hello";
   char r[7];
   pipe(fd);
   if(fork()==0){
      printf("child process runs \n");
      close(fd[0]);
      write(fd[1],w,strlen(w)+1);
      printf("child has writen to pipe\n");
      close(fd[1]);
   }
   else{
      printf("parent process run \n");
      close(fd[1]);
      read(fd[0],r,sizeof(r));
      printf("parent read : %s\n",r);

   }
   return 0;
}


