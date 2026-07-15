#include <stdio.h>
#include <stdlib.h>

#define MAX 100

typedef struct {
    int items[MAX];
    int front;
    int rear;
} Queue;

// Create Queue
Queue* createQueue() {
    Queue *q = (Queue *)malloc(sizeof(Queue));
    q->front = -1;
    q->rear = -1;
    return q;
}

// Check if Queue is Empty
int isEmpty(Queue *q) {
    return (q->front == -1);
}

// Check if Queue is Full
int isFull(Queue *q) {
    return (q->rear == MAX - 1);
}

// Enqueue Operation
void enqueue(Queue *q, int value) {
    if (isFull(q)) {
        printf("Queue Overflow!\n");
        return;
    }

    if (isEmpty(q)) {
        q->front = 0;
    }

    q->rear++;
    q->items[q->rear] = value;
    printf("%d inserted into queue.\n", value);
}

// Dequeue Operation
int dequeue(Queue *q) {
    if (isEmpty(q)) {
        printf("Queue Underflow!\n");
        return -1;
    }

    int value = q->items[q->front];

    if (q->front == q->rear) {
        q->front = -1;
        q->rear = -1;
    } else {
        q->front++;
    }

    return value;
}

// Peek Front Element
int peek(Queue *q) {
    if (isEmpty(q)) {
        printf("Queue is Empty!\n");
        return -1;
    }

    return q->items[q->front];
}

// Display Queue
void display(Queue *q) {
    if (isEmpty(q)) {
        printf("Queue is Empty!\n");
        return;
    }

    printf("Queue Elements: ");
    for (int i = q->front; i <= q->rear; i++) {
        printf("%d ", q->items[i]);
    }
    printf("\n");
}

// Main Function
int main() {
    Queue *q = createQueue();
    int choice, value;

    while (1) {
        printf("\n===== Queue Menu =====\n");
        printf("1. Enqueue\n");
        printf("2. Dequeue\n");
        printf("3. Peek\n");
        printf("4. Display\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter value: ");
                scanf("%d", &value);
                enqueue(q, value);
                break;

            case 2:
                value = dequeue(q);
                if (value != -1)
                    printf("Deleted element: %d\n", value);
                break;

            case 3:
                value = peek(q);
                if (value != -1)
                    printf("Front element: %d\n", value);
                break;

            case 4:
                display(q);
                break;

            case 5:
                free(q);
                printf("Program exited.\n");
                return 0;

            default:
                printf("Invalid choice!\n");
        }
    }

    return 0;
}