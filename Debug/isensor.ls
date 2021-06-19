   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 346                     ; 5 void iSd_Init( ISensor_t* sensor, void ( *notificacion )(), uint8_t id, GestorModo_t* gm)
 346                     ; 6 {
 348                     	switch	.text
 349  0000               _iSd_Init:
 351  0000 89            	pushw	x
 352       00000000      OFST:	set	0
 355                     ; 7 	sensor->Datos.Modo = &gm->Datos.Modos[sensor->Datos.ID].Modo;
 357  0001 f6            	ld	a,(x)
 358  0002 97            	ld	xl,a
 359  0003 a604          	ld	a,#4
 360  0005 42            	mul	x,a
 361  0006 72fb08        	addw	x,(OFST+8,sp)
 362  0009 5c            	incw	x
 363  000a 1601          	ldw	y,(OFST+1,sp)
 364  000c 90ef01        	ldw	(1,y),x
 365                     ; 8 	sensor->Datos.ID = id;
 367  000f 7b07          	ld	a,(OFST+7,sp)
 368  0011 1e01          	ldw	x,(OFST+1,sp)
 369  0013 f7            	ld	(x),a
 370                     ; 10 	gm->Registrar(id, notificacion, &gm->Datos);
 372  0014 1e08          	ldw	x,(OFST+8,sp)
 373  0016 89            	pushw	x
 374  0017 1e07          	ldw	x,(OFST+7,sp)
 375  0019 89            	pushw	x
 376  001a 7b0b          	ld	a,(OFST+11,sp)
 377  001c 1e0c          	ldw	x,(OFST+12,sp)
 378  001e ee10          	ldw	x,(16,x)
 379  0020 fd            	call	(x)
 381  0021 5b04          	addw	sp,#4
 382                     ; 11 }
 385  0023 85            	popw	x
 386  0024 81            	ret
 399                     	xdef	_iSd_Init
 418                     	end
