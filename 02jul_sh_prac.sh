#ayo,this practice is for shell scripting , also learned from edureka video , and linux basics 
#this code covers varibales, special var, loop, 

#!bin/bash
#echo DHVANIK:
#echo "enter var value"
#read var
#echo $var

echo $0 #file name
echo $1 #first argument 
echo $2 #second ||
echo $# #number of argu
echo $@ #print individual argu (quate)
echo $* #print space separated argu
echo $$ #print process id
echo $? #error status for command 

for T in $*
do
    echo $T
done
