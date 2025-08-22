package tp3.ejercicio1;

import java.util.Scanner;
import paqueteFuncionesArbolesGenerales.*;

public class PruebaGeneralTree {
  public static void main(String [] args) {
	Scanner in = new Scanner(System.in);
    FuncionesArbolesGenerales f = new FuncionesArbolesGenerales();
    GeneralTree<Integer> ag = new GeneralTree<>();
    Integer num;
  
    System.out.println("Se crea un arbol general: ");
    f.cargarArbolInteger(ag,in);
    
    System.out.println("Altura del arbol: " + ag.altura());
    
    System.out.println("Ingrese un numero para saber en que nivel del arbol se encuentra: ");
    num = in.nextInt();
    System.out.println("Nivel en el que se encuentra nodo " + num + ": " + ag.nivel(num));
    
    System.out.println("Ancho del arbol: " + ag.ancho());
    
    System.out.println("Ingrese dos nodos: ");
    int n = in.nextInt();
    int m = in.nextInt();
    
    System.out.println("Existe un camino desde " + n + " a " + m + ": " + ag.esAncestro(n,m));
  }
}
