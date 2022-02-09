#!/bin/bash
./zmac main.asm -I functions -L --oo hex,lst 
RC_BUILD=$?

if [ $RC_BUILD -gt 0 ]; then
	echo "Build failed! Exit."
	exit $RC_BUILD
else
	objcopy --input-target=ihex --output-target=binary zout/main.hex zout/main.bin

	echo "Build successfull!"
fi

read -p "Programm EEPROM? (y/N) " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# programm EEPROM
	minipro -p "AT28C256" -w zout/main.hex -s
fi


