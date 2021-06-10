#ifndef GESTORMODO_H
#define GESTORMODO_H

/**

@file GestorModo.h
@brief Definicion de las funcione necesarias para la gestion 
       del modo de funcionamiento para poder tener control sobre 
			 los elementos a controlar.
@author Supernach
@date 6/2021

*/

#include "stm8s.h"
#include "gestormododef.h"

/**
@brief Inicializacion del buffer de datos del gestor de modo
@param gestorModoDatos Buffer del gestor
*/
void gm_Init( GestorModoDatos_t* gestorModoDatos );




/**
@brief Inicializacion del sensor
@param sensor estructura del sensor
*/
//void gm_Sensor_Init( ModoSensor_t* sensor );




/**
@brief Registrar nuevo elemento en el gestor de modos
@param sensor Configuracion del nuevo elemento
@param gestorModoDatos Buffer del gestor para introducir el nuevo elemento
*/
void gm_Registrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos );

/**
@brief Borrar un elemento en concreto del gestor de modo
@param idSensor Elemento a borrar
@param gestorModoDatos Buffer del gestor
*/
void gm_Borrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos );

/**
@brief Recepcion de un nuevo modo desde un componente externo
*/
void gm_NuevoModo(void);

/**
@brief Cada elemento tiene que definir una funcion de notificacion.
			 Sino para eso he creado esta.
*/
void gm_NotificarCambioDummy(uint8_t idSensor);



static void gm_InicializarPosicionBuffer( ModoSensor_t* posicion );

#endif