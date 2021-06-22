#ifndef INODOINVOKER_H
#define INODOINVOKER_H

#include <ISensorCmd.h>

typedef struct INodoInvoker INodoInvoker_t;

struct INodoInvoker
{
    ISensorCmd_t* command;
		ISensorGeneral_t* receiver;
		
    void( *ConfigCommand )( INodoInvoker_t* nodo, ISensorCmd_t* command, ISensorReceiver_t* cmdRcv, ISensorGeneral_t* receiver );
    void( *ExecuteCommand )( INodoInvoker_t* nodo );
};

#endif
