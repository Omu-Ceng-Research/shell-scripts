#!/usr/bin/bash
# $0 ile kendini tekrar çağıran recursive script
# Kullanım: ./03_recursive.sh 1

count=${1:-1}
echo "Call: $count"

if [ "$count" -lt 5 ]; then
    next=$((count + 1))
    bash "$0" "$next"
fi
