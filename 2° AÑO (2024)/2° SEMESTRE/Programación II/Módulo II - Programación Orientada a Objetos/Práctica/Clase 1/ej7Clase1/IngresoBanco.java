import java.util.Scanner;
public class IngresoBanco {
  public static void main(String[]args) {
    int op,i,max=-1,maxOp=0;
    int [] cantOp = new int[5];
    for (i=0;i<5;i++) cantOp[i]=0;
    Scanner in = new Scanner(System.in);
    System.out.println("Ingrese la operacion que desea realizar: ");
    op = in.nextInt();
    while (op != 999) {
      cantOp[op]++;
      System.out.println("Ingrese la operacion que desea realizar: ");
      op = in.nextInt();
    }
    in.close();
    System.out.println("Cantidad de personas atendidas por cada operacion: ");
    for (i=0;i<5;i++) {
      if (i==0) System.out.println("cobro de cheque: " + cantOp[i]);
      if (i==1) System.out.println("depósito/extracción en cuenta: " + cantOp[i]);
      if (i==2) System.out.println("pago de impuestos o servicios: " + cantOp[i]);
      if (i==3) System.out.println("cobro de jubilación: " + cantOp[i]);
      if (i==4) System.out.println("cobro de planes: " + cantOp[i]);
    }
    for (i=0;i<5;i++) if (cantOp[i]>max) {
      max=cantOp[i];
      maxOp=i;
    }
    System.out.println("La operacion mas solicitada fue la " + maxOp);
  }
}