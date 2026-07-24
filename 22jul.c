#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <mqueue.h>
#include <string.h>

int main() {
    struct mq_attr attr = {
        .mq_flags = 0,
        .mq_maxmsg = 10,
        .mq_msgsize = 100,
        .mq_curmsgs = 0
    };

    mqd_t mq = mq_open("/myqueue",
                       O_CREAT | O_RDWR,
                       0644,
                       &attr);

    if (mq == (mqd_t)-1) {
        perror("mq_open");
        return 1;
    }

    char msg[] = "Hello POSIX Queue";

    if (mq_send(mq, msg, strlen(msg) + 1, 0) == -1)
        perror("mq_send");

    char buffer[100];

    if (mq_receive(mq, buffer, sizeof(buffer), NULL) == -1)
        perror("mq_receive");
    else
        printf("Received: %s\n", buffer);

    mq_close(mq);
    mq_unlink("/myqueue");

    return 0;
}