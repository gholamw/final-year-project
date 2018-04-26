#!/bin/bash

NOW=`date +%Y-%m%d-%H:%M`

tdir=tests
mkdir $tdir
#sudo mv port-setup.sh tests
sudo cp port-setup.sh tests
sudo cp run.sh tests
sudo cp kill_unbound.sh tests

if [ ! -d $tdir ]
then
    mkdir $tdir
    if (( $? != 0 ))
    then
        exit "Making dir failed."
        exit 1
    fi
    echo "Wessam made this test dir at $NOW" >>tests/README.md
    if (( $? != 0 ))
    then
        exit "Making $tdir/README.md failed."
        exit 1
    fi
else
    echo "You seem to be configured already - not bothering"
    #exit 0
fi

# check if anyone on the ports we want already

# TODO: check netstat stuff

# read in ports we wanna use and copy to test dir so can be changed
# later
. ./port-setup.sh 
cp port-setup.sh $tdir

# install things we need
sudo apt-get -y update 
sudo apt-get -y upgrade 
sudo apt-get install unbound -y
sudo apt-get install libssl-dev
sudo apt-get install openssl

sudo systemctl stop unbound
sudo systemctl disable unbound
# kill it deader than dead:-)
sudo killall unbound

#pushd tests
cd tests
# generate a key pair

# TODO: fix to not prompt
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj "/C=IE/ST=TCD/L=SCSS/O=TCD/CN=gholamw@tcd.ie" -keyout privateKey.key -out certificate.pem

# Setup to create stub and recursive servers which use TLS 
#######################################################################################

if [ -f stubTLS.conf ]
then
		cp stubTLS.conf stubTLS.conf.bup
fi

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


# Setup to create stub and recursive servers for DNS/QUIC
########################################################################################################


if [ -f stubQUIC.conf ]
then
		cp stubQUIC.conf stubQUIC.conf.bup
fi

cat >stubQUIC.conf <<EOF

# stub.conf for stub server created at $NOW
server:
	do-ip6: no
	interface: $STUBIPQUIC@$STUBPORTQUIC
	access-control: 127.0.0.0/8 allow
	access-control: ::1 allow
	verbosity: 1
	do-not-query-localhost: no
remote-control:
	control-enable: no
forward-zone:
	name: "." 
	forward-addr: $RECIPQUIC@$RECPORTQUIC

EOF

if [ -f recursiveQUIC.conf ]
then
		cp recursiveQUIC.conf recursiveQUIC.conf.bup
fi

NOW=`date +%Y-%m%d-%H:%M`

cat >recursiveQUIC.conf <<EOF

# recursive.conf for recursive server created at $NOW
server:
	do-ip6: no
	do-udp: yes
	interface: $RECIPQUIC@$RECPORTQUIC
	access-control: 127.0.0.0/8 allow
	access-control: ::1 allow
	verbosity: 1
remote-control:
	control-enable: no
forward-zone:
	forward-first: yes
	name: "."
	forward-addr: $CLIENTQUICIP@$CLIENTQUICPORT

EOF

################################################################################################


cd ..
#popd








