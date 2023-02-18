#!/bin/bash
##To run me on cmd line wget -O - https://raw.githubusercontent.com/monero-ecosystem/PiNode-XMR/master/Install-PiNode-XMR.sh | bash
echo -e "\e[32mMenu wird vorbereitet...\e[0m"
sleep 2
#Check user has whiptail - required to display menu
sudo apt-get install whiptail -y

CHOICE=$(whiptail --title "Willkommen zum PiNode-XMR Projekt" --menu "Für korrekte installation wählen ihr OS aus. \nBuild PiNodeXMR on top of..." 20 60 5 \
	"1)" "Ubunutu Server 22.04/5 LTS (derzeit 32/64bit)" \
	"2)" "Armbian Debian (Bullseye - Eingestellt)" \
	"3)" "Armbian Debian (Buster - Eingestellt)" \
	"4)" "Raspberry Pi OS (Eingestellt)" \
	"5)" "Abbrechen" 3>&2 2>&1 1>&3
)

case $CHOICE in
	"1)")
		#Commands for Ubuntu Server LTS (current)
		echo -e "\e[32mInstallationdateien werden geladen\e[0m"
		sleep 3
		wget https://raw.githubusercontent.com/monero-ecosystem/PiNode-XMR/ubuntuServer-20.04/ubuntu-installer.sh
		echo -e "\e[32mPiNode-XMR Ubuntu Konfiguration datei empfangen\e[0m"
		echo -e "\e[32mInstallation gestartet\e[0m"
		sudo chmod 755 ~/ubuntu-installer.sh
		sleep 2
		./ubuntu-installer.sh
		exit 1
        ;;

	"2)")   
		#Commands for Armbian Bullseye (discontinued)
		echo -e "\e[32mInstallationdateien werden geladen\e[0m"
		sleep 3
		wget https://raw.githubusercontent.com/monero-ecosystem/PiNode-XMR/Armbian-install/armbian-bullseye-installer.sh
		echo -e "\e[32mPiNode-XMR Armbian konfigurations Datei empfangen\e[0m"
		echo -e "\e[32mStarte Installation\e[0m"
		sudo chmod 755 ~/armbian-bullseye-installer.sh
		sleep 2
		./armbian-bullseye-installer.sh
		exit 1
    	;;	

	"3)")   
		#Commands for Armbian Buster (end of life)
		echo -e "\e[32mInstallationdateien werden geladen\e[0m"
		sleep 3
		wget https://raw.githubusercontent.com/monero-ecosystem/PiNode-XMR/Armbian-install/armbian-installer.sh
		echo -e "\e[32mPiNode-XMR Armbian Konfiguration datei empfangen\e[0m"
		echo -e "\e[32mStarte Installation\e[0m"
		sudo chmod 755 ~/armbian-installer.sh
		sleep 2
		./armbian-installer.sh
		exit 1
        ;;

	"4)")   
				#Commands for Raspberry Pi OS
		echo -e "\e[32mInstallationdateien werden geladen\e[0m"
		sleep 3
		wget https://raw.githubusercontent.com/monero-ecosystem/PiNode-XMR/Raspbian-install/raspbian.sh
		echo -e "\e[32mPiNode-XMR Raspbian Konfiguration datei empfangen\e[0m"
		echo -e "\e[32mStarte Installation\e[0m"
		sudo chmod 755 /home/pi/raspbian.sh
		sleep 2
		./raspbian.sh
		exit 1
		;;	

	"5)") exit
        ;;
esac
exit
