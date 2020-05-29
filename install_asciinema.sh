#!/bin/bash
#
# install_asciinema.sh
# ver 0.1.1
# Modified: 24-05-2020

. common.lib

FILE="install_asciinema.sh"
TOPIK="Instalasi ASCIINEMA"

function asciinema_distro() {
    catdistro

    if test "$CATOS" = 'debian'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang dalam pemasangan, mohon menunggu."
        sudo apt-get install asciinema -y
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Membuat token untuk otentikasi."
        asciinema auth
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall # remove all downloaded files

    elif test "$CATOS" = 'ubuntu'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Menambahkan repository."
        sudo apt-add-repository ppa:zanchey/asciinema && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Sedang dalam pemasangan, mohon menunggu."
        sudo apt update -y
        sudo apt install -y asciinema
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Membuat token untuk otentikasi."
        asciinema auth
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        fselesai && f2baris
        frmall # remove all downloaded files

    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung OS Anda, atau sedang dalam pengembangan."
        echo -e "${LCYAN}[${BOT}]:${CDEF} Kunjungi https://asciinema.org/docs/installation untuk info lebih lengkap."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

asciinema_distro