import java.util.Scanner;
public class Main {
  public static void main(String[] args) {
    String nombre;
    int DNI,edad,part,goles,cantJ = 2;
    ProcesarPart procesar = new ProcesarPart();
    Scanner in = new Scanner(System.in);
    Jugador [] jugadores = new Jugador[cantJ];
    
    System.out.println("Se ingresan datos de un jugador: ");
    for (int i=0;i<cantJ;i++) {
      Jugador j = new Jugador();
      System.out.println("Nombre: ");
      nombre = in.nextLine();
      System.out.println("DNI: ");
      DNI = in.nextInt();
      System.out.println("Edad: ");
      edad = in.nextInt();
      System.out.println("Cantidad de partidos jugados: ");
      part = in.nextInt();
      System.out.println("Cantidad de goles anotados: ");
      goles = in.nextInt();
      in.nextLine();
      
      j.setNombre(nombre);
      j.setDNI(DNI);
      j.setEdad(edad);  
      j.setPart(part); 
      j.setGoles(goles); 
      jugadores[i] = j;
    }
    in.close();
    
    System.out.println("La cantidad de jugadores con mas de 100 partidos jugados es: " + procesar.mas100part(jugadores,cantJ));
  }
}