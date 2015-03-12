#!/bin/bash
function encrypt()
{
    openssl enc -e -aes-256-cbc -in $1  |openssl base64 -e -out $1.enc
}

function decrypt()
{
    openssl base64 -d -in $1 | openssl enc -d -aes-256-cbc -out $1.dec
}

while getopts "e:d:" OPTION; do
    case $OPTION in
        e) echo "e arg:" $OPTARG
        encrypt $OPTARG
        ;;
        d) echo "d arg:" $OPTARG
        decrypt $OPTARG
        ;;
        \?) exit 1;;
    esac
done
