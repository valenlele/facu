public class Main {
  public static void main(String[] args) {    
    ProcesarPersonas procesar = new ProcesarPersonas();
      
    procesar.insertarPersonas();
    
    int contMayores65 = procesar.Mayores65();
    System.out.println("Cantidad de personas mayores de 65 años: " + contMayores65);
    
    Persona menorDNI = procesar.MenorDNI();
    System.out.println("Persona con menor DNI: " + menorDNI);
  }
}