package tp3.ejercicio8;

import java.util.Scanner;
import paqueteFuncionesArbolesGenerales.*;
import tp3.ejercicio1.GeneralTree;

public class PruebaNavidad {

  public static void main(String[] args) {
    FuncionesArbolesGenerales f = new FuncionesArbolesGenerales();
	Scanner in = new Scanner(System.in);
	GeneralTree<Integer> ab = new GeneralTree<>(); 
	
	f.cargarArbolInteger(ab,in);
	
	Navidad n = new Navidad(ab);
	
	System.out.println(n.esAbetoNavidenio());
	
	in.close();
  }
	
}
