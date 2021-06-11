/* MAIN.C file
 * 
 * 
 */
 
#include "stm8s.h"
#include "pin_def.h"
#include "gpio.h"
#include "clock.h"

#include "utils.h"
#include "maceta_def.h"
 
 
/**
/* @brief configuracion reloj sistema.
*/
#define FCLK 16000000 //Velocidad frecuencia cpu(depende de la configuracion)
#include "delay.h"

/**
/*
/* @brief Resetear todos los puertos perifericos
/*
/*
*/

static @inline void DeInitAllGPIO(void)
{
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);
}

/**
/*
/* @brief Inicializacion de los pines fisicos asociados a sensores
/*        a traves del tipo Pin.
/*
/*
*/

static @inline void Pin_Init(void)
{
	
}

/**
/*
/* @brief Inicializacion completa de las GPIO. Por ultimo
/*        la IO se configura segun se necesite.
/*
/*
*/

static @inline void InicializacionGPIO(void)
{
	Pin_Init();
}

/**
/*
/* @brief Inicializacion del reloj de sistema y cpu.
/*
/*
*/

static @inline void InicializacionCLK(void)
{
	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
}

/**
/*
/* @brief Inicializacion gestor modos
/*
/*
*/
static @inline void InicializacionGestionModos(void)
{
	Modo.Registrar = gm_Registrar;
	Modo.Borrar = gm_Borrar;
	Modo.NuevoModo = gm_NuevoModo;
	Modo.Init = gm_Init;
	
	Modo.Init(&Modo.Datos);
}

static @inline void aux_InicializacionModoSensores(iSensor_t* sensor, uint8_t id)
{
	sensor->Init = iSd_Init;
	sensor->Init(&sensor->Datos, id, &Modo);
}

/**
/*
/* @brief Inicializacion modo de elementos
/*
/*
*/
static @inline void InicializacionModoSensores(void)
{
	aux_InicializacionModoSensores(&DHT11, 0);
	aux_InicializacionModoSensores(&DHT22, 1);
	
	Modo.NuevoModo(DHT11.Datos.ID, &gm_Medicion, &Modo.Datos);
}



/**
/*
/* @brief Resumen de todas las anteriores inicializaciones
/*
/*
*/

static @inline void Inicializacion_Total(void)
{
	DeInitAllGPIO();
	InicializacionCLK();
	InicializacionGPIO();
	
	InicializacionGestionModos();
	InicializacionModoSensores();
}

/**
/*
/* @brief Rutina principal
/*
/*
*/

int main()
{
	Modo_t valorModo;
	Inicializacion_Total();
	
	
	while (1)
	{
		valorModo = *(DHT11.Datos.Modo);
		_delay_ms(100);
	}
}