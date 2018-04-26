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


static void hexdump(const char *title, const uint8_t *p, size_t l)
{
    fprintf(stderr, "%s (%zu bytes):\n", title, l);

    while (l != 0) {
        int i;
        fputs("   ", stderr);
        for (i = 0; i < 16; ++i) {
            fprintf(stderr, " %02x", *p++);
            if (--l == 0)
                break;
        }
        fputc('\n', stderr);
    }
}


int main(){

    printf("TEST\n");

}










    /*
    int p = 4433;
    int phtons = htons(p);
    printf("%d\n" , phtons);
    int pntons = ntohs(phtons);
    printf("%d\n" , pntons);
    //printf("%d\n" , ntohl(42049));

    struct sockaddr_in myaddr;
    myaddr.sin_family = AF_INET;
    //myaddr.sin_port = htons(1453);
    myaddr.sin_port = htons(53);
    inet_aton("127.0.0.7", &myaddr.sin_addr.s_addr);
    int send_length = 450;
    //SOCKET_TYPE fd = INVALID_SOCKET;
    struct sockaddr_in address;
    address.sin_family = AF_INET;
    //address.sin_addr.s_addr = INADDR_ANY;
    //address.sin_addr.s_addr = inet_addr("127.0.0.1");
    address.sin_port = htons(4488);
    inet_aton("127.0.0.2", &address.sin_addr.s_addr);
    int len=20;
    char buffer_addr[len];
    inet_ntop(AF_INET, &(address.sin_addr), buffer_addr, len);
    printf("address:%s\n",buffer_addr);
    int fd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    bind(fd,(struct sockaddr *)&address,sizeof(address));
    listen(fd,32);
    printf("FUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUK\n");
    printf("%d\n" , ntohs(address.sin_port));
    //int recieve_port = print_address((struct sockaddr*)&address, "CHeck from:",
    //picoquic_get_initial_cnxid(cnx_server));
    //printf("%c\n", address.sin_addr);
    //printf("%d\n", address.sin_port);
    uint8_t buffer_recieve[1536];
    int data_size, saddr_size;
    int send_allow =0;
    while(1){
        printf("Entered while loop \n");
        saddr_size = sizeof (struct sockaddr_in);
        printf("Just before recieving\n");
        //setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, (char*) &timeout, sizeof(timeout));

        int n = recvfrom(fd, buffer_recieve, sizeof(buffer_recieve), 0, NULL, NULL);
        printf("Data recieved : %d\n", n);
        //printf("Daaaata : %d\n",recvfrom(fd , &buffer_recieve , sizeof(buffer_recieve) , 0 ,(struct sockaddr *) &address , (socklen_t*)&saddr_size));
        //data_size = recvfrom(fd , buffer_recieve , sizeof(buffer_recieve) , 0 ,(struct sockaddr *) &address , (socklen_t*)&saddr_size);
        //printf("Data %d\n", data_size);
        data_size=0;
        if(n <=0 ){
            printf("Recvfrom error , failed to get packets\n");
            //return 1;
        }else{
            printf("Received %d bytes\n",data_size);
            hexdump("Data: ", buffer_recieve, sizeof(buffer_recieve));

            uint8_t buffer_to_send[1536];
            char* send_send = (char*)buffer_recieve;
            //printf("THE DNS QUERY: %c\n", buffer);
            int bytes_sent = sendto(fd, send_send, sizeof(buffer_recieve), 0,
                (struct sockaddr*)&myaddr, sizeof(struct sockaddr_in));
            printf("NUMBER OF BYTES ARE ACTUALLY SENT :");
            printf("%d\n", bytes_sent);

            //send_allow = 1;
        }

        if(send_allow == 1){
            uint8_t buffer2[1536];
            buffer2[0] = 0x57;
            buffer2[1] = 0x65;
            buffer2[2] = 0x73;
            buffer2[3] = 0x73;
            buffer2[4] = 0x61;
            buffer2[5] = 0x6d;
            buffer2[6] = 0xff;
            buffer2[7] = 0xff;
            uint8_t buffer_to_send[1536];
            char* send_send = (char*)buffer_recieve;
            //printf("THE DNS QUERY: %c\n", buffer);
            int bytes_sent = sendto(fd, send_send, sizeof(buffer_recieve), 0,
                (struct sockaddr*)&myaddr, sizeof(struct sockaddr_in));
            printf("NUMBER OF BYTES ARE ACTUALLY SENT :");
            printf("%d\n", bytes_sent);
            send_allow = 0;
        }
    }

    */
