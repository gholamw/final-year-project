# final-year-project
DNS/TLS and DNS/QUIC project

Description: 
Running the following commands will run both stub and recursive servers at 127.0.0.4@1253 and 127.0.0.5@853 respectively. All queries will be forwarded from stub to recusrive server using TLS and then forward queries to TCD server(134.226.251.100@53) to get response. For now this is DNS/TLS, DNS/QUIC will be implemented later.  



Run The Following Commands: 
1: sudo sh setup.sh (this install necessary libraries, creates .conf files and run the servers)
2: sudo sh queries.sh (this make queries)

