   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  45                     ; 37 void dht11_ModoCambiado( void )
  45                     ; 38 {
  47                     	switch	.text
  48  0000               _dht11_ModoCambiado:
  52                     ; 40 }
  55  0000 81            	ret
 604                     ; 42 void dht11_Lectura( DHT11_t* sensor )
 604                     ; 43 {
 605                     	switch	.text
 606  0001               _dht11_Lectura:
 608  0001 89            	pushw	x
 609       00000000      OFST:	set	0
 612                     ; 44 	if( dht11_ComenzarTransmision( sensor ) )
 614  0002 ad28          	call	_dht11_ComenzarTransmision
 616  0004 4d            	tnz	a
 617  0005 2718          	jreq	L553
 618                     ; 46 		if( dht11_LeerDatos( sensor ) )
 620  0007 1e01          	ldw	x,(OFST+1,sp)
 621  0009 cd0099        	call	_dht11_LeerDatos
 623  000c 4d            	tnz	a
 624  000d 2708          	jreq	L753
 625                     ; 48 			sensor->Datos.estado = dht11_CERRANDO_CONEXION;
 627  000f 1e01          	ldw	x,(OFST+1,sp)
 628  0011 a605          	ld	a,#5
 629  0013 e70d          	ld	(13,x),a
 631  0015 200e          	jra	L363
 632  0017               L753:
 633                     ; 52 			sensor->Datos.estado = dht11_FALLO_AL_LEER;//fallo crc
 635  0017 1e01          	ldw	x,(OFST+1,sp)
 636  0019 a609          	ld	a,#9
 637  001b e70d          	ld	(13,x),a
 638  001d 2006          	jra	L363
 639  001f               L553:
 640                     ; 57 		sensor->Datos.estado = dht11_FALLO_AL_COMUNICAR;
 642  001f 1e01          	ldw	x,(OFST+1,sp)
 643  0021 a60a          	ld	a,#10
 644  0023 e70d          	ld	(13,x),a
 645  0025               L363:
 646                     ; 60 	dht11_CerrarConexion( sensor );
 648  0025 1e01          	ldw	x,(OFST+1,sp)
 649  0027 cd026b        	call	_dht11_CerrarConexion
 651                     ; 62 }
 654  002a 85            	popw	x
 655  002b 81            	ret
 711                     ; 64 bool dht11_ComenzarTransmision( DHT11_t* sensor )
 711                     ; 65 {
 712                     	switch	.text
 713  002c               _dht11_ComenzarTransmision:
 715  002c 89            	pushw	x
 716  002d 89            	pushw	x
 717       00000002      OFST:	set	2
 720                     ; 67 	Output2mhz_Init( &sensor->pin );
 722  002e 1c0005        	addw	x,#5
 723  0031 cd0000        	call	_Output2mhz_Init
 725                     ; 68 	Output_0( &sensor->pin );
 727  0034 1e03          	ldw	x,(OFST+1,sp)
 728  0036 1c0005        	addw	x,#5
 729  0039 cd0000        	call	_Output_0
 731                     ; 70 	sensor->Datos.estado = dht11_COMUNICANDO;
 733  003c 1e03          	ldw	x,(OFST+1,sp)
 734  003e a601          	ld	a,#1
 735  0040 e70d          	ld	(13,x),a
 739  0042 ae0012        	ldw	x,#18
 740  0045 1f01          	ldw	(OFST-1,sp),x
 743  0047 2008          	jra	L324
 744  0049               L714:
 745                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 749  0049 ae14d4        	ldw	x,#5332
 751  004c 9d            nop
 752  004d                L21:
 753  004d 5a             decw X
 754  004e 26fd           jrne L21
 755  0050 9d             nop
 756                      
 758  0051               L324:
 759                     ; 40 	while ( __ms-- )
 761  0051 1e01          	ldw	x,(OFST-1,sp)
 762  0053 1d0001        	subw	x,#1
 763  0056 1f01          	ldw	(OFST-1,sp),x
 764  0058 1c0001        	addw	x,#1
 766  005b a30000        	cpw	x,#0
 767  005e 26e9          	jrne	L714
 768                     ; 73 	Input_FL_Init( &sensor->pin ); //Configuro como entrada para leer
 770  0060 1e03          	ldw	x,(OFST+1,sp)
 771  0062 1c0005        	addw	x,#5
 772  0065 cd0000        	call	_Input_FL_Init
 775  0068 2006          	jra	L134
 776  006a               L724:
 777                     ; 77 		sensor->Datos.estado = dht11_ESPERA_BAJO;
 779  006a 1e03          	ldw	x,(OFST+1,sp)
 780  006c a607          	ld	a,#7
 781  006e e70d          	ld	(13,x),a
 782  0070               L134:
 783                     ; 75 	while( !IsActive( &sensor->pin ) )
 785  0070 1e03          	ldw	x,(OFST+1,sp)
 786  0072 1c0005        	addw	x,#5
 787  0075 cd0000        	call	_IsActive
 789  0078 4d            	tnz	a
 790  0079 27ef          	jreq	L724
 792  007b 2006          	jra	L734
 793  007d               L534:
 794                     ; 83 		sensor->Datos.estado = dht11_ESPERA_ALTO;
 796  007d 1e03          	ldw	x,(OFST+1,sp)
 797  007f a608          	ld	a,#8
 798  0081 e70d          	ld	(13,x),a
 799  0083               L734:
 800                     ; 81 	while( IsActive( &sensor->pin ) )
 802  0083 1e03          	ldw	x,(OFST+1,sp)
 803  0085 1c0005        	addw	x,#5
 804  0088 cd0000        	call	_IsActive
 806  008b 4d            	tnz	a
 807  008c 26ef          	jrne	L534
 808                     ; 87 	sensor->Datos.estado = dht11_CONEXION_OK;
 810  008e 1e03          	ldw	x,(OFST+1,sp)
 811  0090 a602          	ld	a,#2
 812  0092 e70d          	ld	(13,x),a
 813                     ; 88 	return true;
 815  0094 a601          	ld	a,#1
 818  0096 5b04          	addw	sp,#4
 819  0098 81            	ret
1079                     ; 91 bool dht11_LeerDatos( DHT11_t* sensor )
1079                     ; 92 {
1080                     	switch	.text
1081  0099               _dht11_LeerDatos:
1083  0099 89            	pushw	x
1084  009a 5206          	subw	sp,#6
1085       00000006      OFST:	set	6
1088                     ; 93 	uint16_t checkCRC = 0;
1090                     ; 94 	uint8_t mask = 0b11111111;
1092  009c a6ff          	ld	a,#255
1093  009e 6b04          	ld	(OFST-2,sp),a
1095                     ; 96 	sensor->Datos.estado = dht11_MIDIENDO_H;
1097  00a0 a603          	ld	a,#3
1098  00a2 e70d          	ld	(13,x),a
1099                     ; 97 	sensor->Datos.UltimaLectura.H_Entero = leerByte(&sensor->pin);
1102  00a4 1c0005        	addw	x,#5
1103  00a7 1f05          	ldw	(OFST-1,sp),x
1105                     ; 5 	uint8_t contador = 0;
1107  00a9 0f02          	clr	(OFST-4,sp)
1109                     ; 6 	uint8_t temp = 0;
1111  00ab 0f03          	clr	(OFST-3,sp)
1113                     ; 7 	uint8_t bitLeido = 0;
1115                     ; 9 	for( contador; contador < 8; contador++ )
1118  00ad 202e          	jra	L766
1119  00af               L576:
1120                     ; 11 		while( !IsActive( gpio ) )
1122  00af 1e05          	ldw	x,(OFST-1,sp)
1123  00b1 cd0000        	call	_IsActive
1125  00b4 4d            	tnz	a
1126  00b5 27f8          	jreq	L576
1127                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1131  00b7 ae00d4        	ldw	x,#212
1133  00ba 9d            nop
1134  00bb                L61:
1135  00bb 5a             decw X
1136  00bc 26fd           jrne L61
1137  00be 9d             nop
1138                      
1140  00bf               L544:
1141                     ; 17 		bitLeido = 0;
1143                     ; 18 		if( IsActive( gpio ) )
1145  00bf 1e05          	ldw	x,(OFST-1,sp)
1146  00c1 cd0000        	call	_IsActive
1148  00c4 4d            	tnz	a
1149  00c5 2712          	jreq	L107
1150                     ; 20 			bitLeido = 1;
1152                     ; 21 			temp |= bitLeido;
1154  00c7 7b03          	ld	a,(OFST-3,sp)
1155  00c9 aa01          	or	a,#1
1156  00cb 6b03          	ld	(OFST-3,sp),a
1158                     ; 22 			temp <<=  1;
1160  00cd 0803          	sll	(OFST-3,sp)
1163  00cf               L507:
1164                     ; 23 			while( IsActive( gpio ) )
1166  00cf 1e05          	ldw	x,(OFST-1,sp)
1167  00d1 cd0000        	call	_IsActive
1169  00d4 4d            	tnz	a
1170  00d5 26f8          	jrne	L507
1172  00d7 2002          	jra	L117
1173  00d9               L107:
1174                     ; 30 			temp <<= 1;
1176  00d9 0803          	sll	(OFST-3,sp)
1178  00db               L117:
1179                     ; 9 	for( contador; contador < 8; contador++ )
1181  00db 0c02          	inc	(OFST-4,sp)
1183  00dd               L766:
1186  00dd 7b02          	ld	a,(OFST-4,sp)
1187  00df a108          	cp	a,#8
1188  00e1 25cc          	jrult	L576
1189                     ; 34 	return temp;
1191  00e3 7b03          	ld	a,(OFST-3,sp)
1192  00e5 1e07          	ldw	x,(OFST+1,sp)
1193  00e7 e70c          	ld	(12,x),a
1196  00e9 1e07          	ldw	x,(OFST+1,sp)
1197  00eb e60c          	ld	a,(12,x)
1198                     ; 99 	sensor->Datos.estado = dht11_MIDIENDO_H;
1200  00ed 1e07          	ldw	x,(OFST+1,sp)
1201  00ef a603          	ld	a,#3
1202  00f1 e70d          	ld	(13,x),a
1203                     ; 100 	sensor->Datos.UltimaLectura.H_Decimal = leerByte(&sensor->pin);
1206  00f3 1e07          	ldw	x,(OFST+1,sp)
1207  00f5 1c0005        	addw	x,#5
1208  00f8 1f05          	ldw	(OFST-1,sp),x
1210                     ; 5 	uint8_t contador = 0;
1212  00fa 0f02          	clr	(OFST-4,sp)
1214                     ; 6 	uint8_t temp = 0;
1216  00fc 0f03          	clr	(OFST-3,sp)
1218                     ; 7 	uint8_t bitLeido = 0;
1220                     ; 9 	for( contador; contador < 8; contador++ )
1223  00fe 202e          	jra	L717
1224  0100               L527:
1225                     ; 11 		while( !IsActive( gpio ) )
1227  0100 1e05          	ldw	x,(OFST-1,sp)
1228  0102 cd0000        	call	_IsActive
1230  0105 4d            	tnz	a
1231  0106 27f8          	jreq	L527
1232                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1236  0108 ae00d4        	ldw	x,#212
1238  010b 9d            nop
1239  010c                L02:
1240  010c 5a             decw X
1241  010d 26fd           jrne L02
1242  010f 9d             nop
1243                      
1245  0110               L354:
1246                     ; 17 		bitLeido = 0;
1248                     ; 18 		if( IsActive( gpio ) )
1250  0110 1e05          	ldw	x,(OFST-1,sp)
1251  0112 cd0000        	call	_IsActive
1253  0115 4d            	tnz	a
1254  0116 2712          	jreq	L137
1255                     ; 20 			bitLeido = 1;
1257                     ; 21 			temp |= bitLeido;
1259  0118 7b03          	ld	a,(OFST-3,sp)
1260  011a aa01          	or	a,#1
1261  011c 6b03          	ld	(OFST-3,sp),a
1263                     ; 22 			temp <<=  1;
1265  011e 0803          	sll	(OFST-3,sp)
1268  0120               L537:
1269                     ; 23 			while( IsActive( gpio ) )
1271  0120 1e05          	ldw	x,(OFST-1,sp)
1272  0122 cd0000        	call	_IsActive
1274  0125 4d            	tnz	a
1275  0126 26f8          	jrne	L537
1277  0128 2002          	jra	L147
1278  012a               L137:
1279                     ; 30 			temp <<= 1;
1281  012a 0803          	sll	(OFST-3,sp)
1283  012c               L147:
1284                     ; 9 	for( contador; contador < 8; contador++ )
1286  012c 0c02          	inc	(OFST-4,sp)
1288  012e               L717:
1291  012e 7b02          	ld	a,(OFST-4,sp)
1292  0130 a108          	cp	a,#8
1293  0132 25cc          	jrult	L527
1294                     ; 34 	return temp;
1296  0134 7b03          	ld	a,(OFST-3,sp)
1297  0136 1e07          	ldw	x,(OFST+1,sp)
1298  0138 e70b          	ld	(11,x),a
1301  013a 1e07          	ldw	x,(OFST+1,sp)
1302  013c e60b          	ld	a,(11,x)
1303                     ; 102 	sensor->Datos.estado = dht11_MIDIENDO_T;
1305  013e 1e07          	ldw	x,(OFST+1,sp)
1306  0140 a604          	ld	a,#4
1307  0142 e70d          	ld	(13,x),a
1308                     ; 103 	sensor->Datos.UltimaLectura.T_Entero = leerByte(&sensor->pin);
1311  0144 1e07          	ldw	x,(OFST+1,sp)
1312  0146 1c0005        	addw	x,#5
1313  0149 1f05          	ldw	(OFST-1,sp),x
1315                     ; 5 	uint8_t contador = 0;
1317  014b 0f02          	clr	(OFST-4,sp)
1319                     ; 6 	uint8_t temp = 0;
1321  014d 0f03          	clr	(OFST-3,sp)
1323                     ; 7 	uint8_t bitLeido = 0;
1325                     ; 9 	for( contador; contador < 8; contador++ )
1328  014f 202e          	jra	L747
1329  0151               L557:
1330                     ; 11 		while( !IsActive( gpio ) )
1332  0151 1e05          	ldw	x,(OFST-1,sp)
1333  0153 cd0000        	call	_IsActive
1335  0156 4d            	tnz	a
1336  0157 27f8          	jreq	L557
1337                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1341  0159 ae00d4        	ldw	x,#212
1343  015c 9d            nop
1344  015d                L22:
1345  015d 5a             decw X
1346  015e 26fd           jrne L22
1347  0160 9d             nop
1348                      
1350  0161               L164:
1351                     ; 17 		bitLeido = 0;
1353                     ; 18 		if( IsActive( gpio ) )
1355  0161 1e05          	ldw	x,(OFST-1,sp)
1356  0163 cd0000        	call	_IsActive
1358  0166 4d            	tnz	a
1359  0167 2712          	jreq	L167
1360                     ; 20 			bitLeido = 1;
1362                     ; 21 			temp |= bitLeido;
1364  0169 7b03          	ld	a,(OFST-3,sp)
1365  016b aa01          	or	a,#1
1366  016d 6b03          	ld	(OFST-3,sp),a
1368                     ; 22 			temp <<=  1;
1370  016f 0803          	sll	(OFST-3,sp)
1373  0171               L567:
1374                     ; 23 			while( IsActive( gpio ) )
1376  0171 1e05          	ldw	x,(OFST-1,sp)
1377  0173 cd0000        	call	_IsActive
1379  0176 4d            	tnz	a
1380  0177 26f8          	jrne	L567
1382  0179 2002          	jra	L177
1383  017b               L167:
1384                     ; 30 			temp <<= 1;
1386  017b 0803          	sll	(OFST-3,sp)
1388  017d               L177:
1389                     ; 9 	for( contador; contador < 8; contador++ )
1391  017d 0c02          	inc	(OFST-4,sp)
1393  017f               L747:
1396  017f 7b02          	ld	a,(OFST-4,sp)
1397  0181 a108          	cp	a,#8
1398  0183 25cc          	jrult	L557
1399                     ; 34 	return temp;
1401  0185 7b03          	ld	a,(OFST-3,sp)
1402  0187 1e07          	ldw	x,(OFST+1,sp)
1403  0189 e70a          	ld	(10,x),a
1406  018b 1e07          	ldw	x,(OFST+1,sp)
1407  018d e60a          	ld	a,(10,x)
1408                     ; 105 	sensor->Datos.estado = dht11_MIDIENDO_T;
1410  018f 1e07          	ldw	x,(OFST+1,sp)
1411  0191 a604          	ld	a,#4
1412  0193 e70d          	ld	(13,x),a
1413                     ; 106 	sensor->Datos.UltimaLectura.T_Decimal = leerByte(&sensor->pin);
1416  0195 1e07          	ldw	x,(OFST+1,sp)
1417  0197 1c0005        	addw	x,#5
1418  019a 1f05          	ldw	(OFST-1,sp),x
1420                     ; 5 	uint8_t contador = 0;
1422  019c 0f02          	clr	(OFST-4,sp)
1424                     ; 6 	uint8_t temp = 0;
1426  019e 0f03          	clr	(OFST-3,sp)
1428                     ; 7 	uint8_t bitLeido = 0;
1430                     ; 9 	for( contador; contador < 8; contador++ )
1433  01a0 202e          	jra	L777
1434  01a2               L5001:
1435                     ; 11 		while( !IsActive( gpio ) )
1437  01a2 1e05          	ldw	x,(OFST-1,sp)
1438  01a4 cd0000        	call	_IsActive
1440  01a7 4d            	tnz	a
1441  01a8 27f8          	jreq	L5001
1442                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1446  01aa ae00d4        	ldw	x,#212
1448  01ad 9d            nop
1449  01ae                L42:
1450  01ae 5a             decw X
1451  01af 26fd           jrne L42
1452  01b1 9d             nop
1453                      
1455  01b2               L764:
1456                     ; 17 		bitLeido = 0;
1458                     ; 18 		if( IsActive( gpio ) )
1460  01b2 1e05          	ldw	x,(OFST-1,sp)
1461  01b4 cd0000        	call	_IsActive
1463  01b7 4d            	tnz	a
1464  01b8 2712          	jreq	L1101
1465                     ; 20 			bitLeido = 1;
1467                     ; 21 			temp |= bitLeido;
1469  01ba 7b03          	ld	a,(OFST-3,sp)
1470  01bc aa01          	or	a,#1
1471  01be 6b03          	ld	(OFST-3,sp),a
1473                     ; 22 			temp <<=  1;
1475  01c0 0803          	sll	(OFST-3,sp)
1478  01c2               L5101:
1479                     ; 23 			while( IsActive( gpio ) )
1481  01c2 1e05          	ldw	x,(OFST-1,sp)
1482  01c4 cd0000        	call	_IsActive
1484  01c7 4d            	tnz	a
1485  01c8 26f8          	jrne	L5101
1487  01ca 2002          	jra	L1201
1488  01cc               L1101:
1489                     ; 30 			temp <<= 1;
1491  01cc 0803          	sll	(OFST-3,sp)
1493  01ce               L1201:
1494                     ; 9 	for( contador; contador < 8; contador++ )
1496  01ce 0c02          	inc	(OFST-4,sp)
1498  01d0               L777:
1501  01d0 7b02          	ld	a,(OFST-4,sp)
1502  01d2 a108          	cp	a,#8
1503  01d4 25cc          	jrult	L5001
1504                     ; 34 	return temp;
1506  01d6 7b03          	ld	a,(OFST-3,sp)
1507  01d8 1e07          	ldw	x,(OFST+1,sp)
1508  01da e709          	ld	(9,x),a
1511  01dc 1e07          	ldw	x,(OFST+1,sp)
1512  01de e609          	ld	a,(9,x)
1513                     ; 108 	sensor->Datos.UltimaLectura.CRC = leerByte(&sensor->pin);
1516  01e0 1e07          	ldw	x,(OFST+1,sp)
1517  01e2 1c0005        	addw	x,#5
1518  01e5 1f05          	ldw	(OFST-1,sp),x
1520                     ; 5 	uint8_t contador = 0;
1522  01e7 0f02          	clr	(OFST-4,sp)
1524                     ; 6 	uint8_t temp = 0;
1526  01e9 0f03          	clr	(OFST-3,sp)
1528                     ; 7 	uint8_t bitLeido = 0;
1530                     ; 9 	for( contador; contador < 8; contador++ )
1533  01eb 202e          	jra	L7201
1534  01ed               L5301:
1535                     ; 11 		while( !IsActive( gpio ) )
1537  01ed 1e05          	ldw	x,(OFST-1,sp)
1538  01ef cd0000        	call	_IsActive
1540  01f2 4d            	tnz	a
1541  01f3 27f8          	jreq	L5301
1542                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1546  01f5 ae00d4        	ldw	x,#212
1548  01f8 9d            nop
1549  01f9                L62:
1550  01f9 5a             decw X
1551  01fa 26fd           jrne L62
1552  01fc 9d             nop
1553                      
1555  01fd               L574:
1556                     ; 17 		bitLeido = 0;
1558                     ; 18 		if( IsActive( gpio ) )
1560  01fd 1e05          	ldw	x,(OFST-1,sp)
1561  01ff cd0000        	call	_IsActive
1563  0202 4d            	tnz	a
1564  0203 2712          	jreq	L1401
1565                     ; 20 			bitLeido = 1;
1567                     ; 21 			temp |= bitLeido;
1569  0205 7b03          	ld	a,(OFST-3,sp)
1570  0207 aa01          	or	a,#1
1571  0209 6b03          	ld	(OFST-3,sp),a
1573                     ; 22 			temp <<=  1;
1575  020b 0803          	sll	(OFST-3,sp)
1578  020d               L5401:
1579                     ; 23 			while( IsActive( gpio ) )
1581  020d 1e05          	ldw	x,(OFST-1,sp)
1582  020f cd0000        	call	_IsActive
1584  0212 4d            	tnz	a
1585  0213 26f8          	jrne	L5401
1587  0215 2002          	jra	L1501
1588  0217               L1401:
1589                     ; 30 			temp <<= 1;
1591  0217 0803          	sll	(OFST-3,sp)
1593  0219               L1501:
1594                     ; 9 	for( contador; contador < 8; contador++ )
1596  0219 0c02          	inc	(OFST-4,sp)
1598  021b               L7201:
1601  021b 7b02          	ld	a,(OFST-4,sp)
1602  021d a108          	cp	a,#8
1603  021f 25cc          	jrult	L5301
1604                     ; 34 	return temp;
1606  0221 7b03          	ld	a,(OFST-3,sp)
1607  0223 1e07          	ldw	x,(OFST+1,sp)
1608  0225 e708          	ld	(8,x),a
1611  0227 1e07          	ldw	x,(OFST+1,sp)
1612  0229 e608          	ld	a,(8,x)
1613                     ; 110 	checkCRC = sensor->Datos.UltimaLectura.H_Entero + sensor->Datos.UltimaLectura.H_Decimal + sensor->Datos.UltimaLectura.T_Entero + sensor->Datos.UltimaLectura.T_Decimal;
1615  022b 1e07          	ldw	x,(OFST+1,sp)
1616  022d e60b          	ld	a,(11,x)
1617  022f 5f            	clrw	x
1618  0230 1607          	ldw	y,(OFST+1,sp)
1619  0232 90eb0c        	add	a,(12,y)
1620  0235 2401          	jrnc	L03
1621  0237 5c            	incw	x
1622  0238               L03:
1623  0238 1607          	ldw	y,(OFST+1,sp)
1624  023a 90eb0a        	add	a,(10,y)
1625  023d 2401          	jrnc	L23
1626  023f 5c            	incw	x
1627  0240               L23:
1628  0240 1607          	ldw	y,(OFST+1,sp)
1629  0242 90eb09        	add	a,(9,y)
1630  0245 2401          	jrnc	L43
1631  0247 5c            	incw	x
1632  0248               L43:
1633  0248 02            	rlwa	x,a
1634  0249 1f05          	ldw	(OFST-1,sp),x
1635  024b 01            	rrwa	x,a
1637                     ; 111 	checkCRC &= mask;
1639  024c 7b04          	ld	a,(OFST-2,sp)
1640  024e 5f            	clrw	x
1641  024f 97            	ld	xl,a
1642  0250 01            	rrwa	x,a
1643  0251 1406          	and	a,(OFST+0,sp)
1644  0253 01            	rrwa	x,a
1645  0254 1405          	and	a,(OFST-1,sp)
1646  0256 01            	rrwa	x,a
1647  0257 1f05          	ldw	(OFST-1,sp),x
1649                     ; 113 	if( checkCRC == sensor->Datos.UltimaLectura.CRC )
1651  0259 1e07          	ldw	x,(OFST+1,sp)
1652  025b e608          	ld	a,(8,x)
1653  025d 5f            	clrw	x
1654  025e 97            	ld	xl,a
1655  025f 1305          	cpw	x,(OFST-1,sp)
1656  0261 2604          	jrne	L3501
1657                     ; 115 		return true;
1659  0263 a601          	ld	a,#1
1661  0265 2001          	jra	L63
1662  0267               L3501:
1663                     ; 119 		return false;
1665  0267 4f            	clr	a
1667  0268               L63:
1669  0268 5b08          	addw	sp,#8
1670  026a 81            	ret
1710                     ; 123 void dht11_CerrarConexion( DHT11_t* sensor )
1710                     ; 124 {
1711                     	switch	.text
1712  026b               _dht11_CerrarConexion:
1714  026b 89            	pushw	x
1715       00000000      OFST:	set	0
1718                     ; 125 	Output2mhz_Init( &sensor->pin );
1720  026c 1c0005        	addw	x,#5
1721  026f cd0000        	call	_Output2mhz_Init
1723                     ; 126 	Output_1( &sensor->pin );
1725  0272 1e01          	ldw	x,(OFST+1,sp)
1726  0274 1c0005        	addw	x,#5
1727  0277 cd0000        	call	_Output_1
1729                     ; 128 	if( sensor->Datos.estado == dht11_CERRANDO_CONEXION )
1731  027a 1e01          	ldw	x,(OFST+1,sp)
1732  027c e60d          	ld	a,(13,x)
1733  027e a105          	cp	a,#5
1734  0280 2606          	jrne	L7701
1735                     ; 130 		sensor->Datos.estado = dht11_SLEEP;
1737  0282 1e01          	ldw	x,(OFST+1,sp)
1738  0284 a606          	ld	a,#6
1739  0286 e70d          	ld	(13,x),a
1740  0288               L7701:
1741                     ; 132 }
1744  0288 85            	popw	x
1745  0289 81            	ret
1758                     	xdef	_dht11_CerrarConexion
1759                     	xdef	_dht11_LeerDatos
1760                     	xdef	_dht11_ComenzarTransmision
1761                     	xdef	_dht11_Lectura
1762                     	xdef	_dht11_ModoCambiado
1763                     	xref	_IsActive
1764                     	xref	_Output_1
1765                     	xref	_Output_0
1766                     	xref	_Output2mhz_Init
1767                     	xref	_Input_FL_Init
1786                     	end
