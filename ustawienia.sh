#!/bin/bash
echo -e "Adminn54321\nAdminn54321" | passwd administrator #Ustawiamy hasło dla konta admina.
echo -e "Wizytat0r321\nWizytat0r321" | passwd gosc #Ustawiamy hasło dla konta gościa.
passwd --expire administrator  #Wymuszamy zmianę hasła dla admina, po zalogowaniu.
passwd -x 30 administrator     #Ustawiamy okres "ważności" hasła.
passwd -w 31 administrator     #Ustawiamy przypomnienie o końcu ważności hasła.
#passwd --expire gosc          #Analogicznie dla gościa - gdyby była taka potrzeba.
#passwd -x 60 gosc
#passwd -w 61 gosc
passwd -d gosc                 #Usówamy hasło z gościa - może się logować bez.
chown gosc:public /home/gosc   #Przypisujemy użytkownika do katalogu domowego.
chown administrator:admin /home/administrator #analogicznie j/w
