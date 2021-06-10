   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 313                     ; 163 int main()
 313                     ; 164 {
 315                     	switch	.text
 316  0000               _main:
 318  0000 89            	pushw	x
 319       00000002      OFST:	set	2
 322                     ; 31 	GPIO_DeInit(GPIOA);
 326  0001 ae5000        	ldw	x,#20480
 327  0004 cd0000        	call	_GPIO_DeInit
 329                     ; 32 	GPIO_DeInit(GPIOB);
 331  0007 ae5005        	ldw	x,#20485
 332  000a cd0000        	call	_GPIO_DeInit
 334                     ; 33 	GPIO_DeInit(GPIOC);
 336  000d ae500a        	ldw	x,#20490
 337  0010 cd0000        	call	_GPIO_DeInit
 339                     ; 34 	GPIO_DeInit(GPIOD);
 341  0013 ae500f        	ldw	x,#20495
 342  0016 cd0000        	call	_GPIO_DeInit
 344                     ; 72 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 347  0019 ae0080        	ldw	x,#128
 348  001c cd0000        	call	_Clock_HSI_Init
 350  001f               L771:
 351                     ; 83 	testSensor.idSensor = 0;
 355  001f 3f08          	clr	_testSensor
 356                     ; 84 	testSensor.Modo.Medicion = true;
 358  0021 72100009      	bset	_testSensor+1,#0
 359                     ; 85 	testSensor.Modo.Calibracion = false;
 361  0025 72130009      	bres	_testSensor+1,#1
 362                     ; 86 	testSensor.Modo.Taraje = false;
 364  0029 72150009      	bres	_testSensor+1,#2
 365                     ; 87 	testSensor.Modo.Res4 = false;
 367  002d 72170009      	bres	_testSensor+1,#3
 368                     ; 88 	testSensor.Modo.Res5 = false;
 370  0031 72190009      	bres	_testSensor+1,#4
 371                     ; 89 	testSensor.Modo.Res6 = false;
 373  0035 721b0009      	bres	_testSensor+1,#5
 374                     ; 90 	testSensor.Modo.Res7 = false;
 376  0039 721d0009      	bres	_testSensor+1,#6
 377                     ; 91 	testSensor.Modo.Res8 = false;
 379  003d 721f0009      	bres	_testSensor+1,#7
 380                     ; 92 	testSensor.NotificarCambio = gm_NotificarCambioDummy;
 382  0041 ae0000        	ldw	x,#_gm_NotificarCambioDummy
 383  0044 bf0a          	ldw	_testSensor+2,x
 384                     ; 94 	testSensor1.idSensor = 1;
 386  0046 35010004      	mov	_testSensor1,#1
 387                     ; 95 	testSensor1.Modo.Medicion = false;
 389  004a 72110005      	bres	_testSensor1+1,#0
 390                     ; 96 	testSensor1.Modo.Calibracion = true;
 392  004e 72120005      	bset	_testSensor1+1,#1
 393                     ; 97 	testSensor1.Modo.Taraje = false;
 395  0052 72150005      	bres	_testSensor1+1,#2
 396                     ; 98 	testSensor1.Modo.Res4 = false;
 398  0056 72170005      	bres	_testSensor1+1,#3
 399                     ; 99 	testSensor1.Modo.Res5 = false;
 401  005a 72190005      	bres	_testSensor1+1,#4
 402                     ; 100 	testSensor1.Modo.Res6 = false;
 404  005e 721b0005      	bres	_testSensor1+1,#5
 405                     ; 101 	testSensor1.Modo.Res7 = false;
 407  0062 721d0005      	bres	_testSensor1+1,#6
 408                     ; 102 	testSensor1.Modo.Res8 = false;
 410  0066 721f0005      	bres	_testSensor1+1,#7
 411                     ; 103 	testSensor1.NotificarCambio = gm_NotificarCambioDummy;
 413  006a ae0000        	ldw	x,#_gm_NotificarCambioDummy
 414  006d bf06          	ldw	_testSensor1+2,x
 415                     ; 105 	testSensor2.idSensor = 2;
 417  006f 35020000      	mov	_testSensor2,#2
 418                     ; 106 	testSensor2.Modo.Medicion = false;
 420  0073 72110001      	bres	_testSensor2+1,#0
 421                     ; 107 	testSensor2.Modo.Calibracion = false;
 423  0077 72130001      	bres	_testSensor2+1,#1
 424                     ; 108 	testSensor2.Modo.Taraje = true;
 426  007b 72140001      	bset	_testSensor2+1,#2
 427                     ; 109 	testSensor2.Modo.Res4 = false;
 429  007f 72170001      	bres	_testSensor2+1,#3
 430                     ; 110 	testSensor2.Modo.Res5 = false;
 432  0083 72190001      	bres	_testSensor2+1,#4
 433                     ; 111 	testSensor2.Modo.Res6 = false;
 435  0087 721b0001      	bres	_testSensor2+1,#5
 436                     ; 112 	testSensor2.Modo.Res7 = false;
 438  008b 721d0001      	bres	_testSensor2+1,#6
 439                     ; 113 	testSensor2.Modo.Res8 = false;
 441  008f 721f0001      	bres	_testSensor2+1,#7
 442                     ; 114 	testSensor2.NotificarCambio = gm_NotificarCambioDummy;
 444  0093 ae0000        	ldw	x,#_gm_NotificarCambioDummy
 445  0096 bf02          	ldw	_testSensor2+2,x
 446                     ; 127 	Modo.Registrar = gm_Registrar;
 448  0098 ae0000        	ldw	x,#_gm_Registrar
 449  009b bf1c          	ldw	_Modo+16,x
 450                     ; 128 	Modo.Borrar = gm_Borrar;
 452  009d ae0000        	ldw	x,#_gm_Borrar
 453  00a0 bf1e          	ldw	_Modo+18,x
 454                     ; 129 	Modo.NuevoModo = gm_NuevoModo;
 456  00a2 ae0000        	ldw	x,#_gm_NuevoModo
 457  00a5 bf20          	ldw	_Modo+20,x
 458                     ; 130 	Modo.Init = gm_Init;
 460  00a7 ae0000        	ldw	x,#_gm_Init
 461  00aa bf22          	ldw	_Modo+22,x
 462                     ; 132 	Modo.Init( &Modo.Datos );
 464  00ac ae000c        	ldw	x,#_Modo
 465  00af 92cd22        	call	[_Modo+22.w]
 467                     ; 133 	Modo.Registrar( &testSensor, &Modo.Datos );
 469  00b2 ae000c        	ldw	x,#_Modo
 470  00b5 89            	pushw	x
 471  00b6 ae0008        	ldw	x,#_testSensor
 472  00b9 92cd1c        	call	[_Modo+16.w]
 474  00bc 85            	popw	x
 475                     ; 134 	Modo.Registrar( &testSensor1, &Modo.Datos );
 477  00bd ae000c        	ldw	x,#_Modo
 478  00c0 89            	pushw	x
 479  00c1 ae0004        	ldw	x,#_testSensor1
 480  00c4 92cd1c        	call	[_Modo+16.w]
 482  00c7 85            	popw	x
 483                     ; 135 	Modo.Registrar( &testSensor2, &Modo.Datos );
 485  00c8 ae000c        	ldw	x,#_Modo
 486  00cb 89            	pushw	x
 487  00cc ae0000        	ldw	x,#_testSensor2
 488  00cf 92cd1c        	call	[_Modo+16.w]
 490  00d2 85            	popw	x
 491                     ; 137 	Modo.Borrar( &testSensor, &Modo.Datos );
 493  00d3 ae000c        	ldw	x,#_Modo
 494  00d6 89            	pushw	x
 495  00d7 ae0008        	ldw	x,#_testSensor
 496  00da 92cd1e        	call	[_Modo+18.w]
 498  00dd 85            	popw	x
 499  00de               L142:
 503  00de ae0064        	ldw	x,#100
 504  00e1 1f01          	ldw	(OFST-1,sp),x
 507  00e3 2008          	jra	L152
 508  00e5               L542:
 509                     ; 27 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 513  00e5 ae14d4        	ldw	x,#5332
 515  00e8 9d            nop
 516  00e9                L6:
 517  00e9 5a             decw X
 518  00ea 26fd           jrne L6
 519  00ec 9d             nop
 520                      
 522  00ed               L152:
 523                     ; 38 	while ( __ms-- )
 525  00ed 1e01          	ldw	x,(OFST-1,sp)
 526  00ef 1d0001        	subw	x,#1
 527  00f2 1f01          	ldw	(OFST-1,sp),x
 528  00f4 1c0001        	addw	x,#1
 530  00f7 a30000        	cpw	x,#0
 531  00fa 26e9          	jrne	L542
 532  00fc 20e0          	jra	L142
 699                     	xdef	_main
 700                     	switch	.ubsct
 701  0000               _testSensor2:
 702  0000 00000000      	ds.b	4
 703                     	xdef	_testSensor2
 704  0004               _testSensor1:
 705  0004 00000000      	ds.b	4
 706                     	xdef	_testSensor1
 707  0008               _testSensor:
 708  0008 00000000      	ds.b	4
 709                     	xdef	_testSensor
 710  000c               _Modo:
 711  000c 000000000000  	ds.b	24
 712                     	xdef	_Modo
 713                     	xref	_gm_NotificarCambioDummy
 714                     	xref	_gm_NuevoModo
 715                     	xref	_gm_Borrar
 716                     	xref	_gm_Registrar
 717                     	xref	_gm_Init
 718                     	xref	_Clock_HSI_Init
 719                     	xref	_GPIO_DeInit
 739                     	end
