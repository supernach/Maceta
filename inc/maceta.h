#ifndef MACETA_H
#define MACETA_H

#include <INodoInvoker.h>
#include <cmdLeer.h>

extern INodoInvoker_t Maceta;

void Maceta_Init( INodoInvoker_t* nodo );
void Maceta_ConfigCommand( INodoInvoker_t* nodo,  ISensorCmd_t* command, ISensorReceiver_t* cmdRcv, ISensorGeneral_t* receiver  );
void Maceta_ExecuteCommand( INodoInvoker_t* nodo );



#endif