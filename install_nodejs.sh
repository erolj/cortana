#!/bin/bash
#
# install_nodejs.sh
# ver 0.1.0
# Modified: 24-05-2020

. common.lib

FILE="install_nodejs.sh"
TOPIK="Instalasi Node.js + NPM"

function node_distro() {
    catdistro

    if test "$CATOS" = 'debian'
    then
        echo -e "${LCYAN}»  Ketik versi yg akan diunduh? (pilihan: 12, 13, 14 )${CDEF}" && read -r NODEJS
        sudo apt install -y curl
        sudo curl -sL https://deb.nodesource.com/setup_"${NODEJS}".x | sudo -E bash - && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang."
        sudo apt install nodejs -y
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi."
        node --version && f1baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall # remove all downloaded files

    elif test "$CATOS" = 'ubuntu'
    then
        echo -e "${LCYAN}»  Ketik versi yg akan diunduh? (pilihan: 12, 13, 14 )${CDEF}" && read -r NODEJS
        sudo curl -sL https://deb.nodesource.com/setup_"${NODEJS}".x | sudo -E bash - && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang."
        sudo apt install nodejs -y
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi."
        node --version && f1baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall # remove all downloaded files

    elif test "$CATOSx" = 'centos'
    then
        echo -e "${LCYAN}»  Ketik versi yg akan diunduh? (pilihan: 12, 13, 14 )${CDEF}" && read -r NODEJS
        sudo curl --silent --location https://rpm.nodesource.com/setup_"${NODEJS}".x | sudo bash - && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang memasang."
        sudo yum install nodejs -y
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Cek versi."
        node --version && f1baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall # remove all downloaded files
    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung OS Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

node_distro