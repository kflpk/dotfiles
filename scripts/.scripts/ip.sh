#!/bin/bash

sudo ip r del default via 192.168.11.1
sudo ip r del default via 192.168.12.1
sudo ip r add default via 192.168.11.1 metric 10
sudo ip r add default via 192.168.12.1 metric 100

