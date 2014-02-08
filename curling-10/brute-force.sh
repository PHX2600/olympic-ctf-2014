#!/bin/bash

for i in {0..255}; do

    OUT=$(curl -g "http://[2a02:6b8:0:141f:fea9:d5ff:fed5:${i}01]")

    echo "${i} :: ${OUT}"

done