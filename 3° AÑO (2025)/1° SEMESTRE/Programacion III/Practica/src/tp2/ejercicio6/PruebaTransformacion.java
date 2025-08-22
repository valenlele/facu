package tp2.ejercicio6;

import java.util.Scanner;
import paqueteFuncionesArboles.*;

import tp2.ejercicio1.BinaryTree;

public class PruebaTransformacion {

	public static void main(String[] args) {
		FuncionesArboles f = new FuncionesArboles();		
	    Scanner in = new Scanner(System.in);  	  
	    
	    BinaryTree<Integer> ab = new BinaryTree<>();
	    
	    Transformacion t = new Transformacion();
		
	    f.cargarArbolInteger(ab, in);
        t.setArbol(ab);
        BinaryTree<Integer> abTransformado = t.suma();
	    System.out.println("Arbol transformado: ");
	    abTransformado.printLevelTraversal();
	    
	    in.close();
	  }	
	
}
