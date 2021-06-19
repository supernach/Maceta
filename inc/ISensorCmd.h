#ifndef ISENSORCMD_H
#define ISENSORCMD_H

#include "ISensor.h"
#include "ISensorReceiver.h"



/**
/* @brief Define la interfaz para un comando. El comando
/*        ejecuta la Operacion() sobre el receiver asignado
/*        Se le pasa una referencia al almacen de sensores.
*/
typedef struct ISensorCmd ISensorCmd_t;

struct ISensorCmd
{
    ISensorReceiver_t* Receiver;

		void( *SetReceiver)( ISensorCmd_t* cmd, ISensorReceiver_t* rcv );
    void( *Execute )( ISensorCmd_t* cmd, ISensorGeneral_t* sensor );
};



#endif // ISENSORCMD_H
