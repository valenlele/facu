package tp3.ejercicio10;

import paqueteFuncionesArbolesGenerales.*;
import tp3.ejercicio1.GeneralTree;
import java.util.Scanner;

public class PruebaParcial {

  public static void main(String[] args) {
    FuncionesArbolesGenerales f = new FuncionesArbolesGenerales();
    Scanner in = new Scanner(System.in);	
    GeneralTree<Integer> ab = new GeneralTree<>(); 
    
    f.cargarArbolInteger(ab,in);
    
    System.out.println("Camino filtrado de valor maximo: " + Parcial.resolver(ab));
    
    in.close();
  }

}
