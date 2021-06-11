   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 799                     ; 138 int main()
 799                     ; 139 {
 801                     	switch	.text
 802  0000               _main:
 804  0000 89            	pushw	x
 805       00000002      OFST:	set	2
 808                     ; 30 	GPIO_DeInit(GPIOA);
 812  0001 ae5000        	ldw	x,#20480
 813  0004 cd0000        	call	_GPIO_DeInit
 815                     ; 31 	GPIO_DeInit(GPIOB);
 817  0007 ae5005        	ldw	x,#20485
 818  000a cd0000        	call	_GPIO_DeInit
 820                     ; 32 	GPIO_DeInit(GPIOC);
 822  000d ae500a        	ldw	x,#20490
 823  0010 cd0000        	call	_GPIO_DeInit
 825                     ; 33 	GPIO_DeInit(GPIOD);
 827  0013 ae500f        	ldw	x,#20495
 828  0016 cd0000        	call	_GPIO_DeInit
 830                     ; 71 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 833  0019 ae0080        	ldw	x,#128
 834  001c cd0000        	call	_Clock_HSI_Init
 836  001f               L373:
 837                     ; 82 	Modo.Registrar = gm_Registrar;
 840  001f ae0000        	ldw	x,#_gm_Registrar
 841  0022 bf28          	ldw	_Modo+16,x
 842                     ; 83 	Modo.Borrar = gm_Borrar;
 844  0024 ae0000        	ldw	x,#_gm_Borrar
 845  0027 bf2a          	ldw	_Modo+18,x
 846                     ; 84 	Modo.NuevoModo = gm_NuevoModo;
 848  0029 ae0000        	ldw	x,#_gm_NuevoModo
 849  002c bf2c          	ldw	_Modo+20,x
 850                     ; 85 	Modo.Init = gm_Init;
 852  002e ae0000        	ldw	x,#_gm_Init
 853  0031 bf2e          	ldw	_Modo+22,x
 854                     ; 87 	Modo.Init(&Modo.Datos);
 856  0033 ae0018        	ldw	x,#_Modo
 857  0036 92cd2e        	call	[_Modo+22.w]
 859                     ; 141 	Inicializacion_Total();
 863                     ; 92 	sensor->Init = iSd_Init;
 865  0039 ae0000        	ldw	x,#_iSd_Init
 866  003c bf0f          	ldw	_sensor1+3,x
 867                     ; 93 	sensor->Init(&sensor->Datos, modoCambiado, id, &Modo);
 869  003e ae0018        	ldw	x,#_Modo
 870  0041 89            	pushw	x
 871  0042 4b00          	push	#0
 872  0044 ae0000        	ldw	x,#_dht11_ModoCambiado
 873  0047 89            	pushw	x
 874  0048 ae000c        	ldw	x,#_sensor1
 875  004b 92cd0f        	call	[_sensor1+3.w]
 877  004e 5b05          	addw	sp,#5
 878                     ; 141 	Inicializacion_Total();
 881                     ; 92 	sensor->Init = iSd_Init;
 883  0050 ae0000        	ldw	x,#_iSd_Init
 884  0053 bf03          	ldw	_sensor2+3,x
 885                     ; 93 	sensor->Init(&sensor->Datos, modoCambiado, id, &Modo);
 887  0055 ae0018        	ldw	x,#_Modo
 888  0058 89            	pushw	x
 889  0059 4b01          	push	#1
 890  005b ae0000        	ldw	x,#_dht11_ModoCambiado
 891  005e 89            	pushw	x
 892  005f ae0000        	ldw	x,#_sensor2
 893  0062 92cd03        	call	[_sensor2+3.w]
 895  0065 5b05          	addw	sp,#5
 896                     ; 109 	Modo.NuevoModo(sensor1.sistema.Datos.ID, &gm_MEDICION, &Modo.Datos);
 898  0067 ae0018        	ldw	x,#_Modo
 899  006a 89            	pushw	x
 900  006b ae0000        	ldw	x,#_gm_MEDICION
 901  006e 89            	pushw	x
 902  006f b60c          	ld	a,_sensor1
 903  0071 92cd2c        	call	[_Modo+20.w]
 905  0074 5b04          	addw	sp,#4
 906  0076               L555:
 910  0076 ae0064        	ldw	x,#100
 911  0079 1f01          	ldw	(OFST-1,sp),x
 914  007b 2008          	jra	L565
 915  007d               L165:
 916                     ; 27 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 920  007d ae14d4        	ldw	x,#5332
 922  0080 9d            nop
 923  0081                L6:
 924  0081 5a             decw X
 925  0082 26fd           jrne L6
 926  0084 9d             nop
 927                      
 929  0085               L565:
 930                     ; 38 	while ( __ms-- )
 932  0085 1e01          	ldw	x,(OFST-1,sp)
 933  0087 1d0001        	subw	x,#1
 934  008a 1f01          	ldw	(OFST-1,sp),x
 935  008c 1c0001        	addw	x,#1
 937  008f a30000        	cpw	x,#0
 938  0092 26e9          	jrne	L165
 939  0094 20e0          	jra	L555
 952                     	xdef	_main
 953                     	switch	.ubsct
 954  0000               _sensor2:
 955  0000 000000000000  	ds.b	12
 956                     	xdef	_sensor2
 957  000c               _sensor1:
 958  000c 000000000000  	ds.b	12
 959                     	xdef	_sensor1
 960  0018               _Modo:
 961  0018 000000000000  	ds.b	24
 962                     	xdef	_Modo
 963                     	xref	_dht11_ModoCambiado
 964                     	xref	_iSd_Init
 965                     	xref	_gm_NuevoModo
 966                     	xref	_gm_Borrar
 967                     	xref	_gm_Registrar
 968                     	xref	_gm_Init
 969                     	xref.b	_gm_MEDICION
 970                     	xref	_Clock_HSI_Init
 971                     	xref	_GPIO_DeInit
 991                     	end
