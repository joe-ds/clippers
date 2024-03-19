#! /usr/bin/env bash

if [ $# -lt 2 ]; then
    echo "USAGE :\nsh clippers.sh CONTENT URL_WORD\nsh clippers.sh -f FILE URL_WORD"
elif [ $# -lt 3 ]; then
    content=$1; url=$2;
    curl --data-urlencode "content=$content" https://www.cl1p.net/$url -o /dev/null
else
    while getopts ':f' opts; do
        case $opts in
            f) content=$2; url=$3;
                curl --data-urlencode "content@$content" https://www.cl1p.net/$url -o /dev/null
                ;;
            *) echo "Invalid flag. -h for help"
                ;;
        esac
    done
fi
