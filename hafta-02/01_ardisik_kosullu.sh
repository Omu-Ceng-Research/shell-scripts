#!/bin/bash
# Komutları peş peşe (;) ve şarta bağlı (&&, ||) çalıştırma
cd "$(mktemp -d)" || exit 1

echo '--- ls ; pwd ; whoami ---'
ls ; pwd ; whoami

echo '--- ; ile: ilk komut başarısız olsa da sonraki çalışır ---'
ls olmayan_dosya ; echo "yine de çalıştım"

echo '--- mkdir test && echo ... ---'
mkdir test && echo "Klasör oluşturuldu"
echo '--- ikinci kez: mkdir başarısız, echo çalışmaz ---'
mkdir test && echo "Klasör oluşturuldu"

echo '--- cd not_exist || echo ... ---'
cd not_exist || echo "Klasör yok"

rm -r "$PWD"
