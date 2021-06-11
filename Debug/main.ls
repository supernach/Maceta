   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 877                     ; 133 int main()
 877                     ; 134 {
 879                     	switch	.text
 880  0000               _main:
 882  0000 89            	pushw	x
 883       00000002      OFST:	set	2
 886                     ; 24 	GPIO_DeInit(GPIOA);
 890  0001 ae5000        	ldw	x,#20480
 891  0004 cd0000        	call	_GPIO_DeInit
 893                     ; 25 	GPIO_DeInit(GPIOB);
 895  0007 ae5005        	ldw	x,#20485
 896  000a cd0000        	call	_GPIO_DeInit
 898                     ; 26 	GPIO_DeInit(GPIOC);
 900  000d ae500a        	ldw	x,#20490
 901  0010 cd0000        	call	_GPIO_DeInit
 903                     ; 27 	GPIO_DeInit(GPIOD);
 905  0013 ae500f        	ldw	x,#20495
 906  0016 cd0000        	call	_GPIO_DeInit
 908                     ; 66 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 911  0019 ae0080        	ldw	x,#128
 912  001c cd0000        	call	_Clock_HSI_Init
 914                     ; 40 	sensor1.pin.Pin = GPIO_PIN_2;
 918  001f 35040015      	mov	_sensor1+7,#4
 919                     ; 41 	sensor1.pin.Puerto = GPIOD;
 921  0023 ae500f        	ldw	x,#20495
 922  0026 bf13          	ldw	_sensor1+5,x
 923  0028               L334:
 924                     ; 77 	Modo.Registrar = gm_Registrar;
 927  0028 ae0000        	ldw	x,#_gm_Registrar
 928  002b bf2c          	ldw	_Modo+16,x
 929                     ; 78 	Modo.Borrar = gm_Borrar;
 931  002d ae0000        	ldw	x,#_gm_Borrar
 932  0030 bf2e          	ldw	_Modo+18,x
 933                     ; 79 	Modo.NuevoModo = gm_NuevoModo;
 935  0032 ae0000        	ldw	x,#_gm_NuevoModo
 936  0035 bf30          	ldw	_Modo+20,x
 937                     ; 80 	Modo.Init = gm_Init;
 939  0037 ae0000        	ldw	x,#_gm_Init
 940  003a bf32          	ldw	_Modo+22,x
 941                     ; 82 	Modo.Init(&Modo.Datos);
 943  003c ae001c        	ldw	x,#_Modo
 944  003f 92cd32        	call	[_Modo+22.w]
 946                     ; 136 	Inicializacion_Total();
 950                     ; 87 	sensor->Init = iSd_Init;
 952  0042 ae0000        	ldw	x,#_iSd_Init
 953  0045 bf11          	ldw	_sensor1+3,x
 954                     ; 88 	sensor->Init(&sensor->Datos, modoCambiado, id, &Modo);
 956  0047 ae001c        	ldw	x,#_Modo
 957  004a 89            	pushw	x
 958  004b 4b00          	push	#0
 959  004d ae0000        	ldw	x,#_dht11_ModoCambiado
 960  0050 89            	pushw	x
 961  0051 ae000e        	ldw	x,#_sensor1
 962  0054 92cd11        	call	[_sensor1+3.w]
 964  0057 5b05          	addw	sp,#5
 965  0059               L344:
 969  0059 ae03e8        	ldw	x,#1000
 970  005c 1f01          	ldw	(OFST-1,sp),x
 973  005e 2008          	jra	L716
 974  0060               L316:
 975                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 979  0060 ae14d4        	ldw	x,#5332
 981  0063 9d            nop
 982  0064                L6:
 983  0064 5a             decw X
 984  0065 26fd           jrne L6
 985  0067 9d             nop
 986                      
 988  0068               L716:
 989                     ; 37 	while ( __ms-- )
 991  0068 1e01          	ldw	x,(OFST-1,sp)
 992  006a 1d0001        	subw	x,#1
 993  006d 1f01          	ldw	(OFST-1,sp),x
 994  006f 1c0001        	addw	x,#1
 996  0072 a30000        	cpw	x,#0
 997  0075 26e9          	jrne	L316
 998  0077               L326:
 999                     ; 142 		tarea_Sensor1();
1001  0077 ad20          	call	_tarea_Sensor1
1006  0079 ae0064        	ldw	x,#100
1007  007c 1f01          	ldw	(OFST-1,sp),x
1010  007e 2008          	jra	L336
1011  0080               L726:
1012                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1016  0080 ae14d4        	ldw	x,#5332
1018  0083 9d            nop
1019  0084                L01:
1020  0084 5a             decw X
1021  0085 26fd           jrne L01
1022  0087 9d             nop
1023                      
1025  0088               L336:
1026                     ; 37 	while ( __ms-- )
1028  0088 1e01          	ldw	x,(OFST-1,sp)
1029  008a 1d0001        	subw	x,#1
1030  008d 1f01          	ldw	(OFST-1,sp),x
1031  008f 1c0001        	addw	x,#1
1033  0092 a30000        	cpw	x,#0
1034  0095 26e9          	jrne	L726
1035  0097 20de          	jra	L326
1063                     	switch	.text
1064  0099               _tarea_Sensor1:
1070  0099 ae000e        	ldw	x,#_sensor1
1071  009c cd0000        	call	_dht11_ComenzarTransmision
1075  009f ae000e        	ldw	x,#_sensor1
1076  00a2 cd0000        	call	_dht11_LeerDatos
1080  00a5 ae000e        	ldw	x,#_sensor1
1081  00a8 cd0000        	call	_dht11_CerrarConexion
1086  00ab 81            	ret
1099                     	xdef	_main
1100                     	xdef	_tarea_Sensor1
1101                     	switch	.ubsct
1102  0000               _sensor2:
1103  0000 000000000000  	ds.b	14
1104                     	xdef	_sensor2
1105  000e               _sensor1:
1106  000e 000000000000  	ds.b	14
1107                     	xdef	_sensor1
1108  001c               _Modo:
1109  001c 000000000000  	ds.b	24
1110                     	xdef	_Modo
1111                     	xref	_dht11_CerrarConexion
1112                     	xref	_dht11_LeerDatos
1113                     	xref	_dht11_ComenzarTransmision
1114                     	xref	_dht11_ModoCambiado
1115                     	xref	_iSd_Init
1116                     	xref	_gm_NuevoModo
1117                     	xref	_gm_Borrar
1118                     	xref	_gm_Registrar
1119                     	xref	_gm_Init
1120                     	xref	_Clock_HSI_Init
1121                     	xref	_GPIO_DeInit
1141                     	end
