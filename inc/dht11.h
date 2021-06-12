#ifndef DHT11_H
#define DHT11_H

#include "utils.h"
#include "pin_def.h"
#include "gpio.h"
#include "isensor.h"

typedef enum
{
	dht11_SIN_REGISTRAR,
	dht11_COMUNICANDO,
	dht11_CONEXION_OK,
	dht11_MIDIENDO_H,
	dht11_MIDIENDO_T,
	dht11_CERRANDO_CONEXION,
	dht11_SLEEP,
	dht11_ESPERA_BAJO,
	dht11_ESPERA_ALTO
} DHT11_Estado_e;

typedef struct sDht11_SI
{
	uint8_t CRC;
	uint8_t T_Decimal;
	uint8_t T_Entero;
	uint8_t H_Decimal;
	uint8_t H_Entero;
} DHT11_SI_t;

typedef struct sDht11Datos
{
	DHT11_SI_t UltimaLectura;
	DHT11_Estado_e estado;
} DHT11_Datos_t;



typedef struct sDht11
{
	iSensor_t sistema;
	Pin pin;
	DHT11_Datos_t Datos;
} DHT11_t;




void dht11_ModoCambiado( void );

bool dht11_ComenzarTransmision(DHT11_t* sensor);
void dht11_LeerDatos( DHT11_t* sensor );
void dht11_CerrarConexion( DHT11_t* sensor );



#endif