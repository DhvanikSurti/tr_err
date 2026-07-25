#include <stdio.h>          // printf(), perror()
#include <stdlib.h>         // exit()
#include <string.h>         // strlen(), memset()
#include <unistd.h>         // close()

#include <sys/socket.h>     // socket(), bind(), listen(), accept()
#include <netinet/in.h>     // sockaddr_in
#include <arpa/inet.h>      // htons()

#define PORT 8080

int main(void)
{
    int server_fd;
    int client_fd;

    struct sockaddr_in server_addr;

    // 1. Create a TCP socket
    server_fd = socket(AF_INET, SOCK_STREAM, 0);

    if (server_fd == -1)
    {
        perror("socket");
        exit(EXIT_FAILURE);
    }

    printf("Socket created.\n");

    // Clear the structure
    memset(&server_addr, 0, sizeof(server_addr));

    // tells kernel to use IPv4 
    server_addr.sin_family = AF_INET;

    // Listen on all network interfaces
    server_addr.sin_addr.s_addr = INADDR_ANY;

    // Port number
    server_addr.sin_port = htons(PORT);

    // 2. Bind socket to address
    if (bind(server_fd,
             (struct sockaddr *)&server_addr,
             sizeof(server_addr)) < 0)
    {
        perror("bind");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    printf("Bind successful.\n");

    // 3. Listen for incoming connections
    if (listen(server_fd, 5) < 0)
    {
        perror("listen");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    printf("Waiting for client...\n");

    // 4. Accept one client
    client_fd = accept(server_fd, NULL, NULL);

    if (client_fd < 0)
    {
        perror("accept");
        close(server_fd);
        exit(EXIT_FAILURE);
    }

    printf("Client connected!\n");

    // 5. Send a message
    char message[] = "Hello from server!\n";

    send(client_fd, message, strlen(message), 0);

    // 6. Close sockets
    close(client_fd);
    close(server_fd);

    return 0;
}