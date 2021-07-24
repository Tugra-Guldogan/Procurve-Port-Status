#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Usage: ./$(basename $0) file"
    echo "File must be a list of IP addresses or hostnames separated by newline."
    exit 0
fi

DATE=$(date +%F_%H:%M:%S)
mkdir -p ./results/$DATE
while read IP; do
    (
        TMPFILE=$(mktemp /tmp/tmp.XXXXXXXXXX)
        RESULTFILE=./results/$DATE/$IP.txt
        echo "Connecting to: $IP"
        (
            echo " ";
            sleep 1;
            echo "terminal length 32";
            sleep 1;
            echo "show interfaces brief";
            sleep 1;
            echo "exit";
            sleep 1;
            echo "exit";
            sleep 1;
            echo "y"
        ) | telnet $IP 2>/dev/null > $TMPFILE
        (echo "IP: $IP"; sed -n '/                  |/,/24/p' $TMPFILE; echo) > $RESULTFILE
        cat $RESULTFILE
    ) &
    sleep 0.1
done <$1
wait
