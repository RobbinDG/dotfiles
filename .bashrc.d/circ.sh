alias circ=cd $HOME/Documents/circ/

export CIRC_HOME_PATH=$HOME/Documents/circ
export CIRC_AUTOPILOT_PATH=$CIRC_HOME_PATH/autopilot
export PYTHONPATH=$PYTHONPATH:$CIRC_AUTOPILOT_PATH/src/python/core
export PYTHONPATH=$PYTHONPATH:$CIRC_AUTOPILOT_PATH/src/python/autopilot
export PYTHONPATH=$PYTHONPATH:$CIRC_AUTOPILOT_PATH/src/python/api

circ-pi-mount() {
	umount -l $HOME/mnt/circ_rpi
	sshfs "pi@$1:CIRC" $HOME/mnt/circ_rpi
}

circ-pi-copy() {
	mkdir -p $HOME/mnt/circ_rpi
	found_ip="$(grep "$HOME/mnt/circ_rpi" /proc/mounts | cut -d ' ' -f1 | cut -d '@' -f2 | cut -d ':' -f1)"
	if [[ ( -z "$found_ip" ) || ( "$1" != "$found_ip" ) ]]; then
		echo "Raspberry pi not yet mounted, (re)mounting...";
		circ-pi-mount $1
	fi;
	cp -r -u *.py circ ui ~/mnt/circ_rpi
}

circ-scan() {
	CIDR="192.168.0.0/24"
	if [[ -n "$1" ]]; then
		CIDR="$1"
	fi
	echo "Scanning CIDR range $CIDR"
	sudo nmap -sn "$CIDR" | awk '{lines[NR] = $0} /Raspberry/ {if (NR > 2) {fifth_word = (split(lines[NR-2], arr2, " ") > 4) ? arr2[5] : ""; third_word = (split($0, arr, " ") > 2) ? arr[3] : ""; print fifth_word, third_word}}'
}
