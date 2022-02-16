#!/bin/bash
FILE=test
echo "Start building Z8C monitor..."
./../zmac $FILE.asm -I include -L --oo hex,lst 
RC_BUILD=$?

if [ $RC_BUILD -gt 0 ]; then
	echo "Build failed! Exit."
	exit $RC_BUILD
else
	objcopy --input-target=ihex --output-target=binary zout/$FILE.hex zout/$FILE.bin
	echo "Build successfull!"
	echo "Binary size: $(stat -c %s zout/$FILE.bin)"
fi
