#ifndef ISENSOR_H
#define ISENSOR_H


#include "gestormodo.h"

/**
/*@brief Tipo destinado a albergar los datos comunes para 
/*       el gestor de modo
*/
typedef struct sISensorDatos
{
	uint8_t ID;
	Modo_t* Modo;
} iSensorDatos_t;


/**
/*@brief Interfaz para los sensores. La funcion Init tiene
/*       que encargarse de inicializar datos y registrar
/*       el sensor en el gestor de modos
*/
typedef struct sISensor
{
	iSensorDatos_t Datos;
	void ( *Init )( iSensorDatos_t* sensor, void ( *notificacion )(), uint8_t id, GestorModo_t* gm );
} iSensor_t;



/**
/*@brief Funcion Init por defecto. Rellena los datos del sensor
/*       y lo registra en el gestor de modo.
/*@param sensor almacen datos del sensor para rellenar
/*@param notificacion() Funcion a la que se llamara cada vez que el
/*       modo de este sensor cambie
/*@param id Numero id para este sensor
/*@param gm puntero al gestor de modo donde esta inscrito el sensor
*/
void iSd_Init( iSensorDatos_t* sensor, void ( *notificacion )(), uint8_t id, GestorModo_t* gm);


#endif