   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 307                     ; 6 void HX711_Init( HX711_t* hx711 )
 307                     ; 7 {
 309                     	switch	.text
 310  0000               _HX711_Init:
 314                     ; 9 }
 317  0000 81            	ret
 340                     ; 11 void hx711_ModoCambiado( void )
 340                     ; 12 {
 341                     	switch	.text
 342  0001               _hx711_ModoCambiado:
 346                     ; 14 }
 349  0001 81            	ret
 386                     ; 16 void hx711_Lectura( HX711_t* sensor )
 386                     ; 17 {
 387                     	switch	.text
 388  0002               _hx711_Lectura:
 392                     ; 19 }
 395  0002 81            	ret
 408                     	xdef	_hx711_Lectura
 409                     	xdef	_hx711_ModoCambiado
 410                     	xdef	_HX711_Init
 429                     	end
