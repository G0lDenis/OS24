#!/bin/bash

MANWIDTH=160 man bash | grep -so '[[:alpha:]]\{4,\}' | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -r -n | head -3
