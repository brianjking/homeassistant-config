![Travis-CI Octocat](http://blog.biicode.com/wp-content/uploads/sites/2/2014/11/logotravis.png "Travis-CI Octocat")

# Travis-CI Documentation

[Travis-CI](https://travis-ci.org) is used for continuous integration testing to ensure the contents of this repository are valid with the most recent [Home Assistant](https://home-assistant.io) release.

## Checking The Build 

* [Visit Travis-CI](https://travis-ci.org/brianjking/hass-config) or view the build badge:
[![Build Status](https://travis-ci.org/brianjking/homeassistant-config.svg?branch=master)](https://travis-ci.org/brianjking/homeassistant-config)

### How does it work?

* [Travis-CI](https://travis-ci.org) webhook of new commits to [this repo](https://github.com/brianjking/hass-config/).
* Travis-CI runs the tests outlined in the `.travis.yml` [file](https://github.com/brianjking/hass-config/blob/master/.travis.yml):
````yaml
language: python
python:
  - "3.4"
install:
  - pip3 install homeassistant
script:
  - hass -c . --script check_config
before_install:
  - mv travis_secrets.yaml secrets.yaml
````
* Because this is a public GitHub Repository my `secrets.yaml` file is not available. In order to circumvent this this repository has a file named `travis_secrets.yaml` see [here](https://github.com/brianjking/hass-config/blob/master/travis_secrets.yaml) to allow the tests to complete.

#### Was It Successful?

* If a build is successful Travis-CI will report the following:
````
The command "hass -c . --script check_config" exited with 0.
Done. Your build exited with 0.
````
* If there are issues you will see something like this in your Travis-CI Build log:
````
The command "hass -c . --script check_config" exited with 1.
Done. Your build exited with 1.
````
