   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 221                     ; 4 void Input_Init(Pin* input)
 221                     ; 5 {
 223                     	switch	.text
 224  0000               _Input_Init:
 228                     ; 6 	GPIO_Init(input->Puerto, input->Pin, GPIO_MODE_IN_PU_NO_IT);
 230  0000 4b40          	push	#64
 231  0002 e602          	ld	a,(2,x)
 232  0004 88            	push	a
 233  0005 fe            	ldw	x,(x)
 234  0006 cd0000        	call	_GPIO_Init
 236  0009 85            	popw	x
 237                     ; 7 }
 240  000a 81            	ret
 278                     ; 9 void Input_FL_Init(Pin* input)
 278                     ; 10 {
 279                     	switch	.text
 280  000b               _Input_FL_Init:
 284                     ; 11 	GPIO_Init(input->Puerto, input->Pin, GPIO_MODE_IN_FL_NO_IT);
 286  000b 4b00          	push	#0
 287  000d e602          	ld	a,(2,x)
 288  000f 88            	push	a
 289  0010 fe            	ldw	x,(x)
 290  0011 cd0000        	call	_GPIO_Init
 292  0014 85            	popw	x
 293                     ; 12 }
 296  0015 81            	ret
 334                     ; 14 void InputInt_Init(Pin* input)
 334                     ; 15 {
 335                     	switch	.text
 336  0016               _InputInt_Init:
 340                     ; 16 	GPIO_Init(input->Puerto, input->Pin, GPIO_MODE_IN_PU_IT);
 342  0016 4b60          	push	#96
 343  0018 e602          	ld	a,(2,x)
 344  001a 88            	push	a
 345  001b fe            	ldw	x,(x)
 346  001c cd0000        	call	_GPIO_Init
 348  001f 85            	popw	x
 349                     ; 17 }
 352  0020 81            	ret
 390                     ; 19 void Output2mhz_Init(Pin* output)
 390                     ; 20 {
 391                     	switch	.text
 392  0021               _Output2mhz_Init:
 396                     ; 21 	GPIO_Init(output->Puerto, output->Pin, GPIO_MODE_OUT_PP_LOW_SLOW);
 398  0021 4bc0          	push	#192
 399  0023 e602          	ld	a,(2,x)
 400  0025 88            	push	a
 401  0026 fe            	ldw	x,(x)
 402  0027 cd0000        	call	_GPIO_Init
 404  002a 85            	popw	x
 405                     ; 22 }
 408  002b 81            	ret
 446                     ; 24 void Output10mhz_Init(Pin* output)
 446                     ; 25 {
 447                     	switch	.text
 448  002c               _Output10mhz_Init:
 452                     ; 26 	GPIO_Init(output->Puerto, output->Pin, GPIO_MODE_OUT_PP_HIGH_FAST);
 454  002c 4bf0          	push	#240
 455  002e e602          	ld	a,(2,x)
 456  0030 88            	push	a
 457  0031 fe            	ldw	x,(x)
 458  0032 cd0000        	call	_GPIO_Init
 460  0035 85            	popw	x
 461                     ; 27 }
 464  0036 81            	ret
 502                     ; 29 void Output_0(Pin* output)
 502                     ; 30 {
 503                     	switch	.text
 504  0037               _Output_0:
 508                     ; 31 	GPIO_WriteLow(output->Puerto, output->Pin);
 510  0037 e602          	ld	a,(2,x)
 511  0039 88            	push	a
 512  003a fe            	ldw	x,(x)
 513  003b cd0000        	call	_GPIO_WriteLow
 515  003e 84            	pop	a
 516                     ; 32 }
 519  003f 81            	ret
 557                     ; 34 void Output_1(Pin* output)
 557                     ; 35 {
 558                     	switch	.text
 559  0040               _Output_1:
 563                     ; 36 	GPIO_WriteHigh(output->Puerto, output->Pin);
 565  0040 e602          	ld	a,(2,x)
 566  0042 88            	push	a
 567  0043 fe            	ldw	x,(x)
 568  0044 cd0000        	call	_GPIO_WriteHigh
 570  0047 84            	pop	a
 571                     ; 37 }
 574  0048 81            	ret
 633                     ; 39 bool IsActive(Pin* input)
 633                     ; 40 {
 634                     	switch	.text
 635  0049               _IsActive:
 639                     ; 41 	if(GPIO_ReadInputPin(input->Puerto, input->Pin)) return 1;
 641  0049 e602          	ld	a,(2,x)
 642  004b 88            	push	a
 643  004c fe            	ldw	x,(x)
 644  004d cd0000        	call	_GPIO_ReadInputPin
 646  0050 5b01          	addw	sp,#1
 647  0052 4d            	tnz	a
 648  0053 2703          	jreq	L123
 651  0055 a601          	ld	a,#1
 654  0057 81            	ret
 655  0058               L123:
 656                     ; 42 	else return 0;
 658  0058 4f            	clr	a
 661  0059 81            	ret
 674                     	xdef	_IsActive
 675                     	xdef	_Output_1
 676                     	xdef	_Output_0
 677                     	xdef	_Output10mhz_Init
 678                     	xdef	_Output2mhz_Init
 679                     	xdef	_InputInt_Init
 680                     	xdef	_Input_FL_Init
 681                     	xdef	_Input_Init
 682                     	xref	_GPIO_ReadInputPin
 683                     	xref	_GPIO_WriteLow
 684                     	xref	_GPIO_WriteHigh
 685                     	xref	_GPIO_Init
 704                     	end
