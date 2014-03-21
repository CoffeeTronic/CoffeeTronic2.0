import 'dart:html';
import 'dart:core';
import 'dart:math';

void main() {
  querySelector("#btnPers")
    ..onClick.listen(rellenarPResul);
}
/*
 * @brief Función que controla el resultado del benchmark
 * @author Antonio Manuel Jiménez Martínez
 */
void rellenarPResul(MouseEvent event) {
    Benchmark b = new Benchmark();
    CheckboxInputElement chkCrea=querySelector("#chkCrea");
    CheckboxInputElement chkIO =querySelector("#chkIO");
    CheckboxInputElement checkInt=querySelector("#chkEnt");
    CheckboxInputElement checkFloat=querySelector("#chkFloat");
    bool entero=(checkInt.checked),flotante=checkFloat.checked;
    double resultado=0.0,contador=0.0;
    
     if(chkCrea.checked && chkIO.checked){
       contador+=2;
      resultado+=b.RamFull();
    }
    else if(chkCrea.checked){
      contador++;
      resultado+=b.RamCrea();
    }
    else if(chkIO.checked){
      contador++;
      resultado+=b.RamIO();
    }
   resultado+=b.Procesador();
   
   if(entero)
     contador++;
   
   if(flotante)
     contador++;
   
   resultado=resultado/contador;
   
   querySelector("#pResul").text =resultado.toString();
}


/*
 * Clase para el benchmark
 * @author Daniel Barbeitos Carrillo 
*/
class Benchmark{
  //Variables para controlar el tiempo antes y despues de las diferentes pruebas hardware del sistema.
  DateTime tAntes, tDespues;
  CheckboxInputElement checkInt=querySelector("#chkEnt");
    CheckboxInputElement checkFloat=querySelector("#chkFloat");
  
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
      return ((863208831600000/tTotal.millisecondsSinceEpoch)).toDouble();
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
      
      void operaciones_int(int ejecuciones)
        {
          int num=4179869184;
          
          for(int i=0; i <ejecuciones; i++)
          
            num *=2;
            num -=num;
          
        }
        /*
         * @brief Función que hace las operaciones de flotantes
         * @author Antonio Garrido Delgado
         */
        void operaciones_float(int ejecuciones)
        {
          double num=4179869184.9184;
          
          for(int i=0; i <ejecuciones; i++)
          {
            num *=800000.0;
            for(int j=0; j < ejecuciones/10; j++)
            {
              num +=num/2.0;
              
            }
            num -=num;
          }
          
        }
        
        
        /*
         * @brief Función que hará el benchmark al procesador
         * @author Daniel Barbeitos Carrillo, Antonio Garrido Delgado
         */
        double Procesador()
        {
          DateTime tTotal;
          int ejecuciones = 3000;
          double resultado_int=0.0,resultado_float=0.0;
          bool entero=(checkInt.checked),flotante=checkFloat.checked;
          Random r = new Random();
        
          
          if(entero)
          {
            print("entero");
            tAntes = Time();
            
            for(int i=0; i<ejecuciones; i++)
            {
                  
                  operaciones_int(ejecuciones);
            }
            
            tDespues = Time();
            tTotal = new DateTime(tDespues.millisecondsSinceEpoch - tAntes.millisecondsSinceEpoch);
            resultado_int += tTotal.millisecondsSinceEpoch.toDouble();
            resultado_int=412228479600000/resultado_int;
          }
          
          
          
          
          if (flotante)
          {
            print("flotante");
            tAntes = Time();
            
            for(int i=0; i<ejecuciones; i++)
            {
                  
                  operaciones_float(ejecuciones);
            }
            
            tDespues = Time();
            tTotal = new DateTime(tDespues.millisecondsSinceEpoch - tAntes.millisecondsSinceEpoch);
            resultado_float += tTotal.millisecondsSinceEpoch.toDouble();
            resultado_float=resultado_float=438389190000000.0/resultado_float;
          }
          
          
          
            resultado_int+=resultado_float;
          //querySelector("#pResul").text = (resultado_int).toString();
          
          return (resultado_int);
        }
}