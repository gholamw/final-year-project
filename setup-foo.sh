#!/bin/bash
apt-get -y update 
apt-get -y upgrade 
apt-get install unbound -y
apt-get install libssl-div
apt-get install openssl
#echo Hello World


if [ -f stub.conf ]
then
		cp stub.conf stub.conf.bup
fi

NOW=`date +%Y%m%d-%H%M`

cat >stub.conf <<EOF

# stub.conf for stub server created at $NOW
server:
	do-ip6: no
	interface: 127.0.0.4@1253
stub server:
	ip address: 127.0.0.4
port: 1253"
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
	forward-addr: 127.0.0.5@853

EOF

openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.pem
#openssl x509 -inform der -in certificate.crt -out certificate.pem

echo >> recursive.conf
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








