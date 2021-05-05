#!/bin/bash
# colors
green=$'\e[0;32m'
red=$'\e[1;31m'
yellow=$'\e[1;33m'
blue=$'\e[1;34m'
cyan=$'\e[0;36m'
lightgreen=$'\e[1;32m'
white=$'\e[1;37m'
STOP="\e[0m"

clear
sleep 1
echo ""
echo "$blue ██████╗██████╗ ██╗   ██╗███╗   ██╗ ██████╗██╗  ██╗ ██████╗ █████╗ ████████╗
██╔════╝██╔══██╗██║   ██║████╗  ██║██╔════╝██║  ██║██╔════╝██╔══██╗╚══██╔══╝
██║     ██████╔╝██║   ██║██╔██╗ ██║██║     ███████║██║     ███████║   ██║   
██║     ██╔══██╗██║   ██║██║╚██╗██║██║     ██╔══██║██║     ██╔══██║   ██║   
╚██████╗██║  ██║╚██████╔╝██║ ╚████║╚██████╗██║  ██║╚██████╗██║  ██║   ██║   
 ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   
                                                                            

"
x=0
while [ $x = 0 ]
do
read -p "$lightgreen[ ? ] Do you want to use Wordlist? [ Y/n ] : " wordlist1
	case "$wordlist1" in
n)
echo ""
echo ""
read -p "$yellow[ + ] Min : " lenght

        echo ""
read -p "$yellow[ + ] Max : " max
echo ""
sleep 3
echo ""

echo "$red[ + ] Choose a crunch charset ex : [ numeric ]" | pv -qL 12
echo ""
printf "${STOP}"
echo ""
xterm -T "crunch" -geometry 150x50-1+0 -e "nano /usr/share/crunch/charset.lst" & > /dev/null2>&1
read -p "$cyan[ * ] Charset : " Charset
echo ""
echo ""
read -p "$yellow[ + ] Press [ ENTER ] to continue : " enter1
echo ""
printf "${STOP}"
pkill xterm
sleep 0.5
echo ""
echo "$cyan[ * ] Hashcat ..." | pv -qL 10
echo ""
sleep 3
echo ""
echo "$red[ + ] Choose a hashcat modes ex : [ 0 or 100 ]" | pv -qL 12
printf "${STOP}"
echo ""
echo ""
xterm -T "hashcat" -geometry 150x50-1+0 -e "nano hashcat.txt" & > /dev/null2>&1
read -p "$cyan[ + ] Mode hashcat : " mode1
echo ""
pkill xterm
read -p "$cyan[ + ] hash or file hash : " hash
echo ""
read -p "$cyan[ ? ] output password cracked : " out
sleep 0.7
echo ""
read -p "$yellow[ + ] Press [ ENTER ] to Hack : " enter2
sleep 1.5
echo ""
echo "[ + ] Running attack ... " | pv -qL 10
echo ""
sleep 1.5
xterm -T "hashcat" -geometry 140x60-1+0 -e "crunch $lenght $max -f /usr/share/crunch/charset.lst $Charset | hashcat -m $mode1 -a 0 -o $out $hash && sleep 6.5" & > /dev/null2>&1
PID=$!
wait $PID
sleep 2
exit
;;
Y)
echo ""
read -p "[ + ] Path Wordlist : " wordlist2
echo ""
sleep 0.5
echo ""
echo "$cyan[ * ] Hashcat ..." | pv -qL 10
echo ""
sleep 3
echo ""
echo "$red[ + ] Choose a hashcat modes ex : [ 0 or 100 ]" | pv -qL 12
printf "${STOP}"
echo ""
echo ""
xterm -T "hashcat" -geometry 150x50-1+0 -e "nano hashcat.txt" & > /dev/null2>&1
read -p "$cyan[ + ] Mode hashcat : " mode1
echo ""
pkill xterm
read -p "$cyan[ + ] hash or file hash : " hash
echo ""
read -p "$cyan[ ? ] output password cracked : " out
sleep 0.7
echo ""
read -p "$yellow[ + ] Press [ ENTER ] to Hack : " enter0
sleep 1.5
echo ""
echo "[ + ] Running attack ... " | pv -qL 10
echo ""
sleep 1.5
xterm -T "hashcat" -geometry 140x60-1+0 -e "hashcat -m $mode1 -a 0 -o $out $hash $wordlist2 && sleep 6.5" & > /dev/null2>&1
PID=$!
wait $PID
sleep 2
exit
esac
done

