#ifndef ISENSOR_H
#define ISENSOR_H

//#include "isensorreceiver.h"
#include "dht11.h"
#include "gestormodo.h"

typedef struct ISensor ISensor_t;
typedef struct ISensorGeneral ISensorGeneral_t;
typedef struct ISensorDatos ISensorDatos_t;

/**
/*@brief Tipo destinado a albergar los datos comunes para 
/*       el gestor de modo
*/
struct ISensorDatos
{
	uint8_t ID;
	Modo_t* Modo;
};


/**
/*@brief Interfaz para los sensores. La funcion Init tiene
/*       que encargarse de inicializar datos y registrar
/*       el sensor en el gestor de modos
*/
struct ISensor
{
	ISensorDatos_t Datos;
	void ( *Init )( ISensor_t* sensor, void ( *notificacion )(), uint8_t id, GestorModo_t* gm );
};

/**
/* @brief Estructura creada para alojar los distintos sensores
/*        y asi poder acceder a ellos d euna manera comun.
/*        Cada sensor debe ser registrado aqui
*/

struct ISensorGeneral
{
	DHT11_t* SensorTH;
};

/**
/*@brief Funcion Init por defecto. Rellena los datos del sensor
/*       y lo registra en el gestor de modo.
/*@param sensor almacen datos del sensor para rellenar
/*@param notificacion() Funcion a la que se llamara cada vez que el
/*       modo de este sensor cambie
/*@param id Numero id para este sensor
/*@param gm puntero al gestor de modo donde esta inscrito el sensor
*/
void iSd_Init( ISensor_t* sensor, void ( *notificacion )(), uint8_t id, GestorModo_t* gm);


#endif