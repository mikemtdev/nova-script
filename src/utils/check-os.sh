#!/bin/bash 


function GetOs()
{
   local OS=$( egrep '^(NAME)=' /etc/os-release )

   
   if [ $OS == "Ubuntu" ]    # ← see 'man test' for available unary and binary operators.
   then
    echo $OS 
    echo "ok"
   else
       echo "no"
   fi

   echo "Scanning TCP ports..."
for p in {1..1023}
do
  (echo >/dev/udp/localhost/$p) >/dev/null 2>&1 && echo "$p open"
done
  notify-send "Installation is done Happy Hacking!!"

}

GetOs ""