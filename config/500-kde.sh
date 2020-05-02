mkdir -p ~/.config
cd data/kde
kdedir="$(pwd)"
for f in *; do
    ln -s "$kdedir/$f" "$HOME/.config/$f"
done
