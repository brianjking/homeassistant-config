# Graph Your Configuration

Thank you to [happyleavesaoc](https://github.com/happyleavesaoc/home-assistant-graph) for building this amazing addition to [Home Assistant](https://home-assistant.io).

![Graphing Your Configuration](https://cloud.githubusercontent.com/assets/6786817/24590036/d69cbb3a-17aa-11e7-852a-3181f3776fa5.png "Graphing Your Configuration") 


## Demo
* Check out [happyleavesaoc's Home Assistant Graph Demo](https://happyleavesaoc.github.io/hagraph.html).

## Getting Started

* Visit the [Home Assistant Forum Post](https://community.home-assistant.io/t/graph-your-configuration/11092?u=brianjking).
* Install `graphviz`
	* `sudo apt-get install graphviz graphviz-dev`
* Install `hagraph`
	* `pip install hagraph` 
	* Since I'm using the All-in-One installer which uses a `virtualenv` I opted to install this inside of my `virtualenv` (however, I'm not certain if this is required.)
* Running `hagraph` as a standalone (outside of Home Assistant)
	* `python3 -m hagraph -i <path/to/configuration.yaml> -o <path/to/output.[dot/png/jpg/svg/etc]>`

### Implementing HA Graph in Home Assistant

* This can be placed in your `configuration.yaml` or split into separate `yaml` files based on however you [split up your configuration files](https://home-assistant.io/docs/configuration/splitting_configuration/).
	* I personally have mine split into [configuration.yaml](https://github.com/brianjking/hass-config/blob/master/configuration.yaml) for my `panel_iframe` and `shell_command` entities and [automation.yaml](https://github.com/brianjking/hass-config/blob/master/automation.yaml) for my `automation` entries at the time of this writing.

```yaml
panel_iframe:
  graph:
    title: Graph
    icon: mdi:vector-polyline
    url: "https://your.hass/local/graph.html"

shell_command:
  generate_graph: "python3 -m hagraph -i <path/to/configuration.yaml> -o <path/to/www/>graph.svg"

automation:
  - alias: Generate graph
    trigger:
      platform: homeassistant
      event: start
    action:
      - service: shell_command.generate_graph
 ```

 In your `<Home Assistant configuration directory>/www`:
```html
<html>
<script src="/local/svg-pan-zoom.min.js"></script>
<head>
        <meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="pragma" content="no-cache" />
        <style>
                body { margin: 0; padding: 0; }
        </style>
</head>
<body>
<object id="graph" data="/local/graph.svg" type="image/svg+xml" style="width: 100%; height: 100%; background-color: #E5E5E5">
</object>
    <script>
      window.onload = function() {
        svgPanZoom('#graph', {
          controlIconsEnabled: false,
          zoomScaleSensitivity: 0.7,
          minZoom: 1
        });
      };
    </script>
</body>
</html>
```

* *NOTE: Be sure to get [svg-pan-zoom.min.js](https://github.com/ariutta/svg-pan-zoom) as well. Instructions are below.*

* From your `/home/homeassistant/.homeassistant/www` directory the easiest way to download the `svg-pan-zoom.min.js` file is to use `wget`.
	* `wget http://ariutta.github.io/svg-pan-zoom/dist/svg-pan-zoom.min.js`

### Getting Help with Graphing Your Configuration

* If you're having trouble with using the Graph Your Configuration you can check the following links:
	* [Graph your configuration forum post](https://community.home-assistant.io/t/graph-your-configuration/11092?u=brianjking)
	* [Open an issue on happyleaveaoc's home-assistant-graph repository](https://github.com/happyleavesaoc/home-assistant-graph).
	* Check [my configuration.yaml](https://github.com/brianjking/hass-config/blob/master/configuration.yaml) and [automation.yaml](https://github.com/brianjking/hass-config/blob/master/automation.yaml).



