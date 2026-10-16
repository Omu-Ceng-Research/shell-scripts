#!/bin/bash
# Matematiksel işlemler
a=10
b=3

echo "--- Yöntem 1: \$(( )) aritmetik genişleme ---"
echo "a + b = $((a + b))"
echo "a - b = $((a - b))"
echo "a * b = $((a * b))"
echo "a / b = $((a / b))   (tam sayı bölmesi)"
echo "a % b = $((a % b))"

echo "--- Yöntem 2: expr ---"
expr 5 + 3

echo "--- Yöntem 3: bc ile ondalıklı işlem ---"
echo "scale=4; 10 / 3" | bc
echo "scale=8; 10 / 3" | bc
