#!/bin/bash

set -e

DIR=$(dirname $1)
FILE=$(basename $1)

TMPFILE=$(mktemp -q $DIR/$FILE.XXXX)
cat - >$TMPFILE

echo '# TYPE node_exporter_textfile_update_time gauge' >>$TMPFILE
echo '# HELP node_exporter_textfile_update_time "File generation unix time"' >>$TMPFILE
echo 'node_exporter_textfile_update_time{file="'$FILE'"} '$(date +'%s') >>$TMPFILE

mv -uf $TMPFILE $DIR/$FILE
