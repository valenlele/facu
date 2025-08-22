import java.util.Scanner;
public class Main {
  public static void main(String[] args) {
    String nombre;
    int sueldoB,cantCamp;
    Entrenador e = new Entrenador();
    ProcesarSueldo procesar = new ProcesarSueldo();
    Scanner in = new Scanner(System.in);
    System.out.println("Se ingresan datos de un entrenador: ");
    System.out.println("Nombre: ");
    nombre = in.nextLine();
    System.out.println("Sueldo basico: ");
    sueldoB = in.nextInt();
    System.out.println("Cantidad de campeonatos ganados: ");
    cantCamp = in.nextInt();
    in.close();
    e.setNombre(nombre);
    e.setSueldoB(sueldoB);
    e.setCantCamp(cantCamp);
    System.out.println("El sueldo a cobrar por el entrenador es: " + procesar.calcularSueldoACobrar(sueldoB,cantCamp));
  }
}