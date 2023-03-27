#!/bin/bash
groupadd admin                      #Tworzymy grupę "admin" - dla administratorów.
groupadd public                     #Tworzymy grupę "public" - dla gości. Wiem że w RedHat jest opcja specjalna na otwarcie konta "gościa" ale wiadomo, może ktoś a w tym przypadku ja chciałby je stworzyć na własny sposób.
useradd  administrator              #Tworzymy konto admina.
useradd  gosc                       #Tworzymy konto gościa. 
usermod -G admin administrator      #Dodajemy konto admina do grupy administratorów. 
usermod -aG wheel administrator     #Dodajemy administratora do grupy sudo.
usermod -G public gosc              #Dodajemy konto gościa do grupy public.
