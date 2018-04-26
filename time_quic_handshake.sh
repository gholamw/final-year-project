#!/bin/bash


#if [ ! -f quic_timing.txt ]; then
   # echo "File not found!"
    ##cat > quic_timings.txt
  #  touch quic_timing.txt
 #   echo "0">>quic_timing.txt
#fi


##################################################

##########################$

#for i in 1 2 3 4 5 6 7 8 9 10
#do	
 #echo "Looping ... number $i"
 #python start_timing.py
#cd picoquic
 #./picoquicdemo -t time -p 4433  & ./picoquicdemo -t time localhost 4433 &
 #wait -n
 #pkill -P $$
 #killall picoquicdemo
#cd ..
 #python end_timing.py
#done

 #python time_quic_avergare.py

cd picoquic
sh time_quic.sh
cd ..

###################################$


 #./picoquicdemo -p 4433  & ./picoquicdemo localhost 4433 &
 #wait -n
 #pkill -P $$
 #killall picoquicdemo

 #python start_dns_query_timing.py
 #dig @$127.0.0.6 -p 53 www.irishrail.ie
 #python end_dns_query_timing.py




###################################################

#python start_timing.py
 #./picoquicdemo -t time -p 4433  & ./picoquicdemo -t time localhost 4433 &
#wait -n
#pkill -P $$
#python end_timing.py


#xterm -hold ls
#./picoquicdemo -t time -p 4433  

#./picoquicdemo -t time1 -p 4433  &  PIDIOS=$! &
#./picoquicdemo -t time1 localhost 4433 &  PIDMIX=$! &
#wait $PIDMIX
#killall picoquicdemo
#wait $PIDIOS



#./picoquicdemo -t time1 localhost 4433
#./picoquicdemo -t time1 -p 4433 
#./picoquicdemo -t time -p 4433  
#./picoquicdemo -t time localhost 4433 

#wait $(jobs -p)

#while [ `pgrep job*` ]
#    do 
#    echo 'waiting'
#    ./picoquicdemo -t time -p 4433  
#3	./picoquicdemo -t time localhost 4433 
#    done
