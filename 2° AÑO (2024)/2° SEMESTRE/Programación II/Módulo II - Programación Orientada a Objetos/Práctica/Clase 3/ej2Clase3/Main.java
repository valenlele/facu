import java.util.Scanner;
public class Main {
  public static void main(String args[]) {
    int pesoEnKg,precioPorKg;
    ProcesarBalanza procesar = new ProcesarBalanza();
  
    procesar.iniciarCompra();
  
    Scanner in = new Scanner(System.in);
    System.out.println("Ingrese el peso de un producto: ");
    pesoEnKg = in.nextInt();
    while (pesoEnKg != 0) {
      System.out.println("Ingrese el precio por kilo de un producto: ");
      precioPorKg = in.nextInt(); 
      procesar.registrarProducto(pesoEnKg,precioPorKg);
      System.out.println("Ingrese el peso de un producto: ");
      pesoEnKg = in.nextInt();
    }
    System.out.println(procesar.devolverResumenDeCompra());
  }
}