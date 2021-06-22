#ifndef PIN_DEF_H
#define PIN_DEF_H 

#include <stm8s.h>


typedef struct sPin
{
	GPIO_TypeDef* Puerto;
	GPIO_Pin_TypeDef Pin;
} Pin;






#endif