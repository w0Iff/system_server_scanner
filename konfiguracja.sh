!/bin/bash
#yum install epel-release
#yum check-update
#yum update -y
#yum install nginx -y
#yum install nmap -y
#yum install make -y
#yum upgrade 
#nginx -version
#nmap --version
#mkdir -p /usr/local/lynis
#cd /usr/local/lynis
#wget https://downloads.cisofy.com/lynis/lynis-3.0.8.tar.gz
#tar xfvz lynis-3.0.8.tar.gz
#cd /usr/local/lynis/lynis
#./lynis audit system 
mkdir -p /usr/local/Cronie
cd /usr/local/Cronie
wget https://github.com/cronie-crond/cronie/releases/download/cronie-1.6.1/cronie-1.6.1.tar.gz
tar xfvz cronie-1.6.1.tar.gz
cd /usr/local/Cronie/cronie-1.6.1
./configure
