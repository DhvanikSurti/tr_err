//ayo, this is just simple a insertion sort 
// #include<stdio.h>
// #include<stdlib.h>
// int main(){

// 	int a[3]={3,2,1};
// 	int n =sizeof(a) / sizeof(a[0]);
// 	for (int i=1;i<n;i++){
// 		int temp = a[i];
// 		int j = i-1;

// 		while(j>=0 && a[j]>temp){
// 			a[j+1]= a[j];
// 			j--;
// 		}
// 		a[j+1] = temp;
// 	}
// 	printf("Data is sorted \n");
// 	for(int k =0; k < n; k++){
// 		printf("%d",a[k]);
// 	}
// 	printf("\n");
// }

// Descending order insertion sort

#include<stdio.h>
#include<stdlib.h>
int main(){		
	int a[3]={1,2,3};
	int n =sizeof(a) / sizeof(a[0]);
	for (int i=1;i<n;i++){
		int temp = a[i];
		int j = i-1;

		while(j>=0 && a[j]<temp){
			a[j+1]= a[j];
			j--;
		}
		a[j+1] = temp;
	}
	printf("Data is sorted in descending order \n");
	for(int k =0; k < n; k++){
		printf("%d",a[k]);
	}
	printf("\n");
}