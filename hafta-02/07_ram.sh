#!/bin/bash
# RAM bilgisi, ls seçenekleri ve proses bazlı bellek kullanımı
echo '--- free -h ---'
free -h

echo '--- /proc/meminfo (ilk 5 satır) ---'
head -n 5 /proc/meminfo

echo '--- ls -alh /var/log (ilk 10 satır) ---'
ls -alh /var/log | head -n 10

echo '--- ls -sh /var/log (blok boyutu, ilk 5) ---'
ls -sh /var/log | head -n 5

echo '--- ps aux --sort=-%mem | head ---'
ps aux --sort=-%mem | head | cut -c1-150   # satırlar kırpıldı

echo '--- top (batch modunda, ilk 15 satır; interaktif için: top / htop) ---'
top -b -n1 | head -n 15
