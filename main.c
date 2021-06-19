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
	sensor1.Sensor.Config.HW.Pin = GPIO_PIN_3;
	sensor1.Sensor.Config.HW.Puerto = GPIOA;
	Output2mhz_Init( &sensor1.Sensor.Config.HW );
	Output_1( &sensor1.Sensor.Config.HW );
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
/* @brief Inicializacion d elos distintos comandos existentes
*/
static @inline void ConfiguracionComandos( void )
{
	cmdLeer_Init( &cmd_Leer );
}

/**
/* @brief Maceta es el invoker de los comandos
*/
static @inline void ConfiguracionMaceta( void )
{
	ConfiguracionComandos();
	
	Maceta_Init( &Maceta );
	Maceta.SetCommand( &Maceta, &cmd_Leer );
	Maceta.SetReceiver( &Maceta, &ptrHaciaSensores );
	cmd_Leer.SetReceiver( &cmd_Leer, &sensor1.Orden );
	Maceta.Execute( &Maceta );
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
	SensorTH_Init(&sensor1, &Modo);
	ptrHaciaSensores.SensorTH = &sensor1.Sensor;
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
		//sensor1.Sensor.Lectura( &sensor1.Sensor );
		Modo.NuevoModo(sensor1.Sistema.Datos.ID, &gm_MEDICION, &Modo.Datos);
		_delay_ms(1000);
	}
}