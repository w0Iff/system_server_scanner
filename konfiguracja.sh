#!/bin/bash
yum install epel-release -y     #Instalujemy paczke "EPEL". ("-y" - auto "Tak").
yum check-update                #Sprawdzamy czy są aktualizacje dla naszych         zainstalowanych pakietów.
yum update -y                   #Instalujemy aktualizacje.
yum install nginx -y            #Instalujemy NGINX (serwer)
yum install nmap -y             #Instalujemy NMAP (skaner)
yum upgrade                     #Jeszcze raz aktualizujemy i kasujemy pozostałości.
mkdir -p /usr/local/lynis       #Tworzymy folder dla Lynis.
cd /usr/local/lynis		#Wchodzimy w folder który stworzyliśmy.
wget https://downloads.cisofy.com/lynis/lynis-3.0.8.tar.gz #Ściągamy Lynis.
tar xfvz lynis-3.0.8.tar.gz     #Rozpakowujemy Lynis 
mkdir -p /usr/local/Cronie      #Tworzymy folder dla Cronie.
cd /usr/local/Cronie            #Przechodzimy do stworzonego folderu.
wget https://github.com/cronie-crond/cronie/releases/download/cronie-1.6.1/cronie-1.6.1.tar.gz             #Ściągamy Cronie.
tar xfvz cronie-1.6.1.tar.gz    #Rozpakowujemy Cronie.
cd /usr/local/Cronie/cronie-1.6.1 #Przechodzimy do folderu ktory został utworzony.
./configure                     #Konfigurujemy. 
cd /usr/local/lynis/lynis       #Wchodzimy w folder z Lynis 
./lynis audit system            #Przeprowadzamy skan systemu <audyt bezpieczeństwa>.
nginx -version                  #Sprawdzamy czy NGINX został poprawnie zainstalowany.
nmap --version                  #Sprawdzamy czy NMAP został poprawnie zainstalowany.
