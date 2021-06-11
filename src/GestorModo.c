#include "gestormodo.h"

Modo_t gm_Medicion = {1, 0, 0, 0, 0, 0, 0, 0};
Modo_t gm_Calibracion = {0, 1, 0, 0, 0, 0, 0, 0};
Modo_t gm_Taraje = {0, 0, 1, 0, 0, 0, 0, 0};
Modo_t gm_Reset = {0, 0, 0, 0, 0, 0, 0, 0};

static @inline void gm_InicializarPosicionBuffer( ModoSensor_t* posicion )
{
	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
	posicion->Modo.Medicion = 0;
	posicion->Modo.Calibracion = 0;
	posicion->Modo.Taraje = 0;
	posicion->Modo.Res4 = 0;
	posicion->Modo.Res5 = 0;
	posicion->Modo.Res6 = 0;
	posicion->Modo.Res7 = 0;
	posicion->Modo.Res8 = 0;
	posicion->NotificarCambio = NULL;
}


void gm_Init( GestorModoDatos_t* gestorModoDatos )
{
	uint8_t indice = 0;
	
	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
	{
		gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[indice]);
	}
}

void gm_Registrar( uint8_t idSensor, void ( *notificarCambio )(), GestorModoDatos_t* gestorModoDatos )
{
	if( gm_SENSOR_VALIDO(idSensor) ) 
	{
		if( gm_ESTA_LIBRE(gestorModoDatos->Modos[idSensor].idSensor) )
		{	
			gestorModoDatos->Modos[idSensor].idSensor = idSensor;
			gestorModoDatos->Modos[idSensor].Modo = gm_Reset;
			gestorModoDatos->Modos[idSensor].NotificarCambio = notificarCambio;
		}
		else
		{
			//Modo ya ocupado
		}
	}
	else
	{
		//Numero modo no permitido
	}
	
}

void gm_Borrar( uint8_t idSensor, GestorModoDatos_t* gestorModoDatos )
{
	if( gm_SENSOR_VALIDO(idSensor) )
	{
		gm_InicializarPosicionBuffer( &gestorModoDatos->Modos[idSensor] );
	}
	else
	{
		//sensor no valido
	}
}

void gm_NuevoModo(uint8_t idSensor, Modo_t* nuevoModo, GestorModoDatos_t* gestorModoDatos)
{
	if( gm_SENSOR_VALIDO(idSensor) )
	{
		if( !gm_ESTA_LIBRE(gestorModoDatos->Modos[idSensor].idSensor) )
		{
			gestorModoDatos->Modos[idSensor].Modo = *nuevoModo;
			
			if( !IS_NULL(gestorModoDatos->Modos[idSensor].NotificarCambio) )
			{
				gestorModoDatos->Modos[idSensor].NotificarCambio();
			}
		}
		else
		{
			//Sensor no registrado
		}
	}
	else
	{
		//idSensor no valido
	}
}

void gm_NotificarCambioDummy()
{
	
}


