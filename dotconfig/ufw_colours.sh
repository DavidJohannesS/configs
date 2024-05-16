#!/bin/bash
tail -f /var/log/ufw.log | awk '
  /SRC=/ {gsub(/SRC=[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/, "\033[34m&\033[39m")}
  /DST=/ {gsub(/DST=[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/, "\033[36m&\033[39m")}
  /UFW BLOCK/ {print "\033[31m" $0 "\033[39m"; next}
  /UFW ALLOW/ {print "\033[32m" $0 "\033[39m"; next}
  {print}
'

