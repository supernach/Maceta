   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  14                     	bsct
  15  0000               _gm_Medicion:
  16  0000 01            	dc.b	1
  17  0001               _gm_Calibracion:
  18  0001 02            	dc.b	2
  19  0002               _gm_Taraje:
  20  0002 04            	dc.b	4
  21  0003               _gm_Reset:
  22  0003 00            	dc.b	0
 228                     ; 23 void gm_Init( GestorModoDatos_t* gestorModoDatos )
 228                     ; 24 {
 230                     	switch	.text
 231  0000               _gm_Init:
 233  0000 89            	pushw	x
 234  0001 5203          	subw	sp,#3
 235       00000003      OFST:	set	3
 238                     ; 25 	uint8_t indice = 0;
 240  0003 0f03          	clr	(OFST+0,sp)
 242                     ; 27 	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
 245  0005 2058          	jra	L741
 246  0007               L341:
 247                     ; 29 		gm_InicializarPosicionBuffer(&gestorModoDatos->Modos[indice]);
 250  0007 7b03          	ld	a,(OFST+0,sp)
 251  0009 97            	ld	xl,a
 252  000a a604          	ld	a,#4
 253  000c 42            	mul	x,a
 254  000d 72fb04        	addw	x,(OFST+1,sp)
 255  0010 1f01          	ldw	(OFST-2,sp),x
 257                     ; 10 	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
 259  0012 1e01          	ldw	x,(OFST-2,sp)
 260  0014 a605          	ld	a,#5
 261  0016 f7            	ld	(x),a
 262                     ; 11 	posicion->Modo.Medicion = 0;
 264  0017 1e01          	ldw	x,(OFST-2,sp)
 265  0019 e601          	ld	a,(1,x)
 266  001b a4fe          	and	a,#254
 267  001d e701          	ld	(1,x),a
 268                     ; 12 	posicion->Modo.Calibracion = 0;
 270  001f 1e01          	ldw	x,(OFST-2,sp)
 271  0021 e601          	ld	a,(1,x)
 272  0023 a4fd          	and	a,#253
 273  0025 e701          	ld	(1,x),a
 274                     ; 13 	posicion->Modo.Taraje = 0;
 276  0027 1e01          	ldw	x,(OFST-2,sp)
 277  0029 e601          	ld	a,(1,x)
 278  002b a4fb          	and	a,#251
 279  002d e701          	ld	(1,x),a
 280                     ; 14 	posicion->Modo.Res4 = 0;
 282  002f 1e01          	ldw	x,(OFST-2,sp)
 283  0031 e601          	ld	a,(1,x)
 284  0033 a4f7          	and	a,#247
 285  0035 e701          	ld	(1,x),a
 286                     ; 15 	posicion->Modo.Res5 = 0;
 288  0037 1e01          	ldw	x,(OFST-2,sp)
 289  0039 e601          	ld	a,(1,x)
 290  003b a4ef          	and	a,#239
 291  003d e701          	ld	(1,x),a
 292                     ; 16 	posicion->Modo.Res6 = 0;
 294  003f 1e01          	ldw	x,(OFST-2,sp)
 295  0041 e601          	ld	a,(1,x)
 296  0043 a4df          	and	a,#223
 297  0045 e701          	ld	(1,x),a
 298                     ; 17 	posicion->Modo.Res7 = 0;
 300  0047 1e01          	ldw	x,(OFST-2,sp)
 301  0049 e601          	ld	a,(1,x)
 302  004b a4bf          	and	a,#191
 303  004d e701          	ld	(1,x),a
 304                     ; 18 	posicion->Modo.Res8 = 0;
 306  004f 1e01          	ldw	x,(OFST-2,sp)
 307  0051 e601          	ld	a,(1,x)
 308  0053 a47f          	and	a,#127
 309  0055 e701          	ld	(1,x),a
 310                     ; 19 	posicion->NotificarCambio = NULL;
 312  0057 1e01          	ldw	x,(OFST-2,sp)
 313  0059 905f          	clrw	y
 314  005b ef02          	ldw	(2,x),y
 315                     ; 27 	for( indice; indice < gm_NUMERO_MAX_MODOS; indice++)
 317  005d 0c03          	inc	(OFST+0,sp)
 319  005f               L741:
 322  005f 7b03          	ld	a,(OFST+0,sp)
 323  0061 a104          	cp	a,#4
 324  0063 25a2          	jrult	L341
 325                     ; 31 }
 328  0065 5b05          	addw	sp,#5
 329  0067 81            	ret
 387                     ; 33 void gm_Registrar( uint8_t idSensor, void ( *notificarCambio )(), GestorModoDatos_t* gestorModoDatos )
 387                     ; 34 {
 388                     	switch	.text
 389  0068               _gm_Registrar:
 391  0068 88            	push	a
 392       00000000      OFST:	set	0
 395                     ; 35 	if( gm_SENSOR_VALIDO(idSensor) ) 
 397  0069 a104          	cp	a,#4
 398  006b 2438          	jruge	L112
 399                     ; 37 		if( gm_ESTA_LIBRE(gestorModoDatos->Modos[idSensor].idSensor) )
 401  006d 97            	ld	xl,a
 402  006e a604          	ld	a,#4
 403  0070 42            	mul	x,a
 404  0071 72fb06        	addw	x,(OFST+6,sp)
 405  0074 f6            	ld	a,(x)
 406  0075 a105          	cp	a,#5
 407  0077 262c          	jrne	L112
 408                     ; 39 			gestorModoDatos->Modos[idSensor].idSensor = idSensor;
 410  0079 7b01          	ld	a,(OFST+1,sp)
 411  007b 97            	ld	xl,a
 412  007c a604          	ld	a,#4
 413  007e 42            	mul	x,a
 414  007f 72fb06        	addw	x,(OFST+6,sp)
 415  0082 7b01          	ld	a,(OFST+1,sp)
 416  0084 f7            	ld	(x),a
 417                     ; 40 			gestorModoDatos->Modos[idSensor].Modo = gm_Reset;
 419  0085 7b01          	ld	a,(OFST+1,sp)
 420  0087 97            	ld	xl,a
 421  0088 a604          	ld	a,#4
 422  008a 42            	mul	x,a
 423  008b 72fb06        	addw	x,(OFST+6,sp)
 424  008e 5c            	incw	x
 425  008f 90ae0003      	ldw	y,#_gm_Reset
 426  0093 a601          	ld	a,#1
 427  0095 cd0000        	call	c_xymov
 429                     ; 41 			gestorModoDatos->Modos[idSensor].NotificarCambio = notificarCambio;
 431  0098 7b01          	ld	a,(OFST+1,sp)
 432  009a 97            	ld	xl,a
 433  009b a604          	ld	a,#4
 434  009d 42            	mul	x,a
 435  009e 72fb06        	addw	x,(OFST+6,sp)
 436  00a1 1604          	ldw	y,(OFST+4,sp)
 437  00a3 ef02          	ldw	(2,x),y
 439  00a5               L112:
 440                     ; 53 }
 443  00a5 84            	pop	a
 444  00a6 81            	ret
 503                     ; 55 void gm_Borrar( uint8_t idSensor, GestorModoDatos_t* gestorModoDatos )
 503                     ; 56 {
 504                     	switch	.text
 505  00a7               _gm_Borrar:
 507  00a7 88            	push	a
 508  00a8 89            	pushw	x
 509       00000002      OFST:	set	2
 512                     ; 57 	if( gm_SENSOR_VALIDO(idSensor) )
 514  00a9 a104          	cp	a,#4
 515  00ab 2454          	jruge	L152
 516                     ; 59 		gm_InicializarPosicionBuffer( &gestorModoDatos->Modos[idSensor] );
 519  00ad 97            	ld	xl,a
 520  00ae a604          	ld	a,#4
 521  00b0 42            	mul	x,a
 522  00b1 72fb06        	addw	x,(OFST+4,sp)
 523  00b4 1f01          	ldw	(OFST-1,sp),x
 525                     ; 10 	posicion->idSensor = ( gm_NUMERO_MAX_MODOS + 1 );
 527  00b6 1e01          	ldw	x,(OFST-1,sp)
 528  00b8 a605          	ld	a,#5
 529  00ba f7            	ld	(x),a
 530                     ; 11 	posicion->Modo.Medicion = 0;
 532  00bb 1e01          	ldw	x,(OFST-1,sp)
 533  00bd e601          	ld	a,(1,x)
 534  00bf a4fe          	and	a,#254
 535  00c1 e701          	ld	(1,x),a
 536                     ; 12 	posicion->Modo.Calibracion = 0;
 538  00c3 1e01          	ldw	x,(OFST-1,sp)
 539  00c5 e601          	ld	a,(1,x)
 540  00c7 a4fd          	and	a,#253
 541  00c9 e701          	ld	(1,x),a
 542                     ; 13 	posicion->Modo.Taraje = 0;
 544  00cb 1e01          	ldw	x,(OFST-1,sp)
 545  00cd e601          	ld	a,(1,x)
 546  00cf a4fb          	and	a,#251
 547  00d1 e701          	ld	(1,x),a
 548                     ; 14 	posicion->Modo.Res4 = 0;
 550  00d3 1e01          	ldw	x,(OFST-1,sp)
 551  00d5 e601          	ld	a,(1,x)
 552  00d7 a4f7          	and	a,#247
 553  00d9 e701          	ld	(1,x),a
 554                     ; 15 	posicion->Modo.Res5 = 0;
 556  00db 1e01          	ldw	x,(OFST-1,sp)
 557  00dd e601          	ld	a,(1,x)
 558  00df a4ef          	and	a,#239
 559  00e1 e701          	ld	(1,x),a
 560                     ; 16 	posicion->Modo.Res6 = 0;
 562  00e3 1e01          	ldw	x,(OFST-1,sp)
 563  00e5 e601          	ld	a,(1,x)
 564  00e7 a4df          	and	a,#223
 565  00e9 e701          	ld	(1,x),a
 566                     ; 17 	posicion->Modo.Res7 = 0;
 568  00eb 1e01          	ldw	x,(OFST-1,sp)
 569  00ed e601          	ld	a,(1,x)
 570  00ef a4bf          	and	a,#191
 571  00f1 e701          	ld	(1,x),a
 572                     ; 18 	posicion->Modo.Res8 = 0;
 574  00f3 1e01          	ldw	x,(OFST-1,sp)
 575  00f5 e601          	ld	a,(1,x)
 576  00f7 a47f          	and	a,#127
 577  00f9 e701          	ld	(1,x),a
 578                     ; 19 	posicion->NotificarCambio = NULL;
 580  00fb 1e01          	ldw	x,(OFST-1,sp)
 581  00fd 905f          	clrw	y
 582  00ff ef02          	ldw	(2,x),y
 583  0101               L152:
 584                     ; 65 }
 587  0101 5b03          	addw	sp,#3
 588  0103 81            	ret
 646                     ; 67 void gm_NuevoModo(uint8_t idSensor, Modo_t* nuevoModo, GestorModoDatos_t* gestorModoDatos)
 646                     ; 68 {
 647                     	switch	.text
 648  0104               _gm_NuevoModo:
 650  0104 88            	push	a
 651       00000000      OFST:	set	0
 654                     ; 69 	if( gm_SENSOR_VALIDO(idSensor) )
 656  0105 a104          	cp	a,#4
 657  0107 2438          	jruge	L513
 658                     ; 71 		if( !gm_ESTA_LIBRE(gestorModoDatos->Modos[idSensor].idSensor) )
 660  0109 97            	ld	xl,a
 661  010a a604          	ld	a,#4
 662  010c 42            	mul	x,a
 663  010d 72fb06        	addw	x,(OFST+6,sp)
 664  0110 f6            	ld	a,(x)
 665  0111 a105          	cp	a,#5
 666  0113 272c          	jreq	L513
 667                     ; 73 			gestorModoDatos->Modos[idSensor].Modo = *nuevoModo;
 669  0115 7b01          	ld	a,(OFST+1,sp)
 670  0117 97            	ld	xl,a
 671  0118 a604          	ld	a,#4
 672  011a 42            	mul	x,a
 673  011b 72fb06        	addw	x,(OFST+6,sp)
 674  011e 5c            	incw	x
 675  011f 1604          	ldw	y,(OFST+4,sp)
 676  0121 a601          	ld	a,#1
 677  0123 cd0000        	call	c_xymov
 679                     ; 75 			if( !IS_NULL(gestorModoDatos->Modos[idSensor].NotificarCambio) )
 681  0126 7b01          	ld	a,(OFST+1,sp)
 682  0128 97            	ld	xl,a
 683  0129 a604          	ld	a,#4
 684  012b 42            	mul	x,a
 685  012c 72fb06        	addw	x,(OFST+6,sp)
 686  012f e603          	ld	a,(3,x)
 687  0131 ea02          	or	a,(2,x)
 688  0133 270c          	jreq	L513
 689                     ; 77 				gestorModoDatos->Modos[idSensor].NotificarCambio();
 691  0135 7b01          	ld	a,(OFST+1,sp)
 692  0137 97            	ld	xl,a
 693  0138 a604          	ld	a,#4
 694  013a 42            	mul	x,a
 695  013b 72fb06        	addw	x,(OFST+6,sp)
 696  013e ee02          	ldw	x,(2,x)
 697  0140 fd            	call	(x)
 699  0141               L513:
 700                     ; 89 }
 703  0141 84            	pop	a
 704  0142 81            	ret
 728                     ; 91 void gm_NotificarCambioDummy()
 728                     ; 92 {
 729                     	switch	.text
 730  0143               _gm_NotificarCambioDummy:
 734                     ; 94 }
 737  0143 81            	ret
 792                     	xdef	_gm_NotificarCambioDummy
 793                     	xdef	_gm_NuevoModo
 794                     	xdef	_gm_Borrar
 795                     	xdef	_gm_Registrar
 796                     	xdef	_gm_Init
 797                     	xdef	_gm_Reset
 798                     	xdef	_gm_Taraje
 799                     	xdef	_gm_Calibracion
 800                     	xdef	_gm_Medicion
 801                     	xref.b	c_x
 820                     	xref	c_xymov
 821                     	end
