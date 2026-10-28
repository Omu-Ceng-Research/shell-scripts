#!/bin/bash
# Komutları peş peşe (;), şarta bağlı (&&, ||) ve paralel (&) çalıştırma
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

# ---------------------------------------------------------------------------
# Paralel çalıştırma (&)
#   komut &   -> komutu arka planda başlatır, bitmesini beklemeden devam eder
#   wait      -> arka planda başlatılan işlerin hepsi bitene kadar bekler
#   wait PID  -> yalnızca o PID'li iş bitene kadar bekler
#   $!        -> arka planda başlatılan son işin PID'i
# ---------------------------------------------------------------------------

echo '--- Peş peşe: sleep 1 ; sleep 1 ; sleep 1 ---'
start=$SECONDS
sleep 1 ; sleep 1 ; sleep 1
echo "Geçen süre: $((SECONDS - start)) sn (işler birbirini bekledi)"

echo '--- Paralel: sleep 1 & sleep 1 & sleep 1 & wait ---'
start=$SECONDS
sleep 1 & sleep 1 & sleep 1 &
wait
echo "Geçen süre: $((SECONDS - start)) sn (işler aynı anda çalıştı)"

echo '--- Paralel işler, bitiş sırasına göre yazar (başlama sırasına göre değil) ---'
( sleep 3; echo "A bitti (3 sn)" ) &
( sleep 1; echo "B bitti (1 sn)" ) &
( sleep 2; echo "C bitti (2 sn)" ) &
wait
echo "Hepsi bitti"

echo '--- $! ile arka plandaki işin PID'"'"'ini almak ve wait PID ---'
sleep 2 &
pid=$!
echo "Arka planda başlatılan sleep'in PID'i: $pid"
ps -p "$pid" -o pid,comm
wait "$pid"
echo "$pid numaralı iş bitti"

echo '--- for döngüsü ile paralel işler, sonuçları dosyalara yazıp birleştirme ---'
for i in 1 2 3; do
    ( sleep "$i"; echo "iş $i tamamlandı" > "sonuc_$i.txt" ) &
done
wait
cat sonuc_*.txt

rm -r "$PWD"
