   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 198                     ; 3 void gm_Init( GestorModoDatos_t* gestorModoDatos )
 198                     ; 4 {
 200                     	switch	.text
 201  0000               _gm_Init:
 203  0000 89            	pushw	x
 204       00000000      OFST:	set	0
 207                     ; 5 	gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[0]);
 209  0001 ad59          	call	L3_gm_InicializarPosicionBuffer
 211                     ; 6 	gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[1]);
 213  0003 1e01          	ldw	x,(OFST+1,sp)
 214  0005 1c0004        	addw	x,#4
 215  0008 ad52          	call	L3_gm_InicializarPosicionBuffer
 217                     ; 7 	gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[2]);
 219  000a 1e01          	ldw	x,(OFST+1,sp)
 220  000c 1c0008        	addw	x,#8
 221  000f ad4b          	call	L3_gm_InicializarPosicionBuffer
 223                     ; 8 	gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[3]);
 225  0011 1e01          	ldw	x,(OFST+1,sp)
 226  0013 1c000c        	addw	x,#12
 227  0016 ad44          	call	L3_gm_InicializarPosicionBuffer
 229                     ; 10 }
 232  0018 85            	popw	x
 233  0019 81            	ret
 282                     ; 26 void gm_Registrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos )
 282                     ; 27 {
 283                     	switch	.text
 284  001a               _gm_Registrar:
 286  001a 89            	pushw	x
 287       00000000      OFST:	set	0
 290                     ; 28 	if( sensor->idSensor < NUMERO_MAX_MODOS )
 292  001b f6            	ld	a,(x)
 293  001c a104          	cp	a,#4
 294  001e 242b          	jruge	L361
 295                     ; 30 		if( gestorModoDatos->Modos[sensor->idSensor].idSensor == ( NUMERO_MAX_MODOS + 1 ) )
 297  0020 f6            	ld	a,(x)
 298  0021 97            	ld	xl,a
 299  0022 a604          	ld	a,#4
 300  0024 42            	mul	x,a
 301  0025 72fb05        	addw	x,(OFST+5,sp)
 302  0028 f6            	ld	a,(x)
 303  0029 a105          	cp	a,#5
 304  002b 261e          	jrne	L361
 305                     ; 32 			gestorModoDatos->Modos[sensor->idSensor] = *sensor;
 307  002d 1e01          	ldw	x,(OFST+1,sp)
 308  002f f6            	ld	a,(x)
 309  0030 97            	ld	xl,a
 310  0031 a604          	ld	a,#4
 311  0033 42            	mul	x,a
 312  0034 72fb05        	addw	x,(OFST+5,sp)
 313  0037 1601          	ldw	y,(OFST+1,sp)
 314  0039 a604          	ld	a,#4
 315  003b cd0000        	call	c_xymov
 317                     ; 33 			gestorModoDatos->Modos[sensor->idSensor].NotificarCambio();
 319  003e 1e01          	ldw	x,(OFST+1,sp)
 320  0040 f6            	ld	a,(x)
 321  0041 97            	ld	xl,a
 322  0042 a604          	ld	a,#4
 323  0044 42            	mul	x,a
 324  0045 72fb05        	addw	x,(OFST+5,sp)
 325  0048 ee02          	ldw	x,(2,x)
 326  004a fd            	call	(x)
 329  004b               L361:
 330                     ; 45 }
 333  004b 85            	popw	x
 334  004c 81            	ret
 384                     ; 47 void gm_Borrar( ModoSensor_t* sensor, GestorModoDatos_t* gestorModoDatos )
 384                     ; 48 {
 385                     	switch	.text
 386  004d               _gm_Borrar:
 388  004d 89            	pushw	x
 389       00000000      OFST:	set	0
 392                     ; 49 	gm_InicializarPosicionBuffer( &gestorModoDatos->Modos[sensor->idSensor] );
 394  004e f6            	ld	a,(x)
 395  004f 97            	ld	xl,a
 396  0050 a604          	ld	a,#4
 397  0052 42            	mul	x,a
 398  0053 72fb05        	addw	x,(OFST+5,sp)
 399  0056 ad04          	call	L3_gm_InicializarPosicionBuffer
 401                     ; 50 }
 404  0058 85            	popw	x
 405  0059 81            	ret
 428                     ; 52 void gm_NuevoModo()
 428                     ; 53 {
 429                     	switch	.text
 430  005a               _gm_NuevoModo:
 434                     ; 55 }
 437  005a 81            	ret
 461                     ; 57 void gm_NotificarCambioDummy(void)
 461                     ; 58 {
 462                     	switch	.text
 463  005b               _gm_NotificarCambioDummy:
 467                     ; 60 }
 470  005b 81            	ret
 508                     ; 64 void gm_InicializarPosicionBuffer( ModoSensor_t* posicion )
 508                     ; 65 {
 509                     	switch	.text
 510  005c               L3_gm_InicializarPosicionBuffer:
 514                     ; 66 	posicion->idSensor = ( NUMERO_MAX_MODOS + 1 );
 516  005c a605          	ld	a,#5
 517  005e f7            	ld	(x),a
 518                     ; 67 	posicion->Modo.Medicion = 0;
 520  005f e601          	ld	a,(1,x)
 521  0061 a4fe          	and	a,#254
 522  0063 e701          	ld	(1,x),a
 523                     ; 68 	posicion->Modo.Calibracion = 0;
 525  0065 e601          	ld	a,(1,x)
 526  0067 a4fd          	and	a,#253
 527  0069 e701          	ld	(1,x),a
 528                     ; 69 	posicion->Modo.Taraje = 0;
 530  006b e601          	ld	a,(1,x)
 531  006d a4fb          	and	a,#251
 532  006f e701          	ld	(1,x),a
 533                     ; 70 	posicion->Modo.Res4 = 0;
 535  0071 e601          	ld	a,(1,x)
 536  0073 a4f7          	and	a,#247
 537  0075 e701          	ld	(1,x),a
 538                     ; 71 	posicion->Modo.Res5 = 0;
 540  0077 e601          	ld	a,(1,x)
 541  0079 a4ef          	and	a,#239
 542  007b e701          	ld	(1,x),a
 543                     ; 72 	posicion->Modo.Res6 = 0;
 545  007d e601          	ld	a,(1,x)
 546  007f a4df          	and	a,#223
 547  0081 e701          	ld	(1,x),a
 548                     ; 73 	posicion->Modo.Res7 = 0;
 550  0083 e601          	ld	a,(1,x)
 551  0085 a4bf          	and	a,#191
 552  0087 e701          	ld	(1,x),a
 553                     ; 74 	posicion->Modo.Res8 = 0;
 555  0089 e601          	ld	a,(1,x)
 556  008b a47f          	and	a,#127
 557  008d e701          	ld	(1,x),a
 558                     ; 76 }
 561  008f 81            	ret
 574                     	xdef	_gm_NotificarCambioDummy
 575                     	xdef	_gm_NuevoModo
 576                     	xdef	_gm_Borrar
 577                     	xdef	_gm_Registrar
 578                     	xdef	_gm_Init
 579                     	xref.b	c_x
 598                     	xref	c_xymov
 599                     	end
