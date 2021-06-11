   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 307                     ; 5 void iSd_Init( iSensorDatos_t* sensor, uint8_t id, GestorModo_t* gm)
 307                     ; 6 {
 309                     	switch	.text
 310  0000               _iSd_Init:
 312  0000 89            	pushw	x
 313       00000000      OFST:	set	0
 316                     ; 7 	sensor->Modo = &gm->Datos.Modos[sensor->ID].Modo;
 318  0001 f6            	ld	a,(x)
 319  0002 97            	ld	xl,a
 320  0003 a604          	ld	a,#4
 321  0005 42            	mul	x,a
 322  0006 72fb06        	addw	x,(OFST+6,sp)
 323  0009 5c            	incw	x
 324  000a 1601          	ldw	y,(OFST+1,sp)
 325  000c 90ef01        	ldw	(1,y),x
 326                     ; 8 	gm->Registrar(id, &gm_NotificarCambioDummy, &gm->Datos);
 328  000f 1e06          	ldw	x,(OFST+6,sp)
 329  0011 89            	pushw	x
 330  0012 ae0000        	ldw	x,#_gm_NotificarCambioDummy
 331  0015 89            	pushw	x
 332  0016 7b09          	ld	a,(OFST+9,sp)
 333  0018 1e0a          	ldw	x,(OFST+10,sp)
 334  001a ee10          	ldw	x,(16,x)
 335  001c fd            	call	(x)
 337  001d 5b04          	addw	sp,#4
 338                     ; 9 }
 341  001f 85            	popw	x
 342  0020 81            	ret
 355                     	xdef	_iSd_Init
 356                     	xref	_gm_NotificarCambioDummy
 375                     	end
