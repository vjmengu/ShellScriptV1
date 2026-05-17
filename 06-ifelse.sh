#!/bin/bash

echo "Enter a number and we will say if its greater than or less than the 100"
read X
if [ $X -le 100 ]
then
    echo " The number entered is $X and its less than 100"
else
    echo " The number entered is $X and its greater than 100"
fi