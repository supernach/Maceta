#include "iSensor.h"



void iSd_Init( iSensorDatos_t* sensor, void ( *notificacion )(), uint8_t id, GestorModo_t* gm)
{
	sensor->Modo = &gm->Datos.Modos[sensor->ID].Modo;
	sensor->ID = id;
	
	gm->Registrar(id, notificacion, &gm->Datos);
}