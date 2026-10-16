#!/bin/bash
# USB cihazlarını listeleme
echo '--- lsusb ---'
lsusb

echo '--- lsusb -v (ilk 25 satır) ---'
lsusb -v 2>/dev/null | head -n 25

echo '--- df -h | grep /media (takılı USB bellekler) ---'
df -h | grep /media || echo "(/media altında bağlı aygıt yok)"

echo '--- dmesg | tail -n 20 ---'
dmesg 2>/dev/null | tail -n 20 || true
dmesg >/dev/null 2>&1 || echo "(dmesg için yetki yok — 'sudo dmesg | tail -n 20' deneyin)"
