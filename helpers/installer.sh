installSystem() {
    cmd="pacman"
    if [ command -v yay >/dev/null ]; then
	cmd="yay"
    fi
    "$cmd" -S --noconfirm $*
}

installNode() {
    cmd="npm i -g"
    if [ command -v pnpm >/dev/null ]; then
	cmd="pnpm i -g"
    elif [ command -v yarn >/dev/null ]; then
	cmd="yarn global add"
    fi
    $cmd $*
}
