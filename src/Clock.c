
#include "Clock.h"


void Clock_HSI_Init(CLK_Prescaler_TypeDef fHsi, CLK_Prescaler_TypeDef fCpu)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE); //Desactivar oscilador externo
	CLK_LSICmd(DISABLE); //Desactivar oscilador lento interno 128khz
	
	CLK_HSICmd(ENABLE); // Activar oscilador interno 16mhz
	
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE); // Espera hasta que el oscilador este preparado
	
	CLK_ClockSwitchCmd(ENABLE);
	
	CLK_HSIPrescalerConfig(fHsi); //fMaster 16mhz
	CLK_SYSCLKConfig(fCpu); // fCpu 
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
                                
  DisableAllPeripherals();
}

void DisableAllPeripherals(void)
{
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}

void EnableClockMirror(CLK_Output_TypeDef source, Pin* pin)
{
	Output10mhz_Init(pin);
	CLK_CCOConfig(source);
  CLK_CCOCmd(ENABLE);
  //while(CLK_GetFlagStatus(CLK_FLAG_CCORDY) == FALSE);
}