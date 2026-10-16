#!/bin/bash
# for döngüsü örnekleri
cd "$(dirname "$0")/../ornek-veri" || exit 1

echo "--- Liste üzerinde döngü ---"
for fruit in apple banana cherry; do
    echo "Meyve: $fruit"
done

echo "--- C tarzı döngü ---"
for ((i=1; i<=5; i++)); do
    echo "i = $i"
done

echo "--- Dosya listesi üzerinde döngü (ornek-veri/*.txt) ---"
for file in *.txt; do
    echo "Bulunan: $file"
done
