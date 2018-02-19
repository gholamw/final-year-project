# final-year-project
DNS/TLS and DNS/QUIC project

# Note
Different conf files for plain DNS and DNS/TLS had to be generated, becuase plain DNS has different configuration than DNS/TLS 

# Description: 
The repo has the following files:  
1. setup.sh  (configure and create conf files for stub and recursive)
2. run.sh        (run unbound servers)
3. kill.sh       (kills all unbound servers)
4. queries.sh    (has queries that are sent to both stub and recursive servers which run plain DNS)
5. tlsQueries.sh (has queries that are sent to both stub and recursive servers which run DNS/TLS)



Running the sudo sh setup.sh" command will create conf fils for 2 stub servers and 2 recursive servers. The following files will be generated: 
1. stubTLS.conf
2. recursiveTLS.conf
3. stub.conf
4. recursive.conf


# Run the following command: 
1. sudo sh setup.sh 
2. sudo sh run.sh
3. Now run 3.1 or 3.2 command depending if you want plain DNS or DNS/TLS respectively

# 3.1 Send qeueries for plain DNS
stub.conf and recursive.conf are created to run servers which send queries with plain DNS (no encryption), and queries.sh is to dig dns records
Run the folllwoing command:

1. sh queries.sh 

# 3.2 Send qeueries over TLS 
stubTLS.conf and recursiveTLS.conf are created to run servers which send queries over TLS, and tlsQueries.sh is to dig dns records over tls. Run the folllwoing command: 

1. sh tlsQueries.sh




