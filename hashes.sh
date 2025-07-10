#!/bin/bash

# build the list of interface names that have ip addresses
declare -a interfaces
interfaces=( $(ip r | grep -v default | awk '{print $3}') )

#build a hash of the addresses, identified by their interface names
declare -A addresses
for (( index=0; index < ${#interfaces[@]}; index++ )); do
	interfacename=${interfaces[$index]}
	address="$(ip a s $interfacename|awk '/inet /{print $2}')"
	addresses+=( [$interfacename]="$address" )
done

#Use the hash as we see fit
#iflist="${interfaces[@]}"
#read -p "What interface do you want to know the address for? (Choose from $iflist) " intf
userpicked=$(dialog --menu "choose one" 0 0 0 0 ${interfaces[0]} 1 ${interfaces[1]} 2 ${interfaces[2]} 3 ${interfaces[3]} --output-fd 1)
clear
intf="${interfaces[userpicked]}"
echo "Interface $userpicked ($intf) has address ${addresses[$intf]}"

