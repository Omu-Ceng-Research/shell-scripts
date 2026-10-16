#!/bin/bash
# Quiz çalışma soruları — önerilen çözümler
VERI="$(dirname "$0")/../ornek-veri"

echo "### 0. En çok RAM kullanan 3 process'in PID'leri"
ps -eo pid,%mem --sort=-%mem | awk 'NR>1 && NR<=4 {print $1}'

echo "### 1. Bu 3 process toplam RAM'in yüzde kaçını kullanıyor?"
ps -eo %mem --sort=-%mem | awk 'NR>1 && NR<=4 {s+=$1} END {printf "%%%.2f\n", s}'

echo "### 2. web.log'daki HTTPS istek sayısı"
grep -c "https://" "$VERI/web.log"

echo "### 3. Sistemde tanımlı toplam kullanıcı sayısı"
echo "Tüm hesaplar:            $(wc -l < /etc/passwd)"
echo "Gerçek (UID>=1000) user: $(awk -F: '$3>=1000 && $3<65534' /etc/passwd | wc -l)"

echo "### 4. Son 24 saatte değişmiş .conf dosyaları (/etc)"
find /etc -type f -name "*.conf" -mtime -1 2>/dev/null || true

echo "### 5. Bir dizindeki en büyük 5 dosya (/var/log)"
find /var/log -maxdepth 1 -type f -printf "%s\t%p\n" 2>/dev/null | sort -nr | head -n 5 \
    | awk -F'\t' '{printf "%10.1f KB  %s\n", $1/1024, $2}'

echo "### 6. Sisteme en son giriş yapan 5 kayıt"
last -n 5 | grep -v "^$" | grep -v "^wtmp"

echo "### 7. /var/log altında ERROR içeren satır sayısı"
grep -r "ERROR" /var/log 2>/dev/null | wc -l

echo "### 8. .txt dosyalarını whole.txt'de birleştir"
tmp=$(mktemp -d)
cp "$VERI"/*.txt "$tmp"/
( cd "$tmp" && cat *.txt > whole.txt && echo "whole.txt: $(wc -l < whole.txt) satır" )
rm -r "$tmp"

echo "### 10. students.csv 3. sütun, büyükten küçüğe"
cut -d, -f3 "$VERI/students.csv" | sort -nr

echo "### 11. En son giriş yapan 3 kullanıcının adları (tekil)"
last -w | awk 'NF && $1!="reboot" && $1!="wtmp" && !seen[$1]++ {print $1}' | head -n 3

echo "### 12. Son iki reboot arasındaki zaman farkı"
mapfile -t r < <(last -F reboot | awk '$1=="reboot" {print $6,$7,$8,$9}' | head -n 2)
if [ ${#r[@]} -ge 2 ]; then
    t1=$(date -d "${r[0]}" +%s); t2=$(date -d "${r[1]}" +%s)
    d=$((t1 - t2))
    echo "${r[1]}  ->  ${r[0]}"
    printf "Fark: %d gün %02d:%02d:%02d\n" $((d/86400)) $((d%86400/3600)) $((d%3600/60)) $((d%60))
else
    echo "(yeterli reboot kaydı yok)"
fi

echo "### 13. $USER kullanıcısının toplam giriş sayısı"
last -w "$USER" | grep -c "^$USER "

echo "### 14. Sadece dış IP'lerden yapılan girişler (özel ağlar hariç)"
last -i | awk '$3 ~ /^[0-9]+\./' \
    | grep -vE ' (10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[01])\.|127\.|0\.0\.0\.0)' \
    || echo "(dış IP'den giriş yok)"
