import java.util.Scanner;
public class Ej05Jugadores {
  public static void main(String[] args) {
    double [] alturas = new double[15];
    int i,masProm = 0;
    double altura,prom;
    double altTot = 0;                              
    Scanner in = new Scanner(System.in);           
    for (i=0;i<15;i++) {
      System.out.println("Ingrese la altura de un jugador: ");
      altura = in.nextDouble();
      alturas[i]=altura;
      altTot = altTot + altura;
    } 
    in.close();
    prom = altTot/15.0;
    System.out.println("La altura promedio de los jugadores es: " + prom);
    for (i=0;i<15;i++) {
      if (alturas[i]>prom) masProm++;  
    }
    System.out.println("La cantidad de jugadores que son mas altos que el promedio es: " + masProm);
  }
}
