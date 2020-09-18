#include <p32xxxx.h>
#include <plib.h>

//define devices and address on last page in memory

#ifdef __32MX250F128B_H
//page size is 1KB row size is 128 bytes
//mem start at 0x1D000000 and ends at 0x1D01FFFF last page start at 0x1D01FC00
#define NVM_START_ADD 0x1D01FC00
#define NVM_PAGE_SIZE 1024
#elif defined __32MX270F256B_H
#define NVM_START_ADD 0x1D03FC00
#define NVM_PAGE_SIZE 1024
#elif defined  (__32MX440F512H_H) ||  defined (__32MX470F512H) 
//page size is 1KB row size is 128 bytes
//mem start at 0x1D000000 and ends at 0x1D07FFFF last page start at 0x1D07FC00
#define NVM_START_ADD 0x1D07FC00
#define NVM_PAGE_SIZE 1024
#elif defined  (__32MX460F256L_H)
#define NVM_START_ADD 0x1D02FC00
#define NVM_PAGE_SIZE 1024
#elif defined  (__32MX795F512L_H)
#define NVM_START_ADD 0x1D07F000 
#define NVM_PAGE_SIZE 4096
#else
#error DEFINE START_ADD for THIS PIC!!!
#endif

//#define DEBUG 1

void eprom_read(void *data,int bytes ){
unsigned char *d=data, *ud,a;
unsigned int add,i;

//printf("\r\n");
ud=PA_TO_KVA0(NVM_START_ADD);
//printf("read at %p\r\n",ud);
for(i=0;i<bytes;i++){
#ifdef DEBUG
	printf("%x %x\r\n",*d,*ud);
#endif
		 *d++=*ud++;

}
//printf("%u\r\n",*ud);

}


//warning data structur must be packed!!
void eprom_write(void *data, int bytes){
unsigned char *d=data;
unsigned int add,dd,v,i;

add=NVM_START_ADD;
NVMErasePage((void*)add);
dd=0;
#ifdef DEBUG
printf("nvram: writing %u bytes at %X\r\n",bytes,add);
#endif
i=0;
if(bytes >NVM_PAGE_SIZE) bytes=NVM_PAGE_SIZE;
while(i<bytes)
{
	v=*d++;
    v=v << 8*(i%4);
	dd |= v;
	if(i && !((i+1)%4)) //start 4byte block
    {   
#ifdef DEBUG
        printf("writing at %x val %x\n",add,dd);
#endif
      	NVMWriteWord((void*)add,dd);
        add+=4;
        dd=0;
    }
	i++;
}

if(i%4)
{
#ifdef DEBUG
	printf("pad writing at %x val %x\n",add,dd);
#endif
	NVMWriteWord((void*)add,dd);
}


}



