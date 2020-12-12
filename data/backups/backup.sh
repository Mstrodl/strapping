borg create --stats --progress --compression zlib \
  --exclude **/.parcel-cache \
  --exclude **/node_modules \
  --exclude ~/.pnpm-store \
  --exclude **/.cache \
  --exclude ~/.npm \
  --exclude ~/.nuget \
  --exclude ~/.gradle \
  --exclude ~/.rvm \
  --exclude ~/.rustup \
  --exclude ~/.local/share/Steam/steamapps \
  --exclude ~/.local/share/kiwix \
  --exclude ~/Games \
  --exclude ~/.local/share/lutris/runners \
  ssh://root@doge.coolmathgames.tech:2269/backup/borg::{fqdn}-home-{now} ~/


#duplicity --exclude **/.parcel-cache \
#	  --exclude **/node_modules \
#	  --exclude ~/.pnpm-store \
#	  --exclude **/.cache \
#	  --exclude ~/.npm \
#	  --exclude ~/.nuget \
#	  --exclude ~/.gradle \
#	  --exclude ~/.rvm \
#	  --exclude ~/.rustup \
#	  --exclude ~/.local/share/Steam/steamapps \
#	  --asynchronous-upload \
#	  --backend-retry-delay 60 \
#	  --num-retries 100 \
#	  --progress \
#	  /home/mary \
#	  scp://host/backup/duplicity
