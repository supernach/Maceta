   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 189                     ; 4 void Maceta_Init( INodoInvoker_t* nodo )
 189                     ; 5 {
 191                     	switch	.text
 192  0000               _Maceta_Init:
 196                     ; 6 	nodo->ConfigCommand = &Maceta_ConfigCommand;
 198  0000 90ae000d      	ldw	y,#_Maceta_ConfigCommand
 199  0004 ef04          	ldw	(4,x),y
 200                     ; 7 	nodo->ExecuteCommand = &Maceta_ExecuteCommand;
 202  0006 90ae001d      	ldw	y,#_Maceta_ExecuteCommand
 203  000a ef06          	ldw	(6,x),y
 204                     ; 8 }
 207  000c 81            	ret
 281                     ; 10 void Maceta_ConfigCommand( INodoInvoker_t* nodo, ISensorCmd_t* command, ISensorReceiver_t* cmdRcv, ISensorGeneral_t* receiver )
 281                     ; 11 {
 282                     	switch	.text
 283  000d               _Maceta_ConfigCommand:
 285  000d 89            	pushw	x
 286       00000000      OFST:	set	0
 289                     ; 12 	nodo->command = command;
 291  000e 1605          	ldw	y,(OFST+5,sp)
 292  0010 ff            	ldw	(x),y
 293                     ; 13 	nodo->command->Receiver = cmdRcv;
 295  0011 fe            	ldw	x,(x)
 296  0012 1607          	ldw	y,(OFST+7,sp)
 297  0014 ff            	ldw	(x),y
 298                     ; 14 	nodo->receiver = receiver;
 300  0015 1e01          	ldw	x,(OFST+1,sp)
 301  0017 1609          	ldw	y,(OFST+9,sp)
 302  0019 ef02          	ldw	(2,x),y
 303                     ; 15 }
 306  001b 85            	popw	x
 307  001c 81            	ret
 345                     ; 17 void Maceta_ExecuteCommand( INodoInvoker_t* nodo )
 345                     ; 18 {
 346                     	switch	.text
 347  001d               _Maceta_ExecuteCommand:
 349  001d 89            	pushw	x
 350       00000000      OFST:	set	0
 353                     ; 19 	nodo->command->Execute(nodo->command, nodo->receiver);
 355  001e ee02          	ldw	x,(2,x)
 356  0020 89            	pushw	x
 357  0021 1e03          	ldw	x,(OFST+3,sp)
 358  0023 fe            	ldw	x,(x)
 359  0024 1603          	ldw	y,(OFST+3,sp)
 360  0026 90fe          	ldw	y,(y)
 361  0028 90ee02        	ldw	y,(2,y)
 362  002b 90fd          	call	(y)
 364  002d 85            	popw	x
 365                     ; 20 }
 368  002e 85            	popw	x
 369  002f 81            	ret
 382                     	xdef	_Maceta_ExecuteCommand
 383                     	xdef	_Maceta_ConfigCommand
 384                     	xdef	_Maceta_Init
 403                     	end
