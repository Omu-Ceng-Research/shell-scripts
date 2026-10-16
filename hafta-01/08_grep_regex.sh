#!/bin/bash
# grep ile temel, extended (-E) ve Perl (-P) regex örnekleri
cd "$(dirname "$0")/../ornek-veri" || exit 1

echo '--- grep "error" log.txt ---'
grep "error" log.txt

echo '--- grep "^root" /etc/passwd ---'
grep "^root" /etc/passwd

echo '--- grep "bash$" /etc/passwd ---'
grep "bash$" /etc/passwd

echo '--- grep "^[0-9]*$" dosya.txt (sadece rakam) ---'
grep "^[0-9]*$" dosya.txt

echo '--- grep "[abc]" dosya.txt ---'
grep "[abc]" dosya.txt

echo '--- grep "^[0-9]+$" dosya.txt (temel regex: + düz karakter, eşleşme yok) ---'
grep "^[0-9]+$" dosya.txt || echo "(eşleşme yok — + için -E gerekir)"
echo '--- grep -E "^[0-9]+$" dosya.txt ---'
grep -E "^[0-9]+$" dosya.txt

echo '--- grep -E "error|warning" log.txt ---'
grep -E "error|warning" log.txt

echo '--- Tekrarlama: +, ?, {n} ---'
grep -E "file[0-9]+\.txt" dosya_listesi.txt
echo "logs"      | grep -E "log?s"
echo "colour"    | grep -E "colou?r"
echo "color"     | grep -E "colou?r"
echo "caaat"     | grep -E "a+"
echo "abc123def" | grep -E "[0-9]+"
echo "abc1234"   | grep -E "[0-9]{3}"

echo '--- grep -E "^[a-zA-Z]+$" file.txt (sadece harf) ---'
grep -E "^[a-zA-Z]+$" file.txt

echo '--- grep -P e-posta tespiti ---'
grep -P "[\w.-]+@[\w.-]+\.\w+" users.txt

echo '--- grep -P non-greedy (-o ile sadece eşleşen kısım) ---'
grep -oP "<title>.*?</title>" index.html

echo '--- grep -R "main()" src/ ---'
grep -R "main()" src/
