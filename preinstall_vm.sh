#!/bin/bash
#
# preinstall_vm.sh
# ver 0.1.0

. common.lib

FILE="preinstall_vm.sh"

f1baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Dibawah ini adalah proses yang akan dikerjakan."
echo -e "[1] Mengganti hostname"
echo -e "[2] Mengganti zona waktu"
echo -e "[3] Membuat swap" && f2baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Mau dilanjutkan?"
select yn in "YA" "Nanti dulu."; do
    case $yn in
        YA ) 
            echo -e "${LCYAN}[1]  Mengganti hostname...${CDEF}";
            echo -e "${LCYAN}[${BOT}]:${CDEF} Ketik nama hostname." && read -r HOSTNAME;
            sudo hostnamectl set-hostname ${HOSTNAME};
            echo -e "${LGREN}✔  Sukses diubah ke ${HOSTNAME}.${CDEF}" && f1baris;
            echo -e "${LCYAN}[2]  Mengganti zona waktu...${CDEF}";
            echo -e "${LCYAN}[${BOT}]:${CDEF} Ketik kode timezone. (contoh: Asia/Makassar)" && read -r TIMEZONE;
            sudo timedatectl set-timezone ${TIMEZONE};
            echo -e "${LGREN}✔  Sukses diubah ke ${TIMEZONE}.${CDEF}" && f1baris;
            echo -e "${LCYAN}[3]  Membuat swap...${CDEF}";
            echo -e "${LCYAN}[${BOT}]:${CDEF} Ketik ukuran SWAP (dalam MB)." && read -r SWAPSIZE && f1baris;
            echo -e "${LCYAN}[${BOT}]:${CDEF} Ketik nama file SWAP (tanpa /)." && read -r SWAPNAME && f1baris;
            echo -e "${LCYAN}i  Membuat swap:${CDEF} Mohon tunggu sebentar.";
            sudo dd if=/dev/zero of=/${SWAPNAME} count=${SWAPSIZE} bs=1MiB && sleep 1;
            sudo chmod 600 /${SWAPNAME} && sleep 1;
            sudo mkswap /${SWAPNAME} && sleep 1;
            sudo swapon /${SWAPNAME} && sleep 1;
            echo -e "/${SWAPNAME} none swap sw 0 0" | sudo tee -a /etc/fstab;
            echo -e "${LGREN}✔  Sukses membuat SWAP sebesar ${SWAPSIZE} dengan nama /${SWAPNAME}.${CDEF}" && f1baris;
            sudo swapon -s && f1baris;
            fselesai && f1baris;
            frmall; # remove all downloaded files
            break;;
        "Nanti dulu." )
            fbye; # Bye message from Cortana
            frmall; # remove all downloaded files
            exit;;
    esac
done