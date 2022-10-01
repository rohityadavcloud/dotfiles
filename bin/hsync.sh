set -x
set -e

echo "Syncing changes to Helium!"

SRC="$HOME/Bhaisaab/"
DST="bhaisaab@192.168.1.16:/home/bhaisaab/Bhaisaab/"
Dirs='Books Documents Papers TV YouTube'

for folder in $Dirs; do
  rsync -vaxAXt --delete-after --progress --ignore-errors $SRC/$folder/ $DST/$folder/
done;

rsync -vaxAXt --delete-after --progress --ignore-errors $HOME/Lab/ bhaisaab@192.168.1.16:/home/bhaisaab/Lab/
