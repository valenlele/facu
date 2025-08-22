public class Flota {
  private Micro [] micros = new Micro[15];
  private int cantMicros;
  
  public Flota() {
    this.cantMicros = 0;    
  }
  
  public boolean flotaCompleta() {
    boolean completa;
    if (this.cantMicros==15) completa = true;
    else completa = false;
    return completa;
  }
  
  public void agregarMicro(Micro unMicro) {
    if (this.cantMicros<15) {
      micros[cantMicros] = unMicro;
      cantMicros++;
    }
    else System.out.println("La flota esta llena");
  }
  
  public void eliminarMicro(String unaPatente) {
    int i=0;
    boolean encontre=false;
    while (i<this.cantMicros && !encontre) {
      if (micros[i].getPatente().equals(unaPatente)) {
        encontre = true;
        for (int j=i;j<cantMicros;j++) {
          micros[j]=micros[j+1]; 
        }
        this.cantMicros--;
      }
      else i++;
    }
  }
  
  public Micro buscarMicroPorPatente(String unaPatente) {
    int i=0;
    boolean encontre=false;
    while (i<this.cantMicros && !encontre) {
      if (micros[i].getPatente().equals(unaPatente)) encontre = true;
      else i++;
    }
    if (encontre) return micros[i];
    else {
      System.out.println("NULL");
      return null;
    }
  }
  
  public Micro buscarMicroPorDestino(String unDest) {
    int i=0;
    boolean encontre=false;
    while (i<this.cantMicros && !encontre) {
      if (micros[i].getDest().equals(unDest)) encontre = true;
      else i++;
    }
    if (encontre) return micros[i];
    else {
      System.out.println("NULL");    
      return null;
    }
  }
  
}