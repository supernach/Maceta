   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 324                     ; 163 int main()
 324                     ; 164 {
 326                     	switch	.text
 327  0000               _main:
 329  0000 89            	pushw	x
 330       00000002      OFST:	set	2
 333                     ; 31 	GPIO_DeInit(GPIOA);
 337  0001 ae5000        	ldw	x,#20480
 338  0004 cd0000        	call	_GPIO_DeInit
 340                     ; 32 	GPIO_DeInit(GPIOB);
 342  0007 ae5005        	ldw	x,#20485
 343  000a cd0000        	call	_GPIO_DeInit
 345                     ; 33 	GPIO_DeInit(GPIOC);
 347  000d ae500a        	ldw	x,#20490
 348  0010 cd0000        	call	_GPIO_DeInit
 350                     ; 34 	GPIO_DeInit(GPIOD);
 352  0013 ae500f        	ldw	x,#20495
 353  0016 cd0000        	call	_GPIO_DeInit
 355                     ; 72 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 358  0019 ae0080        	ldw	x,#128
 359  001c cd0000        	call	_Clock_HSI_Init
 361  001f               L302:
 362                     ; 83 	testSensor.idSensor = 0;
 366  001f 3f08          	clr	_testSensor
 367                     ; 84 	testSensor.Modo.Medicion = true;
 369  0021 72100009      	bset	_testSensor+1,#0
 370                     ; 85 	testSensor.Modo.Calibracion = false;
 372  0025 72130009      	bres	_testSensor+1,#1
 373                     ; 86 	testSensor.Modo.Taraje = false;
 375  0029 72150009      	bres	_testSensor+1,#2
 376                     ; 87 	testSensor.Modo.Res4 = false;
 378  002d 72170009      	bres	_testSensor+1,#3
 379                     ; 88 	testSensor.Modo.Res5 = false;
 381  0031 72190009      	bres	_testSensor+1,#4
 382                     ; 89 	testSensor.Modo.Res6 = false;
 384  0035 721b0009      	bres	_testSensor+1,#5
 385                     ; 90 	testSensor.Modo.Res7 = false;
 387  0039 721d0009      	bres	_testSensor+1,#6
 388                     ; 91 	testSensor.Modo.Res8 = false;
 390  003d 721f0009      	bres	_testSensor+1,#7
 391                     ; 92 	testSensor.NotificarCambio = gm_NotificarCambioDummy;
 393  0041 ae0000        	ldw	x,#_gm_NotificarCambioDummy
 394  0044 bf0a          	ldw	_testSensor+2,x
 395                     ; 94 	testSensor1.idSensor = 1;
 397  0046 35010004      	mov	_testSensor1,#1
 398                     ; 95 	testSensor1.Modo.Medicion = false;
 400  004a 72110005      	bres	_testSensor1+1,#0
 401                     ; 96 	testSensor1.Modo.Calibracion = true;
 403  004e 72120005      	bset	_testSensor1+1,#1
 404                     ; 97 	testSensor1.Modo.Taraje = false;
 406  0052 72150005      	bres	_testSensor1+1,#2
 407                     ; 98 	testSensor1.Modo.Res4 = false;
 409  0056 72170005      	bres	_testSensor1+1,#3
 410                     ; 99 	testSensor1.Modo.Res5 = false;
 412  005a 72190005      	bres	_testSensor1+1,#4
 413                     ; 100 	testSensor1.Modo.Res6 = false;
 415  005e 721b0005      	bres	_testSensor1+1,#5
 416                     ; 101 	testSensor1.Modo.Res7 = false;
 418  0062 721d0005      	bres	_testSensor1+1,#6
 419                     ; 102 	testSensor1.Modo.Res8 = false;
 421  0066 721f0005      	bres	_testSensor1+1,#7
 422                     ; 103 	testSensor1.NotificarCambio = gm_NotificarCambioDummy;
 424  006a ae0000        	ldw	x,#_gm_NotificarCambioDummy
 425  006d bf06          	ldw	_testSensor1+2,x
 426                     ; 105 	testSensor2.idSensor = 2;
 428  006f 35020000      	mov	_testSensor2,#2
 429                     ; 106 	testSensor2.Modo.Medicion = false;
 431  0073 72110001      	bres	_testSensor2+1,#0
 432                     ; 107 	testSensor2.Modo.Calibracion = false;
 434  0077 72130001      	bres	_testSensor2+1,#1
 435                     ; 108 	testSensor2.Modo.Taraje = true;
 437  007b 72140001      	bset	_testSensor2+1,#2
 438                     ; 109 	testSensor2.Modo.Res4 = false;
 440  007f 72170001      	bres	_testSensor2+1,#3
 441                     ; 110 	testSensor2.Modo.Res5 = false;
 443  0083 72190001      	bres	_testSensor2+1,#4
 444                     ; 111 	testSensor2.Modo.Res6 = false;
 446  0087 721b0001      	bres	_testSensor2+1,#5
 447                     ; 112 	testSensor2.Modo.Res7 = false;
 449  008b 721d0001      	bres	_testSensor2+1,#6
 450                     ; 113 	testSensor2.Modo.Res8 = false;
 452  008f 721f0001      	bres	_testSensor2+1,#7
 453                     ; 114 	testSensor2.NotificarCambio = gm_NotificarCambioDummy;
 455  0093 ae0000        	ldw	x,#_gm_NotificarCambioDummy
 456  0096 bf02          	ldw	_testSensor2+2,x
 457                     ; 127 	Modo.Registrar = gm_Registrar;
 459  0098 ae0000        	ldw	x,#_gm_Registrar
 460  009b bf1c          	ldw	_Modo+16,x
 461                     ; 128 	Modo.Borrar = gm_Borrar;
 463  009d ae0000        	ldw	x,#_gm_Borrar
 464  00a0 bf1e          	ldw	_Modo+18,x
 465                     ; 129 	Modo.NuevoModo = gm_NuevoModo;
 467  00a2 ae0000        	ldw	x,#_gm_NuevoModo
 468  00a5 bf20          	ldw	_Modo+20,x
 469                     ; 130 	Modo.Init = gm_Init;
 471  00a7 ae0000        	ldw	x,#_gm_Init
 472  00aa bf22          	ldw	_Modo+22,x
 473                     ; 132 	Modo.Init(&ModoDatos);
 475  00ac ae0024        	ldw	x,#_ModoDatos
 476  00af cd0000        	call	_gm_Init
 478                     ; 133 	Modo.Registrar(&testSensor, &ModoDatos);
 480  00b2 ae0024        	ldw	x,#_ModoDatos
 481  00b5 89            	pushw	x
 482  00b6 ae0008        	ldw	x,#_testSensor
 483  00b9 92cd1c        	call	[_Modo+16.w]
 485  00bc 85            	popw	x
 486                     ; 134 	Modo.Registrar(&testSensor1, &ModoDatos);
 488  00bd ae0024        	ldw	x,#_ModoDatos
 489  00c0 89            	pushw	x
 490  00c1 ae0004        	ldw	x,#_testSensor1
 491  00c4 92cd1c        	call	[_Modo+16.w]
 493  00c7 85            	popw	x
 494                     ; 135 	Modo.Registrar(&testSensor2, &ModoDatos);
 496  00c8 ae0024        	ldw	x,#_ModoDatos
 497  00cb 89            	pushw	x
 498  00cc ae0000        	ldw	x,#_testSensor2
 499  00cf 92cd1c        	call	[_Modo+16.w]
 501  00d2 85            	popw	x
 502                     ; 137 	Modo.Borrar(&testSensor, &ModoDatos);
 504  00d3 ae0024        	ldw	x,#_ModoDatos
 505  00d6 89            	pushw	x
 506  00d7 ae0008        	ldw	x,#_testSensor
 507  00da 92cd1e        	call	[_Modo+18.w]
 509  00dd 85            	popw	x
 510  00de               L542:
 514  00de ae0064        	ldw	x,#100
 515  00e1 1f01          	ldw	(OFST-1,sp),x
 518  00e3 2008          	jra	L552
 519  00e5               L152:
 520                     ; 27 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 524  00e5 ae14d4        	ldw	x,#5332
 526  00e8 9d            nop
 527  00e9                L6:
 528  00e9 5a             decw X
 529  00ea 26fd           jrne L6
 530  00ec 9d             nop
 531                      
 533  00ed               L552:
 534                     ; 38 	while ( __ms-- )
 536  00ed 1e01          	ldw	x,(OFST-1,sp)
 537  00ef 1d0001        	subw	x,#1
 538  00f2 1f01          	ldw	(OFST-1,sp),x
 539  00f4 1c0001        	addw	x,#1
 541  00f7 a30000        	cpw	x,#0
 542  00fa 26e9          	jrne	L152
 543  00fc 20e0          	jra	L542
 710                     	xdef	_main
 711                     	switch	.ubsct
 712  0000               _testSensor2:
 713  0000 00000000      	ds.b	4
 714                     	xdef	_testSensor2
 715  0004               _testSensor1:
 716  0004 00000000      	ds.b	4
 717                     	xdef	_testSensor1
 718  0008               _testSensor:
 719  0008 00000000      	ds.b	4
 720                     	xdef	_testSensor
 721  000c               _Modo:
 722  000c 000000000000  	ds.b	24
 723                     	xdef	_Modo
 724  0024               _ModoDatos:
 725  0024 000000000000  	ds.b	16
 726                     	xdef	_ModoDatos
 727                     	xref	_gm_NotificarCambioDummy
 728                     	xref	_gm_NuevoModo
 729                     	xref	_gm_Borrar
 730                     	xref	_gm_Registrar
 731                     	xref	_gm_Init
 732                     	xref	_Clock_HSI_Init
 733                     	xref	_GPIO_DeInit
 753                     	end
