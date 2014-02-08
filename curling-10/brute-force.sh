#!/bin/bash

for i in {0..255}; do

    HEX=$(printf '%x\n' $i)

    URL="http://[2a02:6b8:0:141f:fea9:d5ff:fed5:${HEX}01]"

    RESPONSE=$(curl -sL -o /dev/null -w "%{http_code}" -g <url>)

    if [[ RESPONSE != 200 ]]; then

        echo

    fi

    OUT=$(curl -g "http://[2a02:6b8:0:141f:fea9:d5ff:fed5:${i}01]")

    echo "${i} :: ${OUT}"

done