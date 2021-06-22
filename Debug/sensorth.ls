   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 777                     ; 9 void SensorTH_Init( SensorTH_t* sensor, GestorModo_t* modo )
 777                     ; 10 {
 779                     	switch	.text
 780  0000               _SensorTH_Init:
 782  0000 89            	pushw	x
 783  0001 89            	pushw	x
 784       00000002      OFST:	set	2
 787                     ; 11 	aux_InicializacionModoSensores(&sensor->Sistema, &dht11_ModoCambiado, 0, modo);
 790  0002 1c000d        	addw	x,#13
 791  0005 1f01          	ldw	(OFST-1,sp),x
 793                     ; 5 	sensor->Init = iSd_Init;
 795  0007 1e01          	ldw	x,(OFST-1,sp)
 796  0009 90ae0000      	ldw	y,#_iSd_Init
 797  000d ef03          	ldw	(3,x),y
 798                     ; 6 	sensor->Init(sensor, modoCambiado, id, modo);
 800  000f 1e07          	ldw	x,(OFST+5,sp)
 801  0011 89            	pushw	x
 802  0012 4b00          	push	#0
 803  0014 ae0000        	ldw	x,#_dht11_ModoCambiado
 804  0017 89            	pushw	x
 805  0018 1e06          	ldw	x,(OFST+4,sp)
 806  001a 1606          	ldw	y,(OFST+4,sp)
 807  001c 90ee03        	ldw	y,(3,y)
 808  001f 90fd          	call	(y)
 810  0021 5b05          	addw	sp,#5
 811                     ; 12 	sensor->Sensor.Lectura = &dht11_Lectura;
 813  0023 1e03          	ldw	x,(OFST+1,sp)
 814  0025 90ae0000      	ldw	y,#_dht11_Lectura
 815  0029 ef09          	ldw	(9,x),y
 816                     ; 13 	sensor->cmdLeer.Exec = &SensorTH_Medicion;
 818  002b 1e03          	ldw	x,(OFST+1,sp)
 819  002d 90ae0036      	ldw	y,#_SensorTH_Medicion
 820  0031 ef0b          	ldw	(11,x),y
 821                     ; 14 }
 824  0033 5b04          	addw	sp,#4
 825  0035 81            	ret
 881                     ; 16 void SensorTH_Medicion( ISensorGeneral_t* sensor )
 881                     ; 17 {
 882                     	switch	.text
 883  0036               _SensorTH_Medicion:
 885  0036 89            	pushw	x
 886       00000000      OFST:	set	0
 889                     ; 18 	sensor->SensorTH->Sensor.Lectura(&sensor->SensorTH->Sensor);
 891  0037 fe            	ldw	x,(x)
 892  0038 1601          	ldw	y,(OFST+1,sp)
 893  003a 90fe          	ldw	y,(y)
 894  003c 90ee09        	ldw	y,(9,y)
 895  003f 90fd          	call	(y)
 897                     ; 19 }
 900  0041 85            	popw	x
 901  0042 81            	ret
 924                     ; 21 void SensorTH_Calibrar( void )
 924                     ; 22 {
 925                     	switch	.text
 926  0043               _SensorTH_Calibrar:
 930                     ; 24 }
 933  0043 81            	ret
 946                     	xdef	_SensorTH_Calibrar
 947                     	xdef	_SensorTH_Medicion
 948                     	xdef	_SensorTH_Init
 949                     	xref	_iSd_Init
 950                     	xref	_dht11_Lectura
 951                     	xref	_dht11_ModoCambiado
 970                     	end
