#!/bin/bash
# if - elif - else yapısı
x=15

if [ $x -gt 10 ]; then
    echo "x 10'dan büyük"
elif [ $x -eq 10 ]; then
    echo "x eşit 10"
else
    echo "x 10'dan küçük"
fi
