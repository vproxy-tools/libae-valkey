#!/bin/bash

set -e

VALKEY_REPO="$1"
if [ "$VALKEY_REPO" == "" ]; then
	echo "Usage ./diff-valkey.sh \$the_path_to_valkey_code_repo"
	exit 1
fi

files=`ls src/ | grep '\.\(c\|h\)$'`

set +e
for f in $files
do
	echo "========== $f =========="
	diff "$VALKEY_REPO/src/$f" "src/$f" --color
done
set -e
