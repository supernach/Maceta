#include <iSensor.h>



void iSd_Init( ISensor_t* sensor, void ( *notificacion )(), uint8_t id, GestorModo_t* gm)
{
	sensor->Datos.Modo = &gm->Datos.Modos[sensor->Datos.ID].Modo;
	sensor->Datos.ID = id;
	
	gm->Registrar(id, notificacion, &gm->Datos);
}