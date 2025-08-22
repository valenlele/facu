public class Main {
  public static void main(String[] args) {
    ProcesarPartidos procesar = new ProcesarPartidos();
    
    procesar.insertarPartidos();
    
    int partidosRiver = procesar.partidosRiver();
    System.out.println("La cantidad de partidos que ganó River es: " + partidosRiver);
    
    int golesBocaLoc = procesar.golesBoca();
    System.out.println("La cantidad de goles que hizo Boca de local es: " + golesBocaLoc);
    
    double porcEmpate = procesar.partidosEmpate();
    System.out.println("El porcentaje de partidos finalizados en empate es: " + porcEmpate);
  }
}