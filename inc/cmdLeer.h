#ifndef CMDLEER_H
#define CMDLEER_H

#include "ISensorCmd.h"

extern ISensorCmd_t cmd_Leer;


void cmdLeer_Init( ISensorCmd_t* cmd );

void cmdSetReceiver( ISensorCmd_t* cmd, ISensorReceiver_t* rcv );
void cmdLeerExecute( ISensorCmd_t* cmd, ISensorGeneral_t* sensor );


#endif // CMD_BASICO_H
