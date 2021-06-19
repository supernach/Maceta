   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 975                     ; 150 int main()
 975                     ; 151 {
 977                     	switch	.text
 978  0000               _main:
 980  0000 89            	pushw	x
 981       00000002      OFST:	set	2
 984                     ; 24 	GPIO_DeInit(GPIOA);
 988  0001 ae5000        	ldw	x,#20480
 989  0004 cd0000        	call	_GPIO_DeInit
 991                     ; 25 	GPIO_DeInit(GPIOB);
 993  0007 ae5005        	ldw	x,#20485
 994  000a cd0000        	call	_GPIO_DeInit
 996                     ; 26 	GPIO_DeInit(GPIOC);
 998  000d ae500a        	ldw	x,#20490
 999  0010 cd0000        	call	_GPIO_DeInit
1001                     ; 27 	GPIO_DeInit(GPIOD);
1003  0013 ae500f        	ldw	x,#20495
1004  0016 cd0000        	call	_GPIO_DeInit
1006                     ; 68 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
1009  0019 ae0080        	ldw	x,#128
1010  001c cd0000        	call	_Clock_HSI_Init
1012                     ; 40 	sensor1.Sensor.Config.HW.Pin = GPIO_PIN_3;
1016  001f 35080002      	mov	_sensor1+2,#8
1017                     ; 41 	sensor1.Sensor.Config.HW.Puerto = GPIOA;
1019  0023 ae5000        	ldw	x,#20480
1020  0026 bf00          	ldw	_sensor1,x
1021                     ; 42 	Output2mhz_Init( &sensor1.Sensor.Config.HW );
1023  0028 ae0000        	ldw	x,#_sensor1
1024  002b cd0000        	call	_Output2mhz_Init
1026                     ; 43 	Output_1( &sensor1.Sensor.Config.HW );
1028  002e ae0000        	ldw	x,#_sensor1
1029  0031 cd0000        	call	_Output_1
1031  0034               L506:
1032                     ; 102 	Modo.Registrar = gm_Registrar;
1035  0034 ae0000        	ldw	x,#_gm_Registrar
1036  0037 bf22          	ldw	_Modo+16,x
1037                     ; 103 	Modo.Borrar = gm_Borrar;
1039  0039 ae0000        	ldw	x,#_gm_Borrar
1040  003c bf24          	ldw	_Modo+18,x
1041                     ; 104 	Modo.NuevoModo = gm_NuevoModo;
1043  003e ae0000        	ldw	x,#_gm_NuevoModo
1044  0041 bf26          	ldw	_Modo+20,x
1045                     ; 105 	Modo.Init = gm_Init;
1047  0043 ae0000        	ldw	x,#_gm_Init
1048  0046 bf28          	ldw	_Modo+22,x
1049                     ; 107 	Modo.Init(&Modo.Datos);
1051  0048 ae0012        	ldw	x,#_Modo
1052  004b 92cd28        	call	[_Modo+22.w]
1054                     ; 120 	SensorTH_Init(&sensor1, &Modo);
1057  004e ae0012        	ldw	x,#_Modo
1058  0051 89            	pushw	x
1059  0052 ae0000        	ldw	x,#_sensor1
1060  0055 cd0000        	call	_SensorTH_Init
1062  0058 85            	popw	x
1063                     ; 121 	ptrHaciaSensores.SensorTH = &sensor1.Sensor;
1065  0059 ae0000        	ldw	x,#_sensor1
1066  005c bf2a          	ldw	_ptrHaciaSensores,x
1067  005e               L316:
1071  005e ae03e8        	ldw	x,#1000
1072  0061 1f01          	ldw	(OFST-1,sp),x
1075  0063 2008          	jra	L566
1076  0065               L166:
1077                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1081  0065 ae14d4        	ldw	x,#5332
1083  0068 9d            nop
1084  0069                L6:
1085  0069 5a             decw X
1086  006a 26fd           jrne L6
1087  006c 9d             nop
1088                      
1090  006d               L566:
1091                     ; 40 	while ( __ms-- )
1093  006d 1e01          	ldw	x,(OFST-1,sp)
1094  006f 1d0001        	subw	x,#1
1095  0072 1f01          	ldw	(OFST-1,sp),x
1096  0074 1c0001        	addw	x,#1
1098  0077 a30000        	cpw	x,#0
1099  007a 26e9          	jrne	L166
1100  007c               L176:
1101                     ; 158 		Modo.NuevoModo(sensor1.Sistema.Datos.ID, &gm_MEDICION, &Modo.Datos);
1103  007c ae0012        	ldw	x,#_Modo
1104  007f 89            	pushw	x
1105  0080 ae0000        	ldw	x,#_gm_MEDICION
1106  0083 89            	pushw	x
1107  0084 b60d          	ld	a,_sensor1+13
1108  0086 92cd26        	call	[_Modo+20.w]
1110  0089 5b04          	addw	sp,#4
1114  008b ae03e8        	ldw	x,#1000
1115  008e 1f01          	ldw	(OFST-1,sp),x
1118  0090 2008          	jra	L107
1119  0092               L576:
1120                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1124  0092 ae14d4        	ldw	x,#5332
1126  0095 9d            nop
1127  0096                L01:
1128  0096 5a             decw X
1129  0097 26fd           jrne L01
1130  0099 9d             nop
1131                      
1133  009a               L107:
1134                     ; 40 	while ( __ms-- )
1136  009a 1e01          	ldw	x,(OFST-1,sp)
1137  009c 1d0001        	subw	x,#1
1138  009f 1f01          	ldw	(OFST-1,sp),x
1139  00a1 1c0001        	addw	x,#1
1141  00a4 a30000        	cpw	x,#0
1142  00a7 26e9          	jrne	L576
1143  00a9 20d1          	jra	L176
1156                     	xdef	_main
1157                     	switch	.ubsct
1158  0000               _sensor1:
1159  0000 000000000000  	ds.b	18
1160                     	xdef	_sensor1
1161  0012               _Modo:
1162  0012 000000000000  	ds.b	24
1163                     	xdef	_Modo
1164  002a               _ptrHaciaSensores:
1165  002a 0000          	ds.b	2
1166                     	xdef	_ptrHaciaSensores
1167                     	xref	_Maceta_Init
1168  002c               _Maceta:
1169  002c 000000000000  	ds.b	10
1170                     	xdef	_Maceta
1171                     	xref	_cmdLeer_Init
1172  0036               _cmd_Leer:
1173  0036 000000000000  	ds.b	6
1174                     	xdef	_cmd_Leer
1175                     	xref	_SensorTH_Init
1176                     	xref	_gm_NuevoModo
1177                     	xref	_gm_Borrar
1178                     	xref	_gm_Registrar
1179                     	xref	_gm_Init
1180                     	xref.b	_gm_MEDICION
1181                     	xref	_Clock_HSI_Init
1182                     	xref	_Output_1
1183                     	xref	_Output2mhz_Init
1184                     	xref	_GPIO_DeInit
1204                     	end
