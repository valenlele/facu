public class Ej03QueImprimeB {
  public static void main(String[] args) {
    Persona p1;
    Persona p2;
    p1 = new Persona();
    p1.setNombre("Pablo Sotile");
    p1.setDNI(11200413);
    p1.setEdad(40);
    p2 = new Persona();
    p2.setNombre("Julio Toledo");
    p2.setDNI(22433516);
    p2.setEdad(51);
    p1 = p2;
    p1.setEdad( p1.getEdad() + 1 );
    System.out.println(p2.toString());
    System.out.println(p1.toString());
    System.out.println( (p1 == p2) );
  } 
}