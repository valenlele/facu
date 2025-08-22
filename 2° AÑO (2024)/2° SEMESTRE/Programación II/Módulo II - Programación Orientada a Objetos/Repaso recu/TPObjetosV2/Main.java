import java.util.Scanner;
public class Main {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);  
      
    Centro centro = new Centro(); //se instancia centro de estadisticas
    
    Carrera c1 = new Carrera("japon");  //se instancia carrera 1
    
    centro.agregarCarrera(c1); //se agrega carrera al centro
    
    Clasificado clas1 = new Clasificado("fr","co",67,1,3);
    Clasificado clas2 = new Clasificado("da","si",89,1,2);
    Clasificado clas3 = new Clasificado("dd","ff",23,1,0);
    Clasificado clas4 = new Clasificado("ss","aa",22,1,1);
    Clasificado clas5 = new Clasificado("cc","aa",45,1,5);
    NoClasificado noClas1 = new NoClasificado("gg","hh",56,2);
    NoClasificado noClas2 = new NoClasificado("jj","uu",109,3);
    NoClasificado noClas3 = new NoClasificado("qq","ww",65,6);
    NoClasificado noClas4 = new NoClasificado("jj","kk",44,7);
    NoClasificado noClas5 = new NoClasificado("bb","nn",43,8); //se instancian 10 pilotos (5 clasificados y 5 no clasificados)
    
    c1.agregarPiloto(clas1);
    c1.agregarPiloto(clas2);
    c1.agregarPiloto(clas3);
    c1.agregarPiloto(clas4);
    c1.agregarPiloto(clas5);
    c1.agregarPiloto(noClas1);
    c1.agregarPiloto(noClas2);
    c1.agregarPiloto(noClas3);
    c1.agregarPiloto(noClas4);
    c1.agregarPiloto(noClas5);  //se agregan los 10 pilotos a la carrera 1
    
    System.out.println("Informacion carrera y pilotos: " + c1.toString());  //impresion de datos
    
    System.out.println(centro.toString()); //se informa puntaje total obtenido entre todas las carreras
    
    in.close();
  }
}