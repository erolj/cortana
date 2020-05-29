#!/bin/bash
#
# install_ibmcloud.sh
# ver 0.1.0
# Modified: 27-05-2020

. common.lib

FILE="install_ibmcloud.sh"

repo_host="static.erto.co"
os_name=$(uname -s | tr '[:upper:]' '[:lower:]')
if [ "$os_name" = "linux" ]; then
    arch=$(uname -m | tr '[:upper:]' '[:lower:]')
    if echo "$arch" | grep -q 'x86_64'
    then
        platform="linux64"
        targz="IBM_Cloud_CLI_1.1.0_amd64.tar.gz"
        # wget https://static.erto.co/etc/IBM_Cloud_CLI_1.1.0_amd64.tar.gz

    elif echo "$arch" | grep -q -E '(x86)|(i686)'
    then
        platform="linux32"
        targz="IBM_Cloud_CLI_1.1.0_386.tar.gz"
        # wget https://static.erto.co/etc/IBM_Cloud_CLI_1.1.0_386.tar.gz

    elif echo "$arch" | grep -q 'ppc64le'
    then
        platform="ppc64le"
        targz="IBM_Cloud_CLI_1.1.0_ppc64le.tar.gz"
        # wget https://static.erto.co/etc/IBM_Cloud_CLI_1.1.0_ppc64le.tar.gz

    else
        echo -e "${LRED}×  Architecture Linux belum didukung: ${arch}. Instalasi dihentikan.${CDEF}";
        exit 1
    fi
else
    echo -e "${LRED}×  Platform Linux belum didukung: ${os_name}. Instalasi dihentikan.${CDEF}";
    exit 1
fi

# Only use sudo if not running as root:
[ "$(id -u)" -ne 0 ] && SUDO=sudo || SUDO=""

url="https://${repo_host}/etc/${targz}"
# checksum_url="https://${repo_host}/download/bluemix-cli/latest/${platform}/checksum"
file_name="IBM_Cloud_CLI.tar.gz"

f1baris;
echo -e "${LCYAN}i  Platform yang digunakan adalah ${platform}.${CDEF}";
echo -e "${LCYAN}»  Mengunduh IBM Cloud CLI untuk platform ini...${CDEF}";


if wget $url && mv IBM_Cloud_CLI_1* ${file_name}
then
    echo -e "${LCYAN}i  Pengunduhan selesai. Instalasi dimulai...${CDEF}";
else
    echo -e "${LRED}×  Pengunduhan gagal. Mohon cek kembali koneksi internet. Instalasi dihentikan.${CDEF}";
    exit 1
fi

# remote_checksum=$(curl -L $checksum_url)
# calculated_checksum=$(sha1sum /tmp/${file_name} | awk '{print $1}')
# if [ "$remote_checksum" != "$calculated_checksum" ]; then
#     echo "Downloaded file is corrupted. Quit installation."
#     exit 1
# fi

# cd /tmp || exit
tar -xvf ${file_name}
chmod 755 Bluemix_CLI/install

if $SUDO Bluemix_CLI/install -q ; then
    echo -e "${LCYAN}i  Instalasi selesai.${CDEF}";
    echo -e "${LCYAN}»  Verifikasi versi IBM Cloud CLI...${CDEF}";
    ibmcloud -v && f1baris && fselesai && f1baris;
    echo "Referensi: https://cloud.ibm.com/docs/cli?topic=cli-install-ibmcloud-cli" && f1baris;
else
    echo -e "${LRED}×  Instalasi gagal.${CDEF}";
fi

rm -fR Bluemix_CLI ${file_name}
frmall # remove all downloaded files