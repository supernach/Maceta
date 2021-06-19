   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 140                     ; 3 void ISensorCmd_Init( ISensorReceiver_t* Receiver, ISensorCmd_t* cmd, void( *Execute )() )
 140                     ; 4 {
 142                     	switch	.text
 143  0000               _ISensorCmd_Init:
 145  0000 89            	pushw	x
 146       00000000      OFST:	set	0
 149                     ; 5     cmd->Receiver = Receiver;
 151  0001 1605          	ldw	y,(OFST+5,sp)
 152  0003 90ff          	ldw	(y),x
 153                     ; 6     cmd->Execute = Execute;
 155  0005 1e05          	ldw	x,(OFST+5,sp)
 156  0007 1607          	ldw	y,(OFST+7,sp)
 157  0009 ef04          	ldw	(4,x),y
 158                     ; 7 }
 161  000b 85            	popw	x
 162  000c 81            	ret
 175                     	xdef	_ISensorCmd_Init
 194                     	end
