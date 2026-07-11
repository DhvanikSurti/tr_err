// this program is used to print the current time in hours, minutes, and seconds format. It uses the C17 language standard version.
#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int main(){
    time_t now;
    struct tm  *t=localtime(&now);
    printf("Current time is: %d:%d:%d\n", t->tm_hour, t->tm_min, t->tm_sec);    
    return 0;
}