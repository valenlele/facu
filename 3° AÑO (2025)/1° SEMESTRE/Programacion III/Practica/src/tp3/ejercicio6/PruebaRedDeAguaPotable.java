package tp3.ejercicio6;

import paqueteFuncionesArbolesGenerales.*;
import java.util.Scanner;
import tp3.ejercicio1.*;

public class PruebaRedDeAguaPotable {
	
  public static void main(String[] args) {
	FuncionesArbolesGenerales f = new FuncionesArbolesGenerales();
	Scanner in = new Scanner(System.in);
    GeneralTree<String> ag = new GeneralTree<>();
    
    System.out.println("Se genera un arbol: ");
    
    f.cargarArbolString(ag, in);
    
    RedDeAguaPotable red = new RedDeAguaPotable(ag);
    
    System.out.println("Ingrese los litros que recibe el canio maestro: ");
    double lts = in.nextDouble();
    
    System.out.println("El minimo caudal que recibe una casa es: " + red.minimoCaudal(lts));
    
    in.close();
  }
  
}

