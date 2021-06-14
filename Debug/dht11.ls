   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  51                     ; 112 void dht11_ModoCambiado( void )
  51                     ; 113 {
  53                     	switch	.text
  54  0000               _dht11_ModoCambiado:
  58                     ; 115 }
  61  0000 81            	ret
 884                     ; 117 void dht11_Lectura( DHT11_t* sensor )
 884                     ; 118 {
 885                     	switch	.text
 886  0001               _dht11_Lectura:
 888  0001 89            	pushw	x
 889  0002 520b          	subw	sp,#11
 890       0000000b      OFST:	set	11
 893                     ; 119 	if( dht11_ComenzarTransmision( sensor ) )
 896  0004 1f09          	ldw	(OFST-2,sp),x
 898                     ; 44 	Output2mhz_Init( &sensor->pin );
 900  0006 1e09          	ldw	x,(OFST-2,sp)
 901  0008 1c0005        	addw	x,#5
 902  000b cd0000        	call	_Output2mhz_Init
 904                     ; 45 	Output_0( &sensor->pin );
 906  000e 1e09          	ldw	x,(OFST-2,sp)
 907  0010 1c0005        	addw	x,#5
 908  0013 cd0000        	call	_Output_0
 910                     ; 47 	sensor->Datos.estado = dht11_COMUNICANDO;
 912  0016 1e09          	ldw	x,(OFST-2,sp)
 913  0018 a601          	ld	a,#1
 914  001a e70d          	ld	(13,x),a
 918  001c ae0012        	ldw	x,#18
 919  001f 1f07          	ldw	(OFST-4,sp),x
 922  0021 2008          	jra	L736
 923  0023               L336:
 924                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 928  0023 ae14d4        	ldw	x,#5332
 930  0026 9d            nop
 931  0027                L01:
 932  0027 5a             decw X
 933  0028 26fd           jrne L01
 934  002a 9d             nop
 935                      
 937  002b               L736:
 938                     ; 40 	while ( __ms-- )
 940  002b 1e07          	ldw	x,(OFST-4,sp)
 941  002d 1d0001        	subw	x,#1
 942  0030 1f07          	ldw	(OFST-4,sp),x
 943  0032 1c0001        	addw	x,#1
 945  0035 a30000        	cpw	x,#0
 946  0038 26e9          	jrne	L336
 947                     ; 50 	Input_Init( &sensor->pin ); //Configuro como entrada para leer
 949  003a 1e09          	ldw	x,(OFST-2,sp)
 950  003c 1c0005        	addw	x,#5
 951  003f cd0000        	call	_Input_Init
 953                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 957  0042 ae00d4        	ldw	x,#212
 959  0045 9d            nop
 960  0046                L21:
 961  0046 5a             decw X
 962  0047 26fd           jrne L21
 963  0049 9d             nop
 964                      
 966  004a 2006          	jra	L546
 967  004c               L346:
 968                     ; 55 		sensor->Datos.estado = dht11_ESPERA_BAJO;
 970  004c 1e09          	ldw	x,(OFST-2,sp)
 971  004e a607          	ld	a,#7
 972  0050 e70d          	ld	(13,x),a
 973  0052               L546:
 974                     ; 53 	while( !IsActive( &sensor->pin ) )
 976  0052 1e09          	ldw	x,(OFST-2,sp)
 977  0054 1c0005        	addw	x,#5
 978  0057 cd0000        	call	_IsActive
 980  005a 4d            	tnz	a
 981  005b 27ef          	jreq	L346
 983  005d 2006          	jra	L356
 984  005f               L156:
 985                     ; 61 		sensor->Datos.estado = dht11_ESPERA_ALTO;
 987  005f 1e09          	ldw	x,(OFST-2,sp)
 988  0061 a608          	ld	a,#8
 989  0063 e70d          	ld	(13,x),a
 990  0065               L356:
 991                     ; 59 	while( IsActive( &sensor->pin ) )
 993  0065 1e09          	ldw	x,(OFST-2,sp)
 994  0067 1c0005        	addw	x,#5
 995  006a cd0000        	call	_IsActive
 997  006d 4d            	tnz	a
 998  006e 26ef          	jrne	L156
 999                     ; 65 	sensor->Datos.estado = dht11_CONEXION_OK;
1001  0070 1e09          	ldw	x,(OFST-2,sp)
1002  0072 a602          	ld	a,#2
1003  0074 e70d          	ld	(13,x),a
1004                     ; 66 	return true;
1006  0076 a601          	ld	a,#1
1007  0078 6b0b          	ld	(OFST+0,sp),a
1011  007a 0d0b          	tnz	(OFST+0,sp)
1012  007c 2603          	jrne	L43
1013  007e cc029e        	jp	L136
1014  0081               L43:
1015                     ; 121 		if( dht11_LeerDatos( sensor ) )
1018  0081 1e0c          	ldw	x,(OFST+1,sp)
1019  0083 1f09          	ldw	(OFST-2,sp),x
1021                     ; 71 	uint16_t checkCRC = 0;
1023                     ; 72 	uint8_t mask = 0b11111111;
1025  0085 a6ff          	ld	a,#255
1026  0087 6b06          	ld	(OFST-5,sp),a
1028                     ; 74 	sensor->Datos.estado = dht11_MIDIENDO_H;
1030  0089 1e09          	ldw	x,(OFST-2,sp)
1031  008b a603          	ld	a,#3
1032  008d e70d          	ld	(13,x),a
1033                     ; 121 		if( dht11_LeerDatos( sensor ) )
1036  008f 1e09          	ldw	x,(OFST-2,sp)
1037  0091 1c0005        	addw	x,#5
1038  0094 1f04          	ldw	(OFST-7,sp),x
1040                     ; 5 	uint8_t contador = 0;
1042  0096 0f02          	clr	(OFST-9,sp)
1044                     ; 6 	uint8_t temp = 0;
1046  0098 0f01          	clr	(OFST-10,sp)
1048                     ; 7 	uint8_t bitLeido = 0;
1050                     ; 9 	for( contador; contador < 8; contador++ )
1053  009a 2038          	jra	L566
1054  009c               L376:
1055                     ; 11 		while( !IsActive( gpio ) ) //Espera nuevo bit
1057  009c 1e04          	ldw	x,(OFST-7,sp)
1058  009e cd0000        	call	_IsActive
1060  00a1 4d            	tnz	a
1061  00a2 27f8          	jreq	L376
1062                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1066  00a4 ae00d4        	ldw	x,#212
1068  00a7 9d            nop
1069  00a8                L41:
1070  00a8 5a             decw X
1071  00a9 26fd           jrne L41
1072  00ab 9d             nop
1073                      
1075  00ac               L55:
1076                     ; 17 		bitLeido = 0;
1078                     ; 18 		if( IsActive( gpio ) )
1080  00ac 1e04          	ldw	x,(OFST-7,sp)
1081  00ae cd0000        	call	_IsActive
1083  00b1 4d            	tnz	a
1084  00b2 2706          	jreq	L776
1085                     ; 20 			bitLeido = 1;
1087  00b4 a601          	ld	a,#1
1088  00b6 6b03          	ld	(OFST-8,sp),a
1091  00b8 2002          	jra	L107
1092  00ba               L776:
1093                     ; 24 			bitLeido = 0;
1095  00ba 0f03          	clr	(OFST-8,sp)
1097  00bc               L107:
1098                     ; 27 		temp |= bitLeido;
1100  00bc 7b01          	ld	a,(OFST-10,sp)
1101  00be 1a03          	or	a,(OFST-8,sp)
1102  00c0 6b01          	ld	(OFST-10,sp),a
1104                     ; 28 		if( contador < 7 )
1106  00c2 7b02          	ld	a,(OFST-9,sp)
1107  00c4 a107          	cp	a,#7
1108  00c6 2402          	jruge	L707
1109                     ; 30 			temp <<=  1;
1111  00c8 0801          	sll	(OFST-10,sp)
1113  00ca               L707:
1114                     ; 33 		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
1116  00ca 1e04          	ldw	x,(OFST-7,sp)
1117  00cc cd0000        	call	_IsActive
1119  00cf 4d            	tnz	a
1120  00d0 26f8          	jrne	L707
1121                     ; 9 	for( contador; contador < 8; contador++ )
1123  00d2 0c02          	inc	(OFST-9,sp)
1125  00d4               L566:
1128  00d4 7b02          	ld	a,(OFST-9,sp)
1129  00d6 a108          	cp	a,#8
1130  00d8 25c2          	jrult	L376
1131                     ; 39 	return temp;
1133  00da 7b01          	ld	a,(OFST-10,sp)
1134  00dc 1e09          	ldw	x,(OFST-2,sp)
1135  00de e70c          	ld	(12,x),a
1138  00e0 1e09          	ldw	x,(OFST-2,sp)
1139  00e2 e60c          	ld	a,(12,x)
1140                     ; 77 	sensor->Datos.estado = dht11_MIDIENDO_H;
1142  00e4 1e09          	ldw	x,(OFST-2,sp)
1143  00e6 a603          	ld	a,#3
1144  00e8 e70d          	ld	(13,x),a
1145                     ; 121 		if( dht11_LeerDatos( sensor ) )
1148  00ea 1e09          	ldw	x,(OFST-2,sp)
1149  00ec 1c0005        	addw	x,#5
1150  00ef 1f04          	ldw	(OFST-7,sp),x
1152                     ; 5 	uint8_t contador = 0;
1154  00f1 0f02          	clr	(OFST-9,sp)
1156                     ; 6 	uint8_t temp = 0;
1158  00f3 0f01          	clr	(OFST-10,sp)
1160                     ; 7 	uint8_t bitLeido = 0;
1162                     ; 9 	for( contador; contador < 8; contador++ )
1165  00f5 2038          	jra	L717
1166  00f7               L527:
1167                     ; 11 		while( !IsActive( gpio ) ) //Espera nuevo bit
1169  00f7 1e04          	ldw	x,(OFST-7,sp)
1170  00f9 cd0000        	call	_IsActive
1172  00fc 4d            	tnz	a
1173  00fd 27f8          	jreq	L527
1174                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1178  00ff ae00d4        	ldw	x,#212
1180  0102 9d            nop
1181  0103                L61:
1182  0103 5a             decw X
1183  0104 26fd           jrne L61
1184  0106 9d             nop
1185                      
1187  0107               L36:
1188                     ; 17 		bitLeido = 0;
1190                     ; 18 		if( IsActive( gpio ) )
1192  0107 1e04          	ldw	x,(OFST-7,sp)
1193  0109 cd0000        	call	_IsActive
1195  010c 4d            	tnz	a
1196  010d 2706          	jreq	L137
1197                     ; 20 			bitLeido = 1;
1199  010f a601          	ld	a,#1
1200  0111 6b03          	ld	(OFST-8,sp),a
1203  0113 2002          	jra	L337
1204  0115               L137:
1205                     ; 24 			bitLeido = 0;
1207  0115 0f03          	clr	(OFST-8,sp)
1209  0117               L337:
1210                     ; 27 		temp |= bitLeido;
1212  0117 7b01          	ld	a,(OFST-10,sp)
1213  0119 1a03          	or	a,(OFST-8,sp)
1214  011b 6b01          	ld	(OFST-10,sp),a
1216                     ; 28 		if( contador < 7 )
1218  011d 7b02          	ld	a,(OFST-9,sp)
1219  011f a107          	cp	a,#7
1220  0121 2402          	jruge	L147
1221                     ; 30 			temp <<=  1;
1223  0123 0801          	sll	(OFST-10,sp)
1225  0125               L147:
1226                     ; 33 		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
1228  0125 1e04          	ldw	x,(OFST-7,sp)
1229  0127 cd0000        	call	_IsActive
1231  012a 4d            	tnz	a
1232  012b 26f8          	jrne	L147
1233                     ; 9 	for( contador; contador < 8; contador++ )
1235  012d 0c02          	inc	(OFST-9,sp)
1237  012f               L717:
1240  012f 7b02          	ld	a,(OFST-9,sp)
1241  0131 a108          	cp	a,#8
1242  0133 25c2          	jrult	L527
1243                     ; 39 	return temp;
1245  0135 7b01          	ld	a,(OFST-10,sp)
1246  0137 1e09          	ldw	x,(OFST-2,sp)
1247  0139 e70b          	ld	(11,x),a
1250  013b 1e09          	ldw	x,(OFST-2,sp)
1251  013d e60b          	ld	a,(11,x)
1252                     ; 80 	sensor->Datos.estado = dht11_MIDIENDO_T;
1254  013f 1e09          	ldw	x,(OFST-2,sp)
1255  0141 a604          	ld	a,#4
1256  0143 e70d          	ld	(13,x),a
1257                     ; 121 		if( dht11_LeerDatos( sensor ) )
1260  0145 1e09          	ldw	x,(OFST-2,sp)
1261  0147 1c0005        	addw	x,#5
1262  014a 1f04          	ldw	(OFST-7,sp),x
1264                     ; 5 	uint8_t contador = 0;
1266  014c 0f02          	clr	(OFST-9,sp)
1268                     ; 6 	uint8_t temp = 0;
1270  014e 0f01          	clr	(OFST-10,sp)
1272                     ; 7 	uint8_t bitLeido = 0;
1274                     ; 9 	for( contador; contador < 8; contador++ )
1277  0150 2038          	jra	L157
1278  0152               L757:
1279                     ; 11 		while( !IsActive( gpio ) ) //Espera nuevo bit
1281  0152 1e04          	ldw	x,(OFST-7,sp)
1282  0154 cd0000        	call	_IsActive
1284  0157 4d            	tnz	a
1285  0158 27f8          	jreq	L757
1286                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1290  015a ae00d4        	ldw	x,#212
1292  015d 9d            nop
1293  015e                L02:
1294  015e 5a             decw X
1295  015f 26fd           jrne L02
1296  0161 9d             nop
1297                      
1299  0162               L17:
1300                     ; 17 		bitLeido = 0;
1302                     ; 18 		if( IsActive( gpio ) )
1304  0162 1e04          	ldw	x,(OFST-7,sp)
1305  0164 cd0000        	call	_IsActive
1307  0167 4d            	tnz	a
1308  0168 2706          	jreq	L367
1309                     ; 20 			bitLeido = 1;
1311  016a a601          	ld	a,#1
1312  016c 6b03          	ld	(OFST-8,sp),a
1315  016e 2002          	jra	L567
1316  0170               L367:
1317                     ; 24 			bitLeido = 0;
1319  0170 0f03          	clr	(OFST-8,sp)
1321  0172               L567:
1322                     ; 27 		temp |= bitLeido;
1324  0172 7b01          	ld	a,(OFST-10,sp)
1325  0174 1a03          	or	a,(OFST-8,sp)
1326  0176 6b01          	ld	(OFST-10,sp),a
1328                     ; 28 		if( contador < 7 )
1330  0178 7b02          	ld	a,(OFST-9,sp)
1331  017a a107          	cp	a,#7
1332  017c 2402          	jruge	L377
1333                     ; 30 			temp <<=  1;
1335  017e 0801          	sll	(OFST-10,sp)
1337  0180               L377:
1338                     ; 33 		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
1340  0180 1e04          	ldw	x,(OFST-7,sp)
1341  0182 cd0000        	call	_IsActive
1343  0185 4d            	tnz	a
1344  0186 26f8          	jrne	L377
1345                     ; 9 	for( contador; contador < 8; contador++ )
1347  0188 0c02          	inc	(OFST-9,sp)
1349  018a               L157:
1352  018a 7b02          	ld	a,(OFST-9,sp)
1353  018c a108          	cp	a,#8
1354  018e 25c2          	jrult	L757
1355                     ; 39 	return temp;
1357  0190 7b01          	ld	a,(OFST-10,sp)
1358  0192 1e09          	ldw	x,(OFST-2,sp)
1359  0194 e70a          	ld	(10,x),a
1362  0196 1e09          	ldw	x,(OFST-2,sp)
1363  0198 e60a          	ld	a,(10,x)
1364                     ; 83 	sensor->Datos.estado = dht11_MIDIENDO_T;
1366  019a 1e09          	ldw	x,(OFST-2,sp)
1367  019c a604          	ld	a,#4
1368  019e e70d          	ld	(13,x),a
1369                     ; 121 		if( dht11_LeerDatos( sensor ) )
1372  01a0 1e09          	ldw	x,(OFST-2,sp)
1373  01a2 1c0005        	addw	x,#5
1374  01a5 1f04          	ldw	(OFST-7,sp),x
1376                     ; 5 	uint8_t contador = 0;
1378  01a7 0f02          	clr	(OFST-9,sp)
1380                     ; 6 	uint8_t temp = 0;
1382  01a9 0f01          	clr	(OFST-10,sp)
1384                     ; 7 	uint8_t bitLeido = 0;
1386                     ; 9 	for( contador; contador < 8; contador++ )
1389  01ab 2038          	jra	L3001
1390  01ad               L1101:
1391                     ; 11 		while( !IsActive( gpio ) ) //Espera nuevo bit
1393  01ad 1e04          	ldw	x,(OFST-7,sp)
1394  01af cd0000        	call	_IsActive
1396  01b2 4d            	tnz	a
1397  01b3 27f8          	jreq	L1101
1398                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1402  01b5 ae00d4        	ldw	x,#212
1404  01b8 9d            nop
1405  01b9                L22:
1406  01b9 5a             decw X
1407  01ba 26fd           jrne L22
1408  01bc 9d             nop
1409                      
1411  01bd               L77:
1412                     ; 17 		bitLeido = 0;
1414                     ; 18 		if( IsActive( gpio ) )
1416  01bd 1e04          	ldw	x,(OFST-7,sp)
1417  01bf cd0000        	call	_IsActive
1419  01c2 4d            	tnz	a
1420  01c3 2706          	jreq	L5101
1421                     ; 20 			bitLeido = 1;
1423  01c5 a601          	ld	a,#1
1424  01c7 6b03          	ld	(OFST-8,sp),a
1427  01c9 2002          	jra	L7101
1428  01cb               L5101:
1429                     ; 24 			bitLeido = 0;
1431  01cb 0f03          	clr	(OFST-8,sp)
1433  01cd               L7101:
1434                     ; 27 		temp |= bitLeido;
1436  01cd 7b01          	ld	a,(OFST-10,sp)
1437  01cf 1a03          	or	a,(OFST-8,sp)
1438  01d1 6b01          	ld	(OFST-10,sp),a
1440                     ; 28 		if( contador < 7 )
1442  01d3 7b02          	ld	a,(OFST-9,sp)
1443  01d5 a107          	cp	a,#7
1444  01d7 2402          	jruge	L5201
1445                     ; 30 			temp <<=  1;
1447  01d9 0801          	sll	(OFST-10,sp)
1449  01db               L5201:
1450                     ; 33 		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
1452  01db 1e04          	ldw	x,(OFST-7,sp)
1453  01dd cd0000        	call	_IsActive
1455  01e0 4d            	tnz	a
1456  01e1 26f8          	jrne	L5201
1457                     ; 9 	for( contador; contador < 8; contador++ )
1459  01e3 0c02          	inc	(OFST-9,sp)
1461  01e5               L3001:
1464  01e5 7b02          	ld	a,(OFST-9,sp)
1465  01e7 a108          	cp	a,#8
1466  01e9 25c2          	jrult	L1101
1467                     ; 39 	return temp;
1469  01eb 7b01          	ld	a,(OFST-10,sp)
1470  01ed 1e09          	ldw	x,(OFST-2,sp)
1471  01ef e709          	ld	(9,x),a
1474  01f1 1e09          	ldw	x,(OFST-2,sp)
1475  01f3 e609          	ld	a,(9,x)
1476                     ; 121 		if( dht11_LeerDatos( sensor ) )
1479  01f5 1e09          	ldw	x,(OFST-2,sp)
1480  01f7 1c0005        	addw	x,#5
1481  01fa 1f04          	ldw	(OFST-7,sp),x
1483                     ; 5 	uint8_t contador = 0;
1485  01fc 0f02          	clr	(OFST-9,sp)
1487                     ; 6 	uint8_t temp = 0;
1489  01fe 0f01          	clr	(OFST-10,sp)
1491                     ; 7 	uint8_t bitLeido = 0;
1493                     ; 9 	for( contador; contador < 8; contador++ )
1496  0200 2038          	jra	L5301
1497  0202               L3401:
1498                     ; 11 		while( !IsActive( gpio ) ) //Espera nuevo bit
1500  0202 1e04          	ldw	x,(OFST-7,sp)
1501  0204 cd0000        	call	_IsActive
1503  0207 4d            	tnz	a
1504  0208 27f8          	jreq	L3401
1505                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1509  020a ae00d4        	ldw	x,#212
1511  020d 9d            nop
1512  020e                L42:
1513  020e 5a             decw X
1514  020f 26fd           jrne L42
1515  0211 9d             nop
1516                      
1518  0212               L501:
1519                     ; 17 		bitLeido = 0;
1521                     ; 18 		if( IsActive( gpio ) )
1523  0212 1e04          	ldw	x,(OFST-7,sp)
1524  0214 cd0000        	call	_IsActive
1526  0217 4d            	tnz	a
1527  0218 2706          	jreq	L7401
1528                     ; 20 			bitLeido = 1;
1530  021a a601          	ld	a,#1
1531  021c 6b03          	ld	(OFST-8,sp),a
1534  021e 2002          	jra	L1501
1535  0220               L7401:
1536                     ; 24 			bitLeido = 0;
1538  0220 0f03          	clr	(OFST-8,sp)
1540  0222               L1501:
1541                     ; 27 		temp |= bitLeido;
1543  0222 7b01          	ld	a,(OFST-10,sp)
1544  0224 1a03          	or	a,(OFST-8,sp)
1545  0226 6b01          	ld	(OFST-10,sp),a
1547                     ; 28 		if( contador < 7 )
1549  0228 7b02          	ld	a,(OFST-9,sp)
1550  022a a107          	cp	a,#7
1551  022c 2402          	jruge	L7501
1552                     ; 30 			temp <<=  1;
1554  022e 0801          	sll	(OFST-10,sp)
1556  0230               L7501:
1557                     ; 33 		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
1559  0230 1e04          	ldw	x,(OFST-7,sp)
1560  0232 cd0000        	call	_IsActive
1562  0235 4d            	tnz	a
1563  0236 26f8          	jrne	L7501
1564                     ; 9 	for( contador; contador < 8; contador++ )
1566  0238 0c02          	inc	(OFST-9,sp)
1568  023a               L5301:
1571  023a 7b02          	ld	a,(OFST-9,sp)
1572  023c a108          	cp	a,#8
1573  023e 25c2          	jrult	L3401
1574                     ; 39 	return temp;
1576  0240 7b01          	ld	a,(OFST-10,sp)
1577  0242 1e09          	ldw	x,(OFST-2,sp)
1578  0244 e708          	ld	(8,x),a
1581  0246 1e09          	ldw	x,(OFST-2,sp)
1582  0248 e608          	ld	a,(8,x)
1583                     ; 88 	checkCRC = sensor->Datos.UltimaLectura.H_Entero + sensor->Datos.UltimaLectura.H_Decimal + sensor->Datos.UltimaLectura.T_Entero + sensor->Datos.UltimaLectura.T_Decimal;
1585  024a 1e09          	ldw	x,(OFST-2,sp)
1586  024c e60b          	ld	a,(11,x)
1587  024e 5f            	clrw	x
1588  024f 1609          	ldw	y,(OFST-2,sp)
1589  0251 90eb0c        	add	a,(12,y)
1590  0254 2401          	jrnc	L62
1591  0256 5c            	incw	x
1592  0257               L62:
1593  0257 1609          	ldw	y,(OFST-2,sp)
1594  0259 90eb0a        	add	a,(10,y)
1595  025c 2401          	jrnc	L03
1596  025e 5c            	incw	x
1597  025f               L03:
1598  025f 1609          	ldw	y,(OFST-2,sp)
1599  0261 90eb09        	add	a,(9,y)
1600  0264 2401          	jrnc	L23
1601  0266 5c            	incw	x
1602  0267               L23:
1603  0267 02            	rlwa	x,a
1604  0268 1f07          	ldw	(OFST-4,sp),x
1605  026a 01            	rrwa	x,a
1607                     ; 89 	checkCRC &= mask;
1609  026b 7b06          	ld	a,(OFST-5,sp)
1610  026d 5f            	clrw	x
1611  026e 97            	ld	xl,a
1612  026f 01            	rrwa	x,a
1613  0270 1408          	and	a,(OFST-3,sp)
1614  0272 01            	rrwa	x,a
1615  0273 1407          	and	a,(OFST-4,sp)
1616  0275 01            	rrwa	x,a
1617  0276 1f07          	ldw	(OFST-4,sp),x
1619                     ; 91 	if( checkCRC == sensor->Datos.UltimaLectura.CRC )
1621  0278 1e09          	ldw	x,(OFST-2,sp)
1622  027a e608          	ld	a,(8,x)
1623  027c 5f            	clrw	x
1624  027d 97            	ld	xl,a
1625  027e 1307          	cpw	x,(OFST-4,sp)
1626  0280 2606          	jrne	L3601
1627                     ; 93 		return true;
1629  0282 a601          	ld	a,#1
1630  0284 6b0b          	ld	(OFST+0,sp),a
1633  0286 2002          	jra	L111
1634  0288               L3601:
1635                     ; 97 		return false;
1637  0288 0f0b          	clr	(OFST+0,sp)
1640  028a               L111:
1642  028a 0d0b          	tnz	(OFST+0,sp)
1643  028c 2708          	jreq	L756
1644                     ; 123 			sensor->Datos.estado = dht11_CERRANDO_CONEXION;
1646  028e 1e0c          	ldw	x,(OFST+1,sp)
1647  0290 a605          	ld	a,#5
1648  0292 e70d          	ld	(13,x),a
1650  0294 200e          	jra	L1701
1651  0296               L756:
1652                     ; 127 			sensor->Datos.estado = dht11_FALLO_AL_LEER;//fallo crc
1654  0296 1e0c          	ldw	x,(OFST+1,sp)
1655  0298 a609          	ld	a,#9
1656  029a e70d          	ld	(13,x),a
1657  029c 2006          	jra	L1701
1658  029e               L136:
1659                     ; 132 		sensor->Datos.estado = dht11_FALLO_AL_COMUNICAR;
1661  029e 1e0c          	ldw	x,(OFST+1,sp)
1662  02a0 a60a          	ld	a,#10
1663  02a2 e70d          	ld	(13,x),a
1664  02a4               L1701:
1665                     ; 135 	dht11_CerrarConexion( sensor );
1668  02a4 1e0c          	ldw	x,(OFST+1,sp)
1669  02a6 1f09          	ldw	(OFST-2,sp),x
1671                     ; 103 	Output2mhz_Init( &sensor->pin );
1673  02a8 1e09          	ldw	x,(OFST-2,sp)
1674  02aa 1c0005        	addw	x,#5
1675  02ad cd0000        	call	_Output2mhz_Init
1677                     ; 104 	Output_1( &sensor->pin );
1679  02b0 1e09          	ldw	x,(OFST-2,sp)
1680  02b2 1c0005        	addw	x,#5
1681  02b5 cd0000        	call	_Output_1
1683                     ; 106 	if( sensor->Datos.estado == dht11_CERRANDO_CONEXION )
1685  02b8 1e09          	ldw	x,(OFST-2,sp)
1686  02ba e60d          	ld	a,(13,x)
1687  02bc a105          	cp	a,#5
1688  02be 2606          	jrne	L311
1689                     ; 108 		sensor->Datos.estado = dht11_SLEEP;
1691  02c0 1e09          	ldw	x,(OFST-2,sp)
1692  02c2 a606          	ld	a,#6
1693  02c4 e70d          	ld	(13,x),a
1694  02c6               L311:
1695                     ; 137 }
1698  02c6 5b0d          	addw	sp,#13
1699  02c8 81            	ret
1712                     	xdef	_dht11_Lectura
1713                     	xdef	_dht11_ModoCambiado
1714                     	xref	_IsActive
1715                     	xref	_Output_1
1716                     	xref	_Output_0
1717                     	xref	_Output2mhz_Init
1718                     	xref	_Input_Init
1737                     	end
