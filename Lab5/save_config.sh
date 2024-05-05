#!/bin/bash

echo "Full RAM size (KB): $(free | sed -n '2p' | cut -d' ' -f9)" > conf.log 
echo "Full swap size (KB): $(free | tail -1 | cut -d' ' -f8)" >> conf.log
echo "Page size: $(getconf PAGE_SIZE)" >> conf.log
echo "Free RAM size (KB): $(free | sed -n '2p' | cut -d' ' -f15)" >> conf.log
echo "Free swap size (KB): $(free | tail -1 | cut -d' ' -f15)" >> conf.log

