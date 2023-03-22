#!/bin/bash
#yum check-update
#yum update
#yum upgrade
mkdir -p /usr/local/lynis
cd /usr/local/lynis
wget https://downloads.cisofy.com/lynis/lynis-3.0.8.tar.gz
tar xfvz lynis-3.0.8.tar.gz
cd /usr/local/lynis/lynis
./lynis audit system 
