#!/bin/bash

imin=1
imax=3

icoci=10
#---------------

hi=( 2.5   6.5 )


caso=1

nn=1

for (( i = $imin; i <= $imax; i ++))
do
#c=$(echo "${hi[i]} / $icoci" |bc -l)


c=$(echo "$i/$icoci" |bc -l)

sed 's/VVV/'$c'/g'  MC_CODE.f90 > zCv$i.f90
ifort -Ofast zCv$i.f90 -o wta-$caso-$i
nohup ./wta-$caso-$i > ra-$caso-$i &
echo   $i

done
