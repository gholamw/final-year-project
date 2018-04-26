#include "getopt.h"
//#include <WinSock2.h>
//#include <Windows.h>
#include <assert.h>
//#include <iphlpapi.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
//#include <ws2tcpip.h>
#include <sys/types.h>
#include <netinet/in.h>
int fd = -1;


int main(int argc, char** argv){
  int listenn = 1;

  while(listenn){

    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    //address.sin_addr.s_addr = INADDR_ANY;
    server_address.sin_addr.s_addr = inet_addr("127.0.0.7");
    //Port defined Here:
    server_address.sin_port=htons(1453);
    //if (ret == 0) {
        //fd = socket(server_address.ss_family, SOCK_DGRAM, IPPROTO_UDP);
        fd = socket(server_address.sin_family, SOCK_DGRAM, IPPROTO_UDP);
        struct sockaddr_in address;
        address.sin_family = AF_INET;
        //address.sin_addr.s_addr = INADDR_ANY;
        address.sin_addr.s_addr = inet_addr("127.0.0.1");
        //Port defined Here:
        address.sin_port=htons(4499);
        //address.sin_port=4449;

        //Bind
        bind(fd,(struct sockaddr *)&address,sizeof(address));
        listen(fd,32);
        //if (fd == INVALID_SOCKET) {
        //    ret = -1;
        //}
    //}
    //printf("Listening!!");
  }
}
