   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 121                     ; 4 void cmdLeer_Init( ISensorCmd_t* cmd )
 121                     ; 5 {
 123                     	switch	.text
 124  0000               _cmdLeer_Init:
 128                     ; 6 	cmd->SetReceiver = &cmdSetReceiver;
 130  0000 90ae000d      	ldw	y,#_cmdSetReceiver
 131  0004 ef02          	ldw	(2,x),y
 132                     ; 7 	cmd->Execute = &cmdLeerExecute;
 134  0006 90ae0013      	ldw	y,#_cmdLeerExecute
 135  000a ef04          	ldw	(4,x),y
 136                     ; 8 }
 139  000c 81            	ret
 188                     ; 10 void cmdSetReceiver( ISensorCmd_t* cmd, ISensorReceiver_t* rcv )
 188                     ; 11 {
 189                     	switch	.text
 190  000d               _cmdSetReceiver:
 192  000d 89            	pushw	x
 193       00000000      OFST:	set	0
 196                     ; 12 	cmd->Receiver = rcv;
 198  000e 1605          	ldw	y,(OFST+5,sp)
 199  0010 ff            	ldw	(x),y
 200                     ; 13 }
 203  0011 85            	popw	x
 204  0012 81            	ret
 647                     ; 15 void cmdLeerExecute( ISensorCmd_t* cmd, ISensorGeneral_t* sensor )
 647                     ; 16 {
 648                     	switch	.text
 649  0013               _cmdLeerExecute:
 651  0013 89            	pushw	x
 652       00000000      OFST:	set	0
 655                     ; 18 	cmd->Receiver->Operacion(sensor);
 657  0014 1e05          	ldw	x,(OFST+5,sp)
 658  0016 1601          	ldw	y,(OFST+1,sp)
 659  0018 90fe          	ldw	y,(y)
 660  001a 90fe          	ldw	y,(y)
 661  001c 90fd          	call	(y)
 663                     ; 19 }
 666  001e 85            	popw	x
 667  001f 81            	ret
 680                     	xdef	_cmdLeerExecute
 681                     	xdef	_cmdSetReceiver
 682                     	xdef	_cmdLeer_Init
 701                     	end
