   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 314                     ; 163 int main()
 314                     ; 164 {
 316                     	switch	.text
 317  0000               _main:
 319  0000 89            	pushw	x
 320       00000002      OFST:	set	2
 323                     ; 31 	GPIO_DeInit(GPIOA);
 327  0001 ae5000        	ldw	x,#20480
 328  0004 cd0000        	call	_GPIO_DeInit
 330                     ; 32 	GPIO_DeInit(GPIOB);
 332  0007 ae5005        	ldw	x,#20485
 333  000a cd0000        	call	_GPIO_DeInit
 335                     ; 33 	GPIO_DeInit(GPIOC);
 337  000d ae500a        	ldw	x,#20490
 338  0010 cd0000        	call	_GPIO_DeInit
 340                     ; 34 	GPIO_DeInit(GPIOD);
 342  0013 ae500f        	ldw	x,#20495
 343  0016 cd0000        	call	_GPIO_DeInit
 345                     ; 72 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 348  0019 ae0080        	ldw	x,#128
 349  001c cd0000        	call	_Clock_HSI_Init
 351  001f               L771:
 352                     ; 83 	testSensor.idSensor = 0;
 356  001f 3f08          	clr	_testSensor
 357                     ; 84 	testSensor.Modo.Medicion = true;
 359  0021 72100009      	bset	_testSensor+1,#0
 360                     ; 85 	testSensor.Modo.Calibracion = false;
 362  0025 72130009      	bres	_testSensor+1,#1
 363                     ; 86 	testSensor.Modo.Taraje = false;
 365  0029 72150009      	bres	_testSensor+1,#2
 366                     ; 87 	testSensor.Modo.Res4 = false;
 368  002d 72170009      	bres	_testSensor+1,#3
 369                     ; 88 	testSensor.Modo.Res5 = false;
 371  0031 72190009      	bres	_testSensor+1,#4
 372                     ; 89 	testSensor.Modo.Res6 = false;
 374  0035 721b0009      	bres	_testSensor+1,#5
 375                     ; 90 	testSensor.Modo.Res7 = false;
 377  0039 721d0009      	bres	_testSensor+1,#6
 378                     ; 91 	testSensor.Modo.Res8 = false;
 380  003d 721f0009      	bres	_testSensor+1,#7
 381                     ; 92 	testSensor.NotificarCambio = gm_NotificarCambioDummy;
 383  0041 ae0000        	ldw	x,#_gm_NotificarCambioDummy
 384  0044 bf0a          	ldw	_testSensor+2,x
 385                     ; 94 	testSensor1.idSensor = 1;
 387  0046 35010004      	mov	_testSensor1,#1
 388                     ; 95 	testSensor1.Modo.Medicion = false;
 390  004a 72110005      	bres	_testSensor1+1,#0
 391                     ; 96 	testSensor1.Modo.Calibracion = true;
 393  004e 72120005      	bset	_testSensor1+1,#1
 394                     ; 97 	testSensor1.Modo.Taraje = false;
 396  0052 72150005      	bres	_testSensor1+1,#2
 397                     ; 98 	testSensor1.Modo.Res4 = false;
 399  0056 72170005      	bres	_testSensor1+1,#3
 400                     ; 99 	testSensor1.Modo.Res5 = false;
 402  005a 72190005      	bres	_testSensor1+1,#4
 403                     ; 100 	testSensor1.Modo.Res6 = false;
 405  005e 721b0005      	bres	_testSensor1+1,#5
 406                     ; 101 	testSensor1.Modo.Res7 = false;
 408  0062 721d0005      	bres	_testSensor1+1,#6
 409                     ; 102 	testSensor1.Modo.Res8 = false;
 411  0066 721f0005      	bres	_testSensor1+1,#7
 412                     ; 103 	testSensor1.NotificarCambio = gm_NotificarCambioDummy;
 414  006a ae0000        	ldw	x,#_gm_NotificarCambioDummy
 415  006d bf06          	ldw	_testSensor1+2,x
 416                     ; 105 	testSensor2.idSensor = 2;
 418  006f 35020000      	mov	_testSensor2,#2
 419                     ; 106 	testSensor2.Modo.Medicion = false;
 421  0073 72110001      	bres	_testSensor2+1,#0
 422                     ; 107 	testSensor2.Modo.Calibracion = false;
 424  0077 72130001      	bres	_testSensor2+1,#1
 425                     ; 108 	testSensor2.Modo.Taraje = true;
 427  007b 72140001      	bset	_testSensor2+1,#2
 428                     ; 109 	testSensor2.Modo.Res4 = false;
 430  007f 72170001      	bres	_testSensor2+1,#3
 431                     ; 110 	testSensor2.Modo.Res5 = false;
 433  0083 72190001      	bres	_testSensor2+1,#4
 434                     ; 111 	testSensor2.Modo.Res6 = false;
 436  0087 721b0001      	bres	_testSensor2+1,#5
 437                     ; 112 	testSensor2.Modo.Res7 = false;
 439  008b 721d0001      	bres	_testSensor2+1,#6
 440                     ; 113 	testSensor2.Modo.Res8 = false;
 442  008f 721f0001      	bres	_testSensor2+1,#7
 443                     ; 114 	testSensor2.NotificarCambio = gm_NotificarCambioDummy;
 445  0093 ae0000        	ldw	x,#_gm_NotificarCambioDummy
 446  0096 bf02          	ldw	_testSensor2+2,x
 447                     ; 127 	Modo.Registrar = gm_Registrar;
 449  0098 ae0000        	ldw	x,#_gm_Registrar
 450  009b bf0c          	ldw	_Modo,x
 451                     ; 128 	Modo.Borrar = gm_Borrar;
 453  009d ae0000        	ldw	x,#_gm_Borrar
 454  00a0 bf0e          	ldw	_Modo+2,x
 455                     ; 129 	Modo.NuevoModo = gm_NuevoModo;
 457  00a2 ae0000        	ldw	x,#_gm_NuevoModo
 458  00a5 bf10          	ldw	_Modo+4,x
 459                     ; 130 	Modo.Init = gm_Init;
 461  00a7 ae0000        	ldw	x,#_gm_Init
 462  00aa bf12          	ldw	_Modo+6,x
 463                     ; 132 	Modo.Init(&ModoDatos);
 465  00ac ae0014        	ldw	x,#_ModoDatos
 466  00af cd0000        	call	_gm_Init
 468                     ; 133 	Modo.Registrar(&testSensor, &ModoDatos);
 470  00b2 ae0014        	ldw	x,#_ModoDatos
 471  00b5 89            	pushw	x
 472  00b6 ae0008        	ldw	x,#_testSensor
 473  00b9 92cd0c        	call	[_Modo.w]
 475  00bc 85            	popw	x
 476                     ; 134 	Modo.Registrar(&testSensor1, &ModoDatos);
 478  00bd ae0014        	ldw	x,#_ModoDatos
 479  00c0 89            	pushw	x
 480  00c1 ae0004        	ldw	x,#_testSensor1
 481  00c4 92cd0c        	call	[_Modo.w]
 483  00c7 85            	popw	x
 484                     ; 135 	Modo.Registrar(&testSensor2, &ModoDatos);
 486  00c8 ae0014        	ldw	x,#_ModoDatos
 487  00cb 89            	pushw	x
 488  00cc ae0000        	ldw	x,#_testSensor2
 489  00cf 92cd0c        	call	[_Modo.w]
 491  00d2 85            	popw	x
 492                     ; 137 	Modo.Borrar(&testSensor, &ModoDatos);
 494  00d3 ae0014        	ldw	x,#_ModoDatos
 495  00d6 89            	pushw	x
 496  00d7 ae0008        	ldw	x,#_testSensor
 497  00da 92cd0e        	call	[_Modo+2.w]
 499  00dd 85            	popw	x
 500  00de               L142:
 504  00de ae0064        	ldw	x,#100
 505  00e1 1f01          	ldw	(OFST-1,sp),x
 508  00e3 2008          	jra	L152
 509  00e5               L542:
 510                     ; 27 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 514  00e5 ae14d4        	ldw	x,#5332
 516  00e8 9d            nop
 517  00e9                L6:
 518  00e9 5a             decw X
 519  00ea 26fd           jrne L6
 520  00ec 9d             nop
 521                      
 523  00ed               L152:
 524                     ; 38 	while ( __ms-- )
 526  00ed 1e01          	ldw	x,(OFST-1,sp)
 527  00ef 1d0001        	subw	x,#1
 528  00f2 1f01          	ldw	(OFST-1,sp),x
 529  00f4 1c0001        	addw	x,#1
 531  00f7 a30000        	cpw	x,#0
 532  00fa 26e9          	jrne	L542
 533  00fc 20e0          	jra	L142
 700                     	xdef	_main
 701                     	switch	.ubsct
 702  0000               _testSensor2:
 703  0000 00000000      	ds.b	4
 704                     	xdef	_testSensor2
 705  0004               _testSensor1:
 706  0004 00000000      	ds.b	4
 707                     	xdef	_testSensor1
 708  0008               _testSensor:
 709  0008 00000000      	ds.b	4
 710                     	xdef	_testSensor
 711  000c               _Modo:
 712  000c 000000000000  	ds.b	8
 713                     	xdef	_Modo
 714  0014               _ModoDatos:
 715  0014 000000000000  	ds.b	16
 716                     	xdef	_ModoDatos
 717                     	xref	_gm_NotificarCambioDummy
 718                     	xref	_gm_NuevoModo
 719                     	xref	_gm_Borrar
 720                     	xref	_gm_Registrar
 721                     	xref	_gm_Init
 722                     	xref	_Clock_HSI_Init
 723                     	xref	_GPIO_DeInit
 743                     	end
