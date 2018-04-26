 #!/bin/bash

. ./port-setup.sh 
#gnome-terminal -x bash -c "./picoquicdemo -p 4433 ; exec $SHELL"
#gnome-terminal -x bash -c "./picoquicdemo localhost 4433 ; exec $SHELL"
cd picoquic
#cd
#cd Desktop
#cd my_fyp
#cd picoquic
./picoquicdemo -p 4433 &
./picoquicdemo localhost 4433 &
#cd ..
 python start_dns_query_timing.py
 dig @$CLIENTQUICIP -p $CLIENTQUICPORT -b 127.0.0.1#4449 www.anpost.ie
 python end_dns_query_timing.py www.anpost.ie

sudo killall picoquicdemo



#./picoquicdemo -p 4433 &
#./picoquicdemo localhost 4433 &
#cd ..
 #python start_dns_query_timing.py
 #dig @$CLIENTQUICIP -p $CLIENTQUICPORT -b 127.0.0.1#4449 www.google.com
 #python end_dns_query_timing.py www.google.com

#sudo killall picoquicdemo



#./picoquicdemo -p 4433 &
#./picoquicdemo localhost 4433 &
#cd ..
 #python start_dns_query_timing.py
 #dig @$CLIENTQUICIP -p $CLIENTQUICPORT -b 127.0.0.1#4449 www.gov.ie
 #python end_dns_query_timing.py www.gov.ie

#sudo killall picoquicdemo

#./picoquicdemo -p 4433 &
#./picoquicdemo localhost 4433 &
#cd ..
 #python start_dns_query_timing.py
 #dig @$CLIENTQUICIP -p $CLIENTQUICPORT -b 127.0.0.1#4449 www.dublinbus.ie
 #python end_dns_query_timing.py www.dublinbus.ie

#sudo killall picoquicdemo
#cd ..
