/* MAIN.C file
 * 
 * 
 */
 
#include "stm8s.h"
#include "pin_def.h"
#include "gpio.h"
#include "clock.h"

#include "maceta_def.h"
 
 
/**
/* @brief configuracion reloj sistema.
*/
#define FCLK 16000000 //Velocidad frecuencia cpu(depende de la configuracion)
#include "delay.h"

/**
/* @brief Elementos del sistema
*/
ModoSensor_t testSensor;
ModoSensor_t testSensor1;
ModoSensor_t testSensor2;
ModoSensor_t testSensor3;
ModoSensor_t testSensor4;

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

static @inline void aux_InicializacionModoSensores(ModoSensor_t* sensor, uint8_t id)
{
	sensor->idSensor = id;
	sensor->Modo.Medicion = false;
	sensor->Modo.Calibracion = false;
	sensor->Modo.Taraje = false;
	sensor->Modo.Res4 = false;
	sensor->Modo.Res5 = false;
	sensor->Modo.Res6 = false;
	sensor->Modo.Res7 = false;
	sensor->Modo.Res8 = false;
	sensor->NotificarCambio = gm_NotificarCambioDummy;
}

/**
/*
/* @brief Inicializacion modo de elementos
/*
/*
*/
static @inline void InicializacionModoSensores(void)
{
	aux_InicializacionModoSensores(&testSensor, 0);
	aux_InicializacionModoSensores(&testSensor1, 1);
	aux_InicializacionModoSensores(&testSensor2, 2);
	aux_InicializacionModoSensores(&testSensor3, 3);
	aux_InicializacionModoSensores(&testSensor4, 4);
	
	
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
	
	Modo.Init( &Modo.Datos );
	Modo.Registrar( &testSensor, &Modo.Datos );
	Modo.Registrar( &testSensor1, &Modo.Datos );
	Modo.Registrar( &testSensor2, &Modo.Datos );
	Modo.Registrar( &testSensor3, &Modo.Datos );
	Modo.Registrar( &testSensor4, &Modo.Datos );
	
	Modo.Borrar( &testSensor, &Modo.Datos );
	
	//Modo.NuevoModo(&testSensor1, 0b10000000);
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