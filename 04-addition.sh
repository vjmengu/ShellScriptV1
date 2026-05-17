#!/bin/bash
NUMBER1=$1
NUMBER2=$2

TimeStamp=$(date)
echo "The script started ecxecution at $TimeStamp"
SUM=$(($NUMBER1+$NUMBER2))
echo "Sum of $NUMBER1 and $NUMBER2 is::$SUM "
