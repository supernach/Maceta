#ifndef GPIO_H
#define GPIO_H

/**

@file Gpio.c
@brief Con este modulo pretendo abstraerme de las funciones 
			 de la SPL relacionadas con las configuraciones de las
			 distintas I/O. Proporciona un tipo sPin para
			 tener una definicion mas clara de la parte fisica de
			 la I/O.
			 
@author Supernach
@date 2/2021

*/
			 

#include "stm8s.h"
#include "stdbool.h"
#include "pin_def.h"

/**
@brief Inicializacion como entrada de una I/O. Se configura
			 en modo Pull-Up sin interrupcion.
			 
@param Configuracion fisica del pin.

*/
void Input_Init(Pin* input);

/**
@brief Inicializacion como entrada de una I/O. Se configura
			 en modo flotante sin interrupcion.
			 
@param Configuracion fisica del pin.

*/

void Input_FL_Init(Pin* input);

/**
@brief Inicializacion como entrada de una I/O. Se configura
			 en modo Pull-Up con interrupcion.
			 
@param Configuracion fisica del pin.

*/
void InputInt_Init(Pin* input);

/**
@brief Inicializacion como salida lenta(max 2mhz) de una I/O. Se configura
			 en modo Push-Pull a nivel bajo.
			 
@param Configuracion fisica del pin.

*/
void Output2mhz_Init(Pin* output);

/**
@brief Inicializacion como salida rapida(max 10mhz) de una I/O. Se configura
			 en modo Push-Pull a nivel bajo.
			 
@param Configuracion fisica del pin.

*/
void Output10mhz_Init(Pin* output);

/**
@brief Poner en nivel bajo la salida correspondiente
			 
@param Configuracion fisica del pin.

*/
void Output_0(Pin* output);

/**
@brief Poner en nivel alto la salida correspondiente
			 
@param Configuracion fisica del pin.

*/
void Output_1(Pin* output);

/**
@brief Comprobar si una entrada esta a nivel alto
			 
@param Configuracion fisica del pin.

@return Si esta activa o no lo esta

*/
bool IsActive(Pin* input);




#endif