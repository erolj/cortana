#!/bin/bash
#
# preinstall_wsl_cent.sh
# ver 0.1.1
# Modified: 24-05-2020

. common.lib

FILE="preinstall_wsl_cent.sh"

f1baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Dibawah ini adalah proses yang akan dikerjakan."
echo -e "[1] Instalasi ${ULINE}node.js + npm${DEF}"
echo -e "[2] Instalasi ${ULINE}firebase-tools${DEF}"
echo -e "[3] Instalasi ${ULINE}Vercel CLI${DEF}"
echo -e "[4] Instalasi ${ULINE}netlify-cli${DEF}"
echo -e "[5] Instalasi ${ULINE}git${DEF}"
echo -e "[6] Instalasi ${ULINE}shellcheck${DEF}"
echo -e "[7] Instalasi ${ULINE}HUGO Extended${DEF}" && f2baris
echo -e "${LCYAN}[${BOT}]:${CDEF} Mau dilanjutkan?"
select yn in "YA" "Nanti dulu."; do
    case $yn in
        YA ) 
            echo -e "${LCYAN}[1]  Instalasi node.js + npm...${CDEF}";
            echo -e "${LCYAN}[${BOT}]:${CDEF} Versi mana yg akan dipasang? (pilihan: 12 / 13 / 14 )" && read -r NODEJS;
            sudo curl --silent --location https://rpm.nodesource.com/setup_"${NODEJS}".x | sudo bash -;
            sudo yum install nodejs -y && sleep 1;
            echo -e "${LGREN}✔  Instalasi node.js + npm:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[2]  Instalasi firebase-tools...${CDEF}";
            npm install -g firebase-tools;
            echo -e "${LGREN}✔  Instalasi firebase-tools:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[3]  Instalasi Vercel CLI...${CDEF}";
            npm install -g vercel;
            echo -e "${LGREN}✔  Instalasi Vercel CLI:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[4]  Instalasi netlify-cli...${CDEF}";
            npm install -g netlify-cli;
            echo -e "${LGREN}✔  Instalasi netlify-cli:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[5]  Instalasi git...${CDEF}";
            sudo yum install git -y;
            echo -e "${LGREN}✔  Instalasi git:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[6]  Instalasi shellcheck...${CDEF}";
            sudo yum install shellcheck -y;
            echo -e "${LGREN}✔  Instalasi git:${CDEF} Selesai." && sleep 2;
            f1baris;
            echo -e "${LCYAN}[7]  Instalasi HUGO Extended...${CDEF}";
            wget https://copr.fedorainfracloud.org/coprs/daftaupe/hugo/repo/epel-7/daftaupe-hugo-epel-7.repo -O /etc/yum.repos.d/hugo.repo;
            sudo yum update -y;
            sudo yum install hugo -y && f1baris;
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