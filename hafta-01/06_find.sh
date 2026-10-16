#!/bin/bash
# find komutu örnekleri

echo "--- $HOME altındaki .txt dosyaları (ilk 10) ---"
find "$HOME" -type f -name "*.txt" 2>/dev/null | head -n 10

echo "--- /var/log altında son 7 günde değişen .log dosyaları ---"
find /var/log -type f -name "*.log" -mtime -7 2>/dev/null

echo "--- /home altında 10MB üzeri dosyalar (ilk 10) ---"
find /home -type f -size +10M 2>/dev/null | head -n 10

echo "--- Bulunan dosyaları silme (-delete) ---"
# Orijinal örnek: find /tmp -type f -name "*.tmp" -delete
# Gerçek /tmp'ye dokunmamak için geçici bir dizinde gösteriyoruz.
demo=$(mktemp -d)
touch "$demo"/a.tmp "$demo"/b.tmp "$demo"/kalsin.txt
echo "Silmeden önce:"; ls "$demo"
find "$demo" -type f -name "*.tmp" -delete
echo "Sildikten sonra:"; ls "$demo"
rm -r "$demo"
