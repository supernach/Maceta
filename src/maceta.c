
#include "maceta.h"

void Maceta_Init( INodoInvoker_t* nodo )
{
	nodo->SetCommand = &Maceta_SetCommand;
	nodo->SetReceiver = &Maceta_SetReceiver;
	nodo->Execute = &Maceta_Execute;
}

void Maceta_SetCommand( INodoInvoker_t* nodo, ISensorCmd_t* command )
{
	nodo->command = command;
}

void Maceta_SetReceiver( INodoInvoker_t* nodo, ISensorGeneral_t* receiver )
{
	nodo->receiver = receiver;
}

void Maceta_Execute( INodoInvoker_t* nodo )
{
	nodo->command->Execute(nodo->command, nodo->receiver);
}

