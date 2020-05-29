#!/bin/bash
#
# install_gcloud_ubn.sh
# ver 0.1.0
# Modified: 27-05-2020


. common.lib

FILE="install_gcloud_ubn.sh"
TOPIK="Instalasi Google Cloud CLI"

f1baris
echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Mengimpor Google Cloud public key..."
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg -y
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && f2baris
echo -e "${LCYAN}i  ${TOPIK}:${CDEF} Memasang SDK..."
sudo apt-get update -y && sudo apt-get install google-cloud-sdk -y && f2baris
echo -e "${LGREN}✔  ${TOPIK}:${CDEF} Selesai." && f2baris
echo "Referensi: https://cloud.google.com/sdk/docs/how-to"
# remove all downloaded files
frmall
