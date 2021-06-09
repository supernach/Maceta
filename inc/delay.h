#ifndef DELAY_H
#define DELAY_H

/**
/* El minimo son 4 microsegundos
/*
/*
/*
/*
*/

#include "stm8s.h"

#ifndef FCLK
#warning FCLK is not defined! 
#endif


/**
@brief La verdad esto es magia
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

#endif /* DELAY_H */