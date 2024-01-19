#!/bin/bash

# Instruction of Using this Bash shell
# bash ./init-swarm.sh

# Begin Block Code
abs_filepath=$(readlink -f $0)
abs_dirpath=$(dirname $abs_filepath)
source $abs_dirpath/swarm-config.sh
source $abs_dirpath/utils.sh

function step01() {
  printf "${blue}"
  print_noti_line
  printf "\t STEP-1: CHECK NETWORK SERVERS \n"
  print_noti_line
  printf "${normal}"
  # Begin Block Code
  for hostname in "${hostnames[@]}"
  do 
    result_step1=FAILED
    try_ping $hostname \
      && result_step1=SUCCESS \
      || result_step1=FAILED
  done;
  # End Block Code
  printf "${blue}"
  print_noti_line
  printf "=> STEP-1: CHECK NETWORK SERVERS => $result_step1 \n"
  print_noti_line
  printf "${normal}"
}

function step02() {
  printf "${blue}"
  print_noti_line
  printf "\t STEP-2: CREATE SWARM \n"
  print_noti_line
  printf "${grey}"
  # Begin Block Code
  manager_ip=$(get_ip_from_hostname $manager_hostname)
  docker swarm init --advertise-addr $manager_ip
  swarm_join_command=$(docker swarm join-token worker | grep "docker swarm join --token")
  for hostname in "${hostnames[@]}"
  do
    if [[ $hostname != $manager_hostname ]]; then
      ssh $hostname "$swarm_join_command"
    fi;
  done
  # End Block Code
  printf "${blue}"
  print_noti_line
  printf "\t STEP-2: CREATE SWARM => $result_step2 \n"
  print_noti_line
  docker node ls 
  printf "${normal}"
  
}

function main() {
  step01
  step02
}
# End Block Code

main