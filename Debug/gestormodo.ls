   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  14                     	bsct
  15  0000               _gm_MEDICION:
  16  0000 01            	dc.b	1
  17  0001               _gm_CALIBRACION:
  18  0001 02            	dc.b	2
  19  0002               _gm_TARAJE:
  20  0002 04            	dc.b	4
  21  0003               _gm_RESET:
  22  0003 00            	dc.b	0
 229                     ; 16 void gm_Init( GestorModoDatos_t* gestorModoDatos )
 229                     ; 17 {
 231                     	switch	.text
 232  0000               _gm_Init:
 234  0000 89            	pushw	x
 235  0001 5203          	subw	sp,#3
 236       00000003      OFST:	set	3
 239                     ; 18 	uint8_t indice = 0;
 241  0003 0f03          	clr	(OFST+0,sp)
 243                     ; 20 	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
 246  0005 2024          	jra	L741
 247  0007               L341:
 248                     ; 22 		gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[indice]);
 251  0007 7b03          	ld	a,(OFST+0,sp)
 252  0009 97            	ld	xl,a
 253  000a a604          	ld	a,#4
 254  000c 42            	mul	x,a
 255  000d 72fb04        	addw	x,(OFST+1,sp)
 256  0010 1f01          	ldw	(OFST-2,sp),x
 258                     ; 10 	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
 260  0012 1e01          	ldw	x,(OFST-2,sp)
 261  0014 a605          	ld	a,#5
 262  0016 f7            	ld	(x),a
 263                     ; 11 	posicion->Modo = gm_RESET;
 265  0017 1e01          	ldw	x,(OFST-2,sp)
 266  0019 5c            	incw	x
 267  001a 90ae0003      	ldw	y,#_gm_RESET
 268  001e a601          	ld	a,#1
 269  0020 cd0000        	call	c_xymov
 271                     ; 12 	posicion->NotificarCambio = NULL;
 273  0023 1e01          	ldw	x,(OFST-2,sp)
 274  0025 905f          	clrw	y
 275  0027 ef02          	ldw	(2,x),y
 276                     ; 20 	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
 278  0029 0c03          	inc	(OFST+0,sp)
 280  002b               L741:
 283  002b 7b03          	ld	a,(OFST+0,sp)
 284  002d a104          	cp	a,#4
 285  002f 25d6          	jrult	L341
 286                     ; 24 }
 289  0031 5b05          	addw	sp,#5
 290  0033 81            	ret
 348                     ; 26 void gm_Registrar( uint8_t idSensor, void ( *notificarCambio )(), GestorModoDatos_t* gestorModoDatos )
 348                     ; 27 {
 349                     	switch	.text
 350  0034               _gm_Registrar:
 352  0034 88            	push	a
 353       00000000      OFST:	set	0
 356                     ; 28 	if( gm_SENSOR_VALIDO(idSensor) ) 
 358  0035 a104          	cp	a,#4
 359  0037 2438          	jruge	L112
 360                     ; 30 		if( gm_ESTA_LIBRE(gestorModoDatos->Modos[idSensor].idSensor) )
 362  0039 97            	ld	xl,a
 363  003a a604          	ld	a,#4
 364  003c 42            	mul	x,a
 365  003d 72fb06        	addw	x,(OFST+6,sp)
 366  0040 f6            	ld	a,(x)
 367  0041 a105          	cp	a,#5
 368  0043 262c          	jrne	L112
 369                     ; 32 			gestorModoDatos->Modos[idSensor].idSensor = idSensor;
 371  0045 7b01          	ld	a,(OFST+1,sp)
 372  0047 97            	ld	xl,a
 373  0048 a604          	ld	a,#4
 374  004a 42            	mul	x,a
 375  004b 72fb06        	addw	x,(OFST+6,sp)
 376  004e 7b01          	ld	a,(OFST+1,sp)
 377  0050 f7            	ld	(x),a
 378                     ; 33 			gestorModoDatos->Modos[idSensor].Modo = gm_RESET;
 380  0051 7b01          	ld	a,(OFST+1,sp)
 381  0053 97            	ld	xl,a
 382  0054 a604          	ld	a,#4
 383  0056 42            	mul	x,a
 384  0057 72fb06        	addw	x,(OFST+6,sp)
 385  005a 5c            	incw	x
 386  005b 90ae0003      	ldw	y,#_gm_RESET
 387  005f a601          	ld	a,#1
 388  0061 cd0000        	call	c_xymov
 390                     ; 34 			gestorModoDatos->Modos[idSensor].NotificarCambio = notificarCambio;
 392  0064 7b01          	ld	a,(OFST+1,sp)
 393  0066 97            	ld	xl,a
 394  0067 a604          	ld	a,#4
 395  0069 42            	mul	x,a
 396  006a 72fb06        	addw	x,(OFST+6,sp)
 397  006d 1604          	ldw	y,(OFST+4,sp)
 398  006f ef02          	ldw	(2,x),y
 400  0071               L112:
 401                     ; 46 }
 404  0071 84            	pop	a
 405  0072 81            	ret
 465                     ; 48 void gm_Borrar( uint8_t idSensor, GestorModoDatos_t* gestorModoDatos )
 465                     ; 49 {
 466                     	switch	.text
 467  0073               _gm_Borrar:
 469  0073 88            	push	a
 470  0074 89            	pushw	x
 471       00000002      OFST:	set	2
 474                     ; 50 	if( gm_SENSOR_VALIDO(idSensor) )
 476  0075 a104          	cp	a,#4
 477  0077 2420          	jruge	L152
 478                     ; 52 		gm_InicializarPosicionBuffer( &gestorModoDatos->Modos[idSensor] );
 481  0079 97            	ld	xl,a
 482  007a a604          	ld	a,#4
 483  007c 42            	mul	x,a
 484  007d 72fb06        	addw	x,(OFST+4,sp)
 485  0080 1f01          	ldw	(OFST-1,sp),x
 487                     ; 10 	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
 489  0082 1e01          	ldw	x,(OFST-1,sp)
 490  0084 a605          	ld	a,#5
 491  0086 f7            	ld	(x),a
 492                     ; 11 	posicion->Modo = gm_RESET;
 494  0087 1e01          	ldw	x,(OFST-1,sp)
 495  0089 5c            	incw	x
 496  008a 90ae0003      	ldw	y,#_gm_RESET
 497  008e a601          	ld	a,#1
 498  0090 cd0000        	call	c_xymov
 500                     ; 12 	posicion->NotificarCambio = NULL;
 502  0093 1e01          	ldw	x,(OFST-1,sp)
 503  0095 905f          	clrw	y
 504  0097 ef02          	ldw	(2,x),y
 505  0099               L152:
 506                     ; 58 }
 509  0099 5b03          	addw	sp,#3
 510  009b 81            	ret
 568                     ; 60 void gm_NuevoModo(uint8_t idSensor, Modo_t* nuevoModo, GestorModoDatos_t* gestorModoDatos)
 568                     ; 61 {
 569                     	switch	.text
 570  009c               _gm_NuevoModo:
 572  009c 88            	push	a
 573       00000000      OFST:	set	0
 576                     ; 62 	if( gm_SENSOR_VALIDO(idSensor) )
 578  009d a104          	cp	a,#4
 579  009f 2438          	jruge	L513
 580                     ; 64 		if( !gm_ESTA_LIBRE(gestorModoDatos->Modos[idSensor].idSensor) )
 582  00a1 97            	ld	xl,a
 583  00a2 a604          	ld	a,#4
 584  00a4 42            	mul	x,a
 585  00a5 72fb06        	addw	x,(OFST+6,sp)
 586  00a8 f6            	ld	a,(x)
 587  00a9 a105          	cp	a,#5
 588  00ab 272c          	jreq	L513
 589                     ; 66 			gestorModoDatos->Modos[idSensor].Modo = *nuevoModo;
 591  00ad 7b01          	ld	a,(OFST+1,sp)
 592  00af 97            	ld	xl,a
 593  00b0 a604          	ld	a,#4
 594  00b2 42            	mul	x,a
 595  00b3 72fb06        	addw	x,(OFST+6,sp)
 596  00b6 5c            	incw	x
 597  00b7 1604          	ldw	y,(OFST+4,sp)
 598  00b9 a601          	ld	a,#1
 599  00bb cd0000        	call	c_xymov
 601                     ; 68 			if( !IS_NULL(gestorModoDatos->Modos[idSensor].NotificarCambio) )
 603  00be 7b01          	ld	a,(OFST+1,sp)
 604  00c0 97            	ld	xl,a
 605  00c1 a604          	ld	a,#4
 606  00c3 42            	mul	x,a
 607  00c4 72fb06        	addw	x,(OFST+6,sp)
 608  00c7 e603          	ld	a,(3,x)
 609  00c9 ea02          	or	a,(2,x)
 610  00cb 270c          	jreq	L513
 611                     ; 70 				gestorModoDatos->Modos[idSensor].NotificarCambio();
 613  00cd 7b01          	ld	a,(OFST+1,sp)
 614  00cf 97            	ld	xl,a
 615  00d0 a604          	ld	a,#4
 616  00d2 42            	mul	x,a
 617  00d3 72fb06        	addw	x,(OFST+6,sp)
 618  00d6 ee02          	ldw	x,(2,x)
 619  00d8 fd            	call	(x)
 621  00d9               L513:
 622                     ; 82 }
 625  00d9 84            	pop	a
 626  00da 81            	ret
 650                     ; 84 void gm_NotificarCambioDummy()
 650                     ; 85 {
 651                     	switch	.text
 652  00db               _gm_NotificarCambioDummy:
 656                     ; 87 }
 659  00db 81            	ret
 714                     	xdef	_gm_NotificarCambioDummy
 715                     	xdef	_gm_NuevoModo
 716                     	xdef	_gm_Borrar
 717                     	xdef	_gm_Registrar
 718                     	xdef	_gm_Init
 719                     	xdef	_gm_RESET
 720                     	xdef	_gm_TARAJE
 721                     	xdef	_gm_CALIBRACION
 722                     	xdef	_gm_MEDICION
 723                     	xref.b	c_x
 742                     	xref	c_xymov
 743                     	end
