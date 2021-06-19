#ifndef SENSORTH_H
#define SENSORTH_H


/**
/*
/*
/* @brief Sensor DHT11. Mide temperatura y humedad. Esta integrado
/*        en la gestion de modos del sistema y en el gestor de comandos.
/* @author SuperNach
/* @date 6/2021
/*
/*
/*
/*
*/

#include "dht11.h"
#include "ISensorReceiver.h"


typedef struct sensorTH SensorTH_t;

struct sensorTH
{
	DHT11_t Sensor;
	ISensorReceiver_t Orden;
	ISensor_t Sistema;
};

/**
/* @brief Constructor del sensor
*/
void SensorTH_Init( SensorTH_t* sensor, GestorModo_t* modo );

/**
/* @brief Funcion que ejecuta el comando leer
*/
void SensorTH_Medicion( ISensorGeneral_t* sensor );
void SensorTH_Calibrar( void );




#endif