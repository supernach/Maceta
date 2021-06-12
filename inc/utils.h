#ifndef UTILS_H
#define UTILS_H



#include "stm8s.h"

#define NULL (void*)0
#define IS_NULL(val) ((val == NULL) ? true : false)


/**
/* @brief velocidad reloj del sistema
*/
#define FCLK 16000000 //Velocidad frecuencia cpu(depende de la configuracion)
#ifndef FCLK
#warning FCLK is not defined! 
#endif


/**
@brief Funcion delay
*/

static @inline void _delay_cycl( unsigned short __ticks )
{
	#define T_COUNT(x) (( x * (FCLK / 1000000UL) )-3)/3)
	// ldw X, __ticks ; insert automaticaly
	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
}


static @inline void _delay_us( const unsigned short __us )
{
	_delay_cycl( (unsigned short)( T_COUNT(__us) );
}

static @inline void _delay_ms( unsigned short __ms )
{
	while ( __ms-- )
	{
		_delay_us( 1000 );
	}
}



#endif 