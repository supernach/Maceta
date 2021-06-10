/* MAIN.C file
 * 
 * 
 */
 
#include "stm8s.h"
#include "pin_def.h"
#include "gpio.h"
#include "clock.h"

#include "maceta_def.h"
 
 
 
#define FCLK 16000000 //Velocidad frecuencia cpu(depende de la configuracion)
#include "delay.h"

ModoSensor_t testSensor;
ModoSensor_t testSensor1;
ModoSensor_t testSensor2;

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
/* @brief Inicializacion modo de elementos
/*
/*
*/
static @inline void InicializacionModoSensores(void)
{
	testSensor.idSensor = 0;
	testSensor.Modo.Medicion = true;
	testSensor.Modo.Calibracion = false;
	testSensor.Modo.Taraje = false;
	testSensor.Modo.Res4 = false;
	testSensor.Modo.Res5 = false;
	testSensor.Modo.Res6 = false;
	testSensor.Modo.Res7 = false;
	testSensor.Modo.Res8 = false;
	testSensor.NotificarCambio = gm_NotificarCambioDummy;
	
	testSensor1.idSensor = 1;
	testSensor1.Modo.Medicion = false;
	testSensor1.Modo.Calibracion = true;
	testSensor1.Modo.Taraje = false;
	testSensor1.Modo.Res4 = false;
	testSensor1.Modo.Res5 = false;
	testSensor1.Modo.Res6 = false;
	testSensor1.Modo.Res7 = false;
	testSensor1.Modo.Res8 = false;
	testSensor1.NotificarCambio = gm_NotificarCambioDummy;
	
	testSensor2.idSensor = 2;
	testSensor2.Modo.Medicion = false;
	testSensor2.Modo.Calibracion = false;
	testSensor2.Modo.Taraje = true;
	testSensor2.Modo.Res4 = false;
	testSensor2.Modo.Res5 = false;
	testSensor2.Modo.Res6 = false;
	testSensor2.Modo.Res7 = false;
	testSensor2.Modo.Res8 = false;
	testSensor2.NotificarCambio = gm_NotificarCambioDummy;
}

/**
/*
/* @brief Inicializacion gestor modos
/*
/*
*/
static @inline void InicializacionGestionModos(void)
{
	InicializacionModoSensores();
	
	Modo.Registrar = gm_Registrar;
	Modo.Borrar = gm_Borrar;
	Modo.NuevoModo = gm_NuevoModo;
	Modo.Init = gm_Init;
	
	Modo.Init(&ModoDatos);
	Modo.Registrar(&testSensor, &ModoDatos);
	Modo.Registrar(&testSensor1, &ModoDatos);
	Modo.Registrar(&testSensor2, &ModoDatos);
	
	Modo.Borrar(&testSensor, &ModoDatos);
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
	
	
	while (1)
	{
		_delay_ms(100);
	}
}