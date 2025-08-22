package tp3.ejercicio9;

import java.util.Scanner;
import paqueteFuncionesArbolesGenerales.*;
import tp3.ejercicio1.GeneralTree;

public class PruebaParcial {

  public static void main(String[] args) {
    FuncionesArbolesGenerales f = new FuncionesArbolesGenerales();
	Scanner in = new Scanner(System.in);
	GeneralTree<Integer> ab = new GeneralTree<>();  
	
	f.cargarArbolInteger(ab,in);
	
	System.out.println(Parcial.esDeSeleccion(ab));
	
	in.close();
  }
	
}
