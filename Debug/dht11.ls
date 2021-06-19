   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 440                     ; 113 void DHT11_Init( DHT11_t* dht11 )
 440                     ; 114 {
 442                     	switch	.text
 443  0000               _DHT11_Init:
 447                     ; 116 }
 450  0000 81            	ret
 473                     ; 118 void dht11_ModoCambiado( void )
 473                     ; 119 {
 474                     	switch	.text
 475  0001               _dht11_ModoCambiado:
 479                     ; 121 }
 482  0001 81            	ret
 736                     ; 123 void dht11_Lectura( DHT11_t* sensor )
 736                     ; 124 {
 737                     	switch	.text
 738  0002               _dht11_Lectura:
 740  0002 89            	pushw	x
 741  0003 5209          	subw	sp,#9
 742       00000009      OFST:	set	9
 745                     ; 125 	if( dht11_ComenzarTransmision( sensor ) )
 748  0005 1f07          	ldw	(OFST-2,sp),x
 750                     ; 44 	Output2mhz_Init( &sensor->Config.HW );
 752  0007 1e07          	ldw	x,(OFST-2,sp)
 753  0009 cd0000        	call	_Output2mhz_Init
 755                     ; 45 	Output_0( &sensor->Config.HW );
 757  000c 1e07          	ldw	x,(OFST-2,sp)
 758  000e cd0000        	call	_Output_0
 760                     ; 47 	sensor->Datos.Estado = dht11_COMUNICANDO;
 762  0011 1e07          	ldw	x,(OFST-2,sp)
 763  0013 a601          	ld	a,#1
 764  0015 e708          	ld	(8,x),a
 768  0017 ae0012        	ldw	x,#18
 769  001a 1f05          	ldw	(OFST-4,sp),x
 772  001c 2008          	jra	L135
 773  001e               L525:
 774                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 778  001e ae14d4        	ldw	x,#5332
 780  0021 9d            nop
 781  0022                L21:
 782  0022 5a             decw X
 783  0023 26fd           jrne L21
 784  0025 9d             nop
 785                      
 787  0026               L135:
 788                     ; 40 	while ( __ms-- )
 790  0026 1e05          	ldw	x,(OFST-4,sp)
 791  0028 1d0001        	subw	x,#1
 792  002b 1f05          	ldw	(OFST-4,sp),x
 793  002d 1c0001        	addw	x,#1
 795  0030 a30000        	cpw	x,#0
 796  0033 26e9          	jrne	L525
 797                     ; 50 	Input_Init( &sensor->Config.HW ); //Configuro como entrada para leer
 799  0035 1e07          	ldw	x,(OFST-2,sp)
 800  0037 cd0000        	call	_Input_Init
 802                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 806  003a ae00d4        	ldw	x,#212
 808  003d 9d            nop
 809  003e                L41:
 810  003e 5a             decw X
 811  003f 26fd           jrne L41
 812  0041 9d             nop
 813                      
 815  0042 2006          	jra	L735
 816  0044               L535:
 817                     ; 55 		sensor->Datos.Estado = dht11_ESPERA_BAJO;
 819  0044 1e07          	ldw	x,(OFST-2,sp)
 820  0046 a607          	ld	a,#7
 821  0048 e708          	ld	(8,x),a
 822  004a               L735:
 823                     ; 53 	while( !IsActive( &sensor->Config.HW ) )
 825  004a 1e07          	ldw	x,(OFST-2,sp)
 826  004c cd0000        	call	_IsActive
 828  004f 4d            	tnz	a
 829  0050 27f2          	jreq	L535
 831  0052 2006          	jra	L545
 832  0054               L345:
 833                     ; 61 		sensor->Datos.Estado = dht11_ESPERA_ALTO;
 835  0054 1e07          	ldw	x,(OFST-2,sp)
 836  0056 a608          	ld	a,#8
 837  0058 e708          	ld	(8,x),a
 838  005a               L545:
 839                     ; 59 	while( IsActive( &sensor->Config.HW ) )
 841  005a 1e07          	ldw	x,(OFST-2,sp)
 842  005c cd0000        	call	_IsActive
 844  005f 4d            	tnz	a
 845  0060 26f2          	jrne	L345
 846                     ; 65 	sensor->Datos.Estado = dht11_CONEXION_OK;
 848  0062 1e07          	ldw	x,(OFST-2,sp)
 849  0064 a602          	ld	a,#2
 850  0066 e708          	ld	(8,x),a
 851                     ; 66 	return true;
 853  0068 a601          	ld	a,#1
 854  006a 6b09          	ld	(OFST+0,sp),a
 858  006c 0d09          	tnz	(OFST+0,sp)
 859  006e 2603          	jrne	L63
 860  0070 cc026d        	jp	L325
 861  0073               L63:
 862                     ; 127 		if( dht11_LeerDatos( sensor ) )
 865  0073 1e0a          	ldw	x,(OFST+1,sp)
 866  0075 1f07          	ldw	(OFST-2,sp),x
 868                     ; 71 	uint16_t checkCRC = 0;
 870                     ; 72 	uint8_t mask = 0b11111111;
 872  0077 a6ff          	ld	a,#255
 873  0079 6b04          	ld	(OFST-5,sp),a
 875                     ; 74 	sensor->Datos.Estado = dht11_MIDIENDO_H;
 877  007b 1e07          	ldw	x,(OFST-2,sp)
 878  007d a603          	ld	a,#3
 879  007f e708          	ld	(8,x),a
 880                     ; 5 	uint8_t contador = 0;
 883  0081 0f02          	clr	(OFST-7,sp)
 885                     ; 6 	uint8_t temp = 0;
 887  0083 0f01          	clr	(OFST-8,sp)
 889                     ; 7 	uint8_t bitLeido = 0;
 891                     ; 9 	for( contador; contador < 8; contador++ )
 894  0085 2038          	jra	L755
 895  0087               L565:
 896                     ; 11 		while( !IsActive( gpio ) ) //Espera nuevo bit
 898  0087 1e07          	ldw	x,(OFST-2,sp)
 899  0089 cd0000        	call	_IsActive
 901  008c 4d            	tnz	a
 902  008d 27f8          	jreq	L565
 903                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 907  008f ae00d4        	ldw	x,#212
 909  0092 9d            nop
 910  0093                L61:
 911  0093 5a             decw X
 912  0094 26fd           jrne L61
 913  0096 9d             nop
 914                      
 916  0097               L113:
 917                     ; 17 		bitLeido = 0;
 919                     ; 18 		if( IsActive( gpio ) )
 921  0097 1e07          	ldw	x,(OFST-2,sp)
 922  0099 cd0000        	call	_IsActive
 924  009c 4d            	tnz	a
 925  009d 2706          	jreq	L175
 926                     ; 20 			bitLeido = 1;
 928  009f a601          	ld	a,#1
 929  00a1 6b03          	ld	(OFST-6,sp),a
 932  00a3 2002          	jra	L375
 933  00a5               L175:
 934                     ; 24 			bitLeido = 0;
 936  00a5 0f03          	clr	(OFST-6,sp)
 938  00a7               L375:
 939                     ; 27 		temp |= bitLeido;
 941  00a7 7b01          	ld	a,(OFST-8,sp)
 942  00a9 1a03          	or	a,(OFST-6,sp)
 943  00ab 6b01          	ld	(OFST-8,sp),a
 945                     ; 28 		if( contador < 7 )
 947  00ad 7b02          	ld	a,(OFST-7,sp)
 948  00af a107          	cp	a,#7
 949  00b1 2402          	jruge	L106
 950                     ; 30 			temp <<=  1;
 952  00b3 0801          	sll	(OFST-8,sp)
 954  00b5               L106:
 955                     ; 33 		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
 957  00b5 1e07          	ldw	x,(OFST-2,sp)
 958  00b7 cd0000        	call	_IsActive
 960  00ba 4d            	tnz	a
 961  00bb 26f8          	jrne	L106
 962                     ; 9 	for( contador; contador < 8; contador++ )
 964  00bd 0c02          	inc	(OFST-7,sp)
 966  00bf               L755:
 969  00bf 7b02          	ld	a,(OFST-7,sp)
 970  00c1 a108          	cp	a,#8
 971  00c3 25c2          	jrult	L565
 972                     ; 39 	return temp;
 974  00c5 7b01          	ld	a,(OFST-8,sp)
 975  00c7 1e07          	ldw	x,(OFST-2,sp)
 976  00c9 e707          	ld	(7,x),a
 979  00cb 1e07          	ldw	x,(OFST-2,sp)
 980  00cd e607          	ld	a,(7,x)
 981                     ; 77 	sensor->Datos.Estado = dht11_MIDIENDO_H;
 983  00cf 1e07          	ldw	x,(OFST-2,sp)
 984  00d1 a603          	ld	a,#3
 985  00d3 e708          	ld	(8,x),a
 986                     ; 5 	uint8_t contador = 0;
 989  00d5 0f02          	clr	(OFST-7,sp)
 991                     ; 6 	uint8_t temp = 0;
 993  00d7 0f01          	clr	(OFST-8,sp)
 995                     ; 7 	uint8_t bitLeido = 0;
 997                     ; 9 	for( contador; contador < 8; contador++ )
1000  00d9 2038          	jra	L116
1001  00db               L716:
1002                     ; 11 		while( !IsActive( gpio ) ) //Espera nuevo bit
1004  00db 1e07          	ldw	x,(OFST-2,sp)
1005  00dd cd0000        	call	_IsActive
1007  00e0 4d            	tnz	a
1008  00e1 27f8          	jreq	L716
1009                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1013  00e3 ae00d4        	ldw	x,#212
1015  00e6 9d            nop
1016  00e7                L02:
1017  00e7 5a             decw X
1018  00e8 26fd           jrne L02
1019  00ea 9d             nop
1020                      
1022  00eb               L713:
1023                     ; 17 		bitLeido = 0;
1025                     ; 18 		if( IsActive( gpio ) )
1027  00eb 1e07          	ldw	x,(OFST-2,sp)
1028  00ed cd0000        	call	_IsActive
1030  00f0 4d            	tnz	a
1031  00f1 2706          	jreq	L326
1032                     ; 20 			bitLeido = 1;
1034  00f3 a601          	ld	a,#1
1035  00f5 6b03          	ld	(OFST-6,sp),a
1038  00f7 2002          	jra	L526
1039  00f9               L326:
1040                     ; 24 			bitLeido = 0;
1042  00f9 0f03          	clr	(OFST-6,sp)
1044  00fb               L526:
1045                     ; 27 		temp |= bitLeido;
1047  00fb 7b01          	ld	a,(OFST-8,sp)
1048  00fd 1a03          	or	a,(OFST-6,sp)
1049  00ff 6b01          	ld	(OFST-8,sp),a
1051                     ; 28 		if( contador < 7 )
1053  0101 7b02          	ld	a,(OFST-7,sp)
1054  0103 a107          	cp	a,#7
1055  0105 2402          	jruge	L336
1056                     ; 30 			temp <<=  1;
1058  0107 0801          	sll	(OFST-8,sp)
1060  0109               L336:
1061                     ; 33 		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
1063  0109 1e07          	ldw	x,(OFST-2,sp)
1064  010b cd0000        	call	_IsActive
1066  010e 4d            	tnz	a
1067  010f 26f8          	jrne	L336
1068                     ; 9 	for( contador; contador < 8; contador++ )
1070  0111 0c02          	inc	(OFST-7,sp)
1072  0113               L116:
1075  0113 7b02          	ld	a,(OFST-7,sp)
1076  0115 a108          	cp	a,#8
1077  0117 25c2          	jrult	L716
1078                     ; 39 	return temp;
1080  0119 7b01          	ld	a,(OFST-8,sp)
1081  011b 1e07          	ldw	x,(OFST-2,sp)
1082  011d e706          	ld	(6,x),a
1085  011f 1e07          	ldw	x,(OFST-2,sp)
1086  0121 e606          	ld	a,(6,x)
1087                     ; 80 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1089  0123 1e07          	ldw	x,(OFST-2,sp)
1090  0125 a604          	ld	a,#4
1091  0127 e708          	ld	(8,x),a
1092                     ; 5 	uint8_t contador = 0;
1095  0129 0f02          	clr	(OFST-7,sp)
1097                     ; 6 	uint8_t temp = 0;
1099  012b 0f01          	clr	(OFST-8,sp)
1101                     ; 7 	uint8_t bitLeido = 0;
1103                     ; 9 	for( contador; contador < 8; contador++ )
1106  012d 2038          	jra	L346
1107  012f               L156:
1108                     ; 11 		while( !IsActive( gpio ) ) //Espera nuevo bit
1110  012f 1e07          	ldw	x,(OFST-2,sp)
1111  0131 cd0000        	call	_IsActive
1113  0134 4d            	tnz	a
1114  0135 27f8          	jreq	L156
1115                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1119  0137 ae00d4        	ldw	x,#212
1121  013a 9d            nop
1122  013b                L22:
1123  013b 5a             decw X
1124  013c 26fd           jrne L22
1125  013e 9d             nop
1126                      
1128  013f               L523:
1129                     ; 17 		bitLeido = 0;
1131                     ; 18 		if( IsActive( gpio ) )
1133  013f 1e07          	ldw	x,(OFST-2,sp)
1134  0141 cd0000        	call	_IsActive
1136  0144 4d            	tnz	a
1137  0145 2706          	jreq	L556
1138                     ; 20 			bitLeido = 1;
1140  0147 a601          	ld	a,#1
1141  0149 6b03          	ld	(OFST-6,sp),a
1144  014b 2002          	jra	L756
1145  014d               L556:
1146                     ; 24 			bitLeido = 0;
1148  014d 0f03          	clr	(OFST-6,sp)
1150  014f               L756:
1151                     ; 27 		temp |= bitLeido;
1153  014f 7b01          	ld	a,(OFST-8,sp)
1154  0151 1a03          	or	a,(OFST-6,sp)
1155  0153 6b01          	ld	(OFST-8,sp),a
1157                     ; 28 		if( contador < 7 )
1159  0155 7b02          	ld	a,(OFST-7,sp)
1160  0157 a107          	cp	a,#7
1161  0159 2402          	jruge	L566
1162                     ; 30 			temp <<=  1;
1164  015b 0801          	sll	(OFST-8,sp)
1166  015d               L566:
1167                     ; 33 		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
1169  015d 1e07          	ldw	x,(OFST-2,sp)
1170  015f cd0000        	call	_IsActive
1172  0162 4d            	tnz	a
1173  0163 26f8          	jrne	L566
1174                     ; 9 	for( contador; contador < 8; contador++ )
1176  0165 0c02          	inc	(OFST-7,sp)
1178  0167               L346:
1181  0167 7b02          	ld	a,(OFST-7,sp)
1182  0169 a108          	cp	a,#8
1183  016b 25c2          	jrult	L156
1184                     ; 39 	return temp;
1186  016d 7b01          	ld	a,(OFST-8,sp)
1187  016f 1e07          	ldw	x,(OFST-2,sp)
1188  0171 e705          	ld	(5,x),a
1191  0173 1e07          	ldw	x,(OFST-2,sp)
1192  0175 e605          	ld	a,(5,x)
1193                     ; 83 	sensor->Datos.Estado = dht11_MIDIENDO_T;
1195  0177 1e07          	ldw	x,(OFST-2,sp)
1196  0179 a604          	ld	a,#4
1197  017b e708          	ld	(8,x),a
1198                     ; 5 	uint8_t contador = 0;
1201  017d 0f02          	clr	(OFST-7,sp)
1203                     ; 6 	uint8_t temp = 0;
1205  017f 0f01          	clr	(OFST-8,sp)
1207                     ; 7 	uint8_t bitLeido = 0;
1209                     ; 9 	for( contador; contador < 8; contador++ )
1212  0181 2038          	jra	L576
1213  0183               L307:
1214                     ; 11 		while( !IsActive( gpio ) ) //Espera nuevo bit
1216  0183 1e07          	ldw	x,(OFST-2,sp)
1217  0185 cd0000        	call	_IsActive
1219  0188 4d            	tnz	a
1220  0189 27f8          	jreq	L307
1221                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1225  018b ae00d4        	ldw	x,#212
1227  018e 9d            nop
1228  018f                L42:
1229  018f 5a             decw X
1230  0190 26fd           jrne L42
1231  0192 9d             nop
1232                      
1234  0193               L333:
1235                     ; 17 		bitLeido = 0;
1237                     ; 18 		if( IsActive( gpio ) )
1239  0193 1e07          	ldw	x,(OFST-2,sp)
1240  0195 cd0000        	call	_IsActive
1242  0198 4d            	tnz	a
1243  0199 2706          	jreq	L707
1244                     ; 20 			bitLeido = 1;
1246  019b a601          	ld	a,#1
1247  019d 6b03          	ld	(OFST-6,sp),a
1250  019f 2002          	jra	L117
1251  01a1               L707:
1252                     ; 24 			bitLeido = 0;
1254  01a1 0f03          	clr	(OFST-6,sp)
1256  01a3               L117:
1257                     ; 27 		temp |= bitLeido;
1259  01a3 7b01          	ld	a,(OFST-8,sp)
1260  01a5 1a03          	or	a,(OFST-6,sp)
1261  01a7 6b01          	ld	(OFST-8,sp),a
1263                     ; 28 		if( contador < 7 )
1265  01a9 7b02          	ld	a,(OFST-7,sp)
1266  01ab a107          	cp	a,#7
1267  01ad 2402          	jruge	L717
1268                     ; 30 			temp <<=  1;
1270  01af 0801          	sll	(OFST-8,sp)
1272  01b1               L717:
1273                     ; 33 		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
1275  01b1 1e07          	ldw	x,(OFST-2,sp)
1276  01b3 cd0000        	call	_IsActive
1278  01b6 4d            	tnz	a
1279  01b7 26f8          	jrne	L717
1280                     ; 9 	for( contador; contador < 8; contador++ )
1282  01b9 0c02          	inc	(OFST-7,sp)
1284  01bb               L576:
1287  01bb 7b02          	ld	a,(OFST-7,sp)
1288  01bd a108          	cp	a,#8
1289  01bf 25c2          	jrult	L307
1290                     ; 39 	return temp;
1292  01c1 7b01          	ld	a,(OFST-8,sp)
1293  01c3 1e07          	ldw	x,(OFST-2,sp)
1294  01c5 e704          	ld	(4,x),a
1297  01c7 1e07          	ldw	x,(OFST-2,sp)
1298  01c9 e604          	ld	a,(4,x)
1299                     ; 5 	uint8_t contador = 0;
1302  01cb 0f02          	clr	(OFST-7,sp)
1304                     ; 6 	uint8_t temp = 0;
1306  01cd 0f01          	clr	(OFST-8,sp)
1308                     ; 7 	uint8_t bitLeido = 0;
1310                     ; 9 	for( contador; contador < 8; contador++ )
1313  01cf 2038          	jra	L727
1314  01d1               L537:
1315                     ; 11 		while( !IsActive( gpio ) ) //Espera nuevo bit
1317  01d1 1e07          	ldw	x,(OFST-2,sp)
1318  01d3 cd0000        	call	_IsActive
1320  01d6 4d            	tnz	a
1321  01d7 27f8          	jreq	L537
1322                     ; 29 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1326  01d9 ae00d4        	ldw	x,#212
1328  01dc 9d            nop
1329  01dd                L62:
1330  01dd 5a             decw X
1331  01de 26fd           jrne L62
1332  01e0 9d             nop
1333                      
1335  01e1               L143:
1336                     ; 17 		bitLeido = 0;
1338                     ; 18 		if( IsActive( gpio ) )
1340  01e1 1e07          	ldw	x,(OFST-2,sp)
1341  01e3 cd0000        	call	_IsActive
1343  01e6 4d            	tnz	a
1344  01e7 2706          	jreq	L147
1345                     ; 20 			bitLeido = 1;
1347  01e9 a601          	ld	a,#1
1348  01eb 6b03          	ld	(OFST-6,sp),a
1351  01ed 2002          	jra	L347
1352  01ef               L147:
1353                     ; 24 			bitLeido = 0;
1355  01ef 0f03          	clr	(OFST-6,sp)
1357  01f1               L347:
1358                     ; 27 		temp |= bitLeido;
1360  01f1 7b01          	ld	a,(OFST-8,sp)
1361  01f3 1a03          	or	a,(OFST-6,sp)
1362  01f5 6b01          	ld	(OFST-8,sp),a
1364                     ; 28 		if( contador < 7 )
1366  01f7 7b02          	ld	a,(OFST-7,sp)
1367  01f9 a107          	cp	a,#7
1368  01fb 2402          	jruge	L157
1369                     ; 30 			temp <<=  1;
1371  01fd 0801          	sll	(OFST-8,sp)
1373  01ff               L157:
1374                     ; 33 		while( IsActive( gpio ) ) //Si el bit=1 espero a que baje señal
1376  01ff 1e07          	ldw	x,(OFST-2,sp)
1377  0201 cd0000        	call	_IsActive
1379  0204 4d            	tnz	a
1380  0205 26f8          	jrne	L157
1381                     ; 9 	for( contador; contador < 8; contador++ )
1383  0207 0c02          	inc	(OFST-7,sp)
1385  0209               L727:
1388  0209 7b02          	ld	a,(OFST-7,sp)
1389  020b a108          	cp	a,#8
1390  020d 25c2          	jrult	L537
1391                     ; 39 	return temp;
1393  020f 7b01          	ld	a,(OFST-8,sp)
1394  0211 1e07          	ldw	x,(OFST-2,sp)
1395  0213 e703          	ld	(3,x),a
1398  0215 1e07          	ldw	x,(OFST-2,sp)
1399  0217 e603          	ld	a,(3,x)
1400                     ; 88 	checkCRC = sensor->Datos.UltimaLectura.H_Entero + sensor->Datos.UltimaLectura.H_Decimal + sensor->Datos.UltimaLectura.T_Entero + sensor->Datos.UltimaLectura.T_Decimal;
1402  0219 1e07          	ldw	x,(OFST-2,sp)
1403  021b e606          	ld	a,(6,x)
1404  021d 5f            	clrw	x
1405  021e 1607          	ldw	y,(OFST-2,sp)
1406  0220 90eb07        	add	a,(7,y)
1407  0223 2401          	jrnc	L03
1408  0225 5c            	incw	x
1409  0226               L03:
1410  0226 1607          	ldw	y,(OFST-2,sp)
1411  0228 90eb05        	add	a,(5,y)
1412  022b 2401          	jrnc	L23
1413  022d 5c            	incw	x
1414  022e               L23:
1415  022e 1607          	ldw	y,(OFST-2,sp)
1416  0230 90eb04        	add	a,(4,y)
1417  0233 2401          	jrnc	L43
1418  0235 5c            	incw	x
1419  0236               L43:
1420  0236 02            	rlwa	x,a
1421  0237 1f05          	ldw	(OFST-4,sp),x
1422  0239 01            	rrwa	x,a
1424                     ; 89 	checkCRC &= mask;
1426  023a 7b04          	ld	a,(OFST-5,sp)
1427  023c 5f            	clrw	x
1428  023d 97            	ld	xl,a
1429  023e 01            	rrwa	x,a
1430  023f 1406          	and	a,(OFST-3,sp)
1431  0241 01            	rrwa	x,a
1432  0242 1405          	and	a,(OFST-4,sp)
1433  0244 01            	rrwa	x,a
1434  0245 1f05          	ldw	(OFST-4,sp),x
1436                     ; 91 	if( checkCRC == sensor->Datos.UltimaLectura.CRC )
1438  0247 1e07          	ldw	x,(OFST-2,sp)
1439  0249 e603          	ld	a,(3,x)
1440  024b 5f            	clrw	x
1441  024c 97            	ld	xl,a
1442  024d 1305          	cpw	x,(OFST-4,sp)
1443  024f 2606          	jrne	L557
1444                     ; 93 		return true;
1446  0251 a601          	ld	a,#1
1447  0253 6b09          	ld	(OFST+0,sp),a
1450  0255 2002          	jra	L543
1451  0257               L557:
1452                     ; 97 		return false;
1454  0257 0f09          	clr	(OFST+0,sp)
1457  0259               L543:
1459  0259 0d09          	tnz	(OFST+0,sp)
1460  025b 2708          	jreq	L155
1461                     ; 129 			sensor->Datos.Estado = dht11_CERRANDO_CONEXION;
1463  025d 1e0a          	ldw	x,(OFST+1,sp)
1464  025f a605          	ld	a,#5
1465  0261 e708          	ld	(8,x),a
1467  0263 200e          	jra	L367
1468  0265               L155:
1469                     ; 133 			sensor->Datos.Estado = dht11_FALLO_AL_LEER;//fallo crc
1471  0265 1e0a          	ldw	x,(OFST+1,sp)
1472  0267 a609          	ld	a,#9
1473  0269 e708          	ld	(8,x),a
1474  026b 2006          	jra	L367
1475  026d               L325:
1476                     ; 138 		sensor->Datos.Estado = dht11_FALLO_AL_COMUNICAR;
1478  026d 1e0a          	ldw	x,(OFST+1,sp)
1479  026f a60a          	ld	a,#10
1480  0271 e708          	ld	(8,x),a
1481  0273               L367:
1482                     ; 141 	dht11_CerrarConexion( sensor );
1485  0273 1e0a          	ldw	x,(OFST+1,sp)
1486  0275 1f07          	ldw	(OFST-2,sp),x
1488                     ; 103 	Output2mhz_Init( &sensor->Config.HW );
1490  0277 1e07          	ldw	x,(OFST-2,sp)
1491  0279 cd0000        	call	_Output2mhz_Init
1493                     ; 104 	Output_1( &sensor->Config.HW );
1495  027c 1e07          	ldw	x,(OFST-2,sp)
1496  027e cd0000        	call	_Output_1
1498                     ; 106 	if( sensor->Datos.Estado == dht11_CERRANDO_CONEXION )
1500  0281 1e07          	ldw	x,(OFST-2,sp)
1501  0283 e608          	ld	a,(8,x)
1502  0285 a105          	cp	a,#5
1503  0287 2606          	jrne	L743
1504                     ; 108 		sensor->Datos.Estado = dht11_SLEEP;
1506  0289 1e07          	ldw	x,(OFST-2,sp)
1507  028b a606          	ld	a,#6
1508  028d e708          	ld	(8,x),a
1509  028f               L743:
1510                     ; 143 }
1513  028f 5b0b          	addw	sp,#11
1514  0291 81            	ret
1527                     	xdef	_dht11_Lectura
1528                     	xdef	_dht11_ModoCambiado
1529                     	xdef	_DHT11_Init
1530                     	xref	_IsActive
1531                     	xref	_Output_1
1532                     	xref	_Output_0
1533                     	xref	_Output2mhz_Init
1534                     	xref	_Input_Init
1553                     	end
