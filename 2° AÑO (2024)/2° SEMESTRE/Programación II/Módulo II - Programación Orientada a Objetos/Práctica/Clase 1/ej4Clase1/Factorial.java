public class Factorial {
  public static void main(String args[]) {
    for (int j=1;j<=9;j++) { //para que imprima solo el factorial de los numeros impares cambio j++ por j=j+2
      int fact=1;
      for (int i=j;i>1;i--)
        fact=fact*i;  
      System.out.println("El factorial de " + j + " es: " + fact); 
    }
  }
}