#!/bin/bash
# last komutu: giriş/çıkış ve reboot geçmişi
echo '--- last | head -n 5 ---'
last | head -n 5

echo "--- last $USER | head -n 5 (belirli kullanıcı) ---"
last "$USER" | head -n 5

echo '--- last reboot | head -n 5 ---'
last reboot | head -n 5

echo '--- last shutdown | head -n 5 ---'
last shutdown | head -n 5
