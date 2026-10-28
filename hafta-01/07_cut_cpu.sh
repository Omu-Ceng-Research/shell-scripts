#!/bin/bash
# Sütun kesme (cut), ps ve top ile en çok kaynak kullanan prosesler
# ps ve top sütunları sabit genişlikte yazar: her sütun her satırda aynı karakter
# aralığındadır. Bu yüzden boşluğa göre değil, karakter konumuna göre kesiyoruz:
#   cut -c1-7   -> her satırın 1. ile 7. karakterleri arası
#   cut -c72-   -> 72. karakterden satır sonuna kadar
# Sayısal sütunlar sağa yaslıdır; değerin önünde boşluk görünmesi normaldir.

echo "--- /etc/passwd'den kullanıcı adları (ilk 10) ---"
cut -d: -f1 /etc/passwd | head -n 10

# ps -eo pid,%cpu -> PID: 1-7. karakterler
echo "--- ps + head + cut (başlık dahil 4 satırın 1. sütunu) ---"
ps -eo pid,%cpu --sort=-%cpu | head -n 4 | cut -c1-7

echo "--- aynı, tail ile başlık atılmış ---"
ps -eo pid,%cpu --sort=-%cpu | head -n 4 | cut -c1-7 | tail -n 3

echo "En çok CPU kullanan 3 proses PID:"
ps -eo pid,%cpu --sort=-%cpu | head -n 4 | tail -n 3 | cut -c1-7

# ps -eo comm,%cpu -> COMMAND: 1-15. karakterler
echo "En çok CPU kullanan 3 programın isimleri:"
ps -eo comm,%cpu --sort=-%cpu | head -n 4 | tail -n 3 | cut -c1-15

# ---------------------------------------------------------------------------
# top örnekleri
# top her çalıştırmada farklı sonuç verir. Herkesin aynı sonucu görmesi için
# top çıktısının bir anlık görüntüsü (snapshot) repoda hazır olarak duruyor:
#   ornek-veri/top_snapshot.log
# Aşağıdaki sonuçların hepsi bu dosyadan okunur. Dosya şu komutla oluşturuldu:
#   top -b -n1 -w 512 > ornek-veri/top_snapshot.log
#   -b      : batch modu (ekranı kaplamadan, metin olarak yazar)
#   -n1     : tek seferlik ölçüm
#   -w 512  : uzun program adları kesilmesin diye geniş satır
# Aynı komutla kendi bilgisayarınızın snapshot'ını alıp örnekleri onun üzerinde
# de deneyebilirsiniz. top varsayılan olarak prosesleri %CPU'ya göre sıralar.
# ---------------------------------------------------------------------------
SNAP="$(dirname "$0")/../ornek-veri/top_snapshot.log"
echo
echo "=== Sonuçlar top snapshot dosyasından okunuyor: ornek-veri/top_snapshot.log ==="
echo "    (snapshot zamanı: $(head -n1 "$SNAP" | cut -d' ' -f3))"

echo "--- top sütun başlıkları ve karakter konumları ---"
grep -m1 "PID" "$SNAP"
# PID: 1-7   %CPU: 50-54   %MEM: 56-60   COMMAND: 72-

echo "--- En çok CPU kullanan 3 prosesin PID'i (sort -k9 ile) ---"
grep -E "^[ ]*[0-9]" "$SNAP" | sort -k9 -nr | head -n3 | cut -c1-7

# Not: %CPU değeri eşit olan proseslerin sırası sort ile top arasında farklı olabilir.
echo "--- Aynısı, sort olmadan (top zaten %CPU'ya göre sıralı) ---"
grep -E "^[ ]*[0-9]" "$SNAP" | head -n3 | cut -c1-7

echo "--- En çok RAM kullanan 3 prosesin PID'i (10. sütun %MEM) ---"
grep -E "^[ ]*[0-9]" "$SNAP" | sort -k10 -nr | head -n3 | cut -c1-7

echo "--- En çok CPU kullanan 3 programın adı ---"
grep -E "^[ ]*[0-9]" "$SNAP" | head -n3 | cut -c72-

echo "--- PID, %CPU ve program adı birlikte ---"
# Aralıklar önlerindeki boşlukla birlikte alınır (49-54, 71-); yoksa değerler birbirine yapışır.
grep -E "^[ ]*[0-9]" "$SNAP" | head -n3 | cut -c1-7,49-54,71-

echo "--- Toplam ve boş RAM (MiB) ---"
# Satır: "MiB Mem :  31777.2 total,    707.2 free, ..."  ':' sonrası, ilk iki ',' alanı
grep "Mem :" "$SNAP" | cut -d':' -f2 | cut -d',' -f1,2

echo "--- CPU boşta yüzdesi ---"
# Satır: "%Cpu(s):  6.7 us,  3.0 sy,  0.0 ni, 90.4 id, ..."  4. ',' alanı
grep "Cpu(s)" "$SNAP" | cut -d',' -f4
