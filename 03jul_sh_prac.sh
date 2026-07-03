#ayo, today's covered topics are shell operators , 

#!/bin/bash
#
# echo "enter var1 value"
# read var
# echo "enter var2 value"
# read var2
# var3=$(expr $var + $var2)
# echo $var3

# while and until loops
# a=0
# while [ $a -lt 10 ] 
# do 
#     echo $a
#     a=$(expr $a + 1)
# done

# until [ ! $a -lt 5 ]
# do 
#     echo $a
#     a=$(expr $a + 1)

# done


#nested loop
# a=0
# while [ $a -lt 10 ]
# do
#     b=$a
#     while [ $b -gt 0 ]
#     do 
#         echo -n $b
#         b=$(expr $b - 1)
#     done
#     echo 
#     a=$(expr $a + 1)
# done


#loop control 
a=0
# while [ $a -lt 10 ]
# do 
#     echo $a
   
#     if [ $a -eq 5 ]
#     then 
#         break
#     fi
#     a=$(expr $a + 1)
# done

# conditional statements 
# a=0
# num="1 2 3 4 5 6 7 8 9"
# for i in $num
# do
#     Q=$(expr $i % 2 )
#     if [ $Q -eq 0 ]
#     then 
#         echo "$i is even"
#         continue
#     fi
#         echo "$i is odd"
# done

#functions 
# yo() {
#     echo "this is function & this is value $1 $2"
#     return 12
# }
# yo hello wo
# ret=$?
# echo "return value is $ret"