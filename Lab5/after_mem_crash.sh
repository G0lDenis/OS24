#!/bin/bash

echo "$(sudo cat /var/log/messages | tail -12 | grep [Kk]ill)"
