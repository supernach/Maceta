#ifndef ISENSORRECEIVER_H
#define ISENSORRECEIVER_H

#include "ISensor.h"


/**
/* @brief Interfaz de un elemento para recibir comandos
/*        Los elementos deben declarar una funcion Operacion
/*        la cual ejecutara la accion correspondiente
*/
typedef struct ISensorReceiver ISensorReceiver_t;

struct ISensorReceiver
{
	void( *Operacion )( ISensorGeneral_t* sensor );
};

#endif // ISENSORRECEIVER_H
