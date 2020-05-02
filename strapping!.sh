echo "Strapping!"

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$dir"

source "$dir/helpers/installer.sh"
source "$dir/helpers/didFail.sh"
source "$dir/helpers/grabProject.sh"

# keep sudo alive (thanks ari thanks homebrew)
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Strapping in preconfigs"
for config in preconfig/*.sh; do
    echo "Strapping ${config} in"
    cd "$dir"
    source "$config"
    cd "$dir"
    exit=$?
    if [ "$exit" -eq 0 ]; then
	echo "Strapped ${config}"
    else
	echo "Something went wrong, exited with code ${exit}. We'll do the same"
	exit $exit
    fi
done

cd "$dir"

echo "Let's get some packages!"
for package in package/*.sh; do
    echo "Setting up package: ${package}"
    cd "$dir"
    source "$package"
    cd "$dir"
    didFail $? "$package"
done

cd "$dir"

echo "Strapping in configs $dir"
for config in config/*.sh; do
    echo "Strapping ${config} in"
    cd "$dir"
    source "$config"
    cd "$dir"
    exit=$?
    if [ "$exit" -eq 0 ]; then
	echo "Strapped ${config}"
    else
	echo "Something went wrong, exited with code ${exit}. We'll do the same"
	exit $exit
    fi
done
echo "Configs are strapped in hopefully"
