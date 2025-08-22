package tp3.ejercicio7;

import paqueteFuncionesArbolesGenerales.*;
import java.util.Scanner;
import tp3.ejercicio1.*;

public class PruebaCaminos {

  public static void main(String[] args) {
    FuncionesArbolesGenerales f = new FuncionesArbolesGenerales();
    Scanner in = new Scanner(System.in);
    GeneralTree<Integer> ab = new GeneralTree<>();
    
    f.cargarArbolInteger(ab,in);
    
    Caminos camino = new Caminos(ab);
    
    System.out.println("El camino desde la raiz a la hoja mas lejana es: " + camino.caminoAHojaMasLejana());
    
    in.close();
  }
	
}
