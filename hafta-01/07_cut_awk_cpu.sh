#!/bin/bash
# Sütun kesme (cut, awk) ve en çok CPU kullanan prosesler

echo "--- /etc/passwd'den kullanıcı adları (ilk 10) ---"
cut -d: -f1 /etc/passwd | head -n 10

echo "--- ps + head + awk (başlık dahil 4 satırın 1. sütunu) ---"
ps -eo pid,%cpu --sort=-%cpu | head -n 4 | awk '{print $1}'

echo "--- aynı, tail ile başlık atılmış ---"
ps -eo pid,%cpu --sort=-%cpu | head -n 4 | awk '{print $1}' | tail -n 3

echo "--- top'tan veri çekerek ---"
top -b -n1 | grep -E "^[ ]*[0-9]" | sort -k9 -nr | head -n3 | awk '{print $1}'

echo "En çok CPU kullanan 3 proses PID:"
ps -eo pid,%cpu --sort=-%cpu | head -n 4 | awk 'NR>1 {print $1}'

echo "En çok CPU kullanan 3 programın isimleri:"
ps -eo comm,%cpu --sort=-%cpu | head -n 4 | awk 'NR>1 {print $1}'
