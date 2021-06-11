   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 584                     ; 142 int main()
 584                     ; 143 {
 586                     	switch	.text
 587  0000               _main:
 589  0000 5203          	subw	sp,#3
 590       00000003      OFST:	set	3
 593                     ; 36 	GPIO_DeInit(GPIOA);
 597  0002 ae5000        	ldw	x,#20480
 598  0005 cd0000        	call	_GPIO_DeInit
 600                     ; 37 	GPIO_DeInit(GPIOB);
 602  0008 ae5005        	ldw	x,#20485
 603  000b cd0000        	call	_GPIO_DeInit
 605                     ; 38 	GPIO_DeInit(GPIOC);
 607  000e ae500a        	ldw	x,#20490
 608  0011 cd0000        	call	_GPIO_DeInit
 610                     ; 39 	GPIO_DeInit(GPIOD);
 612  0014 ae500f        	ldw	x,#20495
 613  0017 cd0000        	call	_GPIO_DeInit
 615                     ; 77 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 618  001a ae0080        	ldw	x,#128
 619  001d cd0000        	call	_Clock_HSI_Init
 621  0020               L342:
 622                     ; 88 	Modo.Registrar = gm_Registrar;
 625  0020 ae0000        	ldw	x,#_gm_Registrar
 626  0023 bf1e          	ldw	_Modo+16,x
 627                     ; 89 	Modo.Borrar = gm_Borrar;
 629  0025 ae0000        	ldw	x,#_gm_Borrar
 630  0028 bf20          	ldw	_Modo+18,x
 631                     ; 90 	Modo.NuevoModo = gm_NuevoModo;
 633  002a ae0000        	ldw	x,#_gm_NuevoModo
 634  002d bf22          	ldw	_Modo+20,x
 635                     ; 91 	Modo.Init = gm_Init;
 637  002f ae0000        	ldw	x,#_gm_Init
 638  0032 bf24          	ldw	_Modo+22,x
 639                     ; 93 	Modo.Init(&Modo.Datos);
 641  0034 ae000e        	ldw	x,#_Modo
 642  0037 92cd24        	call	[_Modo+22.w]
 644                     ; 145 	Inicializacion_Total();
 648                     ; 98 	sensor->Init = iSd_Init;
 650  003a ae0000        	ldw	x,#_iSd_Init
 651  003d bf0a          	ldw	_DHT11+3,x
 652                     ; 99 	sensor->Init(&sensor->Datos, id, &Modo);
 654  003f ae000e        	ldw	x,#_Modo
 655  0042 89            	pushw	x
 656  0043 4b00          	push	#0
 657  0045 ae0007        	ldw	x,#_DHT11
 658  0048 92cd0a        	call	[_DHT11+3.w]
 660  004b 5b03          	addw	sp,#3
 661                     ; 145 	Inicializacion_Total();
 664                     ; 98 	sensor->Init = iSd_Init;
 666  004d ae0000        	ldw	x,#_iSd_Init
 667  0050 bf03          	ldw	_DHT22+3,x
 668                     ; 99 	sensor->Init(&sensor->Datos, id, &Modo);
 670  0052 ae000e        	ldw	x,#_Modo
 671  0055 89            	pushw	x
 672  0056 4b01          	push	#1
 673  0058 ae0000        	ldw	x,#_DHT22
 674  005b 92cd03        	call	[_DHT22+3.w]
 676  005e 5b03          	addw	sp,#3
 677                     ; 113 	Modo.NuevoModo(DHT11.Datos.ID, &gm_Medicion, &Modo.Datos);
 679  0060 ae000e        	ldw	x,#_Modo
 680  0063 89            	pushw	x
 681  0064 ae0000        	ldw	x,#_gm_Medicion
 682  0067 89            	pushw	x
 683  0068 b607          	ld	a,_DHT11
 684  006a 92cd22        	call	[_Modo+20.w]
 686  006d 5b04          	addw	sp,#4
 687  006f               L134:
 688                     ; 150 		valorModo = *(DHT11.Datos.Modo);
 690  006f 96            	ldw	x,sp
 691  0070 1c0003        	addw	x,#OFST+0
 692  0073 90be08        	ldw	y,_DHT11+1
 693  0076 a601          	ld	a,#1
 694  0078 cd0000        	call	c_xymov
 699  007b ae0064        	ldw	x,#100
 700  007e 1f01          	ldw	(OFST-2,sp),x
 703  0080 2008          	jra	L144
 704  0082               L534:
 705                     ; 27 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 709  0082 ae14d4        	ldw	x,#5332
 711  0085 9d            nop
 712  0086                L6:
 713  0086 5a             decw X
 714  0087 26fd           jrne L6
 715  0089 9d             nop
 716                      
 718  008a               L144:
 719                     ; 38 	while ( __ms-- )
 721  008a 1e01          	ldw	x,(OFST-2,sp)
 722  008c 1d0001        	subw	x,#1
 723  008f 1f01          	ldw	(OFST-2,sp),x
 724  0091 1c0001        	addw	x,#1
 726  0094 a30000        	cpw	x,#0
 727  0097 26e9          	jrne	L534
 728  0099 20d4          	jra	L134
 741                     	xdef	_main
 742                     	switch	.ubsct
 743  0000               _DHT22:
 744  0000 000000000000  	ds.b	7
 745                     	xdef	_DHT22
 746  0007               _DHT11:
 747  0007 000000000000  	ds.b	7
 748                     	xdef	_DHT11
 749  000e               _Modo:
 750  000e 000000000000  	ds.b	24
 751                     	xdef	_Modo
 752                     	xref	_iSd_Init
 753                     	xref	_gm_NuevoModo
 754                     	xref	_gm_Borrar
 755                     	xref	_gm_Registrar
 756                     	xref	_gm_Init
 757                     	xref.b	_gm_Medicion
 758                     	xref	_Clock_HSI_Init
 759                     	xref	_GPIO_DeInit
 760                     	xref.b	c_x
 780                     	xref	c_xymov
 781                     	end
