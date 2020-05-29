#!/bin/bash
#
# install_certbot_nginx.sh
# ver 0.1.1
# Modified: 24-05-2020

. common.lib

FILE="install_certbot_nginx.sh"
TOPIK="Instalasi Certbox"

function oscheck() {
    
    catdistro

    if test "$CATOS" = 'ubuntu'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Menambah repository certbot."
        sudo apt-get update -y && sleep 1
        sudo apt-get install software-properties-common -y && sleep 1
        sudo add-apt-repository universe && sleep 1
        sudo add-apt-repository ppa:certbot/certbot && sleep 1
        sudo apt-get update -y && f2baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengunduh certbot."
        sudo apt-get install certbot python-certbot-nginx && f2baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Konfigurasi otomatis sertifikat untuk Nginx."
        sudo certbot --nginx && f2baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Tes melakukan renewal otomatis."
        sudo certbot renew --dry-run && f2baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai."
        echo "-------------"
        echo -e "Sekarang coba buka website dan gunakan ${ULINE}https://WEBSITE_ANDA${DEF}. Tes keamanan SSL server web Anda dengan mengunjungi ${ULINE}https://www.ssllabs.com/ssltest/${CEF}"
        frmall # remove all downloaded files

    elif test "$CATOS" = 'debian'
    then
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengunduh certbot."
        sudo apt-get install certbot python-certbot-nginx && f2baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Konfigurasi otomatis sertifikat untuk Nginx."
        sudo certbot --nginx && f2baris
        echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Tes melakukan renewal otomatis."
        sudo certbot renew --dry-run && f2baris
        echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai."
        echo "-------------"
        echo -e "Sekarang coba buka website dan gunakan ${ULINE}https://WEBSITE_ANDA${DEF}. Tes keamanan SSL server web Anda dengan mengunjungi ${ULINE}https://www.ssllabs.com/ssltest/${CEF}"
        frmall # remove all downloaded files

    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung OS Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

oscheck