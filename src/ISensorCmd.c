#include "ISensorCmd.h"

void ISensorCmd_Init( ISensorReceiver_t* Receiver, ISensorCmd_t* cmd, void( *Execute )() )
{
    cmd->Receiver = Receiver;
    cmd->Execute = Execute;
}
