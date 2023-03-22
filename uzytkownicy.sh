#!/bin/bash
groupadd admin
groupadd public
useradd  administrator
useradd  gosc
usermod -G admin administrator
usermod -aG wheel administrator
usermod -G public gosc
