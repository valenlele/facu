import java.util.Scanner;
public class Main {
  public static void main(String [] args) {
    Scanner in = new Scanner(System.in);

    ReservaGrupal rg5 = new ReservaGrupal(3234,"EZE","PAR","12/4/1234",4000);
    rg5.agregarPasajero(2234);
    rg5.agregarPasajero(1233);
    rg5.agregarPasajero(4332);
    rg5.agregarPasajero(2324);
    rg5.agregarPasajero(1112);
    
    ReservaGrupal rg10 = new ReservaGrupal(1123,"NOSE","AHI","45/12/3",1000);
    rg10.agregarPasajero(3232);
    rg10.agregarPasajero(123);
    rg10.agregarPasajero(213);
    rg10.agregarPasajero(2132);
    rg10.agregarPasajero(322);
    rg10.agregarPasajero(1223);
    rg10.agregarPasajero(3244);
    rg10.agregarPasajero(1234);
    rg10.agregarPasajero(1234);
    rg10.agregarPasajero(4444);
    
    ReservaClasica rc = new ReservaClasica(2212,"MAMA","IAME","4/2/1",12000,21212121,37);
    
    rg5.aplicarPromocion();
    rg10.aplicarPromocion();
    rc.aplicarPromocion();
    
    System.out.println(rg5.toString());
    System.out.println(rg10.toString());
    System.out.println(rc.toString());
    
    in.close();
  }
}