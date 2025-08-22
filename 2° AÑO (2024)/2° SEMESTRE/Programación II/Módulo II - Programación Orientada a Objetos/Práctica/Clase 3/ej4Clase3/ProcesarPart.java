public class ProcesarPart {
  public int mas100part (Jugador[] jugadores, int cantJ) {
    int cant = 0;
    
    for (int i=0;i<cantJ;i++) {
      if (jugadores[i].getPart()>100) cant++; 
    }
    
    return cant;    
  }
}