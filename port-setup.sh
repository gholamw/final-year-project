#!/bin/bash

# the ports we wanna use

## setup IPs/ports
# stub and recursive servers to run TLS
STUBIPTLS=127.0.0.4
RECIPTLS=127.0.0.5
#stub port
STUBPORT=1253
# needs to be 853 to trigger unbound use of DPRIVE
RECPORTTLS=853
# to listen on port 1453 
RECPORT=1453
# need to forward queries to tcd server on port 53
TCDIP=134.226.251.100
TCDPORT=53
# stub and recusrive Ips to run without encryption
STUBIP=127.0.0.6
RECIP=127.0.0.7

# flag for consumer to check
PORTSETUPDONE="y"