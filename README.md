# porla-mqtt
This is an extension to [`porla`](https://github.com/rise-maritime/porla)

## What

This extension provides several tools for mqtt connectivity

### Built-in functionality

N/A

### 3rd-party tools

* **mqtt-cli**

  See https://github.com/MO-RISE/mqtt-cli

* **mosquitto_sub** and **mosuitto_pub**

  See https://mosquitto.org/man/mosquitto_sub-1.html and https://mosquitto.org/man/mosquitto_pub-1.html

## Usage

### Examples
```yaml
version: '3.8'

services:
    source_1:
        image: ghcr.io/mo-rise/porla-mqtt
        network_mode: host
        restart: always
        command: ["mqtt subscribe -t my/topic | timestamp | to_bus 1"]

    transform_1:
        image: ghcr.io/mo-rise/porla
        network_mode: host
        restart: always
        command: ["from_bus 1 | shuffle '{} {name} {value}' '{value} {name}' | to_bus 3"]

    sink_1:
        image: ghcr.io/mo-rise/porla
        network_mode: host
        restart: always
        command: ["from_bus 3 | mosquitto_pub -t another/topic --stdin-line"]
```
