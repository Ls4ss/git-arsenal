#!/bin/bash

function banner {
if [ -z $2 ]; then
echo "Options (-r - Range IP | -i - IP  |-fr - File Range IP | -fi - File IP)"
fi
}
#Range
if [ $1 = '-r' ]; then
min=$(ipcalc $2 | grep HostMi | awk '{print $ 2}' | cut -d"." -f4)
max=$(ipcalc $2 | grep HostMa | awk '{print $ 2}' | cut -d"." -f4)
ip=$(echo $2 | cut -d . -f1,2,3)
for o in $(seq $min $max); do echo $ip.$o >> ips-list.txt; done
for i in $(seq $min $max); do shodan host $ip.$i >> shodan-results.txt; done

elif [ $1 = '-i' ]; then
shodan host $2 >> shodan-results.txt

#File Range
elif [ $1 = '-fr' ]; then
for range in $(cat $2); do
min=$(ipcalc $range | grep HostMi | awk '{print $ 2}' | cut -d"." -f4)
max=$(ipcalc $range | grep HostMa | awk '{print $ 2}' | cut -d"." -f4)
ip=$(echo $range | cut -d . -f1,2,3)
for o in $(seq $min $max); do echo $ip.$o >> ips-list.txt; done
for i in $(seq $min $max); do shodan host $ip.$i >> shodan-results.txt; done
done

#File IP
elif [ $1 = '-fi' ]; then
for ip in $(cat $2); do shodan host $ip >> shodan-results.txt; done

else
banner

fi
