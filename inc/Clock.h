#ifndef CLOCK_H
#define CLOCK_H

/**

@file Clock.c
@brief Proporciona un acceso basico a la configuracion y
			 usos del reloj interno del micro.
			 
@author Supernach
@date 2/2021

*/

#include "stm8s.h"
#include "pin_def.h"
#include "Gpio.h"

/**
@brief Deshabilita el uso del reloj en todos los perifericos			 

*/
void DisableAllPeripherals(void);

/**
@brief Inicializa el reloj de alta velocidad interno del
			 micro. A su vez deshabilita el reloj externo y el
			 reloj lento interno. Configura la frecuencia Master
			 y la frecuencia de la cpu. Por ultimo deshabilita
			 el uso del reloj para todos los perifericos.
			 
@param Prescaler para la frecuencia Master. 1,2,4,8
@param Prescaler para la frecuencia de la cpu. Esta 
			 la marca la frecuencia Master. 1,2,4,8,16,32,64,128
*/			 
void Clock_HSI_Init(CLK_Prescaler_TypeDef fHsi, CLK_Prescaler_TypeDef fCpu);

/**
@brief Habilita el uso de la funcion CCO en el pin por 
			 defecto del micro. En ese pin tendremos un espejo
			 de la frecuencia del reloj que elijamos.
@param Señal de reloj a usar
@param Configuracion fisica del pin
*/
void EnableClockMirror(CLK_Output_TypeDef source, Pin* pin);


#endif