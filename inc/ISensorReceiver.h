#ifndef ISENSORRECEIVER_H
#define ISENSORRECEIVER_H

#include <iSensor.h>

/**
/* @brief Interfaz de un elemento para recibir comandos
/*        Los elementos deben declarar una funcion Operacion
/*        la cual ejecutara la accion correspondiente
*/
typedef struct ISensorReceiver ISensorReceiver_t;

struct ISensorReceiver
{
	void( *Exec )( ISensorGeneral_t* sensor );
};

#endif // ISENSORRECEIVER_H
