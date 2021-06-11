   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  44                     ; 5 void dht11_ModoCambiado( void )
  44                     ; 6 {
  46                     	switch	.text
  47  0000               _dht11_ModoCambiado:
  51                     ; 8 }
  54  0000 81            	ret
 573                     ; 10 bool dht11_ComenzarTransmision( DHT11_t* sensor )
 573                     ; 11 {
 574                     	switch	.text
 575  0001               _dht11_ComenzarTransmision:
 577  0001 89            	pushw	x
 578       00000000      OFST:	set	0
 581                     ; 13 	Output2mhz_Init( &sensor->pin );
 583  0002 1c0005        	addw	x,#5
 584  0005 cd0000        	call	_Output2mhz_Init
 586                     ; 14 	Output_0( &sensor->pin );
 588  0008 1e01          	ldw	x,(OFST+1,sp)
 589  000a 1c0005        	addw	x,#5
 590  000d cd0000        	call	_Output_0
 592                     ; 16 	sensor->Datos.estado = dht11_COMUNICANDO;
 594  0010 1e01          	ldw	x,(OFST+1,sp)
 595  0012 a601          	ld	a,#1
 596  0014 e70d          	ld	(13,x),a
 597                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 601  0016 ae0069        	ldw	x,#105
 603  0019 9d            nop
 604  001a                L01:
 605  001a 5a             decw X
 606  001b 26fd           jrne L01
 607  001d 9d             nop
 608                      
 610  001e               L13:
 611                     ; 19 	Output_1( &sensor->pin );
 613  001e 1e01          	ldw	x,(OFST+1,sp)
 614  0020 1c0005        	addw	x,#5
 615  0023 cd0000        	call	_Output_1
 617                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 621  0026 ae00d4        	ldw	x,#212
 623  0029 9d            nop
 624  002a                L21:
 625  002a 5a             decw X
 626  002b 26fd           jrne L21
 627  002d 9d             nop
 628                      
 630  002e               L53:
 631                     ; 22 	Input_Init( &sensor->pin ); //Configuro como entrada para leer
 633  002e 1e01          	ldw	x,(OFST+1,sp)
 634  0030 1c0005        	addw	x,#5
 635  0033 cd0000        	call	_Input_Init
 637                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 641  0036 ae00d4        	ldw	x,#212
 643  0039 9d            nop
 644  003a                L41:
 645  003a 5a             decw X
 646  003b 26fd           jrne L41
 647  003d 9d             nop
 648                      
 650  003e               L14:
 651                     ; 25 	if( IsActive( &sensor->pin ) ) 
 653  003e 1e01          	ldw	x,(OFST+1,sp)
 654  0040 1c0005        	addw	x,#5
 655  0043 cd0000        	call	_IsActive
 657  0046 4d            	tnz	a
 658  0047 2709          	jreq	L363
 659                     ; 27 		sensor->Datos.estado = dht11_SLEEP;
 661  0049 1e01          	ldw	x,(OFST+1,sp)
 662  004b a606          	ld	a,#6
 663  004d e70d          	ld	(13,x),a
 664                     ; 28 		return false; //Compruebo que este en nivel bajo
 666  004f 4f            	clr	a
 668  0050 201a          	jra	L22
 669  0052               L363:
 670                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 674  0052 ae01a9        	ldw	x,#425
 676  0055 9d            nop
 677  0056                L61:
 678  0056 5a             decw X
 679  0057 26fd           jrne L61
 680  0059 9d             nop
 681                      
 683  005a               L54:
 684                     ; 32 	if( !IsActive( &sensor->pin ) ) 
 686  005a 1e01          	ldw	x,(OFST+1,sp)
 687  005c 1c0005        	addw	x,#5
 688  005f cd0000        	call	_IsActive
 690  0062 4d            	tnz	a
 691  0063 2609          	jrne	L563
 692                     ; 34 		sensor->Datos.estado = dht11_SLEEP;
 694  0065 1e01          	ldw	x,(OFST+1,sp)
 695  0067 a606          	ld	a,#6
 696  0069 e70d          	ld	(13,x),a
 697                     ; 35 		return false; //Compruebo que este en nivel alto
 699  006b 4f            	clr	a
 701  006c               L22:
 703  006c 85            	popw	x
 704  006d 81            	ret
 705  006e               L563:
 706                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 710  006e ae00ef        	ldw	x,#239
 712  0071 9d            nop
 713  0072                L02:
 714  0072 5a             decw X
 715  0073 26fd           jrne L02
 716  0075 9d             nop
 717                      
 719  0076               L15:
 720                     ; 39 	if( IsActive( &sensor->pin ) ) 
 722  0076 1e01          	ldw	x,(OFST+1,sp)
 723  0078 1c0005        	addw	x,#5
 724  007b cd0000        	call	_IsActive
 726  007e 4d            	tnz	a
 727  007f 2709          	jreq	L763
 728                     ; 41 		sensor->Datos.estado = dht11_SLEEP;
 730  0081 1e01          	ldw	x,(OFST+1,sp)
 731  0083 a606          	ld	a,#6
 732  0085 e70d          	ld	(13,x),a
 733                     ; 42 		return false;
 735  0087 4f            	clr	a
 737  0088 20e2          	jra	L22
 738  008a               L763:
 739                     ; 46 		sensor->Datos.estado = dht11_CONEXION_OK;
 741  008a 1e01          	ldw	x,(OFST+1,sp)
 742  008c a602          	ld	a,#2
 743  008e e70d          	ld	(13,x),a
 744                     ; 47 		return true;
 746  0090 a601          	ld	a,#1
 748  0092 20d8          	jra	L22
 820                     ; 51 void dht11_LeerDatos( DHT11_t* sensor )
 820                     ; 52 {
 821                     	switch	.text
 822  0094               _dht11_LeerDatos:
 824  0094 89            	pushw	x
 825  0095 5203          	subw	sp,#3
 826       00000003      OFST:	set	3
 829                     ; 53 	uint8_t temp = 0;
 831  0097 0f03          	clr	(OFST+0,sp)
 833                     ; 54 	uint8_t contador = 0;
 835  0099 0f02          	clr	(OFST-1,sp)
 837                     ; 57 	sensor->Datos.estado = dht11_MIDIENDO_H;
 839  009b a603          	ld	a,#3
 840  009d e70d          	ld	(13,x),a
 841                     ; 59 	for( contador; contador < 8; contador++ )
 844  009f 2037          	jra	L754
 845  00a1               L564:
 846                     ; 61 		while( !IsActive( &sensor->pin ) )
 848  00a1 1e04          	ldw	x,(OFST+1,sp)
 849  00a3 1c0005        	addw	x,#5
 850  00a6 cd0000        	call	_IsActive
 852  00a9 4d            	tnz	a
 853  00aa 27f5          	jreq	L564
 854                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 858  00ac ae00d4        	ldw	x,#212
 860  00af 9d            nop
 861  00b0                L62:
 862  00b0 5a             decw X
 863  00b1 26fd           jrne L62
 864  00b3 9d             nop
 865                      
 867  00b4               L573:
 868                     ; 67 		bitLeido = 0;
 870                     ; 68 		if( IsActive( &sensor->pin ) )
 872  00b4 1e04          	ldw	x,(OFST+1,sp)
 873  00b6 1c0005        	addw	x,#5
 874  00b9 cd0000        	call	_IsActive
 876  00bc 4d            	tnz	a
 877  00bd 2715          	jreq	L174
 878                     ; 70 			bitLeido = 1;
 880                     ; 71 			temp |= bitLeido;
 882  00bf 7b03          	ld	a,(OFST+0,sp)
 883  00c1 aa01          	or	a,#1
 884  00c3 6b03          	ld	(OFST+0,sp),a
 886                     ; 72 			temp <<=  1;
 888  00c5 0803          	sll	(OFST+0,sp)
 891  00c7               L574:
 892                     ; 73 			while( IsActive( &sensor->pin ) )
 894  00c7 1e04          	ldw	x,(OFST+1,sp)
 895  00c9 1c0005        	addw	x,#5
 896  00cc cd0000        	call	_IsActive
 898  00cf 4d            	tnz	a
 899  00d0 26f5          	jrne	L574
 901  00d2 2002          	jra	L105
 902  00d4               L174:
 903                     ; 80 			temp <<= 1;
 905  00d4 0803          	sll	(OFST+0,sp)
 907  00d6               L105:
 908                     ; 59 	for( contador; contador < 8; contador++ )
 910  00d6 0c02          	inc	(OFST-1,sp)
 912  00d8               L754:
 915  00d8 7b02          	ld	a,(OFST-1,sp)
 916  00da a108          	cp	a,#8
 917  00dc 25c3          	jrult	L564
 918                     ; 83 	sensor->Datos.UltimaLectura.H_Entero = temp;
 920  00de 7b03          	ld	a,(OFST+0,sp)
 921  00e0 1e04          	ldw	x,(OFST+1,sp)
 922  00e2 e70c          	ld	(12,x),a
 923                     ; 85 	sensor->Datos.estado = dht11_MIDIENDO_H;
 925  00e4 1e04          	ldw	x,(OFST+1,sp)
 926  00e6 a603          	ld	a,#3
 927  00e8 e70d          	ld	(13,x),a
 928                     ; 87 	contador = 0;
 930  00ea 0f02          	clr	(OFST-1,sp)
 932                     ; 88 	temp = 0;
 934  00ec 0f03          	clr	(OFST+0,sp)
 936                     ; 89 	for( contador; contador < 8; contador++ )
 939  00ee 2037          	jra	L705
 940  00f0               L515:
 941                     ; 91 		while( !IsActive( &sensor->pin ) )
 943  00f0 1e04          	ldw	x,(OFST+1,sp)
 944  00f2 1c0005        	addw	x,#5
 945  00f5 cd0000        	call	_IsActive
 947  00f8 4d            	tnz	a
 948  00f9 27f5          	jreq	L515
 949                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 953  00fb ae00d4        	ldw	x,#212
 955  00fe 9d            nop
 956  00ff                L03:
 957  00ff 5a             decw X
 958  0100 26fd           jrne L03
 959  0102 9d             nop
 960                      
 962  0103               L104:
 963                     ; 97 		bitLeido = 0;
 965                     ; 98 		if( IsActive( &sensor->pin ) )
 967  0103 1e04          	ldw	x,(OFST+1,sp)
 968  0105 1c0005        	addw	x,#5
 969  0108 cd0000        	call	_IsActive
 971  010b 4d            	tnz	a
 972  010c 2715          	jreq	L125
 973                     ; 100 			bitLeido = 1;
 975                     ; 101 			temp |= bitLeido;
 977  010e 7b03          	ld	a,(OFST+0,sp)
 978  0110 aa01          	or	a,#1
 979  0112 6b03          	ld	(OFST+0,sp),a
 981                     ; 102 			temp <<=  1;
 983  0114 0803          	sll	(OFST+0,sp)
 986  0116               L525:
 987                     ; 103 			while( IsActive( &sensor->pin ) )
 989  0116 1e04          	ldw	x,(OFST+1,sp)
 990  0118 1c0005        	addw	x,#5
 991  011b cd0000        	call	_IsActive
 993  011e 4d            	tnz	a
 994  011f 26f5          	jrne	L525
 996  0121 2002          	jra	L135
 997  0123               L125:
 998                     ; 110 			temp <<= 1;
1000  0123 0803          	sll	(OFST+0,sp)
1002  0125               L135:
1003                     ; 89 	for( contador; contador < 8; contador++ )
1005  0125 0c02          	inc	(OFST-1,sp)
1007  0127               L705:
1010  0127 7b02          	ld	a,(OFST-1,sp)
1011  0129 a108          	cp	a,#8
1012  012b 25c3          	jrult	L515
1013                     ; 113 	sensor->Datos.UltimaLectura.H_Decimal = temp;
1015  012d 7b03          	ld	a,(OFST+0,sp)
1016  012f 1e04          	ldw	x,(OFST+1,sp)
1017  0131 e70b          	ld	(11,x),a
1018                     ; 115 	sensor->Datos.estado = dht11_MIDIENDO_T;
1020  0133 1e04          	ldw	x,(OFST+1,sp)
1021  0135 a604          	ld	a,#4
1022  0137 e70d          	ld	(13,x),a
1023                     ; 117 	contador = 0;
1025  0139 0f02          	clr	(OFST-1,sp)
1027                     ; 118 	temp = 0;
1029  013b 0f03          	clr	(OFST+0,sp)
1031                     ; 119 	for( contador; contador < 8; contador++ )
1034  013d 2037          	jra	L735
1035  013f               L545:
1036                     ; 121 		while( !IsActive( &sensor->pin ) )
1038  013f 1e04          	ldw	x,(OFST+1,sp)
1039  0141 1c0005        	addw	x,#5
1040  0144 cd0000        	call	_IsActive
1042  0147 4d            	tnz	a
1043  0148 27f5          	jreq	L545
1044                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1048  014a ae00d4        	ldw	x,#212
1050  014d 9d            nop
1051  014e                L23:
1052  014e 5a             decw X
1053  014f 26fd           jrne L23
1054  0151 9d             nop
1055                      
1057  0152               L504:
1058                     ; 127 		bitLeido = 0;
1060                     ; 128 		if( IsActive( &sensor->pin ) )
1062  0152 1e04          	ldw	x,(OFST+1,sp)
1063  0154 1c0005        	addw	x,#5
1064  0157 cd0000        	call	_IsActive
1066  015a 4d            	tnz	a
1067  015b 2715          	jreq	L155
1068                     ; 130 			bitLeido = 1;
1070                     ; 131 			temp |= bitLeido;
1072  015d 7b03          	ld	a,(OFST+0,sp)
1073  015f aa01          	or	a,#1
1074  0161 6b03          	ld	(OFST+0,sp),a
1076                     ; 132 			temp <<=  1;
1078  0163 0803          	sll	(OFST+0,sp)
1081  0165               L555:
1082                     ; 133 			while( IsActive( &sensor->pin ) )
1084  0165 1e04          	ldw	x,(OFST+1,sp)
1085  0167 1c0005        	addw	x,#5
1086  016a cd0000        	call	_IsActive
1088  016d 4d            	tnz	a
1089  016e 26f5          	jrne	L555
1091  0170 2002          	jra	L165
1092  0172               L155:
1093                     ; 140 			temp <<= 1;
1095  0172 0803          	sll	(OFST+0,sp)
1097  0174               L165:
1098                     ; 119 	for( contador; contador < 8; contador++ )
1100  0174 0c02          	inc	(OFST-1,sp)
1102  0176               L735:
1105  0176 7b02          	ld	a,(OFST-1,sp)
1106  0178 a108          	cp	a,#8
1107  017a 25c3          	jrult	L545
1108                     ; 143 	sensor->Datos.UltimaLectura.T_Entero = temp;
1110  017c 7b03          	ld	a,(OFST+0,sp)
1111  017e 1e04          	ldw	x,(OFST+1,sp)
1112  0180 e70a          	ld	(10,x),a
1113                     ; 145 	sensor->Datos.estado = dht11_MIDIENDO_T;
1115  0182 1e04          	ldw	x,(OFST+1,sp)
1116  0184 a604          	ld	a,#4
1117  0186 e70d          	ld	(13,x),a
1118                     ; 147 	contador = 0;
1120  0188 0f02          	clr	(OFST-1,sp)
1122                     ; 148 	temp = 0;
1124  018a 0f03          	clr	(OFST+0,sp)
1126                     ; 149 	for( contador; contador < 8; contador++ )
1129  018c 2037          	jra	L765
1130  018e               L575:
1131                     ; 151 		while( !IsActive( &sensor->pin ) )
1133  018e 1e04          	ldw	x,(OFST+1,sp)
1134  0190 1c0005        	addw	x,#5
1135  0193 cd0000        	call	_IsActive
1137  0196 4d            	tnz	a
1138  0197 27f5          	jreq	L575
1139                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1143  0199 ae00d4        	ldw	x,#212
1145  019c 9d            nop
1146  019d                L43:
1147  019d 5a             decw X
1148  019e 26fd           jrne L43
1149  01a0 9d             nop
1150                      
1152  01a1               L114:
1153                     ; 157 		bitLeido = 0;
1155                     ; 158 		if( IsActive( &sensor->pin ) )
1157  01a1 1e04          	ldw	x,(OFST+1,sp)
1158  01a3 1c0005        	addw	x,#5
1159  01a6 cd0000        	call	_IsActive
1161  01a9 4d            	tnz	a
1162  01aa 2715          	jreq	L106
1163                     ; 160 			bitLeido = 1;
1165                     ; 161 			temp |= bitLeido;
1167  01ac 7b03          	ld	a,(OFST+0,sp)
1168  01ae aa01          	or	a,#1
1169  01b0 6b03          	ld	(OFST+0,sp),a
1171                     ; 162 			temp <<=  1;
1173  01b2 0803          	sll	(OFST+0,sp)
1176  01b4               L506:
1177                     ; 163 			while( IsActive( &sensor->pin ) )
1179  01b4 1e04          	ldw	x,(OFST+1,sp)
1180  01b6 1c0005        	addw	x,#5
1181  01b9 cd0000        	call	_IsActive
1183  01bc 4d            	tnz	a
1184  01bd 26f5          	jrne	L506
1186  01bf 2002          	jra	L116
1187  01c1               L106:
1188                     ; 170 			temp <<= 1;
1190  01c1 0803          	sll	(OFST+0,sp)
1192  01c3               L116:
1193                     ; 149 	for( contador; contador < 8; contador++ )
1195  01c3 0c02          	inc	(OFST-1,sp)
1197  01c5               L765:
1200  01c5 7b02          	ld	a,(OFST-1,sp)
1201  01c7 a108          	cp	a,#8
1202  01c9 25c3          	jrult	L575
1203                     ; 173 	sensor->Datos.UltimaLectura.T_Decimal = temp;
1205  01cb 7b03          	ld	a,(OFST+0,sp)
1206  01cd 1e04          	ldw	x,(OFST+1,sp)
1207  01cf e709          	ld	(9,x),a
1208                     ; 176 	contador = 0;
1210  01d1 0f02          	clr	(OFST-1,sp)
1212                     ; 177 	temp = 0;
1214  01d3 0f03          	clr	(OFST+0,sp)
1216                     ; 178 	for( contador; contador < 8; contador++ )
1219  01d5 2037          	jra	L716
1220  01d7               L526:
1221                     ; 180 		while( !IsActive( &sensor->pin ) )
1223  01d7 1e04          	ldw	x,(OFST+1,sp)
1224  01d9 1c0005        	addw	x,#5
1225  01dc cd0000        	call	_IsActive
1227  01df 4d            	tnz	a
1228  01e0 27f5          	jreq	L526
1229                     ; 26 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
1233  01e2 ae00d4        	ldw	x,#212
1235  01e5 9d            nop
1236  01e6                L63:
1237  01e6 5a             decw X
1238  01e7 26fd           jrne L63
1239  01e9 9d             nop
1240                      
1242  01ea               L514:
1243                     ; 186 		bitLeido = 0;
1245                     ; 187 		if( IsActive( &sensor->pin ) )
1247  01ea 1e04          	ldw	x,(OFST+1,sp)
1248  01ec 1c0005        	addw	x,#5
1249  01ef cd0000        	call	_IsActive
1251  01f2 4d            	tnz	a
1252  01f3 2715          	jreq	L136
1253                     ; 189 			bitLeido = 1;
1255                     ; 190 			temp |= bitLeido;
1257  01f5 7b03          	ld	a,(OFST+0,sp)
1258  01f7 aa01          	or	a,#1
1259  01f9 6b03          	ld	(OFST+0,sp),a
1261                     ; 191 			temp <<=  1;
1263  01fb 0803          	sll	(OFST+0,sp)
1266  01fd               L536:
1267                     ; 192 			while( IsActive( &sensor->pin ) )
1269  01fd 1e04          	ldw	x,(OFST+1,sp)
1270  01ff 1c0005        	addw	x,#5
1271  0202 cd0000        	call	_IsActive
1273  0205 4d            	tnz	a
1274  0206 26f5          	jrne	L536
1276  0208 2002          	jra	L146
1277  020a               L136:
1278                     ; 199 			temp <<= 1;
1280  020a 0803          	sll	(OFST+0,sp)
1282  020c               L146:
1283                     ; 178 	for( contador; contador < 8; contador++ )
1285  020c 0c02          	inc	(OFST-1,sp)
1287  020e               L716:
1290  020e 7b02          	ld	a,(OFST-1,sp)
1291  0210 a108          	cp	a,#8
1292  0212 25c3          	jrult	L526
1293                     ; 202 	sensor->Datos.UltimaLectura.CRC = temp;
1295  0214 7b03          	ld	a,(OFST+0,sp)
1296  0216 1e04          	ldw	x,(OFST+1,sp)
1297  0218 e708          	ld	(8,x),a
1298                     ; 204 	sensor->Datos.estado = dht11_CERRANDO_CONEXION;
1300  021a 1e04          	ldw	x,(OFST+1,sp)
1301  021c a605          	ld	a,#5
1302  021e e70d          	ld	(13,x),a
1303                     ; 205 }
1306  0220 5b05          	addw	sp,#5
1307  0222 81            	ret
1347                     ; 207 void dht11_CerrarConexion( DHT11_t* sensor )
1347                     ; 208 {
1348                     	switch	.text
1349  0223               _dht11_CerrarConexion:
1351  0223 89            	pushw	x
1352       00000000      OFST:	set	0
1355                     ; 209 	Output2mhz_Init( &sensor->pin );
1357  0224 1c0005        	addw	x,#5
1358  0227 cd0000        	call	_Output2mhz_Init
1360                     ; 210 	Output_1( &sensor->pin );
1362  022a 1e01          	ldw	x,(OFST+1,sp)
1363  022c 1c0005        	addw	x,#5
1364  022f cd0000        	call	_Output_1
1366                     ; 211 	sensor->Datos.estado = dht11_SLEEP;
1368  0232 1e01          	ldw	x,(OFST+1,sp)
1369  0234 a606          	ld	a,#6
1370  0236 e70d          	ld	(13,x),a
1371                     ; 212 }
1374  0238 85            	popw	x
1375  0239 81            	ret
1388                     	xdef	_dht11_CerrarConexion
1389                     	xdef	_dht11_LeerDatos
1390                     	xdef	_dht11_ComenzarTransmision
1391                     	xdef	_dht11_ModoCambiado
1392                     	xref	_IsActive
1393                     	xref	_Output_1
1394                     	xref	_Output_0
1395                     	xref	_Output2mhz_Init
1396                     	xref	_Input_Init
1415                     	end
