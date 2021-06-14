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
	sensor1.pin.Pin = GPIO_PIN_3;
	sensor1.pin.Puerto = GPIOA;
	Output2mhz_Init( &sensor1.pin );
	Output_1( &sensor1.pin );
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

static @inline void aux_InicializacionModoSensores(iSensor_t* sensor, void ( *modoCambiado )(), uint8_t id)
{
	sensor->Init = iSd_Init;
	sensor->Init(&sensor->Datos, modoCambiado, id, &Modo);
}

/**
/*
/* @brief Inicializacion modo de elementos. Aqui se registra el sensor
/*        en el gestor de modo. Se le indica cual sera la funcion
/*        a llamar cuando se cambie el modo
/*
/*
*/
static @inline void InicializacionModoSensores(void)
{
	aux_InicializacionModoSensores(&sensor1.sistema, &dht11_ModoCambiado, 0);
	sensor1.Lectura = &dht11_Lectura;
	Modo.NuevoModo(sensor1.sistema.Datos.ID, &gm_MEDICION, &Modo.Datos);
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
	Inicializacion_Total();
	_delay_ms(1000);
	
	while (1)
	{
		sensor1.Lectura( &sensor1 );
		_delay_ms(1000);
	}
}