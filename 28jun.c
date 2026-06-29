// #include<stdio.h>
// #include<stdlib.h>
// #include<stdint.h>

// int int_add(int a, int b) {
//     return a + b;
// }
// float float_add(float a, float b) {
//     return a + b;
// }
// double double_add(double a, double b) {
//     return a + b;
// }   

// #define add(a,b) _Generic((a), \ 
// int : int_add(a,b),\
// float : float_add(a,b),\
// double : double_add(a,b),\ 
// default : printf("Unsupported type\n")  \
// )

// int main() {
//     int a = 5, b = 10;
//     float x = 2.5, y = 3.5;
//     double p = 1.2, q = 3.4;

//     printf("Integer addition: %d\n", add(a, b));
//     printf("Float addition: %.2f\n", add(x,y));
//     printf("Double addition: %.2f\n", add(p, q));

//     return 0;
// }



// #include<stdio.h>
// #include<complex.h>
// int main() {
//     double complex z = 1.0 + 2.0*I;
//     double complex w = 3.0 + 4.0*I;
//     double complex sum = z + w;
//     printf("Real part : %f\n", creal(z));
//     printf("Imaginary part : %f\n", cimag(z));
//     printf("Sum : %f + %fi\n", creal(sum), cimag(sum));
// }

// #include<stdio.h>   
// struct a
// {
//     char i;
//     int j;
// }__attribute__((packed)); // packed attribute to avoid padding 

// int main() {
//     struct a s;
//    printf("Size of struct a: %zu\n", sizeof(struct a));
//     return 0;
// }


// #include<stdio.h>
// int main(int argc, char **argv){
//     printf("Hello, World!\n");
   
//     printf("argc: %d & argv: %p\n", argc, (void*)argv);
//     for(int i=0;i<argc;i++){
//         printf("argv[%d]: %s\n",i,argv[i]);
//     }
//     return 0;
// }

// #include <stdio.h>
// #include <unistd.h>

// int main(int argc, char *argv[])
// {
//     int opt;

//     while ((opt = getopt(argc, argv, "f:")) != -1)
//     {
//         switch (opt)
//         {
//             case 'f':
//                 printf("File = %s\n", optarg);
//                 break;
//         }
//     }
// }

// #include<stdio.h>
// #include<search.h>
// int main(){
//     hcreate(20);
//     ENTRY e = {.key = "k1", .data = "value1"};
//     hsearch(e, ENTER);
//     printf("Entered %s : %s\n", e.key, (char*)e.data);
//     hdestroy();
//     return 0;    
// }


