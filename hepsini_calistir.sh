#!/bin/bash
# Tüm haftaların örnek scriptlerini sırasıyla çalıştırır.
# Kullanım: ./hepsini_calistir.sh            -> tüm haftalar
#           ./hepsini_calistir.sh hafta-02   -> yalnızca belirtilen hafta
cd "$(dirname "$0")" || exit 1

if [ $# -gt 0 ]; then
    dirs=("$@")
else
    dirs=(hafta-*/)
fi

for dir in "${dirs[@]}"; do
    for s in "${dir%/}"/*.sh; do
        echo
        echo "==================== $s ===================="
        bash "$s"
    done
done
