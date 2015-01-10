#!/usr/bin/env sh

inotifywait -r -m -e close_write --format '%w%f' ~/Dropbox| while read MODFILE
do
    rsync -r $MODFILE /mnt/drobo/DropBox-rsync/$MODFILE
    echo syncing $MODFILE ...
done
