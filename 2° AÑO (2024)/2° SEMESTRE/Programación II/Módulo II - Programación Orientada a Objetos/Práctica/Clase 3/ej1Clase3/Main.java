public class Main {
  public static void main(String[] args) {
    ProcesarTriangulo procesar = new ProcesarTriangulo();
    
    procesar.crearTriangulo();
    
    double area = procesar.calcularArea();
    System.out.println("El area del triangulo es: " + area);
    
    double perimetro = procesar.calcularPerimetro();
    System.out.println("El perimetro del triangulo es: " + perimetro);
  }
}