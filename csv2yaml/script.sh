#!/bin/bash
 
input=$1
 
[ -z $1 ] && echo "No se paso ningun archivo como parametro" && exit 1
[ ! -e $input ] && echo "No se encuentra el archivo $1" && exit 1
 
read primeraLinea < $input
a=0
encabezado=`echo $primeraLinea | awk -F";" {'print NF'}`
lineas=`cat $input | wc -l`
while [ $a -lt $encabezado ]
do
        head_array[$a]=$(echo $primeraLinea | awk -v x=$(($a + 1)) -F";" '{print $x}')
        a=$(($a+1))
done
 
c=0
echo "cities:"
while [ $c -lt $lineas ]
do
        read linea
        if [ $c -ne 0 ]; then
                d=0
                echo -n " - "

                while [ $d -lt $encabezado ]
                do
                       
                        elemento=$(echo $linea | awk -v y=$(($d + 1)) -F";" '{print $y}')
                
                        if [ $d -ne $(($encabezado-1)) ]; then
                                if [ ${head_array[$d]} == "provincia" ]; then
                                        echo  ${head_array[$d]}": "$elemento
                                else
                                        echo  "   " ${head_array[$d]}": "$elemento
                                fi
                                #echo "   "
                        else
                                echo "    "${head_array[$d]}": "$elemento
                                #echo "   "
                        fi
                        d=$(($d+1))
                done
                
        fi
        c=$(($c+1))
done < $input

