//this code is for selection sort algorithm
#include<stdio.h>
#include<stdlib.h>
int main(){
    int a[6]={5,6,3,4,1,2};
    int n =sizeof(a) / sizeof(a[0]);
    for(int i=0;i<n-1;i++){
        int min = i;
        for(int j=i+1;j<n;j++){
            if(a[j]<a[min]){
                min = j;
            }
        }
        if(min != i){
            int temp = a[i];
            a[i] = a[min];
            a[min] = temp;
        }
    }
    for(int k =0; k < n; k++){
        printf("%d",a[k]);
    }
    return 0;
}