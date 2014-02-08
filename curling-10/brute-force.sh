#!/bin/bash

for i in $(seq -f "%02g" 0 99); do

    OUT=$(curl -g "http://[2a02:6b8:0:141f:fea9:d5ff:fed5:${i}01]"

    echo "${i} :: ${OUT}"

done