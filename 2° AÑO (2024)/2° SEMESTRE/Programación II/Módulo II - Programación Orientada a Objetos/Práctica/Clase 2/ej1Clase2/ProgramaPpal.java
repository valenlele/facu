import java.util.Scanner;
public class ProgramaPpal {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    System.out.println("Ingrese la edad: ");
    int edad = in.nextInt();
    System.out.println("Ingrese el DNI: ");
    int DNI = in.nextInt();
    System.out.println("Ingrese el nombre: ");
    String nombre = in.next();
    //Persona p = new Persona(nombre,DNI,edad);
    Persona p = new Persona();
    p.setDNI(DNI);
    p.setNombre(nombre);
    p.setEdad(edad);
    System.out.println(p.toString());
    in.close();
  }
}