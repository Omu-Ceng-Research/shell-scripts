#!/bin/bash
# Terminal cihazlarını listeleme
echo '--- ls -l /dev/tty* (ilk 10) ---'
ls -l /dev/tty* | head -n 10
echo "... toplam $(ls /dev/tty* | wc -l) tty cihazı"

echo '--- ls -l /dev/pts/ (sözde terminaller) ---'
ls -l /dev/pts/

echo '--- tty (mevcut terminal) ---'
tty
