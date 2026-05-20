#!/bin/bash

check(){
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Get Sudo access to run this script"
    exit 1
fi
}

validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 installation...Failure"
    else
        echo "$2 installation...Success"
    fi
}


check
for package in [ $@ ]
do
dnf install $package -y
validate $? "$package"
done
