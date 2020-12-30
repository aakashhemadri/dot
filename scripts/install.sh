#!/usr/bin/bash
DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo -e "$YEL*** Installing $PUR${DIR#$DOTS_SOURCE/}/$(basename $0 .install)$RST"

cd $DIR
if ! git diff --name-only --exit-code HEAD $DIR/$(basename $0 .install) >/dev/null 2>/dev/null; then
    # Installation commands
else
    echo -e "${GRE}==> No changes detected... skipping installation."
fi
