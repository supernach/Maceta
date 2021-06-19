#ifndef INODOINVOKER_H
#define INODOINVOKER_H

#include "ISensorCmd.h"

typedef struct INodoInvoker INodoInvoker_t;

struct INodoInvoker
{
    ISensorCmd_t* command;
		ISensorGeneral_t* receiver;
    void( *SetCommand )( INodoInvoker_t* nodo, ISensorCmd_t* command );
		void( *SetReceiver )( INodoInvoker_t* nodo, ISensorGeneral_t* receiver );
    void( *Execute )( INodoInvoker_t* nodo );
};

#endif
