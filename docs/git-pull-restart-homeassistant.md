# Home Assistant Configuration Version Control Git Workflow

| ![Home Assistant Logo](https://github.com/brianjking/hass-config/blob/master/images/hass.png "Home Assistant Logo") | ![Travis-CI Octocat](http://blog.biicode.com/wp-content/uploads/sites/2/2014/11/logotravis.png "Travis-CI Octocat") | ![OctoCat GitHub Logo](https://github.com/brianjking/hass-config/blob/master/images/github-octocat.png "Octocat GitHub Logo") |
|---------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|

**Thank you to [Tommatheussen's Home Assistant Configuration for the scripts & configuration files](https://github.com/Tommatheussen/Home-Assistant-Configuration).**

## Introduction

The `yaml` configuration files and `shell scripts` for [Home Assistant](https://home-assistant.io) below simplify using [GitHub](https://github.com) to manage your Home Assistant Configurations.

### Assumptions
* Your Home Assistant configuration path is the `/home/homeassistant/.homeassistant/` directory.
* Your Home Assistant configuration files on your Raspberry Pi are in a `git` repository.
* You edit your `yaml` files from another computer, commit them to GitHub and then `git pull` your updates to your Raspberry Pi. 

### YAML & Shell Scripts for Home Assistant

* [Create update_new_commits_sensor.yaml](https://github.com/brianjking/hass-config/blob/master/shell_command/update_new_commits_sensor.yaml)
* [Create update_config_from_github.yaml](https://github.com/brianjking/hass-config/blob/master/shell_command/update_config_from_github.yaml)
* [Create update_config_from_github.sh](https://github.com/brianjking/hass-config/blob/master/bin/update_config_from_github.sh)
* [Create update_new_commits_sensor.sh](https://github.com/brianjking/hass-config/blob/master/bin/update_new_commits_sensor.sh)
* [Create get_latest_config.yaml](https://github.com/brianjking/hass-config/blob/master/script/get_latest_config.yaml)

### Customizations Necessary 

* You may need to adjust the path of the various files based on where your Home Assistant is configured.
* If using the `api_password` in the [http component](https://home-assistant.io/components/http/) you will need to adjust the [update_new_commits_sensor.sh](https://github.com/brianjking/hass-config/blob/master/bin/update_new_commits_sensor.sh) command. **FILE FROM REPOSITORY IS BELOW** 
```bash
#!/bin/bash

cd "/home/homeassistant/.homeassistant"
git fetch
commits="$(git rev-list --count master..origin/master)"

curl -X POST -H "x-ha-access: $1" -H "Content-Type: application/json" http://127.0.0.1:8123/api/states/sensor.new_commits -d "{\"state\": \"$commits\"}"
```

* If using the `api_password` option once you create the `update_new_commits_sensor.sh` on your Raspberry Pi it you should edit the `curl` command accordingly. **Example:**

```bash
curl -X POST -H "x-ha-access: $1" -H "Content-Type: application/json" https://my.domain.com/api/states/sensor.new_commits?api_password=MyPassword -d "{\"state\": \"$commits\"}"
```

### Using The Update From GitHub Service

![Travis-CI Octocat](https://github.com/brianjking/hass-config/blob/master/images/get-from-github.png "Travis-CI Octocat")

* Click the **ACTIVATE** button.
* The [get_latest_config.yaml](https://github.com/brianjking/hass-config/blob/master/script/get_latest_config.yaml) will be executed and complete the following tasks:
```yaml
alias: "Get Latest Config"
sequence:
  - service: shell_command.update_new_commits_sensor
  - condition: numeric_state
    entity_id: sensor.new_commits
    above: 1
  - service: shell_command.update_config_from_github
  - service: homeassistant.restart
 ```
* Checks for new commits, `git pull` new commits from GitHub, restart the Home Assistant service.

#### Questions
* [Message me on Twitter](https://twitter.com/brianjking)
* [Open an issue on GitHub](https://github.com/brianjking/hass-config/issues)

##### Disclaimer
```
THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE. 
```
