#!/bin/bash
echo -e "Adminn54321\nAdminn54321" | passwd administrator
echo -e "Wizytat0r321\nWizytat0r321" | passwd gosc
passwd --expire administrator
passwd -x 30 administrator
passwd -w 31 administrator
#passwd --expire gosc
#passwd -x 60 gosc
#passwd -w 61 gosc
passwd -d gosc 
chown gosc:public /home/gosc
chown administrator:admin /home/administrator
