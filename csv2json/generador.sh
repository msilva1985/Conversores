#!/bin/bash

echo "provincia;ciudad;colegio;nivel" > archivo.csv; 
provincias=("Buenos Aires" "Cordoba" "Mendoza");
ciudades=("La Plata" "City Bell" "Villa Elisa");
colegios=("Liceo" "Nacional" "Bellas Artes");
niveles=("1ro" "2do" "3ro");

for ((i=0; i < ${#provincias[@]}; i++))
do
	for ((j=0; j < ${#ciudades[@]}; j++))
	do
		for ((k=0; k < ${#colegios[@]}; k++))
		do
			for ((m=0; m < ${#niveles[@]}; m++))
			do
  				echo ${provincias[$i]}";"${ciudades[$j]}";"${colegios[$k]}";"${niveles[$m]} >> archivo.csv
			done
		done	
 	done
done 
