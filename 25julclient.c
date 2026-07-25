// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
// #include <unistd.h>

// #include <arpa/inet.h>
// #include <sys/socket.h>

// #define PORT 8080

// int main(void)
// {
//     int sockfd;
//     struct sockaddr_in server_addr;

//     char message[] = "Hello Server from client !";

//     sockfd = socket(AF_INET, SOCK_STREAM, 0);

//     if (sockfd < 0)
//     {
//         perror("socket");
//         exit(EXIT_FAILURE);
//     }

//     memset(&server_addr, 0, sizeof(server_addr));

//     server_addr.sin_family = AF_INET;
//     server_addr.sin_port = htons(PORT);

//     inet_pton(AF_INET, "127.0.0.1", &server_addr.sin_addr);

//     if (connect(sockfd,
//                 (struct sockaddr *)&server_addr,
//                 sizeof(server_addr)) < 0)
//     {
//         perror("connect");
//         close(sockfd);
//         exit(EXIT_FAILURE);
//     }

//     send(sockfd, message, strlen(message), 0);

//     printf("Message sent.\n");

//     close(sockfd);

//     return 0;
// }


#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

#define SHM_NAME "/my_shared_memory"
#define SIZE 1024

int main(void)
{
    int fd;

    fd = shm_open(SHM_NAME, O_RDONLY, 0666);

    if (fd == -1)
    {
        perror("shm_open");
        exit(EXIT_FAILURE);
    }

    char *ptr = mmap(NULL,
                     SIZE,
                     PROT_READ,
                     MAP_SHARED,
                     fd,
                     0);

    if (ptr == MAP_FAILED)
    {
        perror("mmap");
        exit(EXIT_FAILURE);
    }

    printf("Message: %s\n", ptr);

    munmap(ptr, SIZE);
    close(fd);

    return 0;
}