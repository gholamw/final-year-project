 #!/bin/bash

 
 python start_dns_query_timing.py
 dig @127.0.0.6 -p 53 www.irishrail.ie
 python end_dns_query_timing.py
