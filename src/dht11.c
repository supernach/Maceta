#include "dht11.h"

static @inline uint8_t leerByte( Pin* gpio )
{
	uint8_t contador = 0;
	uint8_t temp = 0;
	uint8_t bitLeido = 0;
	
	for( contador; contador < 8; contador++ )
	{
		while( !IsActive( gpio ) ) //Espera nuevo bit
		{
		
		}
		_delay_us( 40 ); //Espero para comprobar nivel de la gpio +30us = 1 ; -30us = 0
	
		bitLeido = 0;
		if( IsActive( gpio ) )
		{
			bitLeido = 1;
		}
		else
		{
			bitLeido = 0;
		}
		
		temp |= bitLeido;
		if( contador < 7 )
		{
			temp <<=  1;
		}
		
		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
		{
			
		}
	}
	
	return temp;
}

static @inline bool dht11_ComenzarTransmision( DHT11_t* sensor )
{
	Output2mhz_Init( &sensor->Config.HW );
	Output_0( &sensor->Config.HW );
	
	sensor->Datos.Estado = dht11_COMUNICANDO;
	_delay_ms( 18 ); //Espero tiempo puesta en marcha dht11
	
	Input_Init( &sensor->Config.HW ); //Configuro como entrada para leer
	_delay_us( 40 );
	
	while( !IsActive( &sensor->Config.HW ) )
	{
		sensor->Datos.Estado = dht11_ESPERA_BAJO;
	}
	
	
	while( IsActive( &sensor->Config.HW ) )
	{
		sensor->Datos.Estado = dht11_ESPERA_ALTO;
	}
	
	
	sensor->Datos.Estado = dht11_CONEXION_OK;
	return true;
}

static @inline bool dht11_LeerDatos( DHT11_t* sensor )
{
	uint16_t checkCRC = 0;
	uint8_t mask = 0b11111111;
	
	sensor->Datos.Estado = dht11_MIDIENDO_H;
	sensor->Datos.UltimaLectura.H_Entero = leerByte(&sensor->Config.HW);
	
	sensor->Datos.Estado = dht11_MIDIENDO_H;
	sensor->Datos.UltimaLectura.H_Decimal = leerByte(&sensor->Config.HW);
	
	sensor->Datos.Estado = dht11_MIDIENDO_T;
	sensor->Datos.UltimaLectura.T_Entero = leerByte(&sensor->Config.HW);
	
	sensor->Datos.Estado = dht11_MIDIENDO_T;
	sensor->Datos.UltimaLectura.T_Decimal = leerByte(&sensor->Config.HW);
	
	sensor->Datos.UltimaLectura.CRC = leerByte(&sensor->Config.HW);
	
	checkCRC = sensor->Datos.UltimaLectura.H_Entero + sensor->Datos.UltimaLectura.H_Decimal + sensor->Datos.UltimaLectura.T_Entero + sensor->Datos.UltimaLectura.T_Decimal;
	checkCRC &= mask;
	
	if( checkCRC == sensor->Datos.UltimaLectura.CRC )
	{
		return true;
	}
	else
	{
		return false;
	}
}

static @inline void dht11_CerrarConexion( DHT11_t* sensor )
{
	Output2mhz_Init( &sensor->Config.HW );
	Output_1( &sensor->Config.HW );
	
	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
	{
		sensor->Datos.Estado = dht11_SLEEP;
	}	
}


void DHT11_Init( DHT11_t* dht11 )
{
	
}

void dht11_ModoCambiado( void )
{
	
}

void dht11_Lectura( DHT11_t* sensor )
{
	if( dht11_ComenzarTransmision( sensor ) )
	{
		if( dht11_LeerDatos( sensor ) )
		{
			sensor->Datos.Estado = dht11_CERRANDO_CONEXION;
		}
		else
		{
			sensor->Datos.Estado = dht11_FALLO_AL_LEER;//fallo crc
		}
	}
	else
	{
		sensor->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
	}
	
	dht11_CerrarConexion( sensor );
	
}







