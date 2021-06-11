   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 246                     ; 5 void Init( SensorPrueba_t* sensor, GestorModoDatos_t* datos)
 246                     ; 6 {
 248                     	switch	.text
 249  0000               _Init:
 251  0000 89            	pushw	x
 252       00000000      OFST:	set	0
 255                     ; 7 	sensor->Modo = &datos->Modos[sensor->ID].Modo;
 257  0001 f6            	ld	a,(x)
 258  0002 97            	ld	xl,a
 259  0003 a604          	ld	a,#4
 260  0005 42            	mul	x,a
 261  0006 72fb05        	addw	x,(OFST+5,sp)
 262  0009 5c            	incw	x
 263  000a 1601          	ldw	y,(OFST+1,sp)
 264  000c 90ef01        	ldw	(1,y),x
 265                     ; 8 }
 268  000f 85            	popw	x
 269  0010 81            	ret
 282                     	xdef	_Init
 301                     	end
