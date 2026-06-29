// #include<stdio.h>
// #include<stdlib.h>
// #include<string.h>
// int main(){
//     char str[] = "Hello, World!";
//     char *token = strtok(str, ", ");
//      printf("%s\n", token);
//     while(token != NULL){
       
//         token = strtok(NULL, ", ");
//     }

// }


// #include<stdio.h>
// #include<stdlib.h>
// #include<string.h>
// #include<assert.h>
// int main(){ 
//     int n =10;
//     assert(n<0);
//     printf("The value of n is %d",n);   
//     return 0;
// }   


// #include<stdio.h>
// #include<stdlib.h>
// #include<string.h>
// #include<assert.h>
// #include<malloc.h>

// int main(){
//     FILE *file=fopen("func.c", "r");
//     assert(file!=NULL);

//     char *line=NULL;
//     size_t len=0;
//     while (getline(&line,&len,file)!=-1)
//     {
//         printf("line is %s,malloc size is %zu\n",line,malloc_usable_size(line));

//     }
//     free(line);
//     assert(fclose(file)==0);
//     return 0;
    
// }   

// #include<stdio.h>
// #include<stdlib.h>
// #include<regex.h>
// #include<assert.h>
// int main(){ 
//     regex_t reg;
//     char str[]="abcdE";
//     regcomp(&reg,"abcde",REG_ICASE);
//     int result=regexec(&reg,str,0,NULL,0);
//     if (result==0)
//     {
//         printf("Match found\n");
//     }
//     else if (result==REG_NOMATCH)
//     {
//         printf("No match found\n");
//     }
//     else
//     {
//         char errbuf[100];
//         regerror(result,&reg,errbuf,sizeof(errbuf));
//         printf("Regex match failed: %s\n",errbuf);
//     }

//    return 0 ;
// }
    
// #include<stdio.h>
// #include<stdlib.h>
// #include<strings.h>
// #include<fnmatch.h>
// #include<glob.h>

// int main(){
//     char *s="Hello, world!";
//     int result = fnmatch("He[abc]*", s, 0);
//     printf("Result: %d\n", result);
//     if(result == 0){
//         printf("Match found\n");
//     } else if(result == FNM_NOMATCH){
//         printf("No match found\n");
//     } else {
//         printf("Error occurred during matching\n");
//     }
//     return 0;
// }

// #include<stdio.h>
// #include<stdlib.h> 
// #include<glob.h>
// int main(){
    
//     glob_t glob_result;
//     int result = glob("*.c", 0, NULL, &glob_result);
//     if(result == 0){
//         printf("Matched files:\n");
//         for(size_t i = 0; i < glob_result.gl_pathc; i++){
//             printf("%zu : %s\n", i, glob_result.gl_pathv[i]);
//         }
//     } else if(result == GLOB_NOMATCH){
//         printf("No match found\n");
//     } else {
//         printf("Error occurred during globbing\n");
//     }
//     globfree(&glob_result);
//     return 0;
// }




















