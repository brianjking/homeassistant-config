# Persistent Z-Wave Device Name For Z-Wave Aeotec by Aeon Labs Z-Stick Series 5

* ````sudo nano /etc/udev/rules.d/99-usb-serial.rules````
* ````ACTION=="add", ATTRS{idVendor}=="0658", ATTRS{idProduct}=="0200" SYMLINK+="zwave"````
* Save file.
* Adjust Z-Wave configuration in your ````configuration.yaml```` file to reflect the new name/path. In my case instead of ````/dev/ttyACM0```` I can now use ````/dev/zwave````.
* ````sudo shutdown -r now```` (Reboot your Raspberry Pi to ensure all is working properly).

## Additional Documentation

Official documentation can also be found from references provided by Home Assistant below:

* http://www.domoticz.com/wiki/PersistentUSBDevices
* http://hintshop.ludvig.co.nz/show/persistent-names-usb-serial-devices/
