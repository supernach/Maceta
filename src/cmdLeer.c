#include "cmdLeer.h"


void cmdLeer_Init( ISensorCmd_t* cmd )
{
	cmd->SetReceiver = &cmdSetReceiver;
	cmd->Execute = &cmdLeerExecute;
}

void cmdSetReceiver( ISensorCmd_t* cmd, ISensorReceiver_t* rcv )
{
	cmd->Receiver = rcv;
}

void cmdLeerExecute( ISensorCmd_t* cmd, ISensorGeneral_t* sensor )
{
	//cmd->Receiver->Operacion = &SensorTH_Medicion;
	cmd->Receiver->Operacion(sensor);
}
