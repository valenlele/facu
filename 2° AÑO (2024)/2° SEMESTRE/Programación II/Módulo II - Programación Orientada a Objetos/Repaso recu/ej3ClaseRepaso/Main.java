import java.util.Scanner;
public class Main {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    EventoOcasional event = new EventoOcasional("los marruecos",2,"show de tv","gerardo inc","13/1/1234");
    event.agregarTema("frulafruli");
    event.agregarTema("fralifrufi");
    
    Gira gira = new Gira("las powerpoint",3,"gira terrible",2);
    gira.agregarTema("el flan");
    gira.agregarTema("si");
    gira.agregarTema("lalala");
    Fecha fecha1 = new Fecha("bernal","2/3/4431");
    Fecha fecha2 = new Fecha("nueva pompeya","1/1/43");
    gira.agregarFecha(fecha1);
    gira.agregarFecha(fecha2);
    
    System.out.println("Costo evento ocasional: " + event.calcularCosto());
    System.out.println("Costo gira: " + gira.calcularCosto());
    
    System.out.println(event.actuar());
    System.out.println(gira.actuar());
    System.out.println(gira.actuar());
    
    in.close();
  }
}