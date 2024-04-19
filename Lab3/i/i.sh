#!/bin/bash

mkdir "/home/test" >/dev/null 2>&1 && (echo "catalog test was created successfully" > ~/report && touch "home/test/%d_%t")

ping -c 1 "www.net_nikogo.ru" >/dev/null 2>&1 || echo "$(printf "%(%Y-%m-%d_%H:%M)T") Can't open site" >>  ~/report
