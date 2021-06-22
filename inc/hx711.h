#ifndef HX711_H
#define HX711_H

#include <utils.h>
#include <pin_def.h>
#include <gpio.h>

typedef struct HX711 HX711_t;
typedef struct HX711_Config HX711_Config_t;
typedef struct HX711_Datos HX711_Datos_t;

typedef enum
{
	DEFECTO
} HX711_Estado_e;


typedef struct HX711_Datos
{
	HX711_Estado_e Estado;
};


struct HX711_Config
{
	Pin HW;
};


struct HX711
{
	HX711_Config_t Config;
	HX711_Datos_t Datos;
	
	void ( *Lectura )( HX711_t* sensor );
};

void HX711_Init( HX711_t* hx711 );


void hx711_ModoCambiado( void );
void hx711_Lectura( HX711_t* sensor );




#endif