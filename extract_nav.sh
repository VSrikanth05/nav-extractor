#!/bin/bash

# Download the NAVAll.txt file
curl -s https://www.amfiindia.com/spages/NAVAll.txt -o NAVAll.txt

# Extract Scheme Name and Asset Value, save as TSV
awk -F';' 'NF>=6 && $1 !~ /Scheme Code/ {print $4 "\t" $6}' NAVAll.txt > nav_data.tsv

# Clean up
rm NAVAll.txt
