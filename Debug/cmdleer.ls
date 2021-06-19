   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 108                     ; 4 void cmdLeer_Init( ISensorCmd_t* cmd )
 108                     ; 5 {
 110                     	switch	.text
 111  0000               _cmdLeer_Init:
 115                     ; 6 	cmd->Execute = &cmdLeerExecute;
 117  0000 90ae0007      	ldw	y,#_cmdLeerExecute
 118  0004 ef02          	ldw	(2,x),y
 119                     ; 7 }
 122  0006 81            	ret
 565                     ; 10 void cmdLeerExecute( ISensorCmd_t* cmd, ISensorGeneral_t* sensor )
 565                     ; 11 {
 566                     	switch	.text
 567  0007               _cmdLeerExecute:
 569  0007 89            	pushw	x
 570       00000000      OFST:	set	0
 573                     ; 12 	cmd->Receiver->Operacion(sensor);
 575  0008 1e05          	ldw	x,(OFST+5,sp)
 576  000a 1601          	ldw	y,(OFST+1,sp)
 577  000c 90fe          	ldw	y,(y)
 578  000e 90fe          	ldw	y,(y)
 579  0010 90fd          	call	(y)
 581                     ; 13 }
 584  0012 85            	popw	x
 585  0013 81            	ret
 598                     	xdef	_cmdLeerExecute
 599                     	xdef	_cmdLeer_Init
 618                     	end
