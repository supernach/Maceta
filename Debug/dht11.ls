   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  45                     ; 37 void dht11_ModoCambiado( void )
  45                     ; 38 {
  47                     	switch	.text
  48  0000               _dht11_ModoCambiado:
  52                     ; 40 }
  55  0000 81            	ret
 585                     ; 42 bool dht11_ComenzarTransmision( DHT11_t* sensor )
 585                     ; 43 {
 586                     	switch	.text
 587  0001               _dht11_ComenzarTransmision:
 589  0001 89            	pushw	x
 590       00000000      OFST:	set	0
 593                     ; 45 	Output2mhz_Init( &sensor->pin );
 595  0002 1c0005        	addw	x,#5
 596  0005 cd0000        	call	_Output2mhz_Init
 598                     ; 46 	Output_0( &sensor->pin );
 600  0008 1e01          	ldw	x,(OFST+1,sp)
 601  000a 1c0005        	addw	x,#5
 602  000d cd0000        	call	_Output_0
 604                     ; 48 	sensor->Datos.estado = dht11_COMUNICANDO;
 606  0010 1e01          	ldw	x,(OFST+1,sp)
 607  0012 a601          	ld	a,#1
 608  0014 e70d          	ld	(13,x),a
 609                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 613  0016 ae005f        	ldw	x,#95
 615  0019 9d            nop
 616  001a                L01:
 617  001a 5a             decw X
 618  001b 26fd           jrne L01
 619  001d 9d             nop
 620                      
 622  001e               L33:
 623                     ; 51 	Output_1( &sensor->pin );
 625  001e 1e01          	ldw	x,(OFST+1,sp)
 626  0020 1c0005        	addw	x,#5
 627  0023 cd0000        	call	_Output_1
 629                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 633  0026 ae0069        	ldw	x,#105
 635  0029 9d            nop
 636  002a                L21:
 637  002a 5a             decw X
 638  002b 26fd           jrne L21
 639  002d 9d             nop
 640                      
 642  002e               L73:
 643                     ; 55 	Input_FL_Init( &sensor->pin ); //Configuro como entrada para leer
 645  002e 1e01          	ldw	x,(OFST+1,sp)
 646  0030 1c0005        	addw	x,#5
 647  0033 cd0000        	call	_Input_FL_Init
 650  0036 2006          	jra	L753
 651  0038               L553:
 652                     ; 67 		sensor->Datos.estado = dht11_ESPERA_BAJO;
 654  0038 1e01          	ldw	x,(OFST+1,sp)
 655  003a a607          	ld	a,#7
 656  003c e70d          	ld	(13,x),a
 657  003e               L753:
 658                     ; 65 	while( !IsActive( &sensor->pin ) )
 660  003e 1e01          	ldw	x,(OFST+1,sp)
 661  0040 1c0005        	addw	x,#5
 662  0043 cd0000        	call	_IsActive
 664  0046 4d            	tnz	a
 665  0047 27ef          	jreq	L553
 667  0049 2006          	jra	L563
 668  004b               L363:
 669                     ; 79 		sensor->Datos.estado = dht11_ESPERA_ALTO;
 671  004b 1e01          	ldw	x,(OFST+1,sp)
 672  004d a608          	ld	a,#8
 673  004f e70d          	ld	(13,x),a
 674  0051               L563:
 675                     ; 77 	while( IsActive( &sensor->pin ) )
 677  0051 1e01          	ldw	x,(OFST+1,sp)
 678  0053 1c0005        	addw	x,#5
 679  0056 cd0000        	call	_IsActive
 681  0059 4d            	tnz	a
 682  005a 26ef          	jrne	L363
 683                     ; 93 	sensor->Datos.estado = dht11_CONEXION_OK;
 685  005c 1e01          	ldw	x,(OFST+1,sp)
 686  005e a602          	ld	a,#2
 687  0060 e70d          	ld	(13,x),a
 688                     ; 94 	return true;
 690  0062 a601          	ld	a,#1
 693  0064 85            	popw	x
 694  0065 81            	ret
 935                     ; 97 void dht11_LeerDatos( DHT11_t* sensor )
 935                     ; 98 {
 936                     	switch	.text
 937  0066               _dht11_LeerDatos:
 939  0066 89            	pushw	x
 940  0067 5205          	subw	sp,#5
 941       00000005      OFST:	set	5
 944                     ; 99 	sensor->Datos.estado = dht11_MIDIENDO_H;
 946  0069 a603          	ld	a,#3
 947  006b e70d          	ld	(13,x),a
 948                     ; 100 	sensor->Datos.UltimaLectura.H_Entero = leerByte(&sensor->pin);
 951  006d 1c0005        	addw	x,#5
 952  0070 1f04          	ldw	(OFST-1,sp),x
 954                     ; 5 	uint8_t contador = 0;
 956  0072 0f02          	clr	(OFST-3,sp)
 958                     ; 6 	uint8_t temp = 0;
 960  0074 0f03          	clr	(OFST-2,sp)
 962                     ; 7 	uint8_t bitLeido = 0;
 964                     ; 9 	for( contador; contador < 8; contador++ )
 967  0076 202e          	jra	L506
 968  0078               L316:
 969                     ; 11 		while( !IsActive( gpio ) )
 971  0078 1e04          	ldw	x,(OFST-1,sp)
 972  007a cd0000        	call	_IsActive
 974  007d 4d            	tnz	a
 975  007e 27f8          	jreq	L316
 976                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 980  0080 ae00d4        	ldw	x,#212
 982  0083 9d            nop
 983  0084                L61:
 984  0084 5a             decw X
 985  0085 26fd           jrne L61
 986  0087 9d             nop
 987                      
 989  0088               L373:
 990                     ; 17 		bitLeido = 0;
 992                     ; 18 		if( IsActive( gpio ) )
 994  0088 1e04          	ldw	x,(OFST-1,sp)
 995  008a cd0000        	call	_IsActive
 997  008d 4d            	tnz	a
 998  008e 2712          	jreq	L716
 999                     ; 20 			bitLeido = 1;
1001                     ; 21 			temp |= bitLeido;
1003  0090 7b03          	ld	a,(OFST-2,sp)
1004  0092 aa01          	or	a,#1
1005  0094 6b03          	ld	(OFST-2,sp),a
1007                     ; 22 			temp <<=  1;
1009  0096 0803          	sll	(OFST-2,sp)
1012  0098               L326:
1013                     ; 23 			while( IsActive( gpio ) )
1015  0098 1e04          	ldw	x,(OFST-1,sp)
1016  009a cd0000        	call	_IsActive
1018  009d 4d            	tnz	a
1019  009e 26f8          	jrne	L326
1021  00a0 2002          	jra	L726
1022  00a2               L716:
1023                     ; 30 			temp <<= 1;
1025  00a2 0803          	sll	(OFST-2,sp)
1027  00a4               L726:
1028                     ; 9 	for( contador; contador < 8; contador++ )
1030  00a4 0c02          	inc	(OFST-3,sp)
1032  00a6               L506:
1035  00a6 7b02          	ld	a,(OFST-3,sp)
1036  00a8 a108          	cp	a,#8
1037  00aa 25cc          	jrult	L316
1038                     ; 34 	return temp;
1040  00ac 7b03          	ld	a,(OFST-2,sp)
1041  00ae 1e06          	ldw	x,(OFST+1,sp)
1042  00b0 e70c          	ld	(12,x),a
1045  00b2 1e06          	ldw	x,(OFST+1,sp)
1046  00b4 e60c          	ld	a,(12,x)
1047                     ; 102 	sensor->Datos.estado = dht11_MIDIENDO_H;
1049  00b6 1e06          	ldw	x,(OFST+1,sp)
1050  00b8 a603          	ld	a,#3
1051  00ba e70d          	ld	(13,x),a
1052                     ; 103 	sensor->Datos.UltimaLectura.H_Decimal = leerByte(&sensor->pin);
1055  00bc 1e06          	ldw	x,(OFST+1,sp)
1056  00be 1c0005        	addw	x,#5
1057  00c1 1f04          	ldw	(OFST-1,sp),x
1059                     ; 5 	uint8_t contador = 0;
1061  00c3 0f02          	clr	(OFST-3,sp)
1063                     ; 6 	uint8_t temp = 0;
1065  00c5 0f03          	clr	(OFST-2,sp)
1067                     ; 7 	uint8_t bitLeido = 0;
1069                     ; 9 	for( contador; contador < 8; contador++ )
1072  00c7 202e          	jra	L536
1073  00c9               L346:
1074                     ; 11 		while( !IsActive( gpio ) )
1076  00c9 1e04          	ldw	x,(OFST-1,sp)
1077  00cb cd0000        	call	_IsActive
1079  00ce 4d            	tnz	a
1080  00cf 27f8          	jreq	L346
1081                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1085  00d1 ae00d4        	ldw	x,#212
1087  00d4 9d            nop
1088  00d5                L02:
1089  00d5 5a             decw X
1090  00d6 26fd           jrne L02
1091  00d8 9d             nop
1092                      
1094  00d9               L104:
1095                     ; 17 		bitLeido = 0;
1097                     ; 18 		if( IsActive( gpio ) )
1099  00d9 1e04          	ldw	x,(OFST-1,sp)
1100  00db cd0000        	call	_IsActive
1102  00de 4d            	tnz	a
1103  00df 2712          	jreq	L746
1104                     ; 20 			bitLeido = 1;
1106                     ; 21 			temp |= bitLeido;
1108  00e1 7b03          	ld	a,(OFST-2,sp)
1109  00e3 aa01          	or	a,#1
1110  00e5 6b03          	ld	(OFST-2,sp),a
1112                     ; 22 			temp <<=  1;
1114  00e7 0803          	sll	(OFST-2,sp)
1117  00e9               L356:
1118                     ; 23 			while( IsActive( gpio ) )
1120  00e9 1e04          	ldw	x,(OFST-1,sp)
1121  00eb cd0000        	call	_IsActive
1123  00ee 4d            	tnz	a
1124  00ef 26f8          	jrne	L356
1126  00f1 2002          	jra	L756
1127  00f3               L746:
1128                     ; 30 			temp <<= 1;
1130  00f3 0803          	sll	(OFST-2,sp)
1132  00f5               L756:
1133                     ; 9 	for( contador; contador < 8; contador++ )
1135  00f5 0c02          	inc	(OFST-3,sp)
1137  00f7               L536:
1140  00f7 7b02          	ld	a,(OFST-3,sp)
1141  00f9 a108          	cp	a,#8
1142  00fb 25cc          	jrult	L346
1143                     ; 34 	return temp;
1145  00fd 7b03          	ld	a,(OFST-2,sp)
1146  00ff 1e06          	ldw	x,(OFST+1,sp)
1147  0101 e70b          	ld	(11,x),a
1150  0103 1e06          	ldw	x,(OFST+1,sp)
1151  0105 e60b          	ld	a,(11,x)
1152                     ; 105 	sensor->Datos.estado = dht11_MIDIENDO_T;
1154  0107 1e06          	ldw	x,(OFST+1,sp)
1155  0109 a604          	ld	a,#4
1156  010b e70d          	ld	(13,x),a
1157                     ; 106 	sensor->Datos.UltimaLectura.T_Entero = leerByte(&sensor->pin);
1160  010d 1e06          	ldw	x,(OFST+1,sp)
1161  010f 1c0005        	addw	x,#5
1162  0112 1f04          	ldw	(OFST-1,sp),x
1164                     ; 5 	uint8_t contador = 0;
1166  0114 0f02          	clr	(OFST-3,sp)
1168                     ; 6 	uint8_t temp = 0;
1170  0116 0f03          	clr	(OFST-2,sp)
1172                     ; 7 	uint8_t bitLeido = 0;
1174                     ; 9 	for( contador; contador < 8; contador++ )
1177  0118 202e          	jra	L566
1178  011a               L376:
1179                     ; 11 		while( !IsActive( gpio ) )
1181  011a 1e04          	ldw	x,(OFST-1,sp)
1182  011c cd0000        	call	_IsActive
1184  011f 4d            	tnz	a
1185  0120 27f8          	jreq	L376
1186                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1190  0122 ae00d4        	ldw	x,#212
1192  0125 9d            nop
1193  0126                L22:
1194  0126 5a             decw X
1195  0127 26fd           jrne L22
1196  0129 9d             nop
1197                      
1199  012a               L704:
1200                     ; 17 		bitLeido = 0;
1202                     ; 18 		if( IsActive( gpio ) )
1204  012a 1e04          	ldw	x,(OFST-1,sp)
1205  012c cd0000        	call	_IsActive
1207  012f 4d            	tnz	a
1208  0130 2712          	jreq	L776
1209                     ; 20 			bitLeido = 1;
1211                     ; 21 			temp |= bitLeido;
1213  0132 7b03          	ld	a,(OFST-2,sp)
1214  0134 aa01          	or	a,#1
1215  0136 6b03          	ld	(OFST-2,sp),a
1217                     ; 22 			temp <<=  1;
1219  0138 0803          	sll	(OFST-2,sp)
1222  013a               L307:
1223                     ; 23 			while( IsActive( gpio ) )
1225  013a 1e04          	ldw	x,(OFST-1,sp)
1226  013c cd0000        	call	_IsActive
1228  013f 4d            	tnz	a
1229  0140 26f8          	jrne	L307
1231  0142 2002          	jra	L707
1232  0144               L776:
1233                     ; 30 			temp <<= 1;
1235  0144 0803          	sll	(OFST-2,sp)
1237  0146               L707:
1238                     ; 9 	for( contador; contador < 8; contador++ )
1240  0146 0c02          	inc	(OFST-3,sp)
1242  0148               L566:
1245  0148 7b02          	ld	a,(OFST-3,sp)
1246  014a a108          	cp	a,#8
1247  014c 25cc          	jrult	L376
1248                     ; 34 	return temp;
1250  014e 7b03          	ld	a,(OFST-2,sp)
1251  0150 1e06          	ldw	x,(OFST+1,sp)
1252  0152 e70a          	ld	(10,x),a
1255  0154 1e06          	ldw	x,(OFST+1,sp)
1256  0156 e60a          	ld	a,(10,x)
1257                     ; 108 	sensor->Datos.estado = dht11_MIDIENDO_T;
1259  0158 1e06          	ldw	x,(OFST+1,sp)
1260  015a a604          	ld	a,#4
1261  015c e70d          	ld	(13,x),a
1262                     ; 109 	sensor->Datos.UltimaLectura.T_Decimal = leerByte(&sensor->pin);
1265  015e 1e06          	ldw	x,(OFST+1,sp)
1266  0160 1c0005        	addw	x,#5
1267  0163 1f04          	ldw	(OFST-1,sp),x
1269                     ; 5 	uint8_t contador = 0;
1271  0165 0f02          	clr	(OFST-3,sp)
1273                     ; 6 	uint8_t temp = 0;
1275  0167 0f03          	clr	(OFST-2,sp)
1277                     ; 7 	uint8_t bitLeido = 0;
1279                     ; 9 	for( contador; contador < 8; contador++ )
1282  0169 202e          	jra	L517
1283  016b               L327:
1284                     ; 11 		while( !IsActive( gpio ) )
1286  016b 1e04          	ldw	x,(OFST-1,sp)
1287  016d cd0000        	call	_IsActive
1289  0170 4d            	tnz	a
1290  0171 27f8          	jreq	L327
1291                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1295  0173 ae00d4        	ldw	x,#212
1297  0176 9d            nop
1298  0177                L42:
1299  0177 5a             decw X
1300  0178 26fd           jrne L42
1301  017a 9d             nop
1302                      
1304  017b               L514:
1305                     ; 17 		bitLeido = 0;
1307                     ; 18 		if( IsActive( gpio ) )
1309  017b 1e04          	ldw	x,(OFST-1,sp)
1310  017d cd0000        	call	_IsActive
1312  0180 4d            	tnz	a
1313  0181 2712          	jreq	L727
1314                     ; 20 			bitLeido = 1;
1316                     ; 21 			temp |= bitLeido;
1318  0183 7b03          	ld	a,(OFST-2,sp)
1319  0185 aa01          	or	a,#1
1320  0187 6b03          	ld	(OFST-2,sp),a
1322                     ; 22 			temp <<=  1;
1324  0189 0803          	sll	(OFST-2,sp)
1327  018b               L337:
1328                     ; 23 			while( IsActive( gpio ) )
1330  018b 1e04          	ldw	x,(OFST-1,sp)
1331  018d cd0000        	call	_IsActive
1333  0190 4d            	tnz	a
1334  0191 26f8          	jrne	L337
1336  0193 2002          	jra	L737
1337  0195               L727:
1338                     ; 30 			temp <<= 1;
1340  0195 0803          	sll	(OFST-2,sp)
1342  0197               L737:
1343                     ; 9 	for( contador; contador < 8; contador++ )
1345  0197 0c02          	inc	(OFST-3,sp)
1347  0199               L517:
1350  0199 7b02          	ld	a,(OFST-3,sp)
1351  019b a108          	cp	a,#8
1352  019d 25cc          	jrult	L327
1353                     ; 34 	return temp;
1355  019f 7b03          	ld	a,(OFST-2,sp)
1356  01a1 1e06          	ldw	x,(OFST+1,sp)
1357  01a3 e709          	ld	(9,x),a
1360  01a5 1e06          	ldw	x,(OFST+1,sp)
1361  01a7 e609          	ld	a,(9,x)
1362                     ; 111 	sensor->Datos.UltimaLectura.CRC = leerByte(&sensor->pin);
1365  01a9 1e06          	ldw	x,(OFST+1,sp)
1366  01ab 1c0005        	addw	x,#5
1367  01ae 1f04          	ldw	(OFST-1,sp),x
1369                     ; 5 	uint8_t contador = 0;
1371  01b0 0f02          	clr	(OFST-3,sp)
1373                     ; 6 	uint8_t temp = 0;
1375  01b2 0f03          	clr	(OFST-2,sp)
1377                     ; 7 	uint8_t bitLeido = 0;
1379                     ; 9 	for( contador; contador < 8; contador++ )
1382  01b4 202e          	jra	L547
1383  01b6               L357:
1384                     ; 11 		while( !IsActive( gpio ) )
1386  01b6 1e04          	ldw	x,(OFST-1,sp)
1387  01b8 cd0000        	call	_IsActive
1389  01bb 4d            	tnz	a
1390  01bc 27f8          	jreq	L357
1391                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1395  01be ae00d4        	ldw	x,#212
1397  01c1 9d            nop
1398  01c2                L62:
1399  01c2 5a             decw X
1400  01c3 26fd           jrne L62
1401  01c5 9d             nop
1402                      
1404  01c6               L324:
1405                     ; 17 		bitLeido = 0;
1407                     ; 18 		if( IsActive( gpio ) )
1409  01c6 1e04          	ldw	x,(OFST-1,sp)
1410  01c8 cd0000        	call	_IsActive
1412  01cb 4d            	tnz	a
1413  01cc 2712          	jreq	L757
1414                     ; 20 			bitLeido = 1;
1416                     ; 21 			temp |= bitLeido;
1418  01ce 7b03          	ld	a,(OFST-2,sp)
1419  01d0 aa01          	or	a,#1
1420  01d2 6b03          	ld	(OFST-2,sp),a
1422                     ; 22 			temp <<=  1;
1424  01d4 0803          	sll	(OFST-2,sp)
1427  01d6               L367:
1428                     ; 23 			while( IsActive( gpio ) )
1430  01d6 1e04          	ldw	x,(OFST-1,sp)
1431  01d8 cd0000        	call	_IsActive
1433  01db 4d            	tnz	a
1434  01dc 26f8          	jrne	L367
1436  01de 2002          	jra	L767
1437  01e0               L757:
1438                     ; 30 			temp <<= 1;
1440  01e0 0803          	sll	(OFST-2,sp)
1442  01e2               L767:
1443                     ; 9 	for( contador; contador < 8; contador++ )
1445  01e2 0c02          	inc	(OFST-3,sp)
1447  01e4               L547:
1450  01e4 7b02          	ld	a,(OFST-3,sp)
1451  01e6 a108          	cp	a,#8
1452  01e8 25cc          	jrult	L357
1453                     ; 34 	return temp;
1455  01ea 7b03          	ld	a,(OFST-2,sp)
1456  01ec 1e06          	ldw	x,(OFST+1,sp)
1457  01ee e708          	ld	(8,x),a
1460  01f0 1e06          	ldw	x,(OFST+1,sp)
1461  01f2 e608          	ld	a,(8,x)
1462                     ; 113 	sensor->Datos.estado = dht11_CERRANDO_CONEXION;
1464  01f4 1e06          	ldw	x,(OFST+1,sp)
1465  01f6 a605          	ld	a,#5
1466  01f8 e70d          	ld	(13,x),a
1467                     ; 116 }
1470  01fa 5b07          	addw	sp,#7
1471  01fc 81            	ret
1511                     ; 118 void dht11_CerrarConexion( DHT11_t* sensor )
1511                     ; 119 {
1512                     	switch	.text
1513  01fd               _dht11_CerrarConexion:
1515  01fd 89            	pushw	x
1516       00000000      OFST:	set	0
1519                     ; 120 	Output2mhz_Init( &sensor->pin );
1521  01fe 1c0005        	addw	x,#5
1522  0201 cd0000        	call	_Output2mhz_Init
1524                     ; 121 	Output_1( &sensor->pin );
1526  0204 1e01          	ldw	x,(OFST+1,sp)
1527  0206 1c0005        	addw	x,#5
1528  0209 cd0000        	call	_Output_1
1530                     ; 122 	sensor->Datos.estado = dht11_SLEEP;
1532  020c 1e01          	ldw	x,(OFST+1,sp)
1533  020e a606          	ld	a,#6
1534  0210 e70d          	ld	(13,x),a
1535                     ; 123 }
1538  0212 85            	popw	x
1539  0213 81            	ret
1552                     	xdef	_dht11_CerrarConexion
1553                     	xdef	_dht11_LeerDatos
1554                     	xdef	_dht11_ComenzarTransmision
1555                     	xdef	_dht11_ModoCambiado
1556                     	xref	_IsActive
1557                     	xref	_Output_1
1558                     	xref	_Output_0
1559                     	xref	_Output2mhz_Init
1560                     	xref	_Input_FL_Init
1579                     	end
