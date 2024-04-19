#!/bin/bash

./i.sh

at now+2minutes -f ./i.sh

tail -n 0 -f ~/report
