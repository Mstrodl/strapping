getProject() {
    cmd="git"
    if [ command -v hub >/dev/null ]; then
	cmd="hub"
    fi
    destination="$1"

    cd ~/projects
    $cmd clone $1 $destination
    code=$?
    cd -
    if [ "$code" -neq 0 ]; then
	exit $code
    fi
}
