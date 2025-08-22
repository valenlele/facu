import java.util.Scanner;
public class MatrizPares {
  public static void main(String[]args) {
    int [][] pares = new int[10][10];
    int i,j,k,num,iNum=0,jNum=0;
    int sum=0;
    int [] sumCol_i = new int[10];
    boolean encontre = false;
    for (i=0;i<10;i++)
      for (j=0;j<10;j++)
        pares[i][j]=(j*2)+(i*20);
        
    System.out.println("Contenido de la matriz: ");
    for (i=0;i<10;i++)
      for (j=0;j<10;j++)
        System.out.println("Posicion " + i + "," + j + ": " + pares[i][j]);
    
    for (i=2;i<9;i++)
      for (j=0;j<4;j++)
        sum=sum+pares[i][j];
    System.out.println("La suma de todos los elementos entre las filas 2 y 9 y las columnas 0 y 3 es: " + sum);
    
    for (k=0;k<10;k++) {
      sumCol_i[k]=0;
      for (i=0;i<10;i++) sumCol_i[k]=sumCol_i[k]+pares[i][k];
    }
    for (k=0;k<10;k++) System.out.println("La suma de la columna " + k + " es: " + sumCol_i[k]);
    
    Scanner in = new Scanner(System.in);
    System.out.println("Ingrese un numero para saber si esta en la matriz: ");
    num = in.nextInt();
    in.close();
    for (i=0;i<10 && !encontre;i++) {
      for (j=0;j<10 && !encontre;j++) {
        if (pares[i][j] == num) {
          encontre=true;
          iNum=i;
          jNum=j;
        }       
      }
    } 
    if (encontre==true) System.out.println("El numero se encuentra en la posicion " + iNum + "." +  jNum);
    else System.out.println("No se encontró el elemento");
  }
}