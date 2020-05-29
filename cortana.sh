#!/bin/bash
#
# cortana.sh
# ver 0.4.1
# Modified: 29-05-2020

. common.lib

clear
URL="https://erto.my.id"
VER=$(curl --silent --show-error ${URL}/versi.json | grep "Stable" | cut -d '"' -f 4)
# VER="0.6.3"
FILE="cortana.sh"

## Start Header ##
flogo
echo -e "» VERSI: ${INV} ${VER} ${DEF}" && f1baris
printf "» URL: ${URL}" && f2baris
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
f1baris
## End Header ##

function wsl_distro() {
    catdistro

    if test "$CATOS" = 'ubuntu'
    then
        FILE05="preinstall_wsl_ubn.sh"
        fwget "${FILE05} -O ${FILE05}"; 
        fchmodx "${FILE05}" && ./${FILE05}; 
        frmfile;

    elif test "$CATOSx" = 'centos'
    then
        FILE05="preinstall_wsl_cent.sh"
        fwget "${FILE05} -O ${FILE05}"; 
        fchmodx "${FILE05}" && ./${FILE05}; 
        frmfile;

    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung distro Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}
function gcloud_distro() {
    catdistro

    if test "$CATOS" = 'ubuntu'
    then
        FILE05="install_gcloud_ubn.sh"
        fwget "${FILE05} -O ${FILE05}"; 
        fchmodx "${FILE05}" && ./${FILE05}; 
        frmfile;

    elif test "$CATOS" = 'debian'
    then
        FILE05="install_gcloud_ubn.sh"
        fwget "${FILE05} -O ${FILE05}"; 
        fchmodx "${FILE05}" && ./${FILE05}; 
        frmfile;

    elif test "$CATOSx" = 'centos'
    then
        FILE05="install_gcloud_cent.sh"
        fwget "${FILE05} -O ${FILE05}"; 
        fchmodx "${FILE05}" && ./${FILE05}; 
        frmfile;

    else
        f1baris
        echo -e "${LCYAN}[${BOT}]:${CDEF} Maaf, script ini belum mendukung distro Anda, atau sedang dalam pengembangan."
        fbye # Bye message from Cortana
        frmall # remove all downloaded files
    fi
}

echo -e "${CDEF}"
echo -e "${LCYAN}[${BOT}]:${CDEF} Halo, ada yang bisa dibantu?"
select yn in "Setup awal VM baru..."\
 "Konfigurasi WSL baru..."\
 "Install/Update HUGO Extended"\
 "Install gcloud CLI (Debian, Ubuntu)"\
 "Install ibmcloud CLI"\
 "Install NGINX Certbot (Debian, Ubuntu)"\
 "Install GIT"\
 "Install ASCIINEMA"\
 "Install/Update Node Version Manager (NVM)"\
 "Install Node.js + NPM"\
 "Install YARN"\
 "Install HEXO"\
 "CABALS..."\
 "CLIMYID... (in English)"\
 "Nanti dulu."; do
    
    case $yn in
        "Setup awal VM baru..." )
            FILE02="preinstall_vm.sh"
            fwget "${FILE02} -O ${FILE02}"; 
            fchmodx "${FILE02}" && ./${FILE02}; 
            frmfile;
            break;;
        "Konfigurasi WSL baru..." )
            wsl_distro;
            break;;
        "Install/Update HUGO Extended" )
            FILE03="install_hugoext.sh"
            fwget "${FILE03} -O ${FILE03}"; 
            fchmodx "${FILE03}" && ./${FILE03}; 
            frmfile;
            break;;
        "Install gcloud CLI (Debian, Ubuntu)" )
            gcloud_distro;
            break;;
        "Install ibmcloud CLI" )
            FILE05="install_ibmcloud.sh"
            fwget "${FILE05} -O ${FILE05}"; 
            fchmodx "${FILE05}" && ./${FILE05}; 
            frmfile;
            break;;
        "Install NGINX Certbot (Debian, Ubuntu)" )
            FILE06="install_certbot_nginx.sh"
            fwget "${FILE06} -O ${FILE06}"; 
            fchmodx "${FILE06}" && ./${FILE06}; 
            frmfile;
            break;;
        "Install GIT" )
            FILE07="install_git.sh"
            fwget "${FILE07} -O ${FILE07}"; 
            fchmodx "${FILE07}" && ./${FILE07}; 
            frmfile;
            break;;
        "Install ASCIINEMA" )
            FILE08="install_asciinema.sh"
            fwget "${FILE08} -O ${FILE08}"; 
            fchmodx "${FILE08}" && ./${FILE08}; 
            frmfile;
            break;;
        "Install/Update Node Version Manager (NVM)" )
            frmall; 
            wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash; 
            frmfile;
            break;;
        "Install Node.js + NPM" )
            FILE09="install_nodejs.sh"
            fwget "${FILE09} -O ${FILE09}"; 
            fchmodx "${FILE09}" && ./${FILE09}; 
            frmfile;
            break;;
        "Install YARN" )
            FILE10="install_yarn.sh"
            fwget "${FILE10} -O ${FILE10}"; 
            fchmodx "${FILE10}" && ./${FILE10}; 
            frmfile;
            break;;
        "Install HEXO" )
            f1baris;
            npm install -g hexo; 
            frmfile;
            break;;
        "CABALS..." )
            frmall;
            wget https://cabals.web.app/run.sh && bash run.sh;
            frmfile;  # remove THIS file
            exit;;
        "CLIMYID... (in English)" )
            frmall;
            wget https://cli.my.id/run.sh && bash run.sh;
            frmfile;  # remove THIS file
            exit;;
        "Nanti dulu." )
            fbye; # Bye message from Cortana
            frmall;
            exit;;
    esac
done