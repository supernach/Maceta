#ifndef MACETA_DEF_H
#define MACETA_DEF_H

#include <gestormodo.h>
#include <maceta.h>
#include <SensorTH.h>

/**
/* @brief Invocadores de comandos
*/
INodoInvoker_t Maceta;

/**
/* @brief Almacen de los distintos sensores, para acceder con 
/*        el sistema de comandos
*/
ISensorGeneral_t ptrHaciaSensores;

/**
/* @brief gestores de modos de funcionamiento
*/
GestorModo_t Modo;

/**
/* @brief Sensores
*/
SensorTH_t sensor1;
SensorTH_t sensor2;

/**
/* @brief Comandos
*/
ISensorCmd_t cmd_Leer;






#endif