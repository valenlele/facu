import java.util.Scanner;
public class Main {
  public static void main(String [] args) {
    Scanner in = new Scanner(System.in);
    PasoFronterizo pf = new PasoFronterizo(); //se instancia paso fronterizo
    
    Personal vp1 = new Personal(4,13,1,2017,false,false); //se instancia visita personal
    Grupal vg1 = new Grupal(89,21,6,2019,true,"uruguay","dni",304); //se instancia visita grupal
    
    pf.agregarVisita(vp1);
    pf.agregarVisita(vg1); //se agregan ambas visitas al paso
    
    vg1.agregarEdad(34);
    vg1.agregarEdad(38);
    vg1.agregarEdad(3);
    vg1.agregarEdad(5);
    vg1.agregarEdad(2); //se agregan edades a la visita grupal
    
    System.out.println("Informacion pasaje fronterizo: " + pf.toString()); //impresion de datos
    
    System.out.println("Porcentaje de visitas con costo superior a 20000 pesos: " + pf.porc20000());  
    
    in.close();
  }
}