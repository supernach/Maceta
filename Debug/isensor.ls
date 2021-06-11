   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 316                     ; 5 void iSd_Init( iSensorDatos_t* sensor, void ( *notificacion )(), uint8_t id, GestorModo_t* gm)
 316                     ; 6 {
 318                     	switch	.text
 319  0000               _iSd_Init:
 321  0000 89            	pushw	x
 322       00000000      OFST:	set	0
 325                     ; 7 	sensor->Modo = &gm->Datos.Modos[sensor->ID].Modo;
 327  0001 f6            	ld	a,(x)
 328  0002 97            	ld	xl,a
 329  0003 a604          	ld	a,#4
 330  0005 42            	mul	x,a
 331  0006 72fb08        	addw	x,(OFST+8,sp)
 332  0009 5c            	incw	x
 333  000a 1601          	ldw	y,(OFST+1,sp)
 334  000c 90ef01        	ldw	(1,y),x
 335                     ; 8 	sensor->ID = id;
 337  000f 7b07          	ld	a,(OFST+7,sp)
 338  0011 1e01          	ldw	x,(OFST+1,sp)
 339  0013 f7            	ld	(x),a
 340                     ; 10 	gm->Registrar(id, notificacion, &gm->Datos);
 342  0014 1e08          	ldw	x,(OFST+8,sp)
 343  0016 89            	pushw	x
 344  0017 1e07          	ldw	x,(OFST+7,sp)
 345  0019 89            	pushw	x
 346  001a 7b0b          	ld	a,(OFST+11,sp)
 347  001c 1e0c          	ldw	x,(OFST+12,sp)
 348  001e ee10          	ldw	x,(16,x)
 349  0020 fd            	call	(x)
 351  0021 5b04          	addw	sp,#4
 352                     ; 11 }
 355  0023 85            	popw	x
 356  0024 81            	ret
 369                     	xdef	_iSd_Init
 388                     	end
