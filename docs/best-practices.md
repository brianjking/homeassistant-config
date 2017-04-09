# Configuration Best Pratices

## Acknowledgements

This document is a collection of best practices, tips, and other guidance. 

* [happyleavesaoc](https://github.com/happyleavesaoc/my-home-automation/blob/master/README.md)
* 


### More than one entity

Always use a YAML list when you have multiple entries (Style #1 from the documentation).

Yes:
```yaml
sensor:
- platform: mqtt
- platform: forecastio
```

No:
``` yaml
sensor:
  platform: mqtt
  
sensor 2:
  platform: forecastio
```

### When to use `!env_var`

* Private data.
* Constants.

### Namespaces

Use them. Prevents conflicts once you have many sensors, disambiguates generic names, and lends context when referenced. Some components have hardcoded namespacing - don't double up.

### Automations

* Always provide an override switch, use as a condition.
* Inline scripts as actions, unless the script is used in multiple automations.

### Scripts

* Hide scripts that shouldn't be manually triggered.

### Scenes

* Hide scenes that shouldn't be manually triggered.

### Customizations

The interface should be intuitive to encourage use and reduce the learning curve.

* Always set a relevant icon if available (https://materialdesignicons.com/).
* Always set a friendly, descriptive name if the default is insufficient (vague, awkward, computer-generated, etc).

### Includes

Includes help organize configurations. Do not place all configuration in `configuration.yaml`. Split configuration sections to their own files as they grow. Consider splitting up any section that you cannot view without scrolling your editor.

The way I use this repo is in the following steps:

1. Create a change in 1 or multiple files (through browser or other), on a seperate branch (master is protected).
2. Create a PR against master with the changes.
3. Travis runs on the PR branch, checking wether the config is correct. Travis installs HA and runs the command `hass --script check_config` for this.
4. After Travis builds successfully (and I've done all changes), I'll merge the PR (squashing the commits in my case, to keep the master branch commits cleaner).
5. On my HA instance I click my update button (which pulls new commits from master, and calls the service to restart HA).
6. Profit!

