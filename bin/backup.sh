# Make this script run every hour at 1AM:
# 0 1 * * * /path-to/auto-backup.sh
# sudo crontab -u root that-file 

set -x
set -e

SRC="$HOME/Bhaisaab/"
DST="root@192.168.1.11:/export/Backup/Bhaisaab/"
Dirs="Books Documents Lectures Photos Work TT"

for folder in $Dirs; do
  rsync -vaxAXt --delete-after --progress --ignore-errors $SRC/$folder/ $DST/$folder/
done;
