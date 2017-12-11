echo "
	RPI3 USB OPTION:1  RPI3 USB OPTION:2
	+---------------+  +---------------+
	| wlan1 | wlan2 |  | wlan1 | wlan1 |
	+---------------+  +---------------+
	| wlan3 | wlan4 |  | wlan1 | wlan1 |
	+---------------+  +---------------+

"
echo -n "Elija una opción (ej:1): "
read opcion

case $opcion in

	1)
		usb1="wlan1"
		usb2="wlan2"
		usb3="wlan3"
		usb4="wlan4"
	;;
	2)
		usb1="wlan1"
                usb2="wlan1"
                usb3="wlan1"
                usb4="wlan1"
	;;
esac

if [ -f /etc/udev/rules.d/72-wlan-geo-dependent.rules ]; then
	echo -n "El fichero ya existe, compruebe manualmente la configuración existente"	
else
	sudo touch /etc/udev/rules.d/72-wlan-geo-dependent.rules
	echo "
			ACTION==\"add\", SUBSYSTEM==\"net\", SUBSYSTEMS==\"sdio\", KERNELS==\"mmc1:0001:1\", NAME=\"wlan0\"
		ACTION==\"add\", SUBSYSTEM==\"net\", SUBSYSTEMS==\"usb\", KERNELS==\"1-1.2\", NAME=\"$usb1\"
		ACTION==\"add\", SUBSYSTEM==\"net\", SUBSYSTEMS==\"usb\", KERNELS==\"1-1.4\", NAME=\"$usb2\"
		ACTION==\"add\", SUBSYSTEM==\"net\", SUBSYSTEMS==\"usb\", KERNELS==\"1-1.3\", NAME=\"$usb3\"
		ACTION==\"add\", SUBSYSTEM==\"net\", SUBSYSTEMS==\"usb\", KERNELS==\"1-1.5\", NAME=\"$usb4\"
		" | sudo tee -a /etc/udev/rules.d/72-wlan-geo-dependent.rules

fi


if [ "$?" -eq "0" ]; then
	echo -e "[ \e[1;32mOK\e[0m ] Renombres interfaces"
	echo "Reinicie para que los cambios tengan efecto"
else
	echo -e "[ \e[1;31mFAIL\e[0m ] Renombres interfaces"
fi
