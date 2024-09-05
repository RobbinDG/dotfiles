mcd() {
	mkdir "$1"
	cd "$1"
}

pdf() {
	zathura "$1" &
	disown
}
