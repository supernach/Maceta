
#include <maceta.h>

void Maceta_Init( INodoInvoker_t* nodo )
{
	nodo->ConfigCommand = &Maceta_ConfigCommand;
	nodo->ExecuteCommand = &Maceta_ExecuteCommand;
}

void Maceta_ConfigCommand( INodoInvoker_t* nodo, ISensorCmd_t* command, ISensorReceiver_t* cmdRcv, ISensorGeneral_t* receiver )
{
	nodo->command = command;
	nodo->command->Receiver = cmdRcv;
	nodo->receiver = receiver;
}

void Maceta_ExecuteCommand( INodoInvoker_t* nodo )
{
	nodo->command->Execute(nodo->command, nodo->receiver);
}

