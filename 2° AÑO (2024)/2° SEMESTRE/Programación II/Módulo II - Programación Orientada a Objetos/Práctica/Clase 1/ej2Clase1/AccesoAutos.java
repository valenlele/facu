import java.util.Scanner;
public class AccesoAutos {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    System.out.println("Ingrese el numero de una patente: ");
    int patente = in.nextInt();
    int cantAut = 0;
    int cantAutIn = 0;
    while (patente != 0) {
      cantAut++;
      if (patente % 2 == 0) {
        System.out.println("El auto tiene permitido el acceso");     
        cantAutIn++;
      }
      else
        System.out.println("El auto no tiene permitido el acceso");
      System.out.println("Ingrese el numero de una patente: ");
      patente = in.nextInt();
    }
    System.out.println("El porcentaje de autos que ingresaron fue " + ((cantAutIn*100)/cantAut));
  }
}