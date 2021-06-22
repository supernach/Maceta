   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 129                     ; 3 void ISensorCmd_Init( ISensorReceiver_t* Receiver, ISensorCmd_t* cmd, void( *Execute )() )
 129                     ; 4 {
 131                     	switch	.text
 132  0000               _ISensorCmd_Init:
 134  0000 89            	pushw	x
 135       00000000      OFST:	set	0
 138                     ; 5     cmd->Receiver = Receiver;
 140  0001 1605          	ldw	y,(OFST+5,sp)
 141  0003 90ff          	ldw	(y),x
 142                     ; 6     cmd->Execute = Execute;
 144  0005 1e05          	ldw	x,(OFST+5,sp)
 145  0007 1607          	ldw	y,(OFST+7,sp)
 146  0009 ef02          	ldw	(2,x),y
 147                     ; 7 }
 150  000b 85            	popw	x
 151  000c 81            	ret
 164                     	xdef	_ISensorCmd_Init
 183                     	end
