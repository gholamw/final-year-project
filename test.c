#include <alloca.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <sys/types.h>


#include "getopt.h"
//#include <WinSock2.h>
//#include <Windows.h>
#include <assert.h>
//#include <iphlpapi.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
//#include <ws2tcpip.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>

int main(){
	uint8_t buffer_recieve[1325];
	 printf("The program is running\n");
	 struct sockaddr_in address2;
	 struct sockaddr source_address;
	 struct sockaddr_in source_address2;

     address2.sin_family = AF_INET;
     //address2.sin_addr.s_addr = inet_addr("127.0.0.17");
	 address2.sin_port = htons(4449);
     inet_aton("127.0.0.2", &address2.sin_addr.s_addr);
     int len2=20;
     char buffer_addr2[len2];
     inet_ntop(AF_INET, &(address2.sin_addr), buffer_addr2, len2);
     printf("address:%s\n",buffer_addr2);
     int fd2 = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
     if (setsockopt(fd2, SOL_SOCKET, SO_REUSEADDR, &(int){ 1 }, sizeof(int)) < 0)
      error("setsockopt(SO_REUSEADDR) failed");
     printf("Socket result: %d\n", fd2);

     int check_binding = bind(fd2,(struct sockaddr *)&address2,sizeof(address2));
     printf("Binding result: %d\n", check_binding);
     if(check_binding == 0){
       printf("Binding is completed!\n");
     }else{
       printf("Binding is NOT completed\n");
       //printf("Error code: %d\n", errno);
     }

     //while(1){
     	//printf("loop\n");
     //}

     int l = sizeof(source_address);
     socklen_t len = (socklen_t*)&l;

     struct sockaddr_storage sender;
	socklen_t sendsize = sizeof(source_address);

	//struct sockaddr snd = (struct sockaddr*)sender;

    while(1){ 
    	int n = recvfrom(fd2, buffer_recieve, sizeof(buffer_recieve), 0, &source_address, &sendsize);
    	printf("Data recieved: %d\n" , n);
    	struct sockaddr_in *src_addr =  (struct sockaddr_in*)&source_address;
    	int port = src_addr->sin_port;
    	printf("src port: %d\n" , port);
    	int actual_port = ntohs(port);
    	printf("actual src port: %d\n" , actual_port);

    	if(actual_port != 53){
    		struct sockaddr_in addr_to;
	 		//struct sockaddr source_address;
	 		//struct sockaddr_in source_address2;
			addr_to.sin_family = AF_INET;
     		//address2.sin_addr.s_addr = inet_addr("127.0.0.17");
	 		addr_to.sin_port = htons(53);
     		inet_aton("127.0.0.14", &addr_to.sin_addr.s_addr);
     		//buffer_recieve[0] = 0xff;
     		//buffer_recieve[1] = 0xff;
     		//buffer_recieve[2] = 0xff;
     		//buffer_recieve[3] = 0xff;


     		int bytes_sent2 = sendto(fd2, buffer_recieve, sizeof(buffer_recieve), 0,
                 (struct sockaddr*)&addr_to, sizeof(struct sockaddr_in));
                 printf("MY TEST, NUMBER OF BYTES ARE ACTUALLY SENT :");
                 printf("%d\n", bytes_sent2);
    	}else{

    		struct sockaddr_in addr_to;
	 		//struct sockaddr source_address;
	 		//struct sockaddr_in source_address2;
			addr_to.sin_family = AF_INET;
     		//address2.sin_addr.s_addr = inet_addr("127.0.0.17");
	 		addr_to.sin_port = htons(4450);
     		inet_aton("127.0.0.12", &addr_to.sin_addr.s_addr);
     		//buffer_recieve[0] = 0xff;
     		//buffer_recieve[1] = 0xff;
     		//buffer_recieve[2] = 0xff;
     		//buffer_recieve[3] = 0xff;


     		int bytes_sent2 = sendto(fd2, buffer_recieve, sizeof(buffer_recieve), 0,
                 (struct sockaddr*)&addr_to, sizeof(struct sockaddr_in));
                 printf("MY TEST, NUMBER OF BYTES ARE ACTUALLY SENT :");
                 printf("%d\n", bytes_sent2);
    	}
		//ntohs(port)

	}


	return 1;
}