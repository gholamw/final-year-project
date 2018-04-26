#!/bin/bash

sudo unbound -c stubTLS.conf
sudo unbound -c recursiveTLS.conf
sudo unbound -c stub.conf
sudo unbound -c recursive.conf
sudo unbound -c stubQUIC.conf
sudo unbound -c recursiveQUIC.conf
