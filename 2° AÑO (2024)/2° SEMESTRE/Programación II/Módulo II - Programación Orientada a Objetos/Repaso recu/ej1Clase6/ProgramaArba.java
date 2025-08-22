import java.util.Scanner;
public class ProgramaArba {
  public static void main (String[] args) {
    Scanner in = new Scanner (System.in);
    int cantV = 2;
    Vehiculo [] vecVehiculos = new Vehiculo [cantV];
    int año,rey;
    double impBasico,impAd,eslora,ton,valor;
    String cit,nom,ap,patente,desc,nomEmb,tipoEmb,tipoV;
       
    for (int i=0; i<cantV ; i++) {
      System.out.println("Se ingresa info de un vehiculo: ");
      System.out.println("Año de fabricacion: ");
      año = in.nextInt();
      System.out.println("Importe basico a pagar: ");
      impBasico = in.nextDouble();
      in.nextLine();
      System.out.println("CIT del propietario: ");
      cit = in.nextLine();
      System.out.println("Nombre del propietario: ");
      nom = in.nextLine();
      System.out.println("Apellido del propietario: ");
      ap = in.nextLine();
      Propietario p = new Propietario (cit,nom,ap);
      System.out.println("Tipo de vehiculo: ");
      tipoV = in.nextLine();
      
      if (tipoV.equals("automotor")) {
        System.out.println("Patente: ");
        patente = in.nextLine();
        System.out.println("Importe adicional a pagar: ");
        impAd = in.nextDouble();
        in.nextLine();
        System.out.println("Descripcion: ");
        desc = in.nextLine();  
        Vehiculo aut = new Automotor(año,impBasico,p,patente,impAd,desc);
        vecVehiculos[i] = aut;
      }
      
      if (tipoV.equals("embarcacion")) {
        System.out.println("Registro Especial de Yates: ");
        rey = in.nextInt();
        in.nextLine();
        System.out.println("Nombre: ");
        nomEmb = in.nextLine();
        System.out.println("Tipo de embarcacion: ");
        tipoEmb = in.nextLine();
        System.out.println("Eslora: ");
        eslora = in.nextDouble();
        System.out.println("Tonelaje: ");
        ton = in.nextDouble();
        System.out.println("Valor declarado: ");
        valor = in.nextDouble();
        Vehiculo emb = new Embarcacion(año,impBasico,p,rey,nom,tipoEmb,eslora,ton,valor);
        vecVehiculos[i] = emb;
      }
    }
    
    for (int i=0 ; i<cantV ; i++) {
      System.out.println("Impuesto total a pagar por vehiculo " + i + ":");
      System.out.println(vecVehiculos[i].calcularTotImpuesto());
    }
  }
}