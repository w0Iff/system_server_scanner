#!/bin/bash
groupadd admin
groupadd public
useradd  administrator
useradd  gosc
usermod -G admin administrator
usermod -G public gosc
