// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
// #include <unistd.h>

// #include <arpa/inet.h>
// #include <netinet/in.h>
// #include <sys/socket.h>

// #define PORT 8080
// #define BUFFER_SIZE 1024

// int main(void)
// {
//     int server_fd, client_fd;
//     struct sockaddr_in server_addr;
//     char buffer[BUFFER_SIZE];

//     server_fd = socket(AF_INET, SOCK_STREAM, 0);
//     if (server_fd < 0)
//     {
//         perror("socket");
//         exit(EXIT_FAILURE);
//     }

//     memset(&server_addr, 0, sizeof(server_addr));

//     server_addr.sin_family = AF_INET;
//     server_addr.sin_addr.s_addr = INADDR_ANY;
//     server_addr.sin_port = htons(PORT);

//     if (bind(server_fd,
//              (struct sockaddr *)&server_addr,
//              sizeof(server_addr)) < 0)
//     {
//         perror("bind");
//         close(server_fd);
//         exit(EXIT_FAILURE);
//     }

//     if (listen(server_fd, 5) < 0)
//     {
//         perror("listen");
//         close(server_fd);
//         exit(EXIT_FAILURE);
//     }

//     printf("Waiting for client...\n");

//     client_fd = accept(server_fd, NULL, NULL);
//     if (client_fd < 0)
//     {
//         perror("accept");
//         close(server_fd);
//         exit(EXIT_FAILURE);
//     }

//     printf("Client connected.\n");

//     memset(buffer, 0, sizeof(buffer));

//     int bytes = recv(client_fd, buffer, sizeof(buffer) - 1, 0);

//     if (bytes < 0)
//     {
//         perror("recv");
//     }
//     else
//     {
//         buffer[bytes] = '\0';
//         printf("Received: %s\n", buffer);
//     }

//     close(client_fd);
//     close(server_fd);

//     return 0;
// }


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>      // O_CREAT, O_RDWR
#include <sys/mman.h>   // shm_open, mmap
#include <sys/stat.h>   // mode constants
#include <unistd.h>

#define SHM_NAME "/my_shared_memory"
#define SIZE 1024

int main(void)
{
    int fd;

    fd = shm_open(SHM_NAME, O_CREAT | O_RDWR, 0666);

    if (fd == -1)
    {
        perror("shm_open");
        exit(EXIT_FAILURE);
    }

    if (ftruncate(fd, SIZE) == -1)
    {
        perror("ftruncate");
        exit(EXIT_FAILURE);
    }

    char *ptr = mmap(NULL,
                     SIZE,
                     PROT_READ | PROT_WRITE,
                     MAP_SHARED,
                     fd,
                     0);

    if (ptr == MAP_FAILED)
    {
        perror("mmap");
        exit(EXIT_FAILURE);
    }

    strcpy(ptr, "Hello from Writer Process!");

    printf("Data written successfully.\n");

    munmap(ptr, SIZE);
    close(fd);

    return 0;
}
