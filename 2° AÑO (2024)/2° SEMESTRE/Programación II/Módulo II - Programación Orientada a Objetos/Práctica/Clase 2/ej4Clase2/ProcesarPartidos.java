import java.util.Scanner;
public class ProcesarPartidos {
  int cantPartidos = 3;
  private Partido [] vecPartidos = new Partido[cantPartidos];
  
  public void insertarPartidos() {
    Scanner in = new Scanner(System.in);
    int i,golesLoc,golesVis;
    String loc,vis;
    System.out.println("Se ingresan datos de partidos disputados en la Superliga 2018/2019");
    for (i=0;i<cantPartidos;i++) {
      System.out.println("Equipo local: ");
      loc = in.nextLine();
      System.out.println("Equipo visitante: ");
      vis = in.nextLine();
      System.out.println("Goles equipo local: ");
      golesLoc = in.nextInt();
      System.out.println("Goles equipo visitante: ");
      golesVis = in.nextInt();
      in.nextLine();
      vecPartidos[i] = new Partido(loc,vis,golesLoc,golesVis);
    }
    in.close();
  }
  
  public int partidosRiver() {
    int j,cant=0;
    for (j=0;j<cantPartidos;j++) {
      if (vecPartidos[j].getGanador().equals("River")) cant++;    
    }
    return cant;
  }
  
  public int golesBoca() {
    int k,totGoles=0;
    for (k=0;k<cantPartidos;k++) {
      if (vecPartidos[k].getLocal().equals("Boca")) totGoles = totGoles + vecPartidos[k].getGolesLocal();
    }
    return totGoles;
  }
  
  public double partidosEmpate() {
    int l,cantEmpate=0;
    double porc=0;
    for (l=0;l<cantPartidos;l++) {
      if (vecPartidos[l].hayEmpate()) cantEmpate++;     
    }
    porc = (cantEmpate*100)/cantPartidos;
    return porc;  
  }
  
}