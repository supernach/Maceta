   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 207                     ; 3 void gm_Init( GestorModoDatos_t* gestorModoDatos )
 207                     ; 4 {
 209                     	switch	.text
 210  0000               _gm_Init:
 212  0000 89            	pushw	x
 213  0001 88            	push	a
 214       00000001      OFST:	set	1
 217                     ; 5 	uint8_t indice = 0;
 219  0002 0f01          	clr	(OFST+0,sp)
 221                     ; 16 	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
 224  0004 200d          	jra	L731
 225  0006               L331:
 226                     ; 18 		gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[indice]);
 228  0006 7b01          	ld	a,(OFST+0,sp)
 229  0008 97            	ld	xl,a
 230  0009 a604          	ld	a,#4
 231  000b 42            	mul	x,a
 232  000c 72fb02        	addw	x,(OFST+1,sp)
 233  000f ad66          	call	L3_gm_InicializarPosicionBuffer
 235                     ; 16 	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
 237  0011 0c01          	inc	(OFST+0,sp)
 239  0013               L731:
 242  0013 7b01          	ld	a,(OFST+0,sp)
 243  0015 a104          	cp	a,#4
 244  0017 25ed          	jrult	L331
 245                     ; 20 }
 248  0019 5b03          	addw	sp,#3
 249  001b 81            	ret
 298                     ; 36 void gm_Registrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos )
 298                     ; 37 {
 299                     	switch	.text
 300  001c               _gm_Registrar:
 302  001c 89            	pushw	x
 303       00000000      OFST:	set	0
 306                     ; 38 	if( sensor->idSensor < gm_NUMERO_MAX_MODOS )
 308  001d f6            	ld	a,(x)
 309  001e a104          	cp	a,#4
 310  0020 2438          	jruge	L771
 311                     ; 40 		if( gestorModoDatos->Modos[sensor->idSensor].idSensor == ( gm_NUMERO_MAX_MODOS + 1 ) )
 313  0022 f6            	ld	a,(x)
 314  0023 97            	ld	xl,a
 315  0024 a604          	ld	a,#4
 316  0026 42            	mul	x,a
 317  0027 72fb05        	addw	x,(OFST+5,sp)
 318  002a f6            	ld	a,(x)
 319  002b a105          	cp	a,#5
 320  002d 262b          	jrne	L771
 321                     ; 42 			gestorModoDatos->Modos[sensor->idSensor] = *sensor;
 323  002f 1e01          	ldw	x,(OFST+1,sp)
 324  0031 f6            	ld	a,(x)
 325  0032 97            	ld	xl,a
 326  0033 a604          	ld	a,#4
 327  0035 42            	mul	x,a
 328  0036 72fb05        	addw	x,(OFST+5,sp)
 329  0039 1601          	ldw	y,(OFST+1,sp)
 330  003b a604          	ld	a,#4
 331  003d cd0000        	call	c_xymov
 333                     ; 43 			gestorModoDatos->Modos[sensor->idSensor].NotificarCambio( gestorModoDatos->Modos[sensor->idSensor].idSensor );
 335  0040 1e01          	ldw	x,(OFST+1,sp)
 336  0042 f6            	ld	a,(x)
 337  0043 97            	ld	xl,a
 338  0044 a604          	ld	a,#4
 339  0046 42            	mul	x,a
 340  0047 72fb05        	addw	x,(OFST+5,sp)
 341  004a f6            	ld	a,(x)
 342  004b 88            	push	a
 343  004c 1e02          	ldw	x,(OFST+2,sp)
 344  004e f6            	ld	a,(x)
 345  004f 97            	ld	xl,a
 346  0050 a604          	ld	a,#4
 347  0052 42            	mul	x,a
 348  0053 72fb06        	addw	x,(OFST+6,sp)
 349  0056 ee02          	ldw	x,(2,x)
 350  0058 84            	pop	a
 351  0059 fd            	call	(x)
 354  005a               L771:
 355                     ; 55 }
 358  005a 85            	popw	x
 359  005b 81            	ret
 409                     ; 57 void gm_Borrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos )
 409                     ; 58 {
 410                     	switch	.text
 411  005c               _gm_Borrar:
 413  005c 89            	pushw	x
 414       00000000      OFST:	set	0
 417                     ; 59 	gm_InicializarPosicionBuffer( &gestorModoDatos->Modos[sensor->idSensor] );
 419  005d f6            	ld	a,(x)
 420  005e 97            	ld	xl,a
 421  005f a604          	ld	a,#4
 422  0061 42            	mul	x,a
 423  0062 72fb05        	addw	x,(OFST+5,sp)
 424  0065 ad10          	call	L3_gm_InicializarPosicionBuffer
 426                     ; 60 }
 429  0067 85            	popw	x
 430  0068 81            	ret
 479                     ; 62 void gm_NuevoModo(ModoSensor_t* sensor, Modo_t* nuevoModo)
 479                     ; 63 {
 480                     	switch	.text
 481  0069               _gm_NuevoModo:
 483  0069 89            	pushw	x
 484       00000000      OFST:	set	0
 487                     ; 64 	sensor->Modo = *nuevoModo;
 489  006a 5c            	incw	x
 490  006b 1605          	ldw	y,(OFST+5,sp)
 491  006d a601          	ld	a,#1
 492  006f cd0000        	call	c_xymov
 494                     ; 65 }
 497  0072 85            	popw	x
 498  0073 81            	ret
 542                     ; 67 void gm_NotificarCambioDummy(uint8_t idSensor)
 542                     ; 68 {
 543                     	switch	.text
 544  0074               _gm_NotificarCambioDummy:
 546  0074 88            	push	a
 547       00000001      OFST:	set	1
 550                     ; 69 	uint8_t test = 0;
 552                     ; 71 	test = idSensor;
 554                     ; 72 }
 557  0075 84            	pop	a
 558  0076 81            	ret
 596                     ; 76 static void gm_InicializarPosicionBuffer( ModoSensor_t* posicion )
 596                     ; 77 {
 597                     	switch	.text
 598  0077               L3_gm_InicializarPosicionBuffer:
 602                     ; 78 	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
 604  0077 a605          	ld	a,#5
 605  0079 f7            	ld	(x),a
 606                     ; 79 	posicion->Modo.Medicion = 0;
 608  007a e601          	ld	a,(1,x)
 609  007c a4fe          	and	a,#254
 610  007e e701          	ld	(1,x),a
 611                     ; 80 	posicion->Modo.Calibracion = 0;
 613  0080 e601          	ld	a,(1,x)
 614  0082 a4fd          	and	a,#253
 615  0084 e701          	ld	(1,x),a
 616                     ; 81 	posicion->Modo.Taraje = 0;
 618  0086 e601          	ld	a,(1,x)
 619  0088 a4fb          	and	a,#251
 620  008a e701          	ld	(1,x),a
 621                     ; 82 	posicion->Modo.Res4 = 0;
 623  008c e601          	ld	a,(1,x)
 624  008e a4f7          	and	a,#247
 625  0090 e701          	ld	(1,x),a
 626                     ; 83 	posicion->Modo.Res5 = 0;
 628  0092 e601          	ld	a,(1,x)
 629  0094 a4ef          	and	a,#239
 630  0096 e701          	ld	(1,x),a
 631                     ; 84 	posicion->Modo.Res6 = 0;
 633  0098 e601          	ld	a,(1,x)
 634  009a a4df          	and	a,#223
 635  009c e701          	ld	(1,x),a
 636                     ; 85 	posicion->Modo.Res7 = 0;
 638  009e e601          	ld	a,(1,x)
 639  00a0 a4bf          	and	a,#191
 640  00a2 e701          	ld	(1,x),a
 641                     ; 86 	posicion->Modo.Res8 = 0;
 643  00a4 e601          	ld	a,(1,x)
 644  00a6 a47f          	and	a,#127
 645  00a8 e701          	ld	(1,x),a
 646                     ; 88 }
 649  00aa 81            	ret
 662                     	xdef	_gm_NotificarCambioDummy
 663                     	xdef	_gm_NuevoModo
 664                     	xdef	_gm_Borrar
 665                     	xdef	_gm_Registrar
 666                     	xdef	_gm_Init
 667                     	xref.b	c_x
 686                     	xref	c_xymov
 687                     	end
