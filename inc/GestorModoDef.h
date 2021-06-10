#ifndef GESTORMODODEF_H
#define GESTORMODODEF_H

/**

@file GestorModoDef.h
@brief Tipos de datos para gestion de modos			 
@author Supernach
@date 6/2021

*/



#include "stm8s.h"
#include "stdbool.h"

#define gm_NUMERO_MAX_MODOS 4 //Numero maximo de modos a gestionar

/**
@brief Modo de funcionamiento para los elementos. Define estados
			 que se activan externamente desde una tft por ejemplo.
*/

typedef struct sModo
{
	bool Medicion;
	bool Calibracion;
	bool Taraje;
	bool Res4;
	bool Res5;
	bool Res6;
	bool Res7;
	bool Res8;
} Modo_t;

/**
@brief Definicion del elemento sensor y sus distintas partes.
@param idSensor identificador unico. Existe un maximo NUMERO_MAX_MODOS
@param Modo Modo de funcionamiento del sensor
@param NotificarCambio() Se le notifica al elemento que el modo ha cambiado
			 por si tiene que hacer algun tipo de gestion.
*/

typedef struct sModoSensor
{
	uint8_t idSensor;
	Modo_t Modo;
	
	void ( *NotificarCambio )(uint8_t idSensor);
} ModoSensor_t;

/**
@brief Buffer para los modos de funcionamiento
*/

typedef struct sGestorModoDatos
{
	ModoSensor_t Modos[gm_NUMERO_MAX_MODOS];
} GestorModoDatos_t;

/**
@brief Creacion del gestor de modo
@param Datos buffer del gestor para los modos de funcionamiento
@param Registrar() Agregar nuevo elemento
@param Borrar() Quitar elemento
@param NuevoModo() Nuevo modo recibido desde fuera
@param Init() Inicializar el gestor
*/

typedef struct sGestorModo
{
	GestorModoDatos_t Datos;
	
	void ( *Registrar )( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos );
	void ( *Borrar )( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos );
	void ( *NuevoModo )(void);
	void ( *Init )( GestorModoDatos_t* gestorModoDatos );
} GestorModo_t;

#endif