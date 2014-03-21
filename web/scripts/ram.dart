import 'dart:html';
import 'dart:core';
import 'dart:math';

void main() {
  querySelector("#btnRam")
    .onClick.listen(rellenarPResul);
}
/*
 * @brief Función que controla el resultado del benchmark
 * @author Antonio Manuel Jiménez Martínez
 */
void rellenarPResul(MouseEvent event) {
  Benchmark b = new Benchmark();
  CheckboxInputElement chkCrea=querySelector("#chkCrea");
  CheckboxInputElement chkIO =querySelector("#chkIO");
   if(chkCrea.checked && chkIO.checked){
     querySelector("#pResul").text = b.RamFull().toString();
  }
  else if(chkCrea.checked){
    querySelector("#pResul").text = b.RamCrea().toString();
  }
  else if(chkIO.checked){
    querySelector("#pResul").text = b.RamIO().toString();
  }
  
}


/*
 * Clase para el benchmark
 * @author Daniel Barbeitos Carrillo 
*/
class Benchmark{
  //Variables para controlar el tiempo antes y despues de las diferentes pruebas hardware del sistema.
  DateTime tAntes, tDespues;
  
  /*
   * @brief Función que calcula la hora actual
   * @author Daniel Barbeitos Carrillo
   * @return Retorna un DateTime con la hora actual cuando se ha creado el objeto
   */
  DateTime Time(){
    DateTime ahora = new DateTime.now();
    return ahora;
  }
  
  
  
  
  /*
   * @brief Función que calcula los dos tipos de test de ram
   * @author Antonio Manuel Jiménez Martínez
   */
  double RamFull(){
      DateTime tTotal;
      int result=0;
      int ejecuciones = 3000;
      Random r = new Random();
      print("haciendo prueba");
      //querySelector("#muestra_tiempo").text="calculando...";
      tAntes = Time();
      //creacion
      int size=10000;
      List<List> test = new List<List>(size);
      for (var i = 0; i < size; i++) {
        test[i] = new List(size);
      }
      
      for (var i = 0; i < size; i++) {
        for (var j = 0; j < size; j++) {
          test[i][j] = r.nextInt(12);
        }
      }
      
      tDespues = Time();
      
      
      tTotal = new DateTime(tDespues.millisecondsSinceEpoch - tAntes.millisecondsSinceEpoch);
      return (((863208831600000/tTotal.millisecondsSinceEpoch))/2.0).toDouble();
      //hay que cambiar a donde dirige la salida
    }
  
  /*
   * @brief comentar
   * @author Antonio Manuel Jiménez Martínez
   */
      double RamCrea(){
        DateTime tTotal;
        int ejecuciones = 3000;
        Random r = new Random();
        print("haciendo prueba");
        //querySelector("#muestra_tiempo").text="calculando...";
        tAntes = Time();
        //creacion
        int size=10000;
        List<List> test = new List<List>(size);
        for (var i = 0; i < size; i++) {
          test[i] = new List(size);
        }

        tDespues = Time();
        
        //tTotal = new DateTime((tAntes.year-tDespues.year), (tAntes.month-tDespues.month), (tAntes.day-tDespues.day), (tAntes.hour-tDespues.day), (tAntes.minute-tDespues.minute), (tAntes.second-tDespues.second), (tAntes.millisecond-tDespues.millisecond));
        //tTotal = new DateTime((tAntes.minute-tDespues.minute), (tAntes.second-tDespues.second), (tAntes.millisecond-tDespues.millisecond));
        tTotal = new DateTime(tDespues.millisecondsSinceEpoch - tAntes.millisecondsSinceEpoch);
        //querySelector("#pResul").text = ((67153273200000/tTotal.millisecondsSinceEpoch)).toString();
        return (67153273200000/tTotal.millisecondsSinceEpoch.toDouble());
        //hay que cambiar a donde dirige la salida
      }
      
      /*
       * @brief comentar
       * @author Antonio Manuel Jiménez Martínez
       */
      double RamIO(){
        DateTime tTotal;
        int ejecuciones = 3000;
        Random r = new Random();
        print("haciendo prueba");
        
        
        //creacion
        int size=10000;
        List<List> test = new List<List>(size);
        for (var i = 0; i < size; i++) {
          test[i] = new List(size);
        }
        
        tAntes = Time();
        for (var i = 0; i < size; i++) {
          for (var j = 0; j < size; j++) {
            test[i][j] = r.nextInt(12);
          }
        }
        
        tDespues = Time();
        
        
        tTotal = new DateTime(tDespues.millisecondsSinceEpoch - tAntes.millisecondsSinceEpoch);
        print(tTotal);
        print(tTotal.millisecondsSinceEpoch.toString());
        print(tTotal.second.toString());
        return ((750866108400000/tTotal.millisecondsSinceEpoch)).toDouble();
        //hay que cambiar a donde dirige la salida
      }     
}