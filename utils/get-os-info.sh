#!/bin/bash

##############################
# --- Get CPU Core ---
# --- Get Architecture ---
##############################
cpu_cores=$(lscpu | grep "CPU(s):" | awk '{print $2}')
os_arch=$(lscpu | grep "Architecture:" | awk '{print $2}')

#############################
# --- Print Documentation ---
#############################
echo "#######################################"
echo "-- CPU_CORES:    = $cpu_cores"
echo "-- Architecture: = $os_arch"
echo "#######################################"