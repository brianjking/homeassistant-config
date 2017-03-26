
# Z-Wave Disco Lights

* [Source](https://home-assistant.io/docs/z-wave/settings/) via Home Assistant.

### Turn Off Flashing

````echo -e -n "\x01\x08\x00\xF2\x51\x01\x00\x05\x01\x51" > /dev/serial/by-id/usb-0658_0200-if00````

### Turn On Flashing

````echo -e -n "\x01\x08\x00\xF2\x51\x01\x01\x05\x01\x50" > /dev/serial/by-id/usb-0658_0200-if00````
