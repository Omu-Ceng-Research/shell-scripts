#!/bin/bash
# Command substitution ve aritmetik: backtick, $( ), $(( ))
x=5
y=3

z=`expr $x + $y`
echo "Backtick + expr (eski):   $z"

z=$(expr $x + $y)
echo "\$( ) + expr (modern):    $z"

z=$((x + y))
echo "\$(( )) (önerilen):       $z"

echo "--- Önerilen yöntem ---"
x=10
y=20
z=$((x + y))
echo $z
