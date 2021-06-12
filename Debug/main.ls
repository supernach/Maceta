   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 894                     ; 133 int main()
 894                     ; 134 {
 896                     	switch	.text
 897  0000               _main:
 899  0000 89            	pushw	x
 900       00000002      OFST:	set	2
 903                     ; 24 	GPIO_DeInit(GPIOA);
 907  0001 ae5000        	ldw	x,#20480
 908  0004 cd0000        	call	_GPIO_DeInit
 910                     ; 25 	GPIO_DeInit(GPIOB);
 912  0007 ae5005        	ldw	x,#20485
 913  000a cd0000        	call	_GPIO_DeInit
 915                     ; 26 	GPIO_DeInit(GPIOC);
 917  000d ae500a        	ldw	x,#20490
 918  0010 cd0000        	call	_GPIO_DeInit
 920                     ; 27 	GPIO_DeInit(GPIOD);
 922  0013 ae500f        	ldw	x,#20495
 923  0016 cd0000        	call	_GPIO_DeInit
 925                     ; 68 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 928  0019 ae0080        	ldw	x,#128
 929  001c cd0000        	call	_Clock_HSI_Init
 931                     ; 40 	sensor1.pin.Pin = GPIO_PIN_3;
 935  001f 35080015      	mov	_sensor1+7,#8
 936                     ; 41 	sensor1.pin.Puerto = GPIOA;
 938  0023 ae5000        	ldw	x,#20480
 939  0026 bf13          	ldw	_sensor1+5,x
 940                     ; 42 	Output2mhz_Init( &sensor1.pin );
 942  0028 ae0013        	ldw	x,#_sensor1+5
 943  002b cd0000        	call	_Output2mhz_Init
 945                     ; 43 	Output_1( &sensor1.pin );
 947  002e ae0013        	ldw	x,#_sensor1+5
 948  0031 cd0000        	call	_Output_1
 950  0034               L734:
 951                     ; 79 	Modo.Registrar = gm_Registrar;
 954  0034 ae0000        	ldw	x,#_gm_Registrar
 955  0037 bf2c          	ldw	_Modo+16,x
 956                     ; 80 	Modo.Borrar = gm_Borrar;
 958  0039 ae0000        	ldw	x,#_gm_Borrar
 959  003c bf2e          	ldw	_Modo+18,x
 960                     ; 81 	Modo.NuevoModo = gm_NuevoModo;
 962  003e ae0000        	ldw	x,#_gm_NuevoModo
 963  0041 bf30          	ldw	_Modo+20,x
 964                     ; 82 	Modo.Init = gm_Init;
 966  0043 ae0000        	ldw	x,#_gm_Init
 967  0046 bf32          	ldw	_Modo+22,x
 968                     ; 84 	Modo.Init(&Modo.Datos);
 970  0048 ae001c        	ldw	x,#_Modo
 971  004b 92cd32        	call	[_Modo+22.w]
 973                     ; 135 	Inicializacion_Total();
 977                     ; 89 	sensor->Init = iSd_Init;
 979  004e ae0000        	ldw	x,#_iSd_Init
 980  0051 bf11          	ldw	_sensor1+3,x
 981                     ; 90 	sensor->Init(&sensor->Datos, modoCambiado, id, &Modo);
 983  0053 ae001c        	ldw	x,#_Modo
 984  0056 89            	pushw	x
 985  0057 4b00          	push	#0
 986  0059 ae0000        	ldw	x,#_dht11_ModoCambiado
 987  005c 89            	pushw	x
 988  005d ae000e        	ldw	x,#_sensor1
 989  0060 92cd11        	call	[_sensor1+3.w]
 991  0063 5b05          	addw	sp,#5
 992                     ; 104 	Modo.NuevoModo(sensor1.sistema.Datos.ID, &gm_MEDICION, &Modo.Datos);
 994  0065 ae001c        	ldw	x,#_Modo
 995  0068 89            	pushw	x
 996  0069 ae0000        	ldw	x,#_gm_MEDICION
 997  006c 89            	pushw	x
 998  006d b60e          	ld	a,_sensor1
 999  006f 92cd30        	call	[_Modo+20.w]
1001  0072 5b04          	addw	sp,#4
1002  0074               L744:
1006  0074 ae03e8        	ldw	x,#1000
1007  0077 1f01          	ldw	(OFST-1,sp),x
1010  0079 2008          	jra	L326
1011  007b               L716:
1012                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1016  007b ae14d4        	ldw	x,#5332
1018  007e 9d            nop
1019  007f                L6:
1020  007f 5a             decw X
1021  0080 26fd           jrne L6
1022  0082 9d             nop
1023                      
1025  0083               L326:
1026                     ; 40 	while ( __ms-- )
1028  0083 1e01          	ldw	x,(OFST-1,sp)
1029  0085 1d0001        	subw	x,#1
1030  0088 1f01          	ldw	(OFST-1,sp),x
1031  008a 1c0001        	addw	x,#1
1033  008d a30000        	cpw	x,#0
1034  0090 26e9          	jrne	L716
1035  0092               L726:
1036                     ; 140 		tarea_Sensor1();
1038  0092 ad20          	call	_tarea_Sensor1
1043  0094 ae000a        	ldw	x,#10
1044  0097 1f01          	ldw	(OFST-1,sp),x
1047  0099 2008          	jra	L736
1048  009b               L336:
1049                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1053  009b ae14d4        	ldw	x,#5332
1055  009e 9d            nop
1056  009f                L01:
1057  009f 5a             decw X
1058  00a0 26fd           jrne L01
1059  00a2 9d             nop
1060                      
1062  00a3               L736:
1063                     ; 40 	while ( __ms-- )
1065  00a3 1e01          	ldw	x,(OFST-1,sp)
1066  00a5 1d0001        	subw	x,#1
1067  00a8 1f01          	ldw	(OFST-1,sp),x
1068  00aa 1c0001        	addw	x,#1
1070  00ad a30000        	cpw	x,#0
1071  00b0 26e9          	jrne	L336
1072  00b2 20de          	jra	L726
1098                     	switch	.text
1099  00b4               _tarea_Sensor1:
1105  00b4 92c60f        	ld	a,[_sensor1+1.w]
1106  00b7 a501          	bcp	a,#1
1107  00b9 2706          	jreq	L356
1110  00bb ae000e        	ldw	x,#_sensor1
1111  00be cd0000        	call	_dht11_ComenzarTransmision
1113  00c1               L356:
1117  00c1 81            	ret
1130                     	xdef	_main
1131                     	xdef	_tarea_Sensor1
1132                     	switch	.ubsct
1133  0000               _sensor2:
1134  0000 000000000000  	ds.b	14
1135                     	xdef	_sensor2
1136  000e               _sensor1:
1137  000e 000000000000  	ds.b	14
1138                     	xdef	_sensor1
1139  001c               _Modo:
1140  001c 000000000000  	ds.b	24
1141                     	xdef	_Modo
1142                     	xref	_dht11_ComenzarTransmision
1143                     	xref	_dht11_ModoCambiado
1144                     	xref	_iSd_Init
1145                     	xref	_gm_NuevoModo
1146                     	xref	_gm_Borrar
1147                     	xref	_gm_Registrar
1148                     	xref	_gm_Init
1149                     	xref.b	_gm_MEDICION
1150                     	xref	_Clock_HSI_Init
1151                     	xref	_Output_1
1152                     	xref	_Output2mhz_Init
1153                     	xref	_GPIO_DeInit
1173                     	end
