#!/bin/bash
apt-get -y update 
apt-get -y upgrade 
apt-get install unbound -y
apt-get install libssl-div
apt-get install openssl
echo Hello World
echo >> stub.conf
echo >> recursive.conf
echo "# stub.conf for stub server" >> stub.conf
echo "server:" >> stub.conf
echo "	do-ip6: no" >> stub.conf
echo "	interface: 127.0.0.4@1253" >> stub.conf
echo "stub server: "
echo "ip address: 127.0.0.4"
echo "port: 1253"
echo "	access-control: 127.0.0.0/8 allow" >> stub.conf
echo "	access-control: ::1 allow" >> stub.conf
echo "	verbosity: 1" >> stub.conf
echo "	do-not-query-localhost: no" >> stub.conf
echo "	tcp-upstream: yes" >> stub.conf
echo "	ssl-upstream: yes" >> stub.conf 
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.pem
#openssl x509 -inform der -in certificate.crt -out certificate.pem
echo "	ssl-service-pem: certificate.pem" >> stub.conf
echo "	ssl-service-key: privateKey.key" >> stub.conf
echo "remote-control:" >> stub.conf
echo "	control-enable: no" >> stub.conf
echo "forward-zone:" >> stub.conf
echo "	name: "." " >> stub.conf
echo "	forward-addr: 127.0.0.5@853" >> stub.conf
echo "# recursive.conf for stub server" >> recursive.conf
echo "server:" >> recursive.conf
echo "	do-ip6: no" >> recursive.conf
echo "	do-udp: yes" >> recursive.conf
echo "	interface: 127.0.0.5@853" >> recursive.conf
echo "	access-control: 127.0.0.0/8 allow" >> recursive.conf
echo "	access-control: ::1 allow" >> recursive.conf
echo "	verbosity: 1" >> recursive.conf
echo "	tcp-upstream: yes" >> recursive.conf
echo "	ssl-service-pem: certificate.pem" >> recursive.conf
echo "	ssl-service-key: privateKey.key" >> recursive.conf
echo "remote-control:" >> recursive.conf
echo "	control-enable: no" >> recursive.conf
echo "forward-zone:" >> recursive.conf
echo "	forward-first: yes" >> recursive.conf
echo "	name: "." " >> recursive.conf
echo "	forward-addr: 134.226.251.100@53" >> recursive.conf
echo "recursive server: "
echo "ip address: 127.0.0.5"
echo "port: 853"
sudo unbound -c stub.conf
sudo unbound -c recursive.conf








