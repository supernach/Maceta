#include "gestormodo.h"

void gm_Init( GestorModoDatos_t* gestorModoDatos )
{
	uint8_t indice = 0;
	
	/*gm_Medicion.Medicion = true;
	gm_Medicion.Calibracion = false;
	gm_Medicion.Taraje = false;
	gm_Medicion.Res4 = false;
	gm_Medicion.Res5 = false;
	gm_Medicion.Res6 = false;
	gm_Medicion.Res7 = false;
	gm_Medicion.Res8 = false;*/
	
	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
	{
		gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[indice]);
	}
}

/*void gm_Sensor_Init( ModoSensor_t* sensor )
{
	sensor->idSensor = 0;
	sensor->Modo.Medicion = true;
	sensor->Modo.Calibracion = false;
	sensor->Modo.Taraje = false;
	sensor->Modo.Res4 = false;
	sensor->Modo.Res5 = false;
	sensor->Modo.Res6 = false;
	sensor->Modo.Res7 = false;
	sensor->Modo.Res8 = false;
	sensor->NotificarCambio = gm_NotificarCambioDummy;
}*/

void gm_Registrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos )
{
	if( sensor->idSensor < gm_NUMERO_MAX_MODOS )
	{
		if( gestorModoDatos->Modos[sensor->idSensor].idSensor == ( gm_NUMERO_MAX_MODOS + 1 ) )
		{			
			gestorModoDatos->Modos[sensor->idSensor] = *sensor;
			gestorModoDatos->Modos[sensor->idSensor].NotificarCambio( gestorModoDatos->Modos[sensor->idSensor].idSensor );
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

void gm_Borrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos )
{
	gm_InicializarPosicionBuffer( &gestorModoDatos->Modos[sensor->idSensor] );
}

void gm_NuevoModo(ModoSensor_t* sensor, Modo_t* nuevoModo)
{
	sensor->Modo = *nuevoModo;
}

void gm_NotificarCambioDummy(uint8_t idSensor)
{
	uint8_t test = 0;
	
	test = idSensor;
}

//Funciones "privadas"

static void gm_InicializarPosicionBuffer( ModoSensor_t* posicion )
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
	//posicion->NotificacionCambio = &gm_NotificarCambioDummy;
}