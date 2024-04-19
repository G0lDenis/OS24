#!/bin/bash

touch info.log

sudo grep -E "INFO" /var/log/anaconda/syslog > info.log
