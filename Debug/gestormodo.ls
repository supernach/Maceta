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
 359  0037 2444          	jruge	L112
 360                     ; 30 		if( gm_ESTA_LIBRE(gestorModoDatos->Modos[idSensor].idSensor) )
 362  0039 97            	ld	xl,a
 363  003a a604          	ld	a,#4
 364  003c 42            	mul	x,a
 365  003d 72fb06        	addw	x,(OFST+6,sp)
 366  0040 f6            	ld	a,(x)
 367  0041 a105          	cp	a,#5
 368  0043 262c          	jrne	L702
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
 400  0071               L702:
 401                     ; 41 		gestorModoDatos->Modos[idSensor].NotificarCambio();
 403  0071 7b01          	ld	a,(OFST+1,sp)
 404  0073 97            	ld	xl,a
 405  0074 a604          	ld	a,#4
 406  0076 42            	mul	x,a
 407  0077 72fb06        	addw	x,(OFST+6,sp)
 408  007a ee02          	ldw	x,(2,x)
 409  007c fd            	call	(x)
 412  007d               L112:
 413                     ; 48 }
 416  007d 84            	pop	a
 417  007e 81            	ret
 477                     ; 50 void gm_Borrar( uint8_t idSensor, GestorModoDatos_t* gestorModoDatos )
 477                     ; 51 {
 478                     	switch	.text
 479  007f               _gm_Borrar:
 481  007f 88            	push	a
 482  0080 89            	pushw	x
 483       00000002      OFST:	set	2
 486                     ; 52 	if( gm_SENSOR_VALIDO(idSensor) )
 488  0081 a104          	cp	a,#4
 489  0083 2420          	jruge	L152
 490                     ; 54 		gm_InicializarPosicionBuffer( &gestorModoDatos->Modos[idSensor] );
 493  0085 97            	ld	xl,a
 494  0086 a604          	ld	a,#4
 495  0088 42            	mul	x,a
 496  0089 72fb06        	addw	x,(OFST+4,sp)
 497  008c 1f01          	ldw	(OFST-1,sp),x
 499                     ; 10 	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
 501  008e 1e01          	ldw	x,(OFST-1,sp)
 502  0090 a605          	ld	a,#5
 503  0092 f7            	ld	(x),a
 504                     ; 11 	posicion->Modo = gm_RESET;
 506  0093 1e01          	ldw	x,(OFST-1,sp)
 507  0095 5c            	incw	x
 508  0096 90ae0003      	ldw	y,#_gm_RESET
 509  009a a601          	ld	a,#1
 510  009c cd0000        	call	c_xymov
 512                     ; 12 	posicion->NotificarCambio = NULL;
 514  009f 1e01          	ldw	x,(OFST-1,sp)
 515  00a1 905f          	clrw	y
 516  00a3 ef02          	ldw	(2,x),y
 517  00a5               L152:
 518                     ; 60 }
 521  00a5 5b03          	addw	sp,#3
 522  00a7 81            	ret
 580                     ; 62 void gm_NuevoModo(uint8_t idSensor, Modo_t* nuevoModo, GestorModoDatos_t* gestorModoDatos)
 580                     ; 63 {
 581                     	switch	.text
 582  00a8               _gm_NuevoModo:
 584  00a8 88            	push	a
 585       00000000      OFST:	set	0
 588                     ; 64 	if( gm_SENSOR_VALIDO(idSensor) )
 590  00a9 a104          	cp	a,#4
 591  00ab 2438          	jruge	L513
 592                     ; 66 		if( !gm_ESTA_LIBRE(gestorModoDatos->Modos[idSensor].idSensor) )
 594  00ad 97            	ld	xl,a
 595  00ae a604          	ld	a,#4
 596  00b0 42            	mul	x,a
 597  00b1 72fb06        	addw	x,(OFST+6,sp)
 598  00b4 f6            	ld	a,(x)
 599  00b5 a105          	cp	a,#5
 600  00b7 272c          	jreq	L513
 601                     ; 68 			gestorModoDatos->Modos[idSensor].Modo = *nuevoModo;
 603  00b9 7b01          	ld	a,(OFST+1,sp)
 604  00bb 97            	ld	xl,a
 605  00bc a604          	ld	a,#4
 606  00be 42            	mul	x,a
 607  00bf 72fb06        	addw	x,(OFST+6,sp)
 608  00c2 5c            	incw	x
 609  00c3 1604          	ldw	y,(OFST+4,sp)
 610  00c5 a601          	ld	a,#1
 611  00c7 cd0000        	call	c_xymov
 613                     ; 70 			if( !IS_NULL(gestorModoDatos->Modos[idSensor].NotificarCambio) )
 615  00ca 7b01          	ld	a,(OFST+1,sp)
 616  00cc 97            	ld	xl,a
 617  00cd a604          	ld	a,#4
 618  00cf 42            	mul	x,a
 619  00d0 72fb06        	addw	x,(OFST+6,sp)
 620  00d3 e603          	ld	a,(3,x)
 621  00d5 ea02          	or	a,(2,x)
 622  00d7 270c          	jreq	L513
 623                     ; 72 				gestorModoDatos->Modos[idSensor].NotificarCambio();
 625  00d9 7b01          	ld	a,(OFST+1,sp)
 626  00db 97            	ld	xl,a
 627  00dc a604          	ld	a,#4
 628  00de 42            	mul	x,a
 629  00df 72fb06        	addw	x,(OFST+6,sp)
 630  00e2 ee02          	ldw	x,(2,x)
 631  00e4 fd            	call	(x)
 633  00e5               L513:
 634                     ; 84 }
 637  00e5 84            	pop	a
 638  00e6 81            	ret
 662                     ; 86 void gm_NotificarCambioDummy()
 662                     ; 87 {
 663                     	switch	.text
 664  00e7               _gm_NotificarCambioDummy:
 668                     ; 89 }
 671  00e7 81            	ret
 726                     	xdef	_gm_NotificarCambioDummy
 727                     	xdef	_gm_NuevoModo
 728                     	xdef	_gm_Borrar
 729                     	xdef	_gm_Registrar
 730                     	xdef	_gm_Init
 731                     	xdef	_gm_RESET
 732                     	xdef	_gm_TARAJE
 733                     	xdef	_gm_CALIBRACION
 734                     	xdef	_gm_MEDICION
 735                     	xref.b	c_x
 754                     	xref	c_xymov
 755                     	end
