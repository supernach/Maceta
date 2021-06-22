
#include <gpio.h>

void Input_Init(Pin* input)
{
	GPIO_Init(input->Puerto, input->Pin, GPIO_MODE_IN_PU_NO_IT);
}

void Input_FL_Init(Pin* input)
{
	GPIO_Init(input->Puerto, input->Pin, GPIO_MODE_IN_FL_NO_IT);
}

void InputInt_Init(Pin* input)
{
	GPIO_Init(input->Puerto, input->Pin, GPIO_MODE_IN_PU_IT);
}

void Output2mhz_Init(Pin* output)
{
	GPIO_Init(output->Puerto, output->Pin, GPIO_MODE_OUT_PP_LOW_SLOW);
}

void Output10mhz_Init(Pin* output)
{
	GPIO_Init(output->Puerto, output->Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
}

void Output_0(Pin* output)
{
	GPIO_WriteLow(output->Puerto, output->Pin);
}

void Output_1(Pin* output)
{
	GPIO_WriteHigh(output->Puerto, output->Pin);
}

bool IsActive(Pin* input)
{
	if(GPIO_ReadInputPin(input->Puerto, input->Pin)) return true;
	else return false;
}