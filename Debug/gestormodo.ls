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
 233  000f ad4d          	call	L3_gm_InicializarPosicionBuffer
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
 310  0020 242b          	jruge	L771
 311                     ; 31 		if( gestorModoDatos->Modos[sensor->idSensor].idSensor == ( gm_NUMERO_MAX_MODOS + 1 ) )
 313  0022 f6            	ld	a,(x)
 314  0023 97            	ld	xl,a
 315  0024 a604          	ld	a,#4
 316  0026 42            	mul	x,a
 317  0027 72fb05        	addw	x,(OFST+5,sp)
 318  002a f6            	ld	a,(x)
 319  002b a105          	cp	a,#5
 320  002d 261e          	jrne	L771
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
 333                     ; 34 			gestorModoDatos->Modos[sensor->idSensor].NotificarCambio();
 335  0040 1e01          	ldw	x,(OFST+1,sp)
 336  0042 f6            	ld	a,(x)
 337  0043 97            	ld	xl,a
 338  0044 a604          	ld	a,#4
 339  0046 42            	mul	x,a
 340  0047 72fb05        	addw	x,(OFST+5,sp)
 341  004a ee02          	ldw	x,(2,x)
 342  004c fd            	call	(x)
 345  004d               L771:
 346                     ; 46 }
 349  004d 85            	popw	x
 350  004e 81            	ret
 400                     ; 48 void gm_Borrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos )
 400                     ; 49 {
 401                     	switch	.text
 402  004f               _gm_Borrar:
 404  004f 89            	pushw	x
 405       00000000      OFST:	set	0
 408                     ; 50 	gm_InicializarPosicionBuffer( &gestorModoDatos->Modos[sensor->idSensor] );
 410  0050 f6            	ld	a,(x)
 411  0051 97            	ld	xl,a
 412  0052 a604          	ld	a,#4
 413  0054 42            	mul	x,a
 414  0055 72fb05        	addw	x,(OFST+5,sp)
 415  0058 ad04          	call	L3_gm_InicializarPosicionBuffer
 417                     ; 51 }
 420  005a 85            	popw	x
 421  005b 81            	ret
 444                     ; 53 void gm_NuevoModo()
 444                     ; 54 {
 445                     	switch	.text
 446  005c               _gm_NuevoModo:
 450                     ; 56 }
 453  005c 81            	ret
 477                     ; 58 void gm_NotificarCambioDummy(void)
 477                     ; 59 {
 478                     	switch	.text
 479  005d               _gm_NotificarCambioDummy:
 483                     ; 61 }
 486  005d 81            	ret
 524                     ; 65 static void gm_InicializarPosicionBuffer( ModoSensor_t* posicion )
 524                     ; 66 {
 525                     	switch	.text
 526  005e               L3_gm_InicializarPosicionBuffer:
 530                     ; 67 	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
 532  005e a605          	ld	a,#5
 533  0060 f7            	ld	(x),a
 534                     ; 68 	posicion->Modo.Medicion = 0;
 536  0061 e601          	ld	a,(1,x)
 537  0063 a4fe          	and	a,#254
 538  0065 e701          	ld	(1,x),a
 539                     ; 69 	posicion->Modo.Calibracion = 0;
 541  0067 e601          	ld	a,(1,x)
 542  0069 a4fd          	and	a,#253
 543  006b e701          	ld	(1,x),a
 544                     ; 70 	posicion->Modo.Taraje = 0;
 546  006d e601          	ld	a,(1,x)
 547  006f a4fb          	and	a,#251
 548  0071 e701          	ld	(1,x),a
 549                     ; 71 	posicion->Modo.Res4 = 0;
 551  0073 e601          	ld	a,(1,x)
 552  0075 a4f7          	and	a,#247
 553  0077 e701          	ld	(1,x),a
 554                     ; 72 	posicion->Modo.Res5 = 0;
 556  0079 e601          	ld	a,(1,x)
 557  007b a4ef          	and	a,#239
 558  007d e701          	ld	(1,x),a
 559                     ; 73 	posicion->Modo.Res6 = 0;
 561  007f e601          	ld	a,(1,x)
 562  0081 a4df          	and	a,#223
 563  0083 e701          	ld	(1,x),a
 564                     ; 74 	posicion->Modo.Res7 = 0;
 566  0085 e601          	ld	a,(1,x)
 567  0087 a4bf          	and	a,#191
 568  0089 e701          	ld	(1,x),a
 569                     ; 75 	posicion->Modo.Res8 = 0;
 571  008b e601          	ld	a,(1,x)
 572  008d a47f          	and	a,#127
 573  008f e701          	ld	(1,x),a
 574                     ; 77 }
 577  0091 81            	ret
 590                     	xdef	_gm_NotificarCambioDummy
 591                     	xdef	_gm_NuevoModo
 592                     	xdef	_gm_Borrar
 593                     	xdef	_gm_Registrar
 594                     	xdef	_gm_Init
 595                     	xref.b	c_x
 614                     	xref	c_xymov
 615                     	end
