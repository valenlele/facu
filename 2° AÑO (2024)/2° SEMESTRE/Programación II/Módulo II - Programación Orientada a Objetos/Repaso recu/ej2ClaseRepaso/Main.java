import java.util.Scanner;
public class Main {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    
    Estacionamiento e = new Estacionamiento("juan autos","cochebamba al 37","4:14","22:01",3,3);
    
    Auto a1 = new Auto("pepe","AA2");
    e.registrarAuto(a1,2,3);
    Auto a2 = new Auto("pepe2","ffre");
    e.registrarAuto(a2,1,1);
    Auto a3 = new Auto("pepe3","dder");
    e.registrarAuto(a3,1,2);
    Auto a4 = new Auto("pepe4","ffgre");
    e.registrarAuto(a4,3,3);
    Auto a5 = new Auto("pepe5","gghy5");
    e.registrarAuto(a5,2,1);
    Auto a6 = new Auto("pepe6","rre4");
    e.registrarAuto(a6,2,2);
    
    System.out.println("Representacion estacionamineto: " + e.toString());
    
    System.out.println("Cantidad de autos ubicados en la plaza 1: " + e.obtenerAutosPorPlaza(1));

    System.out.println(e.estaEnEstacionamiento("AA2"));
  }
}