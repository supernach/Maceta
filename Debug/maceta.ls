   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 581                     ; 4 void Maceta_Init( INodoInvoker_t* nodo )
 581                     ; 5 {
 583                     	switch	.text
 584  0000               _Maceta_Init:
 588                     ; 6 	nodo->SetCommand = &Maceta_SetCommand;
 590  0000 90ae0013      	ldw	y,#_Maceta_SetCommand
 591  0004 ef04          	ldw	(4,x),y
 592                     ; 7 	nodo->SetReceiver = &Maceta_SetReceiver;
 594  0006 90ae0019      	ldw	y,#_Maceta_SetReceiver
 595  000a ef06          	ldw	(6,x),y
 596                     ; 8 	nodo->Execute = &Maceta_Execute;
 598  000c 90ae0020      	ldw	y,#_Maceta_Execute
 599  0010 ef08          	ldw	(8,x),y
 600                     ; 9 }
 603  0012 81            	ret
 652                     ; 11 void Maceta_SetCommand( INodoInvoker_t* nodo, ISensorCmd_t* command )
 652                     ; 12 {
 653                     	switch	.text
 654  0013               _Maceta_SetCommand:
 656  0013 89            	pushw	x
 657       00000000      OFST:	set	0
 660                     ; 13 	nodo->command = command;
 662  0014 1605          	ldw	y,(OFST+5,sp)
 663  0016 ff            	ldw	(x),y
 664                     ; 14 }
 667  0017 85            	popw	x
 668  0018 81            	ret
 717                     ; 16 void Maceta_SetReceiver( INodoInvoker_t* nodo, ISensorGeneral_t* receiver )
 717                     ; 17 {
 718                     	switch	.text
 719  0019               _Maceta_SetReceiver:
 721  0019 89            	pushw	x
 722       00000000      OFST:	set	0
 725                     ; 18 	nodo->receiver = receiver;
 727  001a 1605          	ldw	y,(OFST+5,sp)
 728  001c ef02          	ldw	(2,x),y
 729                     ; 19 }
 732  001e 85            	popw	x
 733  001f 81            	ret
 770                     ; 21 void Maceta_Execute( INodoInvoker_t* nodo )
 770                     ; 22 {
 771                     	switch	.text
 772  0020               _Maceta_Execute:
 774  0020 89            	pushw	x
 775       00000000      OFST:	set	0
 778                     ; 23 	nodo->command->Execute(nodo->command, nodo->receiver);
 780  0021 ee02          	ldw	x,(2,x)
 781  0023 89            	pushw	x
 782  0024 1e03          	ldw	x,(OFST+3,sp)
 783  0026 fe            	ldw	x,(x)
 784  0027 1603          	ldw	y,(OFST+3,sp)
 785  0029 90fe          	ldw	y,(y)
 786  002b 90ee04        	ldw	y,(4,y)
 787  002e 90fd          	call	(y)
 789  0030 85            	popw	x
 790                     ; 24 }
 793  0031 85            	popw	x
 794  0032 81            	ret
 807                     	xdef	_Maceta_Execute
 808                     	xdef	_Maceta_SetReceiver
 809                     	xdef	_Maceta_SetCommand
 810                     	xdef	_Maceta_Init
 829                     	end
