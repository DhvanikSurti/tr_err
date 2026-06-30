//Ayo , this code is the simple buble sort and little modification for the nummber of pass in loop 
//Using j < n - i - 1 avoids unnecessary comparisons because the largest elements are already sorted after each pass.
#include<stdio.h>
#include<stdlib.h>
int main(){

	printf("starting main\n");
	int a[5]={5,4,3,2,1};
	int n = sizeof(a)/sizeof(a[0]);
	printf("n size if %d\n",n);
	for(int i=0; i<n; i++){
		for(int j=0; j<n-1-i; j++){
			if(a[j] > a[j+1]){
				int temp = a[j];
				a[j] = a[j+1];
				a[j+1] = temp;
				printf("Swap at j=%d:", j);
				 for(int k=0; k<n; k++){
                			printf("%d",a[k]);
        			}
        			printf("\n");
			}
	
		}
	
	}	
	
	
}

