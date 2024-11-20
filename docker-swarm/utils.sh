#!/bin/bash

# Color Text output
red=$(tput setaf 9)
green=$(tput setaf 10)
yellow=$(tput setaf 11)
blue=$(tput setaf 12)
grey=$(tput setaf 8)
normal=$(tput setaf 7)

function print_noti_line() {
  printf -- '=%.0s' {1..50}
  printf "\n"
}

# Function Test Available HostName by using Ping
function try_ping() {
  hostname=$1
  result_test=failed
  color=$red
  printf "${grey}"
  ping -c 4 -t 1 $hostname \
    && result_test=SUCCESS \
    && color=$green \
    || result_test=FAILED
  printf "${color}"
  print_noti_line
  printf "\tResult of Ping to $hostname: $result_test\n"
  print_noti_line
  printf "${normal}"
}

# Get IP from hostname
function get_ip_from_hostname() {
  hostname=$1
  dig +short $hostname | awk 'NR==1{print $1}'
}