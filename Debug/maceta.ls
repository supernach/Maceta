   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 557                     ; 4 void Maceta_Init( INodoInvoker_t* nodo )
 557                     ; 5 {
 559                     	switch	.text
 560  0000               _Maceta_Init:
 564                     ; 6 	nodo->ConfigCommand = &Maceta_ConfigCommand;
 566  0000 90ae000d      	ldw	y,#_Maceta_ConfigCommand
 567  0004 ef04          	ldw	(4,x),y
 568                     ; 7 	nodo->ExecuteCommand = &Maceta_ExecuteCommand;
 570  0006 90ae001d      	ldw	y,#_Maceta_ExecuteCommand
 571  000a ef06          	ldw	(6,x),y
 572                     ; 8 }
 575  000c 81            	ret
 649                     ; 10 void Maceta_ConfigCommand( INodoInvoker_t* nodo, ISensorCmd_t* command, ISensorReceiver_t* cmdRcv, ISensorGeneral_t* receiver )
 649                     ; 11 {
 650                     	switch	.text
 651  000d               _Maceta_ConfigCommand:
 653  000d 89            	pushw	x
 654       00000000      OFST:	set	0
 657                     ; 12 	nodo->command = command;
 659  000e 1605          	ldw	y,(OFST+5,sp)
 660  0010 ff            	ldw	(x),y
 661                     ; 13 	nodo->command->Receiver = cmdRcv;
 663  0011 fe            	ldw	x,(x)
 664  0012 1607          	ldw	y,(OFST+7,sp)
 665  0014 ff            	ldw	(x),y
 666                     ; 14 	nodo->receiver = receiver;
 668  0015 1e01          	ldw	x,(OFST+1,sp)
 669  0017 1609          	ldw	y,(OFST+9,sp)
 670  0019 ef02          	ldw	(2,x),y
 671                     ; 15 }
 674  001b 85            	popw	x
 675  001c 81            	ret
 713                     ; 17 void Maceta_ExecuteCommand( INodoInvoker_t* nodo )
 713                     ; 18 {
 714                     	switch	.text
 715  001d               _Maceta_ExecuteCommand:
 717  001d 89            	pushw	x
 718       00000000      OFST:	set	0
 721                     ; 19 	nodo->command->Execute(nodo->command, nodo->receiver);
 723  001e ee02          	ldw	x,(2,x)
 724  0020 89            	pushw	x
 725  0021 1e03          	ldw	x,(OFST+3,sp)
 726  0023 fe            	ldw	x,(x)
 727  0024 1603          	ldw	y,(OFST+3,sp)
 728  0026 90fe          	ldw	y,(y)
 729  0028 90ee02        	ldw	y,(2,y)
 730  002b 90fd          	call	(y)
 732  002d 85            	popw	x
 733                     ; 20 }
 736  002e 85            	popw	x
 737  002f 81            	ret
 750                     	xdef	_Maceta_ExecuteCommand
 751                     	xdef	_Maceta_ConfigCommand
 752                     	xdef	_Maceta_Init
 771                     	end
