package tp2.ejercicio7;

import paqueteFuncionesArboles.*;
import java.util.Scanner;
import tp2.ejercicio1.*;

public class Main {

  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);  	  
	FuncionesArboles f = new FuncionesArboles();
	
	BinaryTree<Integer> ab = new BinaryTree<Integer>();
	
	ParcialArboles p = new ParcialArboles(ab);
	
	f.cargarArbolInteger(ab, in);
	p.setAb(ab);
	System.out.println("Arbol generado: ");
	ab.printLevelTraversal();
	
	System.out.println(p.isLeftTree(7));
	
	in.close();
	  
  }
	
}
