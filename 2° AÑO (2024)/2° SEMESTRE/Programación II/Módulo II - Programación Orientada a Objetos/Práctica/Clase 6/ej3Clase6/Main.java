import java.util.Scanner;
public class Main {
  public static void main(String [] args) {
    Scanner in = new Scanner (System.in);
    int nroSurtidor,dni,dimF;
    double impTot,cantLitros;
    String nombre,apellido,patente;
    String vecPatentes[] = new String [20];
    Surtidor vecSurtidores[] = new Surtidor[3];
    
    System.out.println("Se cargan dos surtidores de gasoil: ");
    
    for (int i=0;i<2;i++) {
      System.out.println("Numero de surtidor: ");
      nroSurtidor = in.nextInt();
      System.out.println("Importe total facturado en el dia: ");
      impTot = in.nextDouble();
      System.out.println("Dni del playero: ");
      dni = in.nextInt();
      in.nextLine();
      System.out.println("Nombre: ");
      nombre = in.nextLine();
      System.out.println("Apellido: ");
      apellido = in.nextLine();
      System.out.println("Ingrese la cantidad de vehiculos a cargar: ");
      dimF = in.nextInt();
      System.out.println("Ingrese la patente de los " + dimF + " vehiculos a cargar: ");
      for (int j=0;j<dimF;j++) {
        System.out.println("Patente ");
        in.nextLine();
        patente = in.nextLine();
        vecPatentes[j] = patente;
      }
      if (i==0) {
        Surtidor g1 = new Gasoil(nroSurtidor,impTot,dni,nombre,apellido,vecPatentes,dimF);
        vecSurtidores[i] = g1;
      }
      else if (i==1) {
        Surtidor g2 = new Gasoil(nroSurtidor,impTot,dni,nombre,apellido,vecPatentes,dimF);
        vecSurtidores[i] = g2;  
      }
     }
    
    System.out.println("Se carga un surtidor de nafta: ");
    
    System.out.println("Numero de surtidor: ");
    nroSurtidor = in.nextInt();
    System.out.println("Importe total facturado en el dia: ");
    impTot = in.nextDouble();
    System.out.println("Dni del playero: ");
    dni = in.nextInt();
    System.out.println("Nombre: ");
    nombre = in.nextLine();
    in.nextLine();
    System.out.println("Apellido: ");
    apellido = in.nextLine();
    System.out.println("Cantidad de litros para proveer durante el dia: ");
    cantLitros = in.nextDouble();
    
    Surtidor n = new Nafta(nroSurtidor,impTot,dni,nombre,apellido,cantLitros);
    vecSurtidores[2] = n;
    
    for (int i=0;i<3;i++) {
      vecSurtidores[i].calcularImpuestoAPagar();
      System.out.println(vecSurtidores[i].toString());
    }
    
  }
}