alias circ='cd ~/Documents/personal/circ/'

export PYTHONPATH=$PYTHONPATH:/home/robbin/Documents/personal/circ/circ-data-science/src/python/core
export PYTHONPATH=$PYTHONPATH:/home/robbin/Documents/personal/circ/circ-data-science/src/python/autopilot
export PYTHONPATH=$PYTHONPATH:/home/robbin/Documents/personal/circ/circ-data-science/src/python/api

circ-pi-mount() {
	sudo umount -l /mnt/circ_rpi
	sudo sshfs "pi@$1:CIRC" /mnt/circ_rpi
}

circ-pi-copy() {
	found_ip="$(grep '/mnt/circ_rpi' /proc/mounts | cut -d ' ' -f1 | cut -d '@' -f2 | cut -d ':' -f1)"
	if [[ ( -z "$found_ip" ) || ( "$1" != "$found_ip" ) ]]; then
		echo "Raspberry pi not yet mounted, (re)mounting...";
		circ-pi-mount $1
	fi;
	sudo cp -r *.py circ ui /mnt/circ_rpi
}

circ-scan() {
	sudo nmap -sn 192.168.0.0/24 | awk '{lines[NR] = $0} /Raspberry/ {if (NR > 2) {fifth_word = (split(lines[NR-2], arr2, " ") > 4) ? arr2[5] : ""; third_word = (split($0, arr, " ") > 2) ? arr[3] : ""; print fifth_word, third_word}}'
}