import java.util.Scanner;
public class Vec10Strings {
  public static void main(String[] args) {
    int i,cantStrings = 5;
    String string;
    String [] vecStrings = new String[cantStrings];
    char [] msjOculto = new char[cantStrings];
    
    Scanner in = new Scanner(System.in);
    System.out.println("Se ingresan strings: ");
    for (i=0;i<cantStrings;i++) {
      string = in.nextLine();
      vecStrings[i]=string;
    }
    
    for (i=0;i<cantStrings;i++) {
      msjOculto[i]=vecStrings[i].charAt(0);    
    }
    
    System.out.println("El mensaje oculto es: ");
    for (i=0;i<cantStrings;i++) {
      System.out.print(msjOculto[i]);
    }
  }
}