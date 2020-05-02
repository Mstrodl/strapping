didFail() {
    if [ "$1" -eq 0 ]; then
	echo "Strapped $2"
    else
	echo "Something went wrong, $2 exited with code $1. We'll do the same!"
	exit $exit
    fi
}
