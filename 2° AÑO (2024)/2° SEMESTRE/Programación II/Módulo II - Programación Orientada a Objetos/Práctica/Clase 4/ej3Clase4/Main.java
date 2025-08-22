import java.util.Scanner;
public class Main {
  public static void main(String [] args) {
    Scanner in = new Scanner(System.in);
    Micro m = new Micro("ABC123","Mar del Plata","5:00 am");
    int asiento;
    System.out.println("Se leen numeros de asiento correspondientes a pedidos de personas: ");
    System.out.println("Asiento: ");
    asiento = in.nextInt();
    while (asiento != -1) {
      m.validarAsiento(asiento); 
      if (m.estaOcupado(asiento)==false) {
        m.ocuparAsiento(asiento); 
        System.out.println("La operacion se realizo con exito");
      }
      else {
        System.out.println("El asiento pedido esta ocupado. El primer numero de asiento libre es: " + m.primerAsientoLibre());
      }
      System.out.println("Asiento: ");
      asiento = in.nextInt();  
    }
    System.out.println("La cantidad de asientos ocupados es: " + m.cantAsientosOcup());
  }
}