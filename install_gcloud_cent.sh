#!/bin/bash
#
# install_gcloud_cent.sh
# ver 0.1.0
# Modified: 27-05-2020


. common.lib

FILE="install_gcloud_cent.sh"
TOPIK="Instalasi Google Cloud CLI"

f1baris
echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengimpor Google Cloud SDK repo..."
wget "${CDN}"/repo/google-cloud-sdk.repo -O /etc/yum.repos.d/google-cloud-sdk.repo && f2baris
echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Memasang SDK..."
sudo yum install google-cloud-sdk -y && f2baris
echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
echo "Referensi: https://cloud.google.com/sdk/docs/how-to"
# remove all downloaded files
frmall
