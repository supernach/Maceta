   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 922                     ; 134 int main()
 922                     ; 135 {
 924                     	switch	.text
 925  0000               _main:
 927  0000 89            	pushw	x
 928       00000002      OFST:	set	2
 931                     ; 24 	GPIO_DeInit(GPIOA);
 935  0001 ae5000        	ldw	x,#20480
 936  0004 cd0000        	call	_GPIO_DeInit
 938                     ; 25 	GPIO_DeInit(GPIOB);
 940  0007 ae5005        	ldw	x,#20485
 941  000a cd0000        	call	_GPIO_DeInit
 943                     ; 26 	GPIO_DeInit(GPIOC);
 945  000d ae500a        	ldw	x,#20490
 946  0010 cd0000        	call	_GPIO_DeInit
 948                     ; 27 	GPIO_DeInit(GPIOD);
 950  0013 ae500f        	ldw	x,#20495
 951  0016 cd0000        	call	_GPIO_DeInit
 953                     ; 68 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 956  0019 ae0080        	ldw	x,#128
 957  001c cd0000        	call	_Clock_HSI_Init
 959                     ; 40 	sensor1.pin.Pin = GPIO_PIN_3;
 963  001f 35080017      	mov	_sensor1+7,#8
 964                     ; 41 	sensor1.pin.Puerto = GPIOA;
 966  0023 ae5000        	ldw	x,#20480
 967  0026 bf15          	ldw	_sensor1+5,x
 968                     ; 42 	Output2mhz_Init( &sensor1.pin );
 970  0028 ae0015        	ldw	x,#_sensor1+5
 971  002b cd0000        	call	_Output2mhz_Init
 973                     ; 43 	Output_1( &sensor1.pin );
 975  002e ae0015        	ldw	x,#_sensor1+5
 976  0031 cd0000        	call	_Output_1
 978  0034               L744:
 979                     ; 79 	Modo.Registrar = gm_Registrar;
 982  0034 ae0000        	ldw	x,#_gm_Registrar
 983  0037 bf30          	ldw	_Modo+16,x
 984                     ; 80 	Modo.Borrar = gm_Borrar;
 986  0039 ae0000        	ldw	x,#_gm_Borrar
 987  003c bf32          	ldw	_Modo+18,x
 988                     ; 81 	Modo.NuevoModo = gm_NuevoModo;
 990  003e ae0000        	ldw	x,#_gm_NuevoModo
 991  0041 bf34          	ldw	_Modo+20,x
 992                     ; 82 	Modo.Init = gm_Init;
 994  0043 ae0000        	ldw	x,#_gm_Init
 995  0046 bf36          	ldw	_Modo+22,x
 996                     ; 84 	Modo.Init(&Modo.Datos);
 998  0048 ae0020        	ldw	x,#_Modo
 999  004b 92cd36        	call	[_Modo+22.w]
1001                     ; 136 	Inicializacion_Total();
1005                     ; 89 	sensor->Init = iSd_Init;
1007  004e ae0000        	ldw	x,#_iSd_Init
1008  0051 bf13          	ldw	_sensor1+3,x
1009                     ; 90 	sensor->Init(&sensor->Datos, modoCambiado, id, &Modo);
1011  0053 ae0020        	ldw	x,#_Modo
1012  0056 89            	pushw	x
1013  0057 4b00          	push	#0
1014  0059 ae0000        	ldw	x,#_dht11_ModoCambiado
1015  005c 89            	pushw	x
1016  005d ae0010        	ldw	x,#_sensor1
1017  0060 92cd13        	call	[_sensor1+3.w]
1019  0063 5b05          	addw	sp,#5
1020                     ; 104 	sensor1.Lectura = &dht11_Lectura;
1022  0065 ae0000        	ldw	x,#_dht11_Lectura
1023  0068 bf1e          	ldw	_sensor1+14,x
1024                     ; 105 	Modo.NuevoModo(sensor1.sistema.Datos.ID, &gm_MEDICION, &Modo.Datos);
1026  006a ae0020        	ldw	x,#_Modo
1027  006d 89            	pushw	x
1028  006e ae0000        	ldw	x,#_gm_MEDICION
1029  0071 89            	pushw	x
1030  0072 b610          	ld	a,_sensor1
1031  0074 92cd34        	call	[_Modo+20.w]
1033  0077 5b04          	addw	sp,#4
1034  0079               L754:
1038  0079 ae03e8        	ldw	x,#1000
1039  007c 1f01          	ldw	(OFST-1,sp),x
1042  007e 2008          	jra	L336
1043  0080               L726:
1044                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1048  0080 ae14d4        	ldw	x,#5332
1050  0083 9d            nop
1051  0084                L6:
1052  0084 5a             decw X
1053  0085 26fd           jrne L6
1054  0087 9d             nop
1055                      
1057  0088               L336:
1058                     ; 40 	while ( __ms-- )
1060  0088 1e01          	ldw	x,(OFST-1,sp)
1061  008a 1d0001        	subw	x,#1
1062  008d 1f01          	ldw	(OFST-1,sp),x
1063  008f 1c0001        	addw	x,#1
1065  0092 a30000        	cpw	x,#0
1066  0095 26e9          	jrne	L726
1067  0097               L736:
1068                     ; 141 		sensor1.Lectura( &sensor1 );
1070  0097 ae0010        	ldw	x,#_sensor1
1071  009a 92cd1e        	call	[_sensor1+14.w]
1076  009d ae0bb8        	ldw	x,#3000
1077  00a0 1f01          	ldw	(OFST-1,sp),x
1080  00a2 2008          	jra	L746
1081  00a4               L346:
1082                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1086  00a4 ae14d4        	ldw	x,#5332
1088  00a7 9d            nop
1089  00a8                L01:
1090  00a8 5a             decw X
1091  00a9 26fd           jrne L01
1092  00ab 9d             nop
1093                      
1095  00ac               L746:
1096                     ; 40 	while ( __ms-- )
1098  00ac 1e01          	ldw	x,(OFST-1,sp)
1099  00ae 1d0001        	subw	x,#1
1100  00b1 1f01          	ldw	(OFST-1,sp),x
1101  00b3 1c0001        	addw	x,#1
1103  00b6 a30000        	cpw	x,#0
1104  00b9 26e9          	jrne	L346
1105  00bb 20da          	jra	L736
1118                     	xdef	_main
1119                     	switch	.ubsct
1120  0000               _sensor2:
1121  0000 000000000000  	ds.b	16
1122                     	xdef	_sensor2
1123  0010               _sensor1:
1124  0010 000000000000  	ds.b	16
1125                     	xdef	_sensor1
1126  0020               _Modo:
1127  0020 000000000000  	ds.b	24
1128                     	xdef	_Modo
1129                     	xref	_dht11_Lectura
1130                     	xref	_dht11_ModoCambiado
1131                     	xref	_iSd_Init
1132                     	xref	_gm_NuevoModo
1133                     	xref	_gm_Borrar
1134                     	xref	_gm_Registrar
1135                     	xref	_gm_Init
1136                     	xref.b	_gm_MEDICION
1137                     	xref	_Clock_HSI_Init
1138                     	xref	_Output_1
1139                     	xref	_Output2mhz_Init
1140                     	xref	_GPIO_DeInit
1160                     	end
