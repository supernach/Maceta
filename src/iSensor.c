#include "iSensor.h"



void iSd_Init( iSensorDatos_t* sensor, uint8_t id, GestorModo_t* gm)
{
	sensor->Modo = &gm->Datos.Modos[sensor->ID].Modo;
	gm->Registrar(id, &gm_NotificarCambioDummy, &gm->Datos);
}