#!/bin/bash
# Based on https://github.com/Vinno97/evince-synctex/blob/master/evince-synctex.sh
# Sync LaTeX editor with Evince (Backward Sync Only)
# shellcheck disable=2206

set -e

urldecode() {
    local url=${*//+/ }     # replace "+" with " " (space)
    echo -e "${url//%/\\x}" # replace "%" with "\x" and do hex expansion
}

cmd=${*:-'zeditor %f:%l'}
echo "Listening to Evince SyncSource requests. Executing '$cmd' on new signals"

dbus-monitor "type=signal,interface=org.gnome.evince.Window,member=SyncSource" |
while read -r line
do
    parts=($line)

    if [ "${parts[0]}" == signal ]; then
        exc_cmd=($cmd)
        filename=""
        linenr=""
    elif [ "${parts[0]}" == string ]; then
        filename=${parts[1]}
    elif [ "${parts[0]}" == int32 ] && [ -z "$linenr" ]; then
        linenr=${parts[1]}

        echo ""

        filename=$(urldecode "$filename")
        filename=${filename/#\"file:\/\//} # strips the leading '"file://'
        filename=${filename/%\"/}          # strips the trailing '"'
        echo "Filename: $filename"
        echo "Line number: $linenr"

        for i in "${!exc_cmd[@]}"; do
            # Do all replacements here
            exc_cmd[i]=${exc_cmd[$i]//%l/"$linenr"}
            exc_cmd[i]=${exc_cmd[$i]//%f/"$filename"}
        done

        echo "Executing: '${exc_cmd[*]}'"

        "${exc_cmd[@]}" < /dev/null
    fi
done
