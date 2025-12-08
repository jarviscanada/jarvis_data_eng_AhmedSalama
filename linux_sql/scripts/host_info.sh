#!/bin/bash

if [ "$#" -ne 5 ]; then
    echo "Usage: $0 psql_host psql_port db_name psql_user psql_password"
    exit 1
fi

psql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5

hostname=$(hostname -f)
cpu_number=$(lscpu | awk -F: '/^CPU\(s\)/ {print $2}' | xargs)
cpu_architecture=$(lscpu | awk -F: '/^Architecture/ {print $2}' | xargs)
cpu_model=$(lscpu | awk -F: '/^Model name/ {print $2}' | xargs)
cpu_mhz=$(lscpu | awk -F: '/^Model name/ {print $2}' | tr -d '\r\n' | xargs | awk -F'@' '{gsub(/[^0-9.]/,"",$2); printf "%.0f\n", $2*1000}')
l2_cache=$(lscpu | awk -F: '/^L2 cache/ {print $2}' | xargs | sed 's/[^0-9]*//g')
total_mem=$(awk '/MemTotal/ {print int($2/1024)}' /proc/meminfo)
timestamp=$(date -u +"%Y-%m-%d %H:%M:%S")

insert_stmt="INSERT INTO host_info (
    hostname, cpu_number, cpu_architecture, cpu_model, cpu_mhz, l2_cache, total_mem, \"timestamp\"
) VALUES (
    '$hostname', '$cpu_number', '$cpu_architecture', '$cpu_model', '$cpu_mhz', '$l2_cache', '$total_mem', '$timestamp'
);"

export PGPASSWORD=$psql_password

psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "$insert_stmt"

exit $?