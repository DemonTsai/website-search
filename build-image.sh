#!/bin/bash

if [ "$1" == "slave" ]; then
    cd Dockerfile/jnkslv
    ./build
elif [ "$1" == "website-search" ]; then
    cd Dockerfile/jnkslv_website-search
    ./build
elif [ "$1" == "-h" -o "$1" == "--help" -o "$1" == "-help" -o "$#" == 0 ]; then
    echo "Usage: $0 [slave|website-search]"
fi
