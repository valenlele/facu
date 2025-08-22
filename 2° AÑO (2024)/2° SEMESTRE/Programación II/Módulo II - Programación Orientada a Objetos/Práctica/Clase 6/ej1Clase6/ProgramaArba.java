import java.util.Scanner;
public class ProgramaArba {
  public static void main(String [] args) {
    Scanner in = new Scanner (System.in);
  
    Vehiculo [] vecVehiculos = new Vehiculo [2];
    int año,rey;
    double imp,impAd,eslora,peso,valor;
    String cit,nom,ap,vehiculo,pat,desc,nombre,tipo;
  
    for (int i=0; i<2; i++) {
      System.out.println("Se ingresa info de un vehiculo: ");
      System.out.println("Año de fabricacion: ");
      año = in.nextInt();
      System.out.println("Importe de gestion basico a pagar: ");
      imp = in.nextDouble();
      in.nextLine();
      System.out.println("CIT del propietario: ");
      cit = in.nextLine();
      System.out.println("Nombre del propietario: ");
      nom = in.nextLine();
      System.out.println("Apellido del propietario: ");
      ap = in.nextLine();
      Propietario p = new Propietario(cit,nom,ap);
      System.out.println("Tipo de vehiculo: ");
      vehiculo = in.nextLine();
    
      if (vehiculo.equals("automotor")) {
        System.out.println("Patente: ");
        pat = in.nextLine();
        System.out.println("Importe adicional: ");
        impAd = in.nextDouble();
        in.nextLine();
        System.out.println("Descripcion: ");
        desc = in.nextLine();
        Vehiculo aut = new Automotor(año,imp,p,pat,impAd,desc);
        vecVehiculos[i] = aut;
      }
    
      if (vehiculo.equals("embarcacion")) {
        System.out.println("Registro especial de yates: ");
        rey = in.nextInt();
        in.nextLine();
        System.out.println("Nombre: ");
        nombre = in.nextLine();
        System.out.println("Tipo de embarcacion: ");
        tipo = in.nextLine();
        System.out.println("Eslora: ");
        eslora = in.nextDouble();
        System.out.println("Tonelaje: ");
        peso = in.nextDouble();
        System.out.println("Valor declarado: ");
        valor = in.nextDouble();
        Vehiculo emb = new Embarcacion(año,imp,p,rey,nombre,tipo,eslora,peso,valor);
        vecVehiculos[i] = emb;
      }
    }
    
    for (int i=0;i<2;i++) {
      System.out.println("Importe total a pagar de vehiculo " + i + ": ");
      System.out.println(vecVehiculos[i].calcularCostosImpuestos());
    }
  
  }
}