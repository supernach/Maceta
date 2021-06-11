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
 231                     ; 16 void gm_Init( GestorModoDatos_t* gestorModoDatos )
 231                     ; 17 {
 233                     	switch	.text
 234  0000               _gm_Init:
 236  0000 89            	pushw	x
 237  0001 5203          	subw	sp,#3
 238       00000003      OFST:	set	3
 241                     ; 18 	uint8_t indice = 0;
 243  0003 0f03          	clr	(OFST+0,sp)
 245                     ; 20 	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
 248  0005 2024          	jra	L551
 249  0007               L151:
 250                     ; 22 		gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[indice]);
 253  0007 7b03          	ld	a,(OFST+0,sp)
 254  0009 97            	ld	xl,a
 255  000a a604          	ld	a,#4
 256  000c 42            	mul	x,a
 257  000d 72fb04        	addw	x,(OFST+1,sp)
 258  0010 1f01          	ldw	(OFST-2,sp),x
 260                     ; 10 	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
 262  0012 1e01          	ldw	x,(OFST-2,sp)
 263  0014 a605          	ld	a,#5
 264  0016 f7            	ld	(x),a
 265                     ; 11 	posicion->Modo = gm_RESET;
 267  0017 1e01          	ldw	x,(OFST-2,sp)
 268  0019 5c            	incw	x
 269  001a 90ae0003      	ldw	y,#_gm_RESET
 270  001e a601          	ld	a,#1
 271  0020 cd0000        	call	c_xymov
 273                     ; 12 	posicion->NotificarCambio = NULL;
 275  0023 1e01          	ldw	x,(OFST-2,sp)
 276  0025 905f          	clrw	y
 277  0027 ef02          	ldw	(2,x),y
 278                     ; 20 	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
 280  0029 0c03          	inc	(OFST+0,sp)
 282  002b               L551:
 285  002b 7b03          	ld	a,(OFST+0,sp)
 286  002d a104          	cp	a,#4
 287  002f 25d6          	jrult	L151
 288                     ; 24 }
 291  0031 5b05          	addw	sp,#5
 292  0033 81            	ret
 350                     ; 26 void gm_Registrar( uint8_t idSensor, void ( *notificarCambio )(), GestorModoDatos_t* gestorModoDatos )
 350                     ; 27 {
 351                     	switch	.text
 352  0034               _gm_Registrar:
 354  0034 88            	push	a
 355       00000000      OFST:	set	0
 358                     ; 28 	if( gm_SENSOR_VALIDO(idSensor) ) 
 360  0035 a104          	cp	a,#4
 361  0037 2444          	jruge	L712
 362                     ; 30 		if( gm_ESTA_LIBRE(gestorModoDatos->Modos[idSensor].idSensor) )
 364  0039 97            	ld	xl,a
 365  003a a604          	ld	a,#4
 366  003c 42            	mul	x,a
 367  003d 72fb06        	addw	x,(OFST+6,sp)
 368  0040 f6            	ld	a,(x)
 369  0041 a105          	cp	a,#5
 370  0043 262c          	jrne	L512
 371                     ; 32 			gestorModoDatos->Modos[idSensor].idSensor = idSensor;
 373  0045 7b01          	ld	a,(OFST+1,sp)
 374  0047 97            	ld	xl,a
 375  0048 a604          	ld	a,#4
 376  004a 42            	mul	x,a
 377  004b 72fb06        	addw	x,(OFST+6,sp)
 378  004e 7b01          	ld	a,(OFST+1,sp)
 379  0050 f7            	ld	(x),a
 380                     ; 33 			gestorModoDatos->Modos[idSensor].Modo = gm_RESET;
 382  0051 7b01          	ld	a,(OFST+1,sp)
 383  0053 97            	ld	xl,a
 384  0054 a604          	ld	a,#4
 385  0056 42            	mul	x,a
 386  0057 72fb06        	addw	x,(OFST+6,sp)
 387  005a 5c            	incw	x
 388  005b 90ae0003      	ldw	y,#_gm_RESET
 389  005f a601          	ld	a,#1
 390  0061 cd0000        	call	c_xymov
 392                     ; 34 			gestorModoDatos->Modos[idSensor].NotificarCambio = notificarCambio;
 394  0064 7b01          	ld	a,(OFST+1,sp)
 395  0066 97            	ld	xl,a
 396  0067 a604          	ld	a,#4
 397  0069 42            	mul	x,a
 398  006a 72fb06        	addw	x,(OFST+6,sp)
 399  006d 1604          	ldw	y,(OFST+4,sp)
 400  006f ef02          	ldw	(2,x),y
 402  0071               L512:
 403                     ; 41 		gestorModoDatos->Modos[idSensor].NotificarCambio();
 405  0071 7b01          	ld	a,(OFST+1,sp)
 406  0073 97            	ld	xl,a
 407  0074 a604          	ld	a,#4
 408  0076 42            	mul	x,a
 409  0077 72fb06        	addw	x,(OFST+6,sp)
 410  007a ee02          	ldw	x,(2,x)
 411  007c fd            	call	(x)
 414  007d               L712:
 415                     ; 48 }
 418  007d 84            	pop	a
 419  007e 81            	ret
 479                     ; 50 void gm_Borrar( uint8_t idSensor, GestorModoDatos_t* gestorModoDatos )
 479                     ; 51 {
 480                     	switch	.text
 481  007f               _gm_Borrar:
 483  007f 88            	push	a
 484  0080 89            	pushw	x
 485       00000002      OFST:	set	2
 488                     ; 52 	if( gm_SENSOR_VALIDO(idSensor) )
 490  0081 a104          	cp	a,#4
 491  0083 2420          	jruge	L752
 492                     ; 54 		gm_InicializarPosicionBuffer( &gestorModoDatos->Modos[idSensor] );
 495  0085 97            	ld	xl,a
 496  0086 a604          	ld	a,#4
 497  0088 42            	mul	x,a
 498  0089 72fb06        	addw	x,(OFST+4,sp)
 499  008c 1f01          	ldw	(OFST-1,sp),x
 501                     ; 10 	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
 503  008e 1e01          	ldw	x,(OFST-1,sp)
 504  0090 a605          	ld	a,#5
 505  0092 f7            	ld	(x),a
 506                     ; 11 	posicion->Modo = gm_RESET;
 508  0093 1e01          	ldw	x,(OFST-1,sp)
 509  0095 5c            	incw	x
 510  0096 90ae0003      	ldw	y,#_gm_RESET
 511  009a a601          	ld	a,#1
 512  009c cd0000        	call	c_xymov
 514                     ; 12 	posicion->NotificarCambio = NULL;
 516  009f 1e01          	ldw	x,(OFST-1,sp)
 517  00a1 905f          	clrw	y
 518  00a3 ef02          	ldw	(2,x),y
 519  00a5               L752:
 520                     ; 60 }
 523  00a5 5b03          	addw	sp,#3
 524  00a7 81            	ret
 582                     ; 62 void gm_NuevoModo(uint8_t idSensor, Modo_t* nuevoModo, GestorModoDatos_t* gestorModoDatos)
 582                     ; 63 {
 583                     	switch	.text
 584  00a8               _gm_NuevoModo:
 586  00a8 88            	push	a
 587       00000000      OFST:	set	0
 590                     ; 64 	if( gm_SENSOR_VALIDO(idSensor) )
 592  00a9 a104          	cp	a,#4
 593  00ab 2438          	jruge	L323
 594                     ; 66 		if( !gm_ESTA_LIBRE(gestorModoDatos->Modos[idSensor].idSensor) )
 596  00ad 97            	ld	xl,a
 597  00ae a604          	ld	a,#4
 598  00b0 42            	mul	x,a
 599  00b1 72fb06        	addw	x,(OFST+6,sp)
 600  00b4 f6            	ld	a,(x)
 601  00b5 a105          	cp	a,#5
 602  00b7 272c          	jreq	L323
 603                     ; 68 			gestorModoDatos->Modos[idSensor].Modo = *nuevoModo;
 605  00b9 7b01          	ld	a,(OFST+1,sp)
 606  00bb 97            	ld	xl,a
 607  00bc a604          	ld	a,#4
 608  00be 42            	mul	x,a
 609  00bf 72fb06        	addw	x,(OFST+6,sp)
 610  00c2 5c            	incw	x
 611  00c3 1604          	ldw	y,(OFST+4,sp)
 612  00c5 a601          	ld	a,#1
 613  00c7 cd0000        	call	c_xymov
 615                     ; 70 			if( !IS_NULL(gestorModoDatos->Modos[idSensor].NotificarCambio) )
 617  00ca 7b01          	ld	a,(OFST+1,sp)
 618  00cc 97            	ld	xl,a
 619  00cd a604          	ld	a,#4
 620  00cf 42            	mul	x,a
 621  00d0 72fb06        	addw	x,(OFST+6,sp)
 622  00d3 e603          	ld	a,(3,x)
 623  00d5 ea02          	or	a,(2,x)
 624  00d7 270c          	jreq	L323
 625                     ; 72 				gestorModoDatos->Modos[idSensor].NotificarCambio();
 627  00d9 7b01          	ld	a,(OFST+1,sp)
 628  00db 97            	ld	xl,a
 629  00dc a604          	ld	a,#4
 630  00de 42            	mul	x,a
 631  00df 72fb06        	addw	x,(OFST+6,sp)
 632  00e2 ee02          	ldw	x,(2,x)
 633  00e4 fd            	call	(x)
 635  00e5               L323:
 636                     ; 84 }
 639  00e5 84            	pop	a
 640  00e6 81            	ret
 664                     ; 86 void gm_NotificarCambioDummy()
 664                     ; 87 {
 665                     	switch	.text
 666  00e7               _gm_NotificarCambioDummy:
 670                     ; 89 }
 673  00e7 81            	ret
 728                     	xdef	_gm_NotificarCambioDummy
 729                     	xdef	_gm_NuevoModo
 730                     	xdef	_gm_Borrar
 731                     	xdef	_gm_Registrar
 732                     	xdef	_gm_Init
 733                     	xdef	_gm_RESET
 734                     	xdef	_gm_TARAJE
 735                     	xdef	_gm_CALIBRACION
 736                     	xdef	_gm_MEDICION
 737                     	xref.b	c_x
 756                     	xref	c_xymov
 757                     	end
