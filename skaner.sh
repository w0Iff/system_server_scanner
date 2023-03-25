ip a #Tworzymy i konfigurujemy skaner. Rozpoczynamy od pobrania danych - pobieramy IP.
echo "###################################" #Dla czytelności 
echo "Prosze podaj IP swojej sieci i naciśnij ENTER: " #Komenda "menu".
read ip                                                #Czytamy wprowadzone dane.
crontab -l | { echo "*/5 * * * * nmap $ip -oN /usr/share/nginx/html/scan.txt"; } | crontab - #Pobrane IP, wpisujemy do komendy crontab'a, i tworzymy plik z wynikami.
echo "Jezeli pojawil sie blad o braku crontabow, prosze zignorowac" #Jeżeli użytkownik nie ma żadnych stworzonych crontab'ow, wyskoczy błąd - ale skryp dalej będzie działał.
firewall-cmd --permanent --add-port={80/tcp,443/tcp} #Otwieramy porty w Firewall'u.
firewall-cmd --reload #Restart Firewalla dla zapisu zmian.
systemctl enable nginx #Ustawiamy włączanie się serweru po starcie systemu.
systemctl start nginx  #Włączamy serwer.
firewall-cmd --list-ports #Wyświetlamy porty - sprawdzamy czy są odblokowane.
systemctl is-enabled nginx #Sprawdzamy czy serwer jest ustawiony przy starcie.
cd /usr/share/nginx/html #Wchodzimy do folderu HTML
cat >> index.html <<EOF  #Nadpisujemy domyślny INDEX, i wprowadzamy HTML potrzebny do wyświetlania wyników z NMAP/CRON'a. Optymalnie byłoby to zrobić w .PHP.
> <!DOCTYPE html> 
> <html>
> <body>
> <p> Twoje aktywne i podłączone urządzenia w sieci to: </p>
> <iframe src="scan.txt" width="100%" height="450" style="border:1px solid black;"> </iframe>
> </body>
> </html>
EOF
#Kod HTML. Tutaj już można robić wiele innych rzeczy, np. zabezpieczyć stronę hasłem.
