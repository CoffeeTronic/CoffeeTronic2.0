import 'dart:html';
import 'dart:core';
import 'dart:math';

void main() {
  querySelector("#btnCpu")
      ..onClick.listen(rellenarPResul);
}

void rellenarPResul(MouseEvent event) {
  Benchmark b = new Benchmark();
  b.Procesador();
   
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
   * @brief Función que hace las operaciones de enteros
   * @author Antonio Garrido Delgado
   */
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
    double resultado_int=0.0,resultado_float=0.0,contador=0.0;
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
      contador++;
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
      
      resultado_float=438389190000000.0/resultado_float;
      contador++;
    }
    
    
    
      resultado_int+=resultado_float;
      resultado_int=resultado_int/contador;
    querySelector("#pResul").text = (resultado_int).toString();
    
    return (resultado_int);
  }
  
  
}