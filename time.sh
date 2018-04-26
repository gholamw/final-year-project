#!/bin/bash

#./picoquicdemo -t time -p 4433
#sh time_quic_client.sh

./picoquicdemo -t time -p 4433 &
P1=$!
./picoquicdemo -t time localhost 4433 &
P2=$!
wait $P1 $P2  

