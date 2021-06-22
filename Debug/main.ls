   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 965                     ; 151 int main()
 965                     ; 152 {
 967                     	switch	.text
 968  0000               _main:
 970  0000 89            	pushw	x
 971       00000002      OFST:	set	2
 974                     ; 24 	GPIO_DeInit(GPIOA);
 978  0001 ae5000        	ldw	x,#20480
 979  0004 cd0000        	call	_GPIO_DeInit
 981                     ; 25 	GPIO_DeInit(GPIOB);
 983  0007 ae5005        	ldw	x,#20485
 984  000a cd0000        	call	_GPIO_DeInit
 986                     ; 26 	GPIO_DeInit(GPIOC);
 988  000d ae500a        	ldw	x,#20490
 989  0010 cd0000        	call	_GPIO_DeInit
 991                     ; 27 	GPIO_DeInit(GPIOD);
 993  0013 ae500f        	ldw	x,#20495
 994  0016 cd0000        	call	_GPIO_DeInit
 996                     ; 68 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
 999  0019 ae0080        	ldw	x,#128
1000  001c cd0000        	call	_Clock_HSI_Init
1002                     ; 40 	sensor1.Sensor.Config.HW.Pin = GPIO_PIN_3;
1006  001f 35080014      	mov	_sensor1+2,#8
1007                     ; 41 	sensor1.Sensor.Config.HW.Puerto = GPIOA;
1009  0023 ae5000        	ldw	x,#20480
1010  0026 bf12          	ldw	_sensor1,x
1011                     ; 42 	Output2mhz_Init( &sensor1.Sensor.Config.HW );
1013  0028 ae0012        	ldw	x,#_sensor1
1014  002b cd0000        	call	_Output2mhz_Init
1016                     ; 43 	Output_1( &sensor1.Sensor.Config.HW );
1018  002e ae0012        	ldw	x,#_sensor1
1019  0031 cd0000        	call	_Output_1
1021  0034               L306:
1022                     ; 102 	Modo.Registrar = gm_Registrar;
1025  0034 ae0000        	ldw	x,#_gm_Registrar
1026  0037 bf34          	ldw	_Modo+16,x
1027                     ; 103 	Modo.Borrar = gm_Borrar;
1029  0039 ae0000        	ldw	x,#_gm_Borrar
1030  003c bf36          	ldw	_Modo+18,x
1031                     ; 104 	Modo.NuevoModo = gm_NuevoModo;
1033  003e ae0000        	ldw	x,#_gm_NuevoModo
1034  0041 bf38          	ldw	_Modo+20,x
1035                     ; 105 	Modo.Init = gm_Init;
1037  0043 ae0000        	ldw	x,#_gm_Init
1038  0046 bf3a          	ldw	_Modo+22,x
1039                     ; 107 	Modo.Init(&Modo.Datos);
1041  0048 ae0024        	ldw	x,#_Modo
1042  004b 92cd3a        	call	[_Modo+22.w]
1044                     ; 120 	SensorTH_Init(&sensor1, &Modo);
1047  004e ae0024        	ldw	x,#_Modo
1048  0051 89            	pushw	x
1049  0052 ae0012        	ldw	x,#_sensor1
1050  0055 cd0000        	call	_SensorTH_Init
1052  0058 85            	popw	x
1053                     ; 121 	ptrHaciaSensores.SensorTH = &sensor1;
1055  0059 ae0012        	ldw	x,#_sensor1
1056  005c bf3c          	ldw	_ptrHaciaSensores,x
1057                     ; 77 	cmdLeer_Init( &cmd_Leer );
1061  005e ae0046        	ldw	x,#_cmd_Leer
1062  0061 cd0000        	call	_cmdLeer_Init
1064                     ; 85 	Maceta_Init( &Maceta );	
1067  0064 ae003e        	ldw	x,#_Maceta
1068  0067 cd0000        	call	_Maceta_Init
1070  006a               L716:
1074  006a ae03e8        	ldw	x,#1000
1075  006d 1f01          	ldw	(OFST-1,sp),x
1078  006f 2008          	jra	L176
1079  0071               L566:
1080                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1084  0071 ae14d4        	ldw	x,#5332
1086  0074 9d            nop
1087  0075                L6:
1088  0075 5a             decw X
1089  0076 26fd           jrne L6
1090  0078 9d             nop
1091                      
1093  0079               L176:
1094                     ; 40 	while ( __ms-- )
1096  0079 1e01          	ldw	x,(OFST-1,sp)
1097  007b 1d0001        	subw	x,#1
1098  007e 1f01          	ldw	(OFST-1,sp),x
1099  0080 1c0001        	addw	x,#1
1101  0083 a30000        	cpw	x,#0
1102  0086 26e9          	jrne	L566
1103  0088               L576:
1104                     ; 158 		Maceta.ConfigCommand( &Maceta, &cmd_Leer, &sensor1.cmdLeer, &ptrHaciaSensores );
1106  0088 ae003c        	ldw	x,#_ptrHaciaSensores
1107  008b 89            	pushw	x
1108  008c ae001d        	ldw	x,#_sensor1+11
1109  008f 89            	pushw	x
1110  0090 ae0046        	ldw	x,#_cmd_Leer
1111  0093 89            	pushw	x
1112  0094 ae003e        	ldw	x,#_Maceta
1113  0097 92cd42        	call	[_Maceta+4.w]
1115  009a 5b06          	addw	sp,#6
1116                     ; 159 		Maceta.ExecuteCommand( &Maceta );
1118  009c ae003e        	ldw	x,#_Maceta
1119  009f 92cd44        	call	[_Maceta+6.w]
1121                     ; 161 		Modo.NuevoModo(sensor1.Sistema.Datos.ID, &gm_MEDICION, &Modo.Datos);
1123  00a2 ae0024        	ldw	x,#_Modo
1124  00a5 89            	pushw	x
1125  00a6 ae0000        	ldw	x,#_gm_MEDICION
1126  00a9 89            	pushw	x
1127  00aa b61f          	ld	a,_sensor1+13
1128  00ac 92cd38        	call	[_Modo+20.w]
1130  00af 5b04          	addw	sp,#4
1134  00b1 ae03e8        	ldw	x,#1000
1135  00b4 1f01          	ldw	(OFST-1,sp),x
1138  00b6 2008          	jra	L507
1139  00b8               L107:
1140                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1144  00b8 ae14d4        	ldw	x,#5332
1146  00bb 9d            nop
1147  00bc                L01:
1148  00bc 5a             decw X
1149  00bd 26fd           jrne L01
1150  00bf 9d             nop
1151                      
1153  00c0               L507:
1154                     ; 40 	while ( __ms-- )
1156  00c0 1e01          	ldw	x,(OFST-1,sp)
1157  00c2 1d0001        	subw	x,#1
1158  00c5 1f01          	ldw	(OFST-1,sp),x
1159  00c7 1c0001        	addw	x,#1
1161  00ca a30000        	cpw	x,#0
1162  00cd 26e9          	jrne	L107
1163  00cf 20b7          	jra	L576
1176                     	xdef	_main
1177                     	switch	.ubsct
1178  0000               _sensor2:
1179  0000 000000000000  	ds.b	18
1180                     	xdef	_sensor2
1181  0012               _sensor1:
1182  0012 000000000000  	ds.b	18
1183                     	xdef	_sensor1
1184  0024               _Modo:
1185  0024 000000000000  	ds.b	24
1186                     	xdef	_Modo
1187  003c               _ptrHaciaSensores:
1188  003c 0000          	ds.b	2
1189                     	xdef	_ptrHaciaSensores
1190                     	xref	_SensorTH_Init
1191                     	xref	_Maceta_Init
1192  003e               _Maceta:
1193  003e 000000000000  	ds.b	8
1194                     	xdef	_Maceta
1195                     	xref	_cmdLeer_Init
1196  0046               _cmd_Leer:
1197  0046 00000000      	ds.b	4
1198                     	xdef	_cmd_Leer
1199                     	xref	_gm_NuevoModo
1200                     	xref	_gm_Borrar
1201                     	xref	_gm_Registrar
1202                     	xref	_gm_Init
1203                     	xref.b	_gm_MEDICION
1204                     	xref	_Clock_HSI_Init
1205                     	xref	_Output_1
1206                     	xref	_Output2mhz_Init
1207                     	xref	_GPIO_DeInit
1227                     	end
