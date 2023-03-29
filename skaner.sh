#!/bin/bash
firewall-cmd --permanent --add-port={80/tcp,443/tcp} #Otwieramy porty w Firewall'u.
firewall-cmd --reload #Restart Firewalla dla zapisu zmian.
systemctl enable nginx #Ustawiamy włączanie się serweru po starcie systemu.
systemctl start nginx  #Włączamy serwer.
firewall-cmd --list-ports #Wyświetlamy porty - sprawdzamy czy są odblokowane.
systemctl is-enabled nginx #Sprawdzamy czy serwer jest ustawiony przy starcie.
ip a                                       #Wyświetlamy swoje dane sieciowe.
echo "###################################" #Dla czytelności. 
echo "Prosze podaj IP swojej sieci i naciśnij ENTER: " #Komenda "menu".
read ip   					       #Zbieramy wprowadzone dane.
echo "###################################"
echo "IP zostało pobrane."
echo "###################################"
echo "Prosze wybierz numer odpowiadający typowi skanowania i naciśnij ENTER: " #Menu #2.
echo -e " 1. nmap - standard (nmap)\n" "2. nmap - agresywny (-A)\n" "3. nmap - FIN (-sF -vv)\n" "4. nmap - ACK (-sA)\n" "5. nmap - PING (-sp)\n"  "6. nmap - OS (-O)\n"
#Menu #3.
read numer                                      #Czytamy wprowadzone dane #2.
if [ "$numer" -eq "1" ] ; then			#Sprawdzamy co wprowadził użytkownik, i wykonujemy odpowiednią komendę.
crontab -l | { echo "*/5 * * * * nmap $ip -oN /usr/share/nginx/html/scan.txt"; } | crontab 					#Pobrane IP, wpisujemy do komendy crontab'a, i tworzymy plik z rezultatem.
cd /usr/share/nginx/html                        #Wchodzimy do folderu HTML
cat >> index.html <<EOF                         #Nadpisujemy domyślny INDEX, i wprowadzamy HTML potrzebny do wyświetlania wyników z nmap. Optymalnie byłoby to zrobić w .PHP.
> <!DOCTYPE html> 
> <html>
> <body>
> <p> Rezultat skanu normalnego: </p>
> <iframe src="scan.txt" width="100%" height="450" style="border:1px solid black;"> </iframe>
> </body>
> </html>
EOF
                                                #Kod HTML. Tutaj już można robić wiele innych rzeczy, np. zabezpieczyć stronę hasłem.
echo "###################################"
echo "Twój wybór to: 1 - nmap standard (nmap)"
echo "###################################"
echo "Jeżeli pojawił się bład o braku crontabow - należy zignorować."
echo "###################################"
echo "Proszę przejść do przeglądarki i wpisać: http://$ip/index.html"
elif [ "$numer" -eq "2" ] ; then
crontab -l | { echo "*/5 * * * * nmap -A $ip -oN /usr/share/nginx/html/scan.txt"; } | crontab 
cd /usr/share/nginx/html 
cat >> index.html <<EOF  
> <!DOCTYPE html> 
> <html>
> <body>
> <p> Rezultat skanu agresywnego: </p>
> <iframe src="scan.txt" width="100%" height="450" style="border:1px solid black;"> </iframe>
> </body>
> </html>
EOF
echo "###################################"
echo "Twój wybór to: 2 - nmap - agresywny (-A)"
echo "###################################"
echo "Jeżeli pojawił się bład o braku crontabow - należy zignorować."
echo "###################################"
echo "Proszę przejść do przeglądarki i wpisać: http://$ip/index.html"
elif [ "$numer" -eq "3" ]  ; then
crontab -l | { echo "*/5 * * * * nmap -sF -vv $ip -oN /usr/share/nginx/html/scan.txt"; } | crontab 
cd /usr/share/nginx/html 
cat >> index.html <<EOF  
> <!DOCTYPE html> 
> <html>
> <body>
> <p> Rezultat skinu FIN: </p>
> <iframe src="scan.txt" width="100%" height="450" style="border:1px solid black;"> </iframe>
> </body>
> </html>
EOF
echo "###################################"
echo "Twój wybór to: 3 - nmap - FIN (-sF -vv)"
echo "###################################"
echo "Jeżeli pojawił się bład o braku crontabow - należy zignorować."
echo "###################################"
echo "Proszę przejść do przeglądarki i wpisać: http://$ip/index.html"
elif  [ "$numer" -eq "4" ] ; then
crontab -l | { echo "*/5 * * * * nmap -sA $ip -oN /usr/share/nginx/html/scan.txt"; } | crontab 
cd /usr/share/nginx/html 
cat >> index.html <<EOF  
> <!DOCTYPE html> 
> <html>
> <body>
> <p> Rezultat skanu ACK: </p>
> <iframe src="scan.txt" width="100%" height="450" style="border:1px solid black;"> </iframe>
> </body>
> </html>
EOF
echo "###################################"
echo "Twój wybór to: 4 - nmap - ACK (-sA)"
echo "###################################"
echo "Jeżeli pojawił się bład o braku crontabow - należy zignorować."
echo "###################################"
echo "Proszę przejść do przeglądarki i wpisać: http://$ip/index.html"
elif [ "$numer" -eq "5" ] ; then
crontab -l | { echo "*/5 * * * * nmap -sp $ip -oN /usr/share/nginx/html/scan.txt"; } | crontab 
cd /usr/share/nginx/html 
cat >> index.html <<EOF  
> <!DOCTYPE html> 
> <html>
> <body>
> <p> Rezultat skanu PING: </p>
> <iframe src="scan.txt" width="100%" height="450" style="border:1px solid black;"> </iframe>
> </body>
> </html>
EOF
echo "###################################"
echo "Twój wybór to: 5 - nmap - PING (-sp)"
echo "###################################"
echo "Jeżeli pojawił się bład o braku crontabow - należy zignorować."
echo "###################################"
echo "Proszę przejść do przeglądarki i wpisać: http://$ip/index.html"
elif [ "$numer" -eq "6" ] ; then
crontab -l | { echo "*/5 * * * * nmap -O $ip -oN /usr/share/nginx/html/scan.txt"; } | crontab 
cd /usr/share/nginx/html 
cat >> index.html <<EOF  
> <!DOCTYPE html> 
> <html>
> <body>
> <p> Rezultat skanu OS: </p>
> <iframe src="scan.txt" width="100%" height="450" style="border:1px solid black;"> </iframe>
> </body>
> </html>
EOF
echo "###################################"
echo "Twój wybór to: 6 - nmap - OS (-O)"
echo "###################################"
echo "Jeżeli pojawił się bład o braku crontabow - należy zignorować."
echo "###################################"
echo "Proszę przejść do przeglądarki i wpisać: http://$ip/index.html"
else 
 echo Nie wybrałeś żadnej opcji, lub wybór jest błędny. Proszę podać numer odpowiadający wybranemu typowi skanowani.
fi
