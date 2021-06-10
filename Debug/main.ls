   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 500                     ; 163 int main()
 500                     ; 164 {
 502                     	switch	.text
 503  0000               _main:
 505  0000 89            	pushw	x
 506       00000002      OFST:	set	2
 509                     ; 38 	GPIO_DeInit(GPIOA);
 513  0001 ae5000        	ldw	x,#20480
 514  0004 cd0000        	call	_GPIO_DeInit
 516                     ; 39 	GPIO_DeInit(GPIOB);
 518  0007 ae5005        	ldw	x,#20485
 519  000a cd0000        	call	_GPIO_DeInit
 521                     ; 40 	GPIO_DeInit(GPIOC);
 523  000d ae500a        	ldw	x,#20490
 524  0010 cd0000        	call	_GPIO_DeInit
 526                     ; 41 	GPIO_DeInit(GPIOD);
 528  0013 ae500f        	ldw	x,#20495
 529  0016 cd0000        	call	_GPIO_DeInit
 531                     ; 79 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 534  0019 ae0080        	ldw	x,#128
 535  001c cd0000        	call	_Clock_HSI_Init
 537  001f               L102:
 538                     ; 165 	Inicializacion_Total();
 543                     ; 84 	sensor->idSensor = id;
 545  001f 3f10          	clr	_testSensor
 546                     ; 85 	sensor->Modo.Medicion = false;
 548  0021 72110011      	bres	_testSensor+1,#0
 549                     ; 86 	sensor->Modo.Calibracion = false;
 551  0025 72130011      	bres	_testSensor+1,#1
 552                     ; 87 	sensor->Modo.Taraje = false;
 554  0029 72150011      	bres	_testSensor+1,#2
 555                     ; 88 	sensor->Modo.Res4 = false;
 557  002d 72170011      	bres	_testSensor+1,#3
 558                     ; 89 	sensor->Modo.Res5 = false;
 560  0031 72190011      	bres	_testSensor+1,#4
 561                     ; 90 	sensor->Modo.Res6 = false;
 563  0035 721b0011      	bres	_testSensor+1,#5
 564                     ; 91 	sensor->Modo.Res7 = false;
 566  0039 721d0011      	bres	_testSensor+1,#6
 567                     ; 92 	sensor->Modo.Res8 = false;
 569  003d 721f0011      	bres	_testSensor+1,#7
 570                     ; 93 	sensor->NotificarCambio = gm_NotificarCambioDummy;
 572  0041 ae0000        	ldw	x,#_gm_NotificarCambioDummy
 573  0044 bf12          	ldw	_testSensor+2,x
 574                     ; 165 	Inicializacion_Total();
 577                     ; 84 	sensor->idSensor = id;
 579  0046 3501000c      	mov	_testSensor1,#1
 580                     ; 85 	sensor->Modo.Medicion = false;
 582  004a 7211000d      	bres	_testSensor1+1,#0
 583                     ; 86 	sensor->Modo.Calibracion = false;
 585  004e 7213000d      	bres	_testSensor1+1,#1
 586                     ; 87 	sensor->Modo.Taraje = false;
 588  0052 7215000d      	bres	_testSensor1+1,#2
 589                     ; 88 	sensor->Modo.Res4 = false;
 591  0056 7217000d      	bres	_testSensor1+1,#3
 592                     ; 89 	sensor->Modo.Res5 = false;
 594  005a 7219000d      	bres	_testSensor1+1,#4
 595                     ; 90 	sensor->Modo.Res6 = false;
 597  005e 721b000d      	bres	_testSensor1+1,#5
 598                     ; 91 	sensor->Modo.Res7 = false;
 600  0062 721d000d      	bres	_testSensor1+1,#6
 601                     ; 92 	sensor->Modo.Res8 = false;
 603  0066 721f000d      	bres	_testSensor1+1,#7
 604                     ; 93 	sensor->NotificarCambio = gm_NotificarCambioDummy;
 606  006a ae0000        	ldw	x,#_gm_NotificarCambioDummy
 607  006d bf0e          	ldw	_testSensor1+2,x
 608                     ; 165 	Inicializacion_Total();
 611                     ; 84 	sensor->idSensor = id;
 613  006f 35020008      	mov	_testSensor2,#2
 614                     ; 85 	sensor->Modo.Medicion = false;
 616  0073 72110009      	bres	_testSensor2+1,#0
 617                     ; 86 	sensor->Modo.Calibracion = false;
 619  0077 72130009      	bres	_testSensor2+1,#1
 620                     ; 87 	sensor->Modo.Taraje = false;
 622  007b 72150009      	bres	_testSensor2+1,#2
 623                     ; 88 	sensor->Modo.Res4 = false;
 625  007f 72170009      	bres	_testSensor2+1,#3
 626                     ; 89 	sensor->Modo.Res5 = false;
 628  0083 72190009      	bres	_testSensor2+1,#4
 629                     ; 90 	sensor->Modo.Res6 = false;
 631  0087 721b0009      	bres	_testSensor2+1,#5
 632                     ; 91 	sensor->Modo.Res7 = false;
 634  008b 721d0009      	bres	_testSensor2+1,#6
 635                     ; 92 	sensor->Modo.Res8 = false;
 637  008f 721f0009      	bres	_testSensor2+1,#7
 638                     ; 93 	sensor->NotificarCambio = gm_NotificarCambioDummy;
 640  0093 ae0000        	ldw	x,#_gm_NotificarCambioDummy
 641  0096 bf0a          	ldw	_testSensor2+2,x
 642                     ; 165 	Inicializacion_Total();
 645                     ; 84 	sensor->idSensor = id;
 647  0098 35030004      	mov	_testSensor3,#3
 648                     ; 85 	sensor->Modo.Medicion = false;
 650  009c 72110005      	bres	_testSensor3+1,#0
 651                     ; 86 	sensor->Modo.Calibracion = false;
 653  00a0 72130005      	bres	_testSensor3+1,#1
 654                     ; 87 	sensor->Modo.Taraje = false;
 656  00a4 72150005      	bres	_testSensor3+1,#2
 657                     ; 88 	sensor->Modo.Res4 = false;
 659  00a8 72170005      	bres	_testSensor3+1,#3
 660                     ; 89 	sensor->Modo.Res5 = false;
 662  00ac 72190005      	bres	_testSensor3+1,#4
 663                     ; 90 	sensor->Modo.Res6 = false;
 665  00b0 721b0005      	bres	_testSensor3+1,#5
 666                     ; 91 	sensor->Modo.Res7 = false;
 668  00b4 721d0005      	bres	_testSensor3+1,#6
 669                     ; 92 	sensor->Modo.Res8 = false;
 671  00b8 721f0005      	bres	_testSensor3+1,#7
 672                     ; 93 	sensor->NotificarCambio = gm_NotificarCambioDummy;
 674  00bc ae0000        	ldw	x,#_gm_NotificarCambioDummy
 675  00bf bf06          	ldw	_testSensor3+2,x
 676                     ; 165 	Inicializacion_Total();
 679                     ; 84 	sensor->idSensor = id;
 681  00c1 35040000      	mov	_testSensor4,#4
 682                     ; 85 	sensor->Modo.Medicion = false;
 684  00c5 72110001      	bres	_testSensor4+1,#0
 685                     ; 86 	sensor->Modo.Calibracion = false;
 687  00c9 72130001      	bres	_testSensor4+1,#1
 688                     ; 87 	sensor->Modo.Taraje = false;
 690  00cd 72150001      	bres	_testSensor4+1,#2
 691                     ; 88 	sensor->Modo.Res4 = false;
 693  00d1 72170001      	bres	_testSensor4+1,#3
 694                     ; 89 	sensor->Modo.Res5 = false;
 696  00d5 72190001      	bres	_testSensor4+1,#4
 697                     ; 90 	sensor->Modo.Res6 = false;
 699  00d9 721b0001      	bres	_testSensor4+1,#5
 700                     ; 91 	sensor->Modo.Res7 = false;
 702  00dd 721d0001      	bres	_testSensor4+1,#6
 703                     ; 92 	sensor->Modo.Res8 = false;
 705  00e1 721f0001      	bres	_testSensor4+1,#7
 706                     ; 93 	sensor->NotificarCambio = gm_NotificarCambioDummy;
 708  00e5 ae0000        	ldw	x,#_gm_NotificarCambioDummy
 709  00e8 bf02          	ldw	_testSensor4+2,x
 710  00ea               L512:
 711                     ; 123 	Modo.Registrar = gm_Registrar;
 713  00ea ae0000        	ldw	x,#_gm_Registrar
 714  00ed bf24          	ldw	_Modo+16,x
 715                     ; 124 	Modo.Borrar = gm_Borrar;
 717  00ef ae0000        	ldw	x,#_gm_Borrar
 718  00f2 bf26          	ldw	_Modo+18,x
 719                     ; 125 	Modo.NuevoModo = gm_NuevoModo;
 721  00f4 ae0000        	ldw	x,#_gm_NuevoModo
 722  00f7 bf28          	ldw	_Modo+20,x
 723                     ; 126 	Modo.Init = gm_Init;
 725  00f9 ae0000        	ldw	x,#_gm_Init
 726  00fc bf2a          	ldw	_Modo+22,x
 727                     ; 128 	Modo.Init( &Modo.Datos );
 729  00fe ae0014        	ldw	x,#_Modo
 730  0101 92cd2a        	call	[_Modo+22.w]
 732                     ; 129 	Modo.Registrar( &testSensor, &Modo.Datos );
 734  0104 ae0014        	ldw	x,#_Modo
 735  0107 89            	pushw	x
 736  0108 ae0010        	ldw	x,#_testSensor
 737  010b 92cd24        	call	[_Modo+16.w]
 739  010e 85            	popw	x
 740                     ; 130 	Modo.Registrar( &testSensor1, &Modo.Datos );
 742  010f ae0014        	ldw	x,#_Modo
 743  0112 89            	pushw	x
 744  0113 ae000c        	ldw	x,#_testSensor1
 745  0116 92cd24        	call	[_Modo+16.w]
 747  0119 85            	popw	x
 748                     ; 131 	Modo.Registrar( &testSensor2, &Modo.Datos );
 750  011a ae0014        	ldw	x,#_Modo
 751  011d 89            	pushw	x
 752  011e ae0008        	ldw	x,#_testSensor2
 753  0121 92cd24        	call	[_Modo+16.w]
 755  0124 85            	popw	x
 756                     ; 132 	Modo.Registrar( &testSensor3, &Modo.Datos );
 758  0125 ae0014        	ldw	x,#_Modo
 759  0128 89            	pushw	x
 760  0129 ae0004        	ldw	x,#_testSensor3
 761  012c 92cd24        	call	[_Modo+16.w]
 763  012f 85            	popw	x
 764                     ; 133 	Modo.Registrar( &testSensor4, &Modo.Datos );
 766  0130 ae0014        	ldw	x,#_Modo
 767  0133 89            	pushw	x
 768  0134 ae0000        	ldw	x,#_testSensor4
 769  0137 92cd24        	call	[_Modo+16.w]
 771  013a 85            	popw	x
 772                     ; 135 	Modo.Borrar( &testSensor, &Modo.Datos );
 774  013b ae0014        	ldw	x,#_Modo
 775  013e 89            	pushw	x
 776  013f ae0010        	ldw	x,#_testSensor
 777  0142 92cd26        	call	[_Modo+18.w]
 779  0145 85            	popw	x
 780  0146               L573:
 784  0146 ae0064        	ldw	x,#100
 785  0149 1f01          	ldw	(OFST-1,sp),x
 788  014b 2008          	jra	L504
 789  014d               L104:
 790                     ; 27 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 794  014d ae14d4        	ldw	x,#5332
 796  0150 9d            nop
 797  0151                L6:
 798  0151 5a             decw X
 799  0152 26fd           jrne L6
 800  0154 9d             nop
 801                      
 803  0155               L504:
 804                     ; 38 	while ( __ms-- )
 806  0155 1e01          	ldw	x,(OFST-1,sp)
 807  0157 1d0001        	subw	x,#1
 808  015a 1f01          	ldw	(OFST-1,sp),x
 809  015c 1c0001        	addw	x,#1
 811  015f a30000        	cpw	x,#0
 812  0162 26e9          	jrne	L104
 813  0164 20e0          	jra	L573
 878                     	xdef	_main
 879                     	switch	.ubsct
 880  0000               _testSensor4:
 881  0000 00000000      	ds.b	4
 882                     	xdef	_testSensor4
 883  0004               _testSensor3:
 884  0004 00000000      	ds.b	4
 885                     	xdef	_testSensor3
 886  0008               _testSensor2:
 887  0008 00000000      	ds.b	4
 888                     	xdef	_testSensor2
 889  000c               _testSensor1:
 890  000c 00000000      	ds.b	4
 891                     	xdef	_testSensor1
 892  0010               _testSensor:
 893  0010 00000000      	ds.b	4
 894                     	xdef	_testSensor
 895  0014               _Modo:
 896  0014 000000000000  	ds.b	24
 897                     	xdef	_Modo
 898                     	xref	_gm_NotificarCambioDummy
 899                     	xref	_gm_NuevoModo
 900                     	xref	_gm_Borrar
 901                     	xref	_gm_Registrar
 902                     	xref	_gm_Init
 903                     	xref	_Clock_HSI_Init
 904                     	xref	_GPIO_DeInit
 924                     	end
