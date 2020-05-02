getProject aurieh/dvm.sh
~/projects/dvm.sh install canary
getProject git@gitlab.com:/mstrodl/heckheating ~/projects/hh2
cd ~/projects/hh2
pnpm i
# Now we install hh2!
node bin/cli.js ~/.dvm/branches/canary/DiscordCanary/DiscordCanary
cd -
installNode electron
