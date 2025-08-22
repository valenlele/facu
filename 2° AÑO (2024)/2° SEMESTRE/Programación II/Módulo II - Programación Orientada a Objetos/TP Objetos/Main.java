import java.util.Scanner;
public class Main{
    public static void main(String[] args){
        Carrera[] vecCarreras=new Carrera[5];
        String nombre;
        String apellido;
        int ranking;
        int puntaje;
        String lugar;
        int pos;
        int horas;
        int min;
        int totPuntaje=0;
        int bestRanking;
        Piloto vecPiloto[]= new Piloto[10]; //se tiene que inicializar vector de pilotos por cada carrera (adentro del if de abajo)
        Scanner in =new Scanner(System.in);
        for (int i=0;i<2;i++) {
          System.out.println("Ingrese info de una carrera: ");
          System.out.println("Lugar: ");
          lugar = in.nextLine();
          for (int j=0;j<10;j++) {
            System.out.println("Nombre piloto: ");
            nombre = in.nextLine();
            in.nextLine();
            System.out.println("Apellido: ");
            apellido = in.nextLine();
            System.out.println("Ranking: ");
            ranking = in.nextInt();
            System.out.println("Posicion: ");
            pos = in.nextInt();
            if (pos>=1 && pos<=5) {
              System.out.println("Tiempo en horas minutos: ");
              horas = in.nextInt();
              min = in.nextInt();
              Tiempo t = new Tiempo(horas,min);
              Piloto P= new Clasificado(nombre,apellido,ranking,0,pos,t);
              vecPiloto[j]=P;
            }
            else if (pos>5 && pos<=10) {
               System.out.println("Mejor Ranking: ");
               bestRanking = in.nextInt();
               Piloto P = new NoClasificado(nombre,apellido,ranking,0,pos,bestRanking);
               vecPiloto[j]=P;
            }
            vecPiloto[j].CalcularPuntaje(lugar);  
          }
        Carrera C=new Carrera(lugar,vecPiloto);
        vecCarreras[i] = C;  
        }
        for (int k=0;k<2;k++) {
          System.out.println(vecCarreras[k].toString());
        }
        in.close();
        //falta sumar puntaje total entre todas las carreras
    }
    
}