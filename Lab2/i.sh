#!/bin/bash

ps a -u centos | wc -l

ps au -u centos| awk '{printf("%s:%s\n",$1,$2)}'
