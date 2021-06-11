#ifndef DHT11_H
#define DHT11_H

#include "pin_def.h"
#include "isensor.h"


typedef struct sDht11Datos
{
	uint8_t temperatura;
	uint8_t humedad;
} DHT11_Datos_t;

typedef struct sDht11
{
	iSensor_t sistema;
	Pin pin;
	DHT11_Datos_t Datos;
} DHT11_t;




void dht11_ModoCambiado( void );



#endif