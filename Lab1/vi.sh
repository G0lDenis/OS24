#!/bin/bash

sudo grep -E "\(II\)" /var/log/anaconda/X.log | sed -E "s/\(II\)/Warning:/" > full.log
sudo grep -E "\(WW\)" /var/log/anaconda/X.log | sed -E "s/\(WW\)/Information:/" >> full.log

cat full.log
