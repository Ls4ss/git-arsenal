#!/bin/bash

for range in $(cat $1); do
min=$(ipcalc $range | grep HostMi | awk '{print $ 2}' | cut -d"." -f4)
max=$(ipcalc $range | grep HostMa | awk '{print $ 2}' | cut -d"." -f4)
ip=$(echo $range | cut -d . -f1,2,3)
for o in $(seq $min $max); do echo $ip.$o >> ips-list.txt; done
for i in $(seq $min $max); do shodan host $ip.$i >> shodan-results.txt; done
done
