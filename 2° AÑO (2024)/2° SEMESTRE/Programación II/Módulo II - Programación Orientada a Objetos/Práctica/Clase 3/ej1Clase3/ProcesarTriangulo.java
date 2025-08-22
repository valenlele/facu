import java.util.Scanner;
public class ProcesarTriangulo {
  
  Triangulo t = new Triangulo(); //creo nueva instancia (objeto) triangulo. se crea vacio  
    
  public void crearTriangulo (){
    double l1,l2,l3;
    String colorRelleno,colorLinea; 
    Scanner in = new Scanner(System.in);
    System.out.println("Ingrese el lado 1 del triangulo: ");
    l1 = in.nextDouble();
    System.out.println("Ingrese el lado 2 del triangulo: ");
    l2 = in.nextDouble();
    System.out.println("Ingrese el lado 3 del triangulo: ");
    l3 = in.nextDouble();
    in.nextLine();
    System.out.println("Ingrese el color de relleno del triangulo: ");
    colorRelleno = in.nextLine();
    System.out.println("Ingrese el color de linea del triangulo: ");
    colorLinea = in.nextLine();
    t.setL1(l1);
    t.setL2(l2);
    t.setL3(l3);
    t.setColorRelleno(colorRelleno);
    t.setColorLinea(colorLinea);
    System.out.println(t.toString());
    in.close();
  }
        
  public double calcularArea(){
    double area,s;
    s = (t.getL1()+t.getL2()+t.getL3())/2;
    area = Math.sqrt(s*(s-t.getL1())*(s-t.getL2())*(s-t.getL3()));
    return area;
  }
  
  public double calcularPerimetro() {
    double perimetro;
    perimetro = t.getL1() + t.getL2() + t.getL3();
    return perimetro;
  }
}