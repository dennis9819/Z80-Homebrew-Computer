#Setup UDEV rule for ft232
`sudo vim /etc/udev/rules.d/62-ft232.rules`
```
SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", SYMLINK+="fhss", GROUP="dialout", MODE="0777", RUN+="echo USB CONNECTED!"
```