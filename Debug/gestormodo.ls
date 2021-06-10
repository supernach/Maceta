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
 221                     ; 7 	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
 224  0004 200d          	jra	L731
 225  0006               L331:
 226                     ; 9 		gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[indice]);
 228  0006 7b01          	ld	a,(OFST+0,sp)
 229  0008 97            	ld	xl,a
 230  0009 a604          	ld	a,#4
 231  000b 42            	mul	x,a
 232  000c 72fb02        	addw	x,(OFST+1,sp)
 233  000f ad5c          	call	L3_gm_InicializarPosicionBuffer
 235                     ; 7 	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
 237  0011 0c01          	inc	(OFST+0,sp)
 239  0013               L731:
 242  0013 7b01          	ld	a,(OFST+0,sp)
 243  0015 a104          	cp	a,#4
 244  0017 25ed          	jrult	L331
 245                     ; 11 }
 248  0019 5b03          	addw	sp,#3
 249  001b 81            	ret
 298                     ; 27 void gm_Registrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos )
 298                     ; 28 {
 299                     	switch	.text
 300  001c               _gm_Registrar:
 302  001c 89            	pushw	x
 303       00000000      OFST:	set	0
 306                     ; 29 	if( sensor->idSensor < gm_NUMERO_MAX_MODOS )
 308  001d f6            	ld	a,(x)
 309  001e a104          	cp	a,#4
 310  0020 2438          	jruge	L771
 311                     ; 31 		if( gestorModoDatos->Modos[sensor->idSensor].idSensor == ( gm_NUMERO_MAX_MODOS + 1 ) )
 313  0022 f6            	ld	a,(x)
 314  0023 97            	ld	xl,a
 315  0024 a604          	ld	a,#4
 316  0026 42            	mul	x,a
 317  0027 72fb05        	addw	x,(OFST+5,sp)
 318  002a f6            	ld	a,(x)
 319  002b a105          	cp	a,#5
 320  002d 262b          	jrne	L771
 321                     ; 33 			gestorModoDatos->Modos[sensor->idSensor] = *sensor;
 323  002f 1e01          	ldw	x,(OFST+1,sp)
 324  0031 f6            	ld	a,(x)
 325  0032 97            	ld	xl,a
 326  0033 a604          	ld	a,#4
 327  0035 42            	mul	x,a
 328  0036 72fb05        	addw	x,(OFST+5,sp)
 329  0039 1601          	ldw	y,(OFST+1,sp)
 330  003b a604          	ld	a,#4
 331  003d cd0000        	call	c_xymov
 333                     ; 34 			gestorModoDatos->Modos[sensor->idSensor].NotificarCambio( gestorModoDatos->Modos[sensor->idSensor].idSensor );
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
 355                     ; 46 }
 358  005a 85            	popw	x
 359  005b 81            	ret
 409                     ; 48 void gm_Borrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos )
 409                     ; 49 {
 410                     	switch	.text
 411  005c               _gm_Borrar:
 413  005c 89            	pushw	x
 414       00000000      OFST:	set	0
 417                     ; 50 	gm_InicializarPosicionBuffer( &gestorModoDatos->Modos[sensor->idSensor] );
 419  005d f6            	ld	a,(x)
 420  005e 97            	ld	xl,a
 421  005f a604          	ld	a,#4
 422  0061 42            	mul	x,a
 423  0062 72fb05        	addw	x,(OFST+5,sp)
 424  0065 ad06          	call	L3_gm_InicializarPosicionBuffer
 426                     ; 51 }
 429  0067 85            	popw	x
 430  0068 81            	ret
 453                     ; 53 void gm_NuevoModo()
 453                     ; 54 {
 454                     	switch	.text
 455  0069               _gm_NuevoModo:
 459                     ; 56 }
 462  0069 81            	ret
 506                     ; 58 void gm_NotificarCambioDummy(uint8_t idSensor)
 506                     ; 59 {
 507                     	switch	.text
 508  006a               _gm_NotificarCambioDummy:
 510  006a 88            	push	a
 511       00000001      OFST:	set	1
 514                     ; 60 	uint8_t test = 0;
 516                     ; 62 	test = idSensor;
 518                     ; 63 }
 521  006b 84            	pop	a
 522  006c 81            	ret
 560                     ; 67 static void gm_InicializarPosicionBuffer( ModoSensor_t* posicion )
 560                     ; 68 {
 561                     	switch	.text
 562  006d               L3_gm_InicializarPosicionBuffer:
 566                     ; 69 	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
 568  006d a605          	ld	a,#5
 569  006f f7            	ld	(x),a
 570                     ; 70 	posicion->Modo.Medicion = 0;
 572  0070 e601          	ld	a,(1,x)
 573  0072 a4fe          	and	a,#254
 574  0074 e701          	ld	(1,x),a
 575                     ; 71 	posicion->Modo.Calibracion = 0;
 577  0076 e601          	ld	a,(1,x)
 578  0078 a4fd          	and	a,#253
 579  007a e701          	ld	(1,x),a
 580                     ; 72 	posicion->Modo.Taraje = 0;
 582  007c e601          	ld	a,(1,x)
 583  007e a4fb          	and	a,#251
 584  0080 e701          	ld	(1,x),a
 585                     ; 73 	posicion->Modo.Res4 = 0;
 587  0082 e601          	ld	a,(1,x)
 588  0084 a4f7          	and	a,#247
 589  0086 e701          	ld	(1,x),a
 590                     ; 74 	posicion->Modo.Res5 = 0;
 592  0088 e601          	ld	a,(1,x)
 593  008a a4ef          	and	a,#239
 594  008c e701          	ld	(1,x),a
 595                     ; 75 	posicion->Modo.Res6 = 0;
 597  008e e601          	ld	a,(1,x)
 598  0090 a4df          	and	a,#223
 599  0092 e701          	ld	(1,x),a
 600                     ; 76 	posicion->Modo.Res7 = 0;
 602  0094 e601          	ld	a,(1,x)
 603  0096 a4bf          	and	a,#191
 604  0098 e701          	ld	(1,x),a
 605                     ; 77 	posicion->Modo.Res8 = 0;
 607  009a e601          	ld	a,(1,x)
 608  009c a47f          	and	a,#127
 609  009e e701          	ld	(1,x),a
 610                     ; 79 }
 613  00a0 81            	ret
 626                     	xdef	_gm_NotificarCambioDummy
 627                     	xdef	_gm_NuevoModo
 628                     	xdef	_gm_Borrar
 629                     	xdef	_gm_Registrar
 630                     	xdef	_gm_Init
 631                     	xref.b	c_x
 650                     	xref	c_xymov
 651                     	end
