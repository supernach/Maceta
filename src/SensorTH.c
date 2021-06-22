#include <SensorTH.h>

static @inline void aux_InicializacionModoSensores(ISensor_t* sensor, void ( *modoCambiado )(), uint8_t id, GestorModo_t* modo)
{
	sensor->Init = iSd_Init;
	sensor->Init(sensor, modoCambiado, id, modo);
}

void SensorTH_Init( SensorTH_t* sensor, GestorModo_t* modo )
{
	aux_InicializacionModoSensores(&sensor->Sistema, &dht11_ModoCambiado, 0, modo);
	sensor->Sensor.Lectura = &dht11_Lectura;
	sensor->cmdLeer.Exec = &SensorTH_Medicion;
}

void SensorTH_Medicion( ISensorGeneral_t* sensor )
{
	sensor->SensorTH->Sensor.Lectura(&sensor->SensorTH->Sensor);
}

void SensorTH_Calibrar( void )
{
	
}