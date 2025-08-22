import java.util.Scanner;
public class OpinionesClientes {
  public static void main(String[]args) {
    int[][] opinionesClientes = new int[5][4];
    int c,o,op,totOp;
    Scanner in = new Scanner(System.in);
    for (c=0;c<5;c++) {
      System.out.println("Opiniones cliente " + (c+1));
      for (o=0;o<4;o++) {
        switch(o) {
          case 0:
            System.out.print("Opinion sobre atencion al cliente: ");
            break;
          case 1:
            System.out.print("Opinion sobre calidad de la comida: ");
            break;
          case 2:
            System.out.print("Opinion sobre precio: ");
            break;
          case 3:
            System.out.print("Opinion sobre ambiente: ");
            break;
        }
        op = in.nextInt();
        opinionesClientes[c][o]=op;
      }
    }
    in.close();
    for (o=0;o<4;o++) {
      totOp=0;
      for (c=0;c<5;c++) {
        totOp=totOp+opinionesClientes[c][o];
      }
      System.out.println("La calificacion promedio del aspecto " + o + " es: " + (totOp/5));
    }
  }
}