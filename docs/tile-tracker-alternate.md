# Tile Tracker

[Tile Tracker Alternate](https://github.com/brianjking/homeassistant-config/blob/master/images/tile-tracker-alternate.png "Tile Tracker Alternate")

* https://community.home-assistant.io/t/bluetooth-presence-detection-without-raspberry-pi-3/35558/4?u=brianjking

* https://github.com/brianjking/homeassistant-config/issues/163

### How to obtain Tile Trackers MAC Addresses

`sudo stdbuf -oL hcitool lescan | grep Tile`

https://github.com/brianjking/homeassistant-config/blob/master/sensor/rest.yaml

```yaml
- platform: rest
  name: KinnaTile
  resource: http://0.0.0.0:5000/api/search/c8:31:53:38:c9:f1

- platform: rest
  name: BrianBagTile
  resource: http://0.0.0.0:5000/api/search/d5:a8:5b:68:b3:92

- platform: rest
  name: BrianKeysTile
  resource: http://0.0.0.0:5000/api/search/d3:a5:72:80:83:6a 

- platform: rest
  name: SpareKeysTile
  resource: http://0.0.0.0:5000/api/search/d7:57:d9:9d:8c:b4 

```

https://github.com/brianjking/homeassistant-config/blob/master/binary_sensor/tile-template.yaml

```yaml
- platform: template
  sensors:
      kinna_tile_boolean:
        friendly_name: "Kinna"
        value_template: "{{ states.sensor.kinnatile.state == 'true' }}"

- platform: template
  sensors:
      brian_keys_tile_boolean:
        friendly_name: "Brian"
        value_template: "{{ states.sensor.briankeystile.state == 'true' }}"

- platform: template
  sensors:
      brian_bag_tile_boolean:
        friendly_name: "Brian Bag Tile"
        value_template: "{{ states.sensor.brianbagtile.state == 'true' }}"

- platform: template
  sensors:
      spare_keys_tile_boolean:
        friendly_name: "Spare Keys Tile"
        value_template: "{{ states.sensor.sparekeystile.state == 'true' }}"
```
