import java.util.Scanner;
public class Triangulo {
  public static void main(String[] args) {
    Scanner in=new Scanner(System.in);
    System.out.print("Ingrese el lado 1 del triangulo: ");
    double a = in.nextDouble();
    System.out.print("Ingrese el lado 2 del triangulo: ");
    double b = in.nextDouble();
    System.out.print("Ingrese el lado 3 del triangulo: ");
    double c = in.nextDouble();
    in.close();
    if ((a<(b+c)) && (b<(a+c)) && (c<(a+b))) { 
      System.out.println("El perimetro del triangulo es: " + (a+b+c));
    }
    else {
      System.out.println("Las longitudes ingresadas no forman un triangulo valido: ");  
    }
  }
}