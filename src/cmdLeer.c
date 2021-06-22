#include <cmdLeer.h>


void cmdLeer_Init( ISensorCmd_t* cmd )
{
	cmd->Execute = &cmdLeerExecute;
}


void cmdLeerExecute( ISensorCmd_t* cmd, ISensorGeneral_t* sensor )
{
	//cmd->Receiver->Operacion = &SensorTH_Medicion;
	cmd->Receiver->Exec(sensor);
}
