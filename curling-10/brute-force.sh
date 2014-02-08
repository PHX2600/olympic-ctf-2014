#!/bin/bash

for i in {0..255}; do

    HEX=$(printf '%x\n' $i)

    URL="http://[2a02:6b8:0:141f:fea9:d5ff:fed5:${HEX}01]"

    RESPONSE=$(curl --silent -sL -o /dev/null -w "%{http_code}" -g $URL)

    if [[ $RESPONSE != "200" ]]; then

        echo $(curl -g $URL)

    fi

done