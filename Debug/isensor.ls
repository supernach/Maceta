   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 318                     ; 5 void iSd_Init( iSensorDatos_t* sensor, void ( *notificacion )(), uint8_t id, GestorModo_t* gm)
 318                     ; 6 {
 320                     	switch	.text
 321  0000               _iSd_Init:
 323  0000 89            	pushw	x
 324       00000000      OFST:	set	0
 327                     ; 7 	sensor->Modo = &gm->Datos.Modos[sensor->ID].Modo;
 329  0001 f6            	ld	a,(x)
 330  0002 97            	ld	xl,a
 331  0003 a604          	ld	a,#4
 332  0005 42            	mul	x,a
 333  0006 72fb08        	addw	x,(OFST+8,sp)
 334  0009 5c            	incw	x
 335  000a 1601          	ldw	y,(OFST+1,sp)
 336  000c 90ef01        	ldw	(1,y),x
 337                     ; 8 	sensor->ID = id;
 339  000f 7b07          	ld	a,(OFST+7,sp)
 340  0011 1e01          	ldw	x,(OFST+1,sp)
 341  0013 f7            	ld	(x),a
 342                     ; 10 	gm->Registrar(id, notificacion, &gm->Datos);
 344  0014 1e08          	ldw	x,(OFST+8,sp)
 345  0016 89            	pushw	x
 346  0017 1e07          	ldw	x,(OFST+7,sp)
 347  0019 89            	pushw	x
 348  001a 7b0b          	ld	a,(OFST+11,sp)
 349  001c 1e0c          	ldw	x,(OFST+12,sp)
 350  001e ee10          	ldw	x,(16,x)
 351  0020 fd            	call	(x)
 353  0021 5b04          	addw	sp,#4
 354                     ; 11 }
 357  0023 85            	popw	x
 358  0024 81            	ret
 371                     	xdef	_iSd_Init
 390                     	end
