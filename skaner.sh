#ip a 
#echo "###################################"
#echo "Prosze podaj IP swojej sieci i naciśnij ENTER: "
#read ip
#crontab -l | { echo "*/5 * * * * nmap $ip -oN /usr/share/nginx/html/scan.txt"; } | crontab -
#echo "Jezeli pojawil sie blad o braku crontabow, prosze zignorowac"
#firewall-cmd --permanent --add-port={80/tcp,443/tcp}
#firewall-cmd --reload
#systemctl enable nginx
#systemctl start nginx
#firewall-cmd --list-ports
#systemctl is-enabled nginx
cd /usr/share/nginx/html
cat >> index.html <<EOF
> <!DOCTYPE html>
> <html>
> <body>
> <p> Twoje aktywne urzadzenia 123123123w sieci: </p>
> <iframe src="scan.txt" width="100%" height="450" style="border:1px solid black;"> </iframe>
> </body>
> </html>
EOF
