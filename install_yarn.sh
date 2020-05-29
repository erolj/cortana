#!/bin/bash
#
# install_yarn.sh
# ver 0.2.0
# Modified: 24-05-2020

. common.lib

FILE="install_yarn.sh"
TOPIK="Instalasi YARN"

function git_distro() {
    catdistro

    if test "$CATOS" = 'debian'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Menambahkan repository."
        sudo apt install -y curl
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - 
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Pemasangan yarn. Mohon menunggu."
        sudo apt update -y
        sudo apt install -y --no-install-recommends yarn
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        yarn --version && fselesai && f2baris
        frmall # remove all downloaded files

    elif test "$CATOS" = 'ubuntu'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Menambahkan repository."
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - 
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Pemasangan yarn. Mohon menunggu."
        sudo apt update -y
        sudo apt install -y --no-install-recommends yarn
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        yarn --version && fselesai && f2baris
        frmall # remove all downloaded files

    elif test "$CATOSx" = 'centos'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Menambahkan repository."
        curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
        sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg && f1baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Pemasangan yarn. Mohon menunggu."
        sudo yum install -y --no-install-recommends yarn
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
        yarn --version && fselesai && f2baris
        frmall # remove all downloaded files
    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung OS Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

git_distro