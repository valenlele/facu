import java.util.Scanner;
public class ProcesarPersonas {
  private Persona [] vecPersonas = new Persona[3];
    
  public void insertarPersonas() {
    Scanner in = new Scanner(System.in);
    int i,edad,DNI;
    String nombre;
    System.out.println("Se ingresan datos de 15 personas: ");
    for (i=0;i<3;i++) {
      System.out.println("Ingrese el nombre: ");
      nombre = in.next();
      System.out.println("Ingrese el DNI: ");
      DNI = in.nextInt();
      System.out.println("Ingrese la edad: ");
      edad = in.nextInt();
      vecPersonas[i] = new Persona(nombre,DNI,edad);
    }
    in.close();
  }
  
  public int Mayores65() {
    int j,contador=0;
    for (j=0;j<3;j++) {
      if (vecPersonas[j].getEdad()>65) contador++;
    }
    return contador;
  }
  
  public Persona MenorDNI() {
    int k,minDNI=9999;
    Persona minPersona = vecPersonas[0];;
    for (k=0;k<3;k++) {
      if (vecPersonas[k].getDNI()<minDNI) {
        minDNI = vecPersonas[k].getDNI();
        minPersona = vecPersonas[k];
      }
    }
    return minPersona;
  }
  
}