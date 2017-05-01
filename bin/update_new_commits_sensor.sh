#!/bin/bash

cd "/home/homeassistant/.homeassistant"
git fetch
commits="$(git rev-list --count master..origin/master)"

curl -X POST -H "x-ha-access: $1" -H "Content-Type: application/json" https://raptorbot.ddns.net/api/states/sensor.new_commits?api_password=DeadParrot! -d "{\"state\": \"$commits\"}"
