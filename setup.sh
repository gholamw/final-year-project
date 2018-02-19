#!/bin/bash
apt-get -y update 
apt-get -y upgrade 
apt-get install unbound -y
apt-get install libssl-div
apt-get install openssl
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.pem



## setup IPs/ports
# stub and recursive servers to run TLS
STUBIPTLS=127.0.0.4
RECIPTLS=127.0.0.5
#stub port
STUBPORT=1253
# needs to be 853 to trigger unbound use of DPRIVE
RECPORTTLS=853
# to listen on port 53 
RECPORT=53
# need to forward queries to tcd server on port 53
TCDIP=134.226.251.100
TCDPORT=53
# stub and recusrive Ips to run without encryption
STUBIP=127.0.0.6
RECIP=127.0.0.7

# Setup to create stub and recursive servers which use TLS 
#######################################################################################

if [ -f stubTLS.conf ]
then
		cp stubTLS.conf stubTLS.conf.bup
fi

NOW=`date +%Y-%m%d-%H:%M`

cat >stubTLS.conf <<EOF

# stub.conf for stub server uses TLS created at $NOW
server:
	do-ip6: no
	interface: $STUBIPTLS@$STUBPORT
	access-control: 127.0.0.0/8 allow
	access-control: ::1 allow
	verbosity: 1
	do-not-query-localhost: no
	tcp-upstream: yes
	ssl-upstream: yes 
	ssl-service-pem: certificate.pem
	# this is weird - stub sholdn't need private key
	ssl-service-key: privateKey.key
remote-control:
	control-enable: no
forward-zone:
	name: "." 
	forward-addr: $RECIPTLS@$RECPORTTLS

EOF

if [ -f recursiveTLS.conf ]
then
		cp recursiveTLS.conf recursiveTLS.conf.bup
fi

NOW=`date +%Y-%m%d-%H:%M`

cat >recursiveTLS.conf <<EOF

# recursive.conf for recursive server uses TLS created at $NOW
server:
	do-ip6: no
	do-udp: yes
	interface: $RECIPTLS@$RECPORTTLS
	access-control: 127.0.0.0/8 allow
	access-control: ::1 allow
	verbosity: 1
	tcp-upstream: yes
	ssl-service-pem: certificate.pem
	ssl-service-key: privateKey.key
remote-control:
	control-enable: no
forward-zone:
	forward-first: yes
	name: "."
	forward-addr: $TCDIP@$TCDPORT

EOF



########################################################################################################


# Setup to create stub and recursive servers with no encryption
########################################################################################################


if [ -f stub.conf ]
then
		cp stub.conf stub.conf.bup
fi

NOW=`date +%Y-%m%d-%H:%M`

cat >stub.conf <<EOF

# stub.conf for stub server created at $NOW
server:
	do-ip6: no
	interface: $STUBIP@$STUBPORT
	access-control: 127.0.0.0/8 allow
	access-control: ::1 allow
	verbosity: 1
	do-not-query-localhost: no
remote-control:
	control-enable: no
forward-zone:
	name: "." 
	forward-addr: $RECIP@$RECPORT

EOF

if [ -f recursive.conf ]
then
		cp recursive.conf recursive.conf.bup
fi

NOW=`date +%Y-%m%d-%H:%M`

cat >recursive.conf <<EOF

# recursive.conf for recursive server created at $NOW
server:
	do-ip6: no
	do-udp: yes
	interface: $RECIP@$RECPORT
	access-control: 127.0.0.0/8 allow
	access-control: ::1 allow
	verbosity: 1
remote-control:
	control-enable: no
forward-zone:
	forward-first: yes
	name: "."
	forward-addr: $TCDIP@$TCDPORT

EOF

################################################################################################









