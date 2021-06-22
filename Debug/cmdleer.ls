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
 197                     ; 10 void cmdLeerExecute( ISensorCmd_t* cmd, ISensorGeneral_t* sensor )
 197                     ; 11 {
 198                     	switch	.text
 199  0007               _cmdLeerExecute:
 201  0007 89            	pushw	x
 202       00000000      OFST:	set	0
 205                     ; 13 	cmd->Receiver->Exec(sensor);
 207  0008 1e05          	ldw	x,(OFST+5,sp)
 208  000a 1601          	ldw	y,(OFST+1,sp)
 209  000c 90fe          	ldw	y,(y)
 210  000e 90fe          	ldw	y,(y)
 211  0010 90fd          	call	(y)
 213                     ; 14 }
 216  0012 85            	popw	x
 217  0013 81            	ret
 230                     	xdef	_cmdLeerExecute
 231                     	xdef	_cmdLeer_Init
 250                     	end
