import java.util.Scanner;
public class Main {
  public static void main(String[] args) {
    Scanner in = new Scanner (System.in);
    
    System.out.println("Se lee info de un jugador: ");
    System.out.println("Nombre: ");
    String nombre = in.nextLine();
    System.out.println("DNI: ");
    int dni = in.nextInt();
    System.out.println("Sueldo basico: ");
    double sueldoB = in.nextDouble();
    System.out.println("Cantidad de goles: ");
    int goles = in.nextInt();
    System.out.println("Cantidad de partidos: ");
    int part = in.nextInt();
    in.nextLine();
    
    Empleado j = new Jugador(nombre,dni,sueldoB,part,goles);
    System.out.println(j.toString());
    
    System.out.println("Se lee info de un entrenador: ");
    System.out.println("Nombre: ");
    nombre = in.nextLine();
    System.out.println("DNI: ");
    dni = in.nextInt();
    System.out.println("Sueldo basico: ");
    sueldoB = in.nextDouble();
    System.out.println("Cantidad de campeonatos ganados: ");
    int camp = in.nextInt();
    
    Empleado e = new Entrenador(nombre,dni,sueldoB,camp);
    System.out.println(e.toString());
    
    System.out.println("Sueldo total a cobrar por jugador: " + j.calcularSueldoACobrar());
    System.out.println("Sueldo total a cobrar por entrenador: " + e.calcularSueldoACobrar());
  }
}