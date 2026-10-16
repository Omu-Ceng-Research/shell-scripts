#!/bin/bash
# Paralel çalıştırma (&) ve job kontrolü: jobs, Ctrl+Z, bg, fg
# Script içinde job kontrolü varsayılan kapalıdır; set -m ile açıyoruz.
# firefox yerine sleep kullanıyoruz; Ctrl+Z'yi kill -STOP ile taklit ediyoruz.
set -m

echo '--- sleep 5 & sleep 7 & sleep 10 & (paralel) ---'
sleep 5 & sleep 7 & sleep 10 &
jobs

echo '--- %1 durduruluyor (Ctrl+Z eşdeğeri: SIGTSTP) ---'
kill -TSTP %1
sleep 0.3
jobs

echo '--- bg %1: arka planda devam ettir ---'
bg %1
jobs

echo '--- fg %3: öne getir (bitene kadar bekler, ~10 sn) ---'
start=$SECONDS
fg %3
echo "fg döndü ($((SECONDS - start)) sn beklendi)"
jobs
wait
echo "Tüm job'lar bitti."
