#include "dht11.h"

static @inline uint8_t leerByte( Pin* gpio )
{
	uint8_t contador = 0;
	uint8_t temp = 0;
	uint8_t bitLeido = 0;
	
	for( contador; contador < 8; contador++ )
	{
		while( !IsActive( gpio ) )
		{
		
		}
		_delay_us( 40 );
	
		bitLeido = 0;
		if( IsActive( gpio ) )
		{
			bitLeido = 1;
			temp |= bitLeido;
			temp <<=  1;
			while( IsActive( gpio ) )
			{
			
			}
		}
		else
		{
			temp <<= 1;
		}
	}
	
	return temp;
}

void dht11_ModoCambiado( void )
{
	
}

bool dht11_ComenzarTransmision( DHT11_t* sensor )
{
	//_delay_ms(100);
	Output2mhz_Init( &sensor->pin );
	Output_0( &sensor->pin );
	
	sensor->Datos.estado = dht11_COMUNICANDO;
	_delay_us( 18 ); //Espero tiempo puesta en marcha dht11
	
	Output_1( &sensor->pin );
	_delay_us( 20 ); //Espero tiempo para empezar a recibir datos
	//Output_0( &sensor->pin );
	
	Input_FL_Init( &sensor->pin ); //Configuro como entrada para leer
	//_delay_us( 40 ); //Espero tiempo para empezar a recibir datos
	
	/*if( IsActive( &sensor->pin ) ) 
	{
		sensor->Datos.estado = dht11_SLEEP;
		return false; //Compruebo que este en nivel bajo
	}*/
	//_delay_us( 80 );
	
	while( !IsActive( &sensor->pin ) )
	{
		sensor->Datos.estado = dht11_ESPERA_BAJO;
	}
	
	/*if( !IsActive( &sensor->pin ) ) 
	{
		sensor->Datos.estado = dht11_SLEEP;
		return false; //Compruebo que este en nivel alto
	}
	_delay_us( 45 );*/
	
	while( IsActive( &sensor->pin ) )
	{
		sensor->Datos.estado = dht11_ESPERA_ALTO;
	}
	
	/*if( IsActive( &sensor->pin ) ) 
	{
		sensor->Datos.estado = dht11_SLEEP;
		return false;
	}
	else 
	{
		sensor->Datos.estado = dht11_CONEXION_OK;
		return true;
	}*/
	
	sensor->Datos.estado = dht11_CONEXION_OK;
	return true;
}

void dht11_LeerDatos( DHT11_t* sensor )
{
	sensor->Datos.estado = dht11_MIDIENDO_H;
	sensor->Datos.UltimaLectura.H_Entero = leerByte(&sensor->pin);
	
	sensor->Datos.estado = dht11_MIDIENDO_H;
	sensor->Datos.UltimaLectura.H_Decimal = leerByte(&sensor->pin);
	
	sensor->Datos.estado = dht11_MIDIENDO_T;
	sensor->Datos.UltimaLectura.T_Entero = leerByte(&sensor->pin);
	
	sensor->Datos.estado = dht11_MIDIENDO_T;
	sensor->Datos.UltimaLectura.T_Decimal = leerByte(&sensor->pin);
	
	sensor->Datos.UltimaLectura.CRC = leerByte(&sensor->pin);
	
	sensor->Datos.estado = dht11_CERRANDO_CONEXION;
	
	
}

void dht11_CerrarConexion( DHT11_t* sensor )
{
	Output2mhz_Init( &sensor->pin );
	Output_1( &sensor->pin );
	sensor->Datos.estado = dht11_SLEEP;
}

