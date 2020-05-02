mkdir ~/.ssh
chmod 700 ~/.ssh
cd data/ssh
chmod 600 id_*
chmod 644 id_*.pub
sshdir="$(pwd)"
for f in *; do
    ln -s "$sshdir/$f" "$HOME/.ssh/$f"
done
