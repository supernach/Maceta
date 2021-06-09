# ControlClima
 Proyecto para crear un control de clima en cultivos con maceta


La idea es que cada maceta sea un nodo que contenga una celula de carga para controlar el peso de la maceta
y asi saber cuando es mas optimo regar, a su vez un control de temperatura y humedad. Cada nodo(maceta) se comunicara
por RS485 a una central.
Esta central(probablemente un esp32) tendra una pantalla tactil TFT. Desde ella realizara configuraciones, puestas a punto de cada nodo etc..

Esta desarrollado sobre un stm8s103.

Libreria GestorModo
---------------------

Con ella gestionamos el modo en que se encuentre el sensor ya que es definido desde la central.
Con modo me refiero al modo de funcionamiento, es decir, si se esta calibrando, si esta entregando medicion etc..

*Actualmente trabajando en ella, ya es funcional.


Main
-------------

Configuramos el reloj del micro

Agrega sensores a modo de prueba.

Borra sensor a modo de prueba
