![Home Assistant Logo](https://github.com/brianjking/hass-config/blob/master/images/hass.png "Home Assistant Logo")

# Home Assistant Configuration

Configuration files for [Brian's](https://twitter.com/brianjking) & [Kinna's](https://twitter.com/real_kinna) [HomeAssistant](https://home-assistant.io).

## Build Status (Travis-CI)

[![Build Status](https://travis-ci.org/brianjking/homeassistant-config.svg?branch=master)](https://travis-ci.org/brianjking/homeassistant-config)


## Current Configuration

* RaspberryPi 3 using the [Hassbian](https://home-assistant.io/docs/installation/hassbian/) installation method. 
* NGINX with Let's Encrypt with no-ip.com used for dynamic DNS.

### Devices

* [LIFX White 800 Lightbulbs](https://goo.gl/wy6KkU) (Quantity: 4)
* [LIFX Color 1000 Lightbulbs](https://goo.gl/wy6KkU) (Quantity: 2)
* [LIFX Mini White Lightbulb](https://goo.gl/wy6KkU) (Quantity: 1)
* [Google Chromecast](https://www.google.com/intl/en_us/chromecast/?utm_source=chromecast.com)
* OctoPrint & [Monoprice Select Mini 3D Printer](https://www.amazon.com/gp/product/B01FL49VZE/ref=as_li_tl?ie=UTF8&tag=brianjking-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B01FL49VZE&linkId=76e68ae7b7e1da100d3b710dd8ac260e)
* [Amazon Echo Dot](https://www.amazon.com/gp/product/B01DFKC2SO/ref=as_li_tl?ie=UTF8&tag=brianjking-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B01DFKC2SO&linkId=fd530006c93e95bccfdc671a5422be7a)
* [Z-Wave](https://www.amazon.com/gp/product/B00X0AWA6E/ref=as_li_tl?ie=UTF8&tag=brianjking-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B00X0AWA6E&linkId=46e62070962b1fa275b982f99c9c6aa5)
* [Ecolink Z-Wave Motion Sensors](https://www.amazon.com/gp/product/B00FB1TBKS/ref=as_li_tl?ie=UTF8&tag=brianjking-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B00FB1TBKS&linkId=340fc9e2f1a49196bcc3f93aa39c3bb2)
* [RaspberryPi 3 Model B](http://amzn.to/2kmuagD)
* [SanDisk 32gb MicroSD Card](http://amzn.to/2l1qCjd)
* [Playstation Eye Webcam - Used with OctoPrint/3D Printer](http://amzn.to/2kYYZbm)
* [TP-Link Archer C7 AC1750 Router](http://amzn.to/2l1rfJB)
* [TP-Link HS-100 Smart Plug](http://amzn.to/2kxkzDR)
* [TP-Link HS-105 Smart Plug](https://smile.amazon.com/gp/product/B01K1JVZOE/ref=oh_aui_search_detailpage?ie=UTF8&psc=1)
* [Ecolink Z-Wave Door/Window Sensor](http://amzn.to/2outQ1r)
* Z-Wave Light Bulb
* [Google Home Mini](https://store.google.com/us/product/google_home_mini?hl=en-US)
* [Tile Mate Trackers](http://ssqt.co/mee1Ksr)


### Sensors

* [Speedtest.net](https://home-assistant.io/components/sensor.speedtest/)
* [Forecast.io (Darksky)](https://darksky.net)
* [OctoPrint](https://github.com/foosel/OctoPrint)
* [Raspberry Pi System Resources](https://home-assistant.io/components/sensor.systemmonitor/)
* [USPS Packages](https://home-assistant.io/components/sensor.usps/)
* Z-Wave Motion Sensors
* Z-Wave Door/Window Sensors
* Digital Ocean Droplet Sensors
* Flux Light Adjustment Sensors
* Crime Reports Sensors
* FedEx Package Sensors
* [Google Maps Travel Time Sensors](https://www.home-assistant.io/components/sensor.google_travel_time/)
* Air Quality Index Sensor
* Air Visual Air Quality Sensor
* [Pi-Hole](https://www.home-assistant.io/components/sensor.pi_hole/) 
* [UptimeRobot](https://www.home-assistant.io/components/binary_sensor.uptimerobot/)
* [Tile Sensors](https://www.home-assistant.io/components/device_tracker.tile/)
* [Lyft Ride Sharing Sensors](https://www.lyft.com/i/BRIAN682874)
* [Let's Encrypt Certificate Expiration Sensor](https://www.home-assistant.io/components/sensor.cert_expiry/)
* Wyze Camera v1 (*not integrated into Home Assistant as they don't offer a method of doing so, bummer.*)
* Android IP Webcamera


### Automations 

- [ ] Outline automations here. 
* Use [IFTTT](https://ifttt.com) to flash living room lights at certain hours of the day only if the light is currently turned on.
* Send push notification if front door is open for more than 25 seconds - [automation](https://github.com/brianjking/homeassistant-config/blob/master/automation/front-door-open-alert.yaml)
* Turn home office lights on/off based on motion detection between certain hours - [automation](https://github.com/brianjking/homeassistant-config/blob/master/automation/office-lights-motion.yaml)
* Turn kitchen lights on before it gets dark out based on sunset [automation](https://github.com/brianjking/homeassistant-config/blob/master/automation/kitchen-lifx-sunset.yaml)
* Send push notifications when packages are delivered via USPS, FedEx, or UPS - [automation](https://github.com/brianjking/homeassistant-config/blob/master/automation/announce-deliveries.yaml)
* Turn entryway light on when door is opened and turn it off after several minutes - [automation](https://github.com/brianjking/homeassistant-config/blob/master/automation/front-door-sensor-lighting.yaml)
* Turn on kitchen lights when it's dark inside *(still needs some work)* [automation](https://github.com/brianjking/homeassistant-config/blob/master/automation/cloudy-rainy-lights.yaml)
* Send push notification when there is a new version of Home Assistant released - [automation](https://github.com/brianjking/homeassistant-config/blob/master/automation/notify-new-homeassistant.yaml)
* Send push notification when Home Assistant starts up - [automation](https://github.com/brianjking/homeassistant-config/blob/master/automation/hass-started.yaml)
* Turn kitchen lights off at midnight *(useful for when away on holiday, etc)* - [automation](https://github.com/brianjking/homeassistant-config/blob/master/automation/kitchen-lifx-sunset.yaml)
 


### Preview
![Home Assistant Logo](https://github.com/brianjking/hass-config/blob/master/images/home-assistant.gif "Home Assistant Preview")

#### To-Do

* Check the [issues](https://github.com/brianjking/hass-config/issues) for anything not working properly in my config or that I plan to implement.

#### Getting Help

* [Open an issue](https://github.com/brianjking/hass-config/issues/new)
* [Read My Help Docs](https://github.com/brianjking/hass-config/tree/master/docs)
* [Message @brianjking on Twitter](https://twitter.com/brianjking)
* [Home Assistant Homepage](https://home-assistant.io/)
* [Home Assistant Forums](https://community.home-assistant.io/)
* [Home Assistant Discord Chat](https://discord.gg/c5DvZ4e)
* [Other Featured Home Assistant Configurations](https://home-assistant.io/cookbook/)
* [Home Assistant GitHub Source Repository](https://github.com/home-assistant/home-assistant)
* [Official Home Assistant Demo](https://home-assistant.io/demo/)
