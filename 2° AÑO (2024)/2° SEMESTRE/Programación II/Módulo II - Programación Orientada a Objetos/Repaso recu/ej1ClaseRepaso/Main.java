import java.util.Scanner;
public class Main {
  public static void main (String[] args) {
    Scanner in = new Scanner (System.in);
    
    Proyecto p = new Proyecto("proy1",1233,"pepe");
    
    Investigador inv1 = new Investigador("manolo",2,"lala");
    p.agregarInvestigador(inv1);
    Investigador inv2 = new Investigador("manola",1,"lele");
    p.agregarInvestigador(inv2); 
    Investigador inv3 = new Investigador("pepo",3,"lolo");
    p.agregarInvestigador(inv3); 
        
    Subsidio sub1 = new Subsidio(2000,"jeje");
    Subsidio sub2 = new Subsidio(1000,"jeje");
    inv1.agregarSubsidio(sub1);
    inv1.agregarSubsidio(sub2);
    Subsidio sub3 = new Subsidio(2000,"jeje");
    Subsidio sub4 = new Subsidio(1000,"jeje");
    inv2.agregarSubsidio(sub3);
    inv2.agregarSubsidio(sub4);
    Subsidio sub5 = new Subsidio(2000,"jeje");
    Subsidio sub6 = new Subsidio(1000,"jeje");
    inv3.agregarSubsidio(sub5); 
    inv3.agregarSubsidio(sub6);
      
    p.otorgarTodos("manolo");
    
    System.out.println(p.toString());
  }    
}