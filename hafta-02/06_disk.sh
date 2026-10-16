#!/bin/bash
# Disk ve bölümleri listeleme
echo '--- df -h ---'
df -h

echo '--- df -h /home ---'
df -h /home

echo '--- lsblk ---'
lsblk
