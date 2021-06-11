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

//gm_Medicion.Medicion = true;

/**
@brief Inicializacion del buffer de datos del gestor de modo
@param gestorModoDatos Buffer del gestor
*/
void gm_Init( GestorModoDatos_t* gestorModoDatos );

/**
@brief Registrar nuevo elemento en el gestor de modos
@param sensor Configuracion del nuevo elemento
@param gestorModoDatos Buffer del gestor para introducir el nuevo elemento
*/
void gm_Registrar( uint8_t idSensor, void ( *notificarCambio )(), GestorModoDatos_t* gestorModoDatos );

/**
@brief Borrar un elemento en concreto del gestor de modo
@param idSensor Elemento a borrar
@param gestorModoDatos Buffer del gestor
*/
void gm_Borrar( uint8_t idSensor, GestorModoDatos_t* gestorModoDatos );

/**
@brief Recepcion de un nuevo modo desde un componente externo
*/
void gm_NuevoModo(uint8_t idSensor, Modo_t* nuevoModo, GestorModoDatos_t* gestorModoDatos);

/**
@brief Cada elemento tiene que definir una funcion de notificacion.
			 Sino para eso he creado esta.
*/
void gm_NotificarCambioDummy(void);



//static void gm_InicializarPosicionBuffer( ModoSensor_t* posicion );
//static bool gm_ComprobarIdLibre(uint8_t idSensor);

#endif