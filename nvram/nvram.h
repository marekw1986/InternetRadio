#ifndef NVRAM_H
#define NVRAM_H

void eprom_read(void *data,int bytes );

void eprom_write(void *data, int bytes);

#endif