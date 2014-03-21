/*
 * Clases y funciones para el benchmark
 * @author Daniel Barbeitos Carrillo 
*/

import 'dart:core';
import 'dart:math';

class Benchmark{
  //Variables para controlar el tiempo antes y despues de las diferentes pruebas hardware del sistema.
  DateTime tAntes, tDespues;
  
  /*
   * @brief Función que calcula la hora actual
   * @return Retorna un DateTime con la hora actual cuando se ha creado el objeto
   */
  DateTime Time(){
    DateTime ahora = new DateTime.now();
    return ahora;
  }
  
  /*
   * @brief Función que hace las operaciones de enteros
   */
  void operaciones(int ejecuciones)
  {
    int num=4179869184;
    
    for(int i=0; i <ejecuciones; i++)
      
      num *=2;
      num -=num;
      
    
  }
  
  
  /*
   * @brief Función que hará el benchmark al procesador
   */
  void Procesador(){
    DateTime tTotal;
    int ejecuciones = 3000;
    Random r = new Random();
    print("haciendo prueba");
    //querySelector("#muestra_tiempo").text="calculando...";
    tAntes = Time();
    
    //Esta parte no sabia bien que poner
    for(int i=0; i<ejecuciones; i++)
    {
          operaciones(ejecuciones);
    }
    
    tDespues = Time();
    
    //tTotal = new DateTime((tAntes.year-tDespues.year), (tAntes.month-tDespues.month), (tAntes.day-tDespues.day), (tAntes.hour-tDespues.day), (tAntes.minute-tDespues.minute), (tAntes.second-tDespues.second), (tAntes.millisecond-tDespues.millisecond));
    //tTotal = new DateTime((tAntes.minute-tDespues.minute), (tAntes.second-tDespues.second), (tAntes.millisecond-tDespues.millisecond));
    tTotal = new DateTime(tDespues.millisecondsSinceEpoch - tAntes.millisecondsSinceEpoch);
    print(tTotal);
    print(tTotal.millisecondsSinceEpoch.toString());
    print(tTotal.second.toString());
    //hay que cambiar a donde dirige la salida
  }
  
  
}
