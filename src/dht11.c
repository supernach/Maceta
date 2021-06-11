#include "dht11.h"



void dht11_ModoCambiado( void )
{
	
}

bool dht11_ComenzarTransmision( DHT11_t* sensor )
{
	//_delay_ms(100);
	Output2mhz_Init( &sensor->pin );
	Output_0( &sensor->pin );
	
	sensor->Datos.estado = dht11_COMUNICANDO;
	_delay_us( 20 ); //Espero tiempo puesta en marcha dht11
	
	Output_1( &sensor->pin );
	_delay_us( 40 ); //Espero tiempo para empezar a recibir datos
	
	Input_Init( &sensor->pin ); //Configuro como entrada para leer
	_delay_us( 40 ); //Espero tiempo para empezar a recibir datos
	
	if( IsActive( &sensor->pin ) ) 
	{
		sensor->Datos.estado = dht11_SLEEP;
		return false; //Compruebo que este en nivel bajo
	}
	_delay_us( 80 );
	
	if( !IsActive( &sensor->pin ) ) 
	{
		sensor->Datos.estado = dht11_SLEEP;
		return false; //Compruebo que este en nivel alto
	}
	_delay_us( 45 );
	
	if( IsActive( &sensor->pin ) ) 
	{
		sensor->Datos.estado = dht11_SLEEP;
		return false;
	}
	else 
	{
		sensor->Datos.estado = dht11_CONEXION_OK;
		return true;
	}
}

void dht11_LeerDatos( DHT11_t* sensor )
{
	uint8_t temp = 0;
	uint8_t contador = 0;
	uint8_t bitLeido;
	
	sensor->Datos.estado = dht11_MIDIENDO_H;
	/********** primer byte ********************/
	for( contador; contador < 8; contador++ )
	{
		while( !IsActive( &sensor->pin ) )
		{
		
		}
		_delay_us( 40 );
	
		bitLeido = 0;
		if( IsActive( &sensor->pin ) )
		{
			bitLeido = 1;
			temp |= bitLeido;
			temp <<=  1;
			while( IsActive( &sensor->pin ) )
			{
			
			}
		}
		else
		{
			temp <<= 1;
		}
	}
	sensor->Datos.UltimaLectura.H_Entero = temp;
	
	sensor->Datos.estado = dht11_MIDIENDO_H;
	/*************************** segundo byte **********************/
	contador = 0;
	temp = 0;
	for( contador; contador < 8; contador++ )
	{
		while( !IsActive( &sensor->pin ) )
		{
		
		}
		_delay_us( 40 );
	
		bitLeido = 0;
		if( IsActive( &sensor->pin ) )
		{
			bitLeido = 1;
			temp |= bitLeido;
			temp <<=  1;
			while( IsActive( &sensor->pin ) )
			{
			
			}
		}
		else
		{
			temp <<= 1;
		}
	}
	sensor->Datos.UltimaLectura.H_Decimal = temp;
	
	sensor->Datos.estado = dht11_MIDIENDO_T;
	/***************** tercer byte *****************/
	contador = 0;
	temp = 0;
	for( contador; contador < 8; contador++ )
	{
		while( !IsActive( &sensor->pin ) )
		{
		
		}
		_delay_us( 40 );
	
		bitLeido = 0;
		if( IsActive( &sensor->pin ) )
		{
			bitLeido = 1;
			temp |= bitLeido;
			temp <<=  1;
			while( IsActive( &sensor->pin ) )
			{
			
			}
		}
		else
		{
			temp <<= 1;
		}
	}
	sensor->Datos.UltimaLectura.T_Entero = temp;
	
	sensor->Datos.estado = dht11_MIDIENDO_T;
	/***************** cuarto byte *****************/
	contador = 0;
	temp = 0;
	for( contador; contador < 8; contador++ )
	{
		while( !IsActive( &sensor->pin ) )
		{
		
		}
		_delay_us( 40 );
	
		bitLeido = 0;
		if( IsActive( &sensor->pin ) )
		{
			bitLeido = 1;
			temp |= bitLeido;
			temp <<=  1;
			while( IsActive( &sensor->pin ) )
			{
			
			}
		}
		else
		{
			temp <<= 1;
		}
	}
	sensor->Datos.UltimaLectura.T_Decimal = temp;
	
	/***************** quinto byte *****************/
	contador = 0;
	temp = 0;
	for( contador; contador < 8; contador++ )
	{
		while( !IsActive( &sensor->pin ) )
		{
		
		}
		_delay_us( 40 );
	
		bitLeido = 0;
		if( IsActive( &sensor->pin ) )
		{
			bitLeido = 1;
			temp |= bitLeido;
			temp <<=  1;
			while( IsActive( &sensor->pin ) )
			{
			
			}
		}
		else
		{
			temp <<= 1;
		}
	}
	sensor->Datos.UltimaLectura.CRC = temp;
	
	sensor->Datos.estado = dht11_CERRANDO_CONEXION;
}

void dht11_CerrarConexion( DHT11_t* sensor )
{
	Output2mhz_Init( &sensor->pin );
	Output_1( &sensor->pin );
	sensor->Datos.estado = dht11_SLEEP;
}

