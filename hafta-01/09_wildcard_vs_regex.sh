#!/bin/bash
# Shell wildcard (globbing) ile regex farkı
demo=$(mktemp -d)
cd "$demo" || exit 1
touch z zoom zebra.txt zzzz ba.txt ha.log xa123 apple.txt banana cherry.md notes.txt

echo "Dizindeki dosyalar:"; ls; echo

echo '--- ls z*      (z ile başlayan) ---';           ls z*
echo '--- ls *.txt   (.txt ile biten) ---';           ls *.txt
echo '--- ls ?a*     (ikinci karakter a) ---';        ls ?a*
echo '--- ls [abc]*  (a, b veya c ile başlayan) ---'; ls [abc]*

echo
echo "=== Aynı desenlerin grep regex karşılıkları ==="
ls > ../liste.$$
echo '--- grep "^z" ---';        grep "^z" ../liste.$$
echo '--- grep "\.txt$" ---';    grep "\.txt$" ../liste.$$
echo '--- grep "^.a.*" ---';     grep "^.a.*" ../liste.$$
echo '--- grep "^[abc].*" ---';  grep "^[abc].*" ../liste.$$

rm -f ../liste.$$
cd / && rm -r "$demo"
