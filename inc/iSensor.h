#ifndef ISENSOR_H
#define ISENSOR_H


#include "gestormodo.h"


typedef struct sISensorDatos
{
	uint8_t ID;
	Modo_t* Modo;
} iSensorDatos_t;

typedef struct sISensor
{
	iSensorDatos_t Datos;
	void ( *Init )( iSensorDatos_t* sensor, uint8_t id, GestorModo_t* gm );
	void ( *ModoCambiado )(void);
} iSensor_t;


void iSd_Init( iSensorDatos_t* sensor, uint8_t id, GestorModo_t* gm);



#endif