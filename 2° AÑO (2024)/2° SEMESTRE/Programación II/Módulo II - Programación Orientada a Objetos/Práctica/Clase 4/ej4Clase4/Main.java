import java.util.Scanner;
public class Main {
  public static void main(String [] args) {
    Scanner in = new Scanner(System.in);
    Flota f = new Flota();  
    String patente,dest,horaS;
    int cantMicros=0;
    
    System.out.println("Se lee informacion de micros: ");
    System.out.println("Patente: ");
    patente = in.nextLine();
    while (!patente.equals("ZZZ000") && cantMicros <= 15) {
      System.out.println("Destino: ");
      dest = in.nextLine();
      System.out.println("Hora de salida: ");
      horaS = in.nextLine();
      Micro m = new Micro(patente,dest,horaS);
      f.agregarMicro(m);
      cantMicros++;
      
      System.out.println("Patente: ");
      patente = in.nextLine();
    }
    System.out.println("Ingrese una patente para ver si existe un micro con dicha patente y luego eliminarlo: ");
    patente = in.nextLine();
    if (f.buscarMicroPorPatente(patente)!=null) {
      f.eliminarMicro(patente);
      System.out.println("Micro eliminado");
    } 
    else System.out.println("Micro no encntrado");
    
    System.out.println("Ingrese un destino: ");
    dest = in.nextLine();
    Micro encontrado = f.buscarMicroPorDestino(dest);
    if (encontrado != null) {
      System.out.println("Patente: " + encontrado.getPatente());  
      System.out.println("Horario de salida: " + encontrado.getHoraS());  
    }
    else System.out.println("Micro no encntrado");
  }
}