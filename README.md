<p align="center">
  <img src="assets/terminal.svg" width="96" alt="Terminal ikonu">
</p>

# Shell Scripts — Sistem Programlama

Ondokuz Mayıs Üniversitesi Bilgisayar Mühendisliği **Sistem Programlama** dersinin shell uygulama örnekleri.

Derste gördüğümüz her komut burada çalıştırılabilir bir script olarak yer alıyor. Scriptleri okuyunuz, çalıştırınız, değiştiriniz ve çıktının neden öyle olduğunu anlamaya çalışınız. Dersin ana sayfası: <https://ismailhakkituran.github.io/systemprogramming.html>

> **Quiz 1:** Çalışma konuları ve komut listesi için [Quiz-1.md](Quiz-1.md) dosyasına bakınız.

---

## Gereksinimler

- Linux, WSL (Ubuntu) ya da macOS gibi UNIX benzeri bir sistem
- `bash` ve şu araçlar: `bc`, `ps`, `top`, `find`, `grep`, `cut`, `awk`, `lsusb`, `lsblk`, `last`

Ubuntu/WSL üzerinde eksik araçları şöyle kurabilirsiniz:

```bash
sudo apt install bc usbutils procps
```

## Başlarken

```bash
git clone https://github.com/Omu-Ceng-Research/shell-scripts.git
cd shell-scripts

# Tek bir script çalıştırmak
bash hafta-01/01_degiskenler.sh

# Bir haftanın tüm scriptlerini sırayla çalıştırmak
./hepsini_calistir.sh hafta-01

# Tüm haftaları sırayla çalıştırmak
./hepsini_calistir.sh
```

Her haftanın klasörüne girip scriptleri tek tek de çalıştırabilirsiniz. Bunun iki yolu vardır: `./` ile scripti doğrudan çalıştırmak ya da `bash` komutuna vermek.

```bash
# 1. hafta
cd hafta-01
./01_degiskenler.sh      # ./ ile doğrudan çalıştırma
bash 02_matematik.sh     # bash ile çalıştırma
cd ..

# 2. hafta
cd hafta-02
./03_recursive.sh 1      # script argüman alıyorsa adının arkasına yazılır
bash 06_disk.sh
cd ..
```

> **Not:** `./` ile çalıştırmak için dosyanın çalıştırma izni olmalıdır. Repoyu ZIP olarak indirdiyseniz bu izin kaybolabilir ve `Permission denied` hatası alabilirsiniz. Bu durumda klasörün içinde `chmod +x *.sh` komutunu çalıştırınız ya da scripti `bash` ile çalıştırınız; `bash` ile çalıştırmak bu izni gerektirmez.

> **İpucu:** Çalıştırmadan önce scripti açıp okuyunuz (`cat hafta-01/08_grep_regex.sh`). Sonra bir satırı değiştirip tekrar çalıştırınız; en iyi bu şekilde öğrenebilirsiniz.

## Klasör Yapısı

```
shell-scripts/
├── hafta-01/            # 1. uygulama: değişkenler, döngüler, find, grep, regex
├── hafta-02/            # 2. uygulama: job kontrolü, aygıtlar, disk, RAM, last, quiz
├── ornek-veri/          # grep/regex örneklerinin kullandığı örnek dosyalar
└── hepsini_calistir.sh  # haftaların scriptlerini sırayla çalıştırır
```

Yeni haftalar `hafta-03/`, `hafta-04/` … klasörleri olarak eklenecek.

---

## Hafta 1 — Temeller, find, grep ve Regex

Ders notu: [system-app-27-11-2025.md](https://github.com/ismailhakkituran/ismailhakkituran.github.io/blob/main/system-programming/system-app-27-11-2025.md)

| Script | Konu |
| --- | --- |
| `01_degiskenler.sh` | Değişken tanımlama (`=` etrafında boşluk olmaz) |
| `02_matematik.sh` | `$(( ))`, `expr` ve `bc` ile ondalıklı işlem |
| `03_if_else.sh` | `if / elif / else` ve karşılaştırma operatörleri (`-gt`, `-eq` …) |
| `04_while.sh` | `while` döngüsü |
| `05_for.sh` | Liste üzerinde, C tarzı ve dosyalar üzerinde `for` döngüsü |
| `06_find.sh` | `find`: ada, tarihe ve boyuta göre arama; `-delete` |
| `07_cut_cpu.sh` | `cut` ile sütun kesme (`-d` ayraçla, `-c` karakter konumuyla); en çok CPU ve RAM kullanan prosesleri bulma (`ps`, `top` snapshot) |
| `08_grep_regex.sh` | `grep` ile temel regex, `-E` (extended) ve `-P` (Perl) regex |
| `09_wildcard_vs_regex.sh` | Shell wildcard'ları (`*`, `?`, `[]`) ile regex'in farkı |
| `10_grep_pratik.sh` | URL, IPv4 adresi ve yorum satırı yakalama |
| `11_backtick_aritmetik.sh` | `` `komut` ``, `$( )` ve `$(( ))` karşılaştırması |

## Hafta 2 — Job Kontrolü ve Sistem Bilgisi

Ders notu: [system-app-04-12-2025.md](https://github.com/ismailhakkituran/ismailhakkituran.github.io/blob/main/system-programming/system-app-04-12-2025.md)

| Script | Konu |
| --- | --- |
| `01_ardisik_kosullu.sh` | `;`, `&&` ve `\|\|` ile komut zincirleme; `&`, `wait` ve `$!` ile paralel çalıştırma |
| `02_job_kontrol.sh` | `&`, `jobs`, Ctrl+Z, `bg`, `fg` |
| `03_recursive.sh` | `$0` ile kendini çağıran script |
| `04_terminal.sh` | Terminal aygıtları: `/dev/tty*`, `/dev/pts`, `tty` |
| `05_usb.sh` | USB aygıtları: `lsusb`, `dmesg` |
| `06_disk.sh` | Disk ve bölümler: `df -h`, `lsblk` |
| `07_ram.sh` | Bellek: `free`, `/proc/meminfo`, `ps --sort=-%mem`, `ls` seçenekleri |
| `08_last.sh` | Giriş ve reboot geçmişi: `last` |
| `09_quiz_cozumleri.sh` | Quiz çalışma sorularına önerilen çözümler |

> **Quiz'e hazırlanırken:** `09_quiz_cozumleri.sh` dosyasına bakmadan önce soruları kendiniz çözmeyi deneyiniz. Sorular ders notunun sonunda yer alıyor.

---

## Bilmeniz Gerekenler

- **Çıktılar her çalıştırmada farklı olabilir.** `ps`, `top` ve `free` sistemin o anki durumunu gösterir.
- **Bazı komutlar yetki ister.** Örneğin `dmesg` normal kullanıcıyla çalışmayabilir; o durumda `sudo dmesg | tail -n 20` komutunu deneyebilirsiniz.
- **WSL'de bazı komutlar boş dönebilir.** `lsusb`, `last` ve `/dev/tty*` sanal ortamda gerçek donanımı göstermeyebilir.
- **Scriptler sisteminizi değiştirmez.** Dosya oluşturan ya da silen örnekler (`find -delete`, `mkdir`, `cat > whole.txt`) yalnızca geçici bir klasörde (`mktemp -d`) çalışır.

## Sorular

Sorularınızı ders saatinde ya da [ders sayfasındaki](https://ismailhakkituran.github.io/systemprogramming.html) iletişim kanallarından sorabilirsiniz.
