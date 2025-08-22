import java.util.Scanner;
public class Factorial {
  public static void main(String args[]) {
    Scanner in = new Scanner(System.in);
    System.out.println("Ingrese un numero para calcular su factorial: ");
    int num = in.nextInt();
    in.close();
    if (num>0) {
      int i;
      int fact=1;
      for (i=num;i>1;i--)
        fact=fact*i;  
      System.out.print("El factorial de " + num + " es: " + fact);
    }
    else 
      System.out.print("El numero debe ser mayor a 0");   
  }
}