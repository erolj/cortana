#!/bin/bash
#
# preinstall_wsl_ubn.sh
# ver 0.1.0

. common.lib

FILE="preinstall_wsl_ubn.sh"

f1baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Dibawah ini adalah proses yang akan dikerjakan."
echo -e "[1] Konfigurasi ${ULINE}timezone${DEF}"
echo -e "[2] Instalasi ${ULINE}node.js + npm${DEF}"
echo -e "[3] Instalasi ${ULINE}firebase-tools${DEF}"
echo -e "[4] Instalasi ${ULINE}Vercel CLI${DEF}"
echo -e "[5] Instalasi ${ULINE}netlify-cli${DEF}"
echo -e "[6] Instalasi ${ULINE}git${DEF}"
echo -e "[7] Instalasi ${ULINE}shellcheck${DEF}"
echo -e "[8] Instalasi ${ULINE}HUGO Extended${DEF}" && f2baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Mau dilanjutkan?"
select yn in "YA" "Nanti dulu."; do
    case $yn in
        YA ) 
            echo -e "${LCYAN}[1]  Konfigurasi timezone...${CDEF}";
            sudo dpkg-reconfigure tzdata;
            echo -e "${LGREN}✔  Konfigurasi timezone:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[2]  Instalasi node.js + npm...${CDEF}";
            echo -e "${LCYAN}[${BOT}]:${CDEF} Versi mana yg akan dipasang? (pilihan: 12 / 13 / 14 )" && read -r NODEJS;
            sudo curl -sL https://deb.nodesource.com/setup_"${NODEJS}".x | sudo -E bash -;
            sudo apt install nodejs -y && sleep 1;
            echo -e "${LGREN}✔  Instalasi node.js + npm:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[3]  Instalasi firebase-tools...${CDEF}";
            npm install -g firebase-tools;
            echo -e "${LGREN}✔  Instalasi firebase-tools:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[4]  Instalasi Vercel CLI...${CDEF}";
            npm install -g vercel;
            echo -e "${LGREN}✔  Instalasi Vercel CLI:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[5]  Instalasi netlify-cli...${CDEF}";
            npm install -g netlify-cli;
            echo -e "${LGREN}✔  Instalasi netlify-cli:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[6]  Instalasi git...${CDEF}";
            sudo apt install git -y;
            echo -e "${LGREN}✔  Instalasi git:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[7]  Instalasi shellcheck...${CDEF}";
            sudo apt install shellcheck -y;
            echo -e "${LGREN}✔  Instalasi git:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[7]  Instalasi HUGO Extended...${CDEF}";
            echo -e "${LCYAN}i  Instalasi HUGO Extended:${CDEF} Mengunduh versi terbaru."
            curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest \
            | grep  browser_download_url \
            | grep Linux-64bit.deb \
            | grep extended \
            | cut -d '"' -f 4 \
            | wget -i -;
            f1baris;
            echo -e "${LCYAN}i  Instalasi HUGO Extended:${CDEF} Mengekstrak file.";
            sudo dpkg -i hugo*_Linux-64bit.deb && f1baris;
            echo -e "${LCYAN}i  Instalasi HUGO Extended:${CDEF} Verifikasi versi terpasang.";
            hugo version && f1baris;
            echo -e "${LGREN}✔  Instalasi HUGO Extended:${CDEF} Selesai." && f2baris;
            fselesai && f2baris;
            frmall; # remove all downloaded files
            break;;
        "Nanti dulu." )
            fbye; # Bye message from Cortana
            frmall;
            exit;;
    esac
done