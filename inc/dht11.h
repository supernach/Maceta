#ifndef DHT11_H
#define DHT11_H

#include <utils.h>
#include <pin_def.h>
#include <Gpio.h>

typedef struct DHT11 DHT11_t;
typedef struct DHT11_Config DHT11_Config_t;

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
	dht11_ESPERA_ALTO,
	dht11_FALLO_AL_LEER,
	dht11_FALLO_AL_COMUNICAR
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
	DHT11_Estado_e Estado;
} DHT11_Datos_t;


struct DHT11_Config
{
	Pin HW;
};


struct DHT11
{
	DHT11_Config_t Config;
	DHT11_Datos_t Datos;
	
	void ( *Lectura )( DHT11_t* sensor );
};

void DHT11_Init( DHT11_t* dht11 );


void dht11_ModoCambiado( void );
void dht11_Lectura( DHT11_t* sensor );




#endif