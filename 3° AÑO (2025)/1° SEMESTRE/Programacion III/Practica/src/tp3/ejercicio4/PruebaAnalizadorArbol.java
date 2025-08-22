package tp3.ejercicio4;

import java.util.Scanner;
import tp3.ejercicio1.*;
import java.util.List;
import java.util.LinkedList;

public class PruebaAnalizadorArbol {
  public static void main(String [] args) {
	Scanner in = new Scanner(System.in); 
	GeneralTree<AreaEmpresa> ag = new GeneralTree<>();
	AnalizadorArbol analizador = new AnalizadorArbol();
	
    System.out.println("Se crea un arbol general: ");
    
    List<GeneralTree<AreaEmpresa>> children1 = new LinkedList<>();
    AreaEmpresa nodo11 = new AreaEmpresa("A",4);
    children1.add(new GeneralTree<AreaEmpresa>(nodo11));
    AreaEmpresa nodo12 = new AreaEmpresa("B",7);
    children1.add(new GeneralTree<AreaEmpresa>(nodo12));
    AreaEmpresa nodo13 = new AreaEmpresa("C",5);
    children1.add(new GeneralTree<AreaEmpresa>(nodo13));
    AreaEmpresa infoA1 = new AreaEmpresa("J",13);
    GeneralTree<AreaEmpresa> a1 = new GeneralTree<>(infoA1,children1);
    
    List<GeneralTree<AreaEmpresa>> children2 = new LinkedList<>();
    AreaEmpresa nodo21 = new AreaEmpresa("D",6);
    children2.add(new GeneralTree<AreaEmpresa>(nodo21));
    AreaEmpresa nodo22 = new AreaEmpresa("E",10);
    children2.add(new GeneralTree<AreaEmpresa>(nodo22));
    AreaEmpresa nodo23 = new AreaEmpresa("F",18);
    children2.add(new GeneralTree<AreaEmpresa>(nodo23));
    AreaEmpresa infoA2 = new AreaEmpresa("K",25);
    GeneralTree<AreaEmpresa> a2 = new GeneralTree<>(infoA2,children2);
    
    List<GeneralTree<AreaEmpresa>> children3 = new LinkedList<>();
    AreaEmpresa nodo31 = new AreaEmpresa("G",9);
    children3.add(new GeneralTree<AreaEmpresa>(nodo31));
    AreaEmpresa nodo32 = new AreaEmpresa("H",12);
    children3.add(new GeneralTree<AreaEmpresa>(nodo32));
    AreaEmpresa nodo33 = new AreaEmpresa("I",19);
    children3.add(new GeneralTree<AreaEmpresa>(nodo33));   
    AreaEmpresa infoA3 = new AreaEmpresa("L",10);
    GeneralTree<AreaEmpresa> a3 = new GeneralTree<>(infoA3,children3);
    
    List<GeneralTree<AreaEmpresa>> childen = new LinkedList<>();
    childen.add(a1);
    childen.add(a2);
    childen.add(a3);
    AreaEmpresa infoA = new AreaEmpresa("M",14);
    ag = new GeneralTree<>(infoA, childen);
    
    System.out.println("El mayor promedio de delay de transmision de mensaje es: " + analizador.devolverMaximoPromedio(ag));
    
    in.close();
  }
}
