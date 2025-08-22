import java.util.Scanner;
public class ProgramaEditorial {
  public static void main(String [] args) {
    Scanner in = new Scanner(System.in);
    Ejemplar [] vecEjemplares = new Ejemplar[2];
    String cod,resumen,nom,ap,titulo,nombre,ejemplar,esBolsilloS;
    int cantPag,año,dni,cantCap,numVol,cantArt;
    boolean esBolsillo=false;
    
    for (int i=0;i<2;i++) {
      System.out.println("Se lee info de ejemplares: ");
      System.out.println("Codigo identificatorio: ");
      cod = in.nextLine();
      System.out.println("Cantidad de paginas: ");
      cantPag = in.nextInt();
      in.nextLine();
      System.out.println("Resumen: ");
      resumen = in.nextLine();
      System.out.println("Año de publicacion: ");
      año = in.nextInt();
      System.out.println("DNI del responsable: ");
      dni = in.nextInt();
      in.nextLine();
      System.out.println("Nombre: ");
      nom = in.nextLine();
      System.out.println("Apellido: ");
      ap = in.nextLine();
      Responsable r = new Responsable(dni,nom,ap);
      System.out.println("Tipo de ejemplar: ");
      ejemplar = in.nextLine();
      
      if (ejemplar.equals("libro")) {
        System.out.println("Titulo: ");
        titulo = in.nextLine();
        System.out.println("Cantidad de capitulos: ");
        cantCap = in.nextInt();
        in.nextLine();
        System.out.println("Es o no una edicion de bolsillo?: ");
        esBolsilloS = in.nextLine();
        if (esBolsilloS.equals("si")) esBolsillo=true;
        else if (esBolsilloS.equals("no")) esBolsillo=false;
        
        Ejemplar lib = new Libro(cod,cantPag,resumen,año,r,titulo,cantCap,esBolsillo);
        vecEjemplares[i] = lib;
      }
    
      if (ejemplar.equals("revista")) {
        System.out.println("Nombre: ");
        nombre = in.nextLine();
        System.out.println("Numero de volumen: ");
        numVol = in.nextInt();
        System.out.println("Cantidad de articulos: ");
        cantArt = in.nextInt();
        Ejemplar rev = new Revista(cod,cantPag,resumen,año,r,nombre,numVol,cantArt);
        vecEjemplares[i] = rev;
      }
    }
    
    System.out.println("Listado de ejemplares: ");
    for (int i=0;i<2;i++) {
      System.out.println(vecEjemplares[i].toString());
    }
    
  }
}