   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 775                     ; 9 void SensorTH_Init( SensorTH_t* sensor, GestorModo_t* modo )
 775                     ; 10 {
 777                     	switch	.text
 778  0000               _SensorTH_Init:
 780  0000 89            	pushw	x
 781  0001 89            	pushw	x
 782       00000002      OFST:	set	2
 785                     ; 11 	aux_InicializacionModoSensores(&sensor->Sistema, &dht11_ModoCambiado, 0, modo);
 788  0002 1c000d        	addw	x,#13
 789  0005 1f01          	ldw	(OFST-1,sp),x
 791                     ; 5 	sensor->Init = iSd_Init;
 793  0007 1e01          	ldw	x,(OFST-1,sp)
 794  0009 90ae0000      	ldw	y,#_iSd_Init
 795  000d ef03          	ldw	(3,x),y
 796                     ; 6 	sensor->Init(sensor, modoCambiado, id, modo);
 798  000f 1e07          	ldw	x,(OFST+5,sp)
 799  0011 89            	pushw	x
 800  0012 4b00          	push	#0
 801  0014 ae0000        	ldw	x,#_dht11_ModoCambiado
 802  0017 89            	pushw	x
 803  0018 1e06          	ldw	x,(OFST+4,sp)
 804  001a 1606          	ldw	y,(OFST+4,sp)
 805  001c 90ee03        	ldw	y,(3,y)
 806  001f 90fd          	call	(y)
 808  0021 5b05          	addw	sp,#5
 809                     ; 12 	sensor->Sensor.Lectura = &dht11_Lectura;
 811  0023 1e03          	ldw	x,(OFST+1,sp)
 812  0025 90ae0000      	ldw	y,#_dht11_Lectura
 813  0029 ef09          	ldw	(9,x),y
 814                     ; 13 }
 817  002b 5b04          	addw	sp,#4
 818  002d 81            	ret
 874                     ; 15 void SensorTH_Medicion( ISensorGeneral_t* sensor )
 874                     ; 16 {
 875                     	switch	.text
 876  002e               _SensorTH_Medicion:
 878  002e 89            	pushw	x
 879       00000000      OFST:	set	0
 882                     ; 17 	sensor->SensorTH->Lectura(sensor->SensorTH);
 884  002f fe            	ldw	x,(x)
 885  0030 1601          	ldw	y,(OFST+1,sp)
 886  0032 90fe          	ldw	y,(y)
 887  0034 90ee09        	ldw	y,(9,y)
 888  0037 90fd          	call	(y)
 890                     ; 18 }
 893  0039 85            	popw	x
 894  003a 81            	ret
 917                     ; 20 void SensorTH_Calibrar( void )
 917                     ; 21 {
 918                     	switch	.text
 919  003b               _SensorTH_Calibrar:
 923                     ; 23 }
 926  003b 81            	ret
 939                     	xdef	_SensorTH_Calibrar
 940                     	xdef	_SensorTH_Medicion
 941                     	xdef	_SensorTH_Init
 942                     	xref	_iSd_Init
 943                     	xref	_dht11_Lectura
 944                     	xref	_dht11_ModoCambiado
 963                     	end
