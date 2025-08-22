package tp2.ejercicio4;

import java.util.*;
import tp2.ejercicio1.*;
import paqueteFuncionesArboles.*;

public class RedBinariaLlena {

  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    FuncionesArboles f = new FuncionesArboles();
	
    BinaryTree<Integer> ab = new BinaryTree<>();
    
    System.out.println("Se ingresa el retardo de envio de la raiz del arbol: ");
    
	f.cargarArbolInteger(ab, in);  
	
	System.out.println("El mayor retardo posible en el arbol es: " + retardoEnvio(ab));	
	
	in.close();	  
  }
  
  public static int retardoEnvio(BinaryTree<Integer> ab) {
    if ((ab!=null) && (!ab.isEmpty())) {
    
      int izq = retardoEnvio(ab.getLeftChild());
      
      int der = retardoEnvio(ab.getRightChild());
      
      return (izq>der ? (ab.getData())+izq : (ab.getData()+der));
    	
    }
    return 0; //cuando llego a una hoja
  }
	
}
