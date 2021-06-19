#ifndef MACETA_H
#define MACETA_H

#include "inodoinvoker.h"
#include "cmdleer.h"

extern INodoInvoker_t Maceta;

void Maceta_Init( INodoInvoker_t* nodo );
void Maceta_SetCommand( INodoInvoker_t* nodo,  ISensorCmd_t* command  );
void Maceta_SetReceiver( INodoInvoker_t* nodo, ISensorGeneral_t* receiver );
void Maceta_Execute( INodoInvoker_t* nodo );



#endif