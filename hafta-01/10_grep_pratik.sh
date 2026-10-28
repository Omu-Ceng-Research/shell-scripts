#!/bin/bash
# grep + regex ile pratik örnekler
cd "$(dirname "$0")/../ornek-veri" || exit 1

echo '--- URL satırları ---'
grep -E "https?://[a-zA-Z0-9./_-]+" web.log

echo '--- IPv4 adresleri (-o ile sadece adres) ---'
grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}" network.log

echo '--- # ile başlayan satırlar ---'
grep "^#" script.sh

echo '--- cut + grep regex ile en çok CPU kullanan 3 proses (PID %CPU) ---'
ps aux | cut -c10-21 | grep -E ' [0-9.]+$' | sort -k2 -nr | head -n3
