#!/bin/bash
export OPENSSL_ENGINES=/home/n869p538/ktls_client_server/openssl/openssl/lib/engines-1.1
export LD_LIBRARY_PATH=/home/n869p538/ktls_client_server/openssl/openssl/lib:/home/n869p538/crypto_mb/2020u3/lib:/home/n869p538/intel-ipsec-mb/lib
export LD_LIBRARY_PATH=/home/n869p538/ktls_client_server/openssl/openssl/lib:/home/n869p538/crypto_mb/2020u3/lib:/home/n869p538/intel-ipsec-mb/lib
if [ "${1}" = "tcpw" ]; then 
	taskset 0x2000000000 ./src/iperf -c 192.168.1.1 -t 60 -i 5 -y C > tcp_througput.csv
elif [ "${1}" = "tlsq" ]; then
	taskset 0x2000000000 ./src/iperf --tls=qat -c 192.168.1.1 -t 60 -i 5 -y C > tls_offload_throughput.csv
elif [ "${1}" = "tls" ]; then
	taskset 0x2000000000 ./src/iperf --tls=v1.2 -c 192.168.1.1 -t 60 -i 5 -y C > tls_default_throughput.csv
fi
