public class Micro {
  private String patente,dest,horaS;
  private int cantOcup;
  private boolean [] asientos = new boolean[20];
  
  public Micro(String patente, String dest, String horaS) {
    this.patente = patente;
    this.dest = dest;
    this.horaS = horaS;
    this.cantOcup = 0;
  }
  
  public Micro() {
  
  }
  
  public String getPatente() {
    return this.patente;  
  }
  
  public String getDest() {
    return this.dest;
  }
  
  public String getHoraS() {
    return this.horaS;
  }
  
  public void setPatente(String patente) {
    this.patente = patente;
  }
  
  public void setDest(String dest) {
    this.dest = dest;
  }
  
  public void setHoraS(String horaS) {
    this.horaS = horaS;
  }
  
  public int cantAsientosOcup() {
    for (int i=0;i<20;i++) {
      if (asientos[i]) this.cantOcup++;
    }
    return cantOcup;
  }
  
  public boolean estaLleno() {
    boolean retorno;
    if (this.cantOcup==20) retorno = true;
    else retorno = false;
    return retorno;
  }
  
  public boolean validarAsiento(int unNroAsiento) {
    boolean validacion;
    if ((unNroAsiento>=0) && (unNroAsiento<=20)) validacion = true;
    else validacion = false;
    return validacion;
  }
  
  public boolean estaOcupado(int unNroAsiento) {
    boolean validacion;
    if (asientos[unNroAsiento]==true) validacion = true;
    else validacion = false;
    return validacion;
  }
  
  public void ocuparAsiento(int unNroAsiento) {
    asientos[unNroAsiento]=true;
  }
  
  public void liberarAsiento(int unNroAsiento) {
    asientos[unNroAsiento]=false;
  }
  
  public int primerAsientoLibre() {
    int i = 0, asiento = -1;
    boolean encontreAsiento = false;
    while ((i<20) && (encontreAsiento==false)) {
      if (asientos[i]==false) {
        encontreAsiento = true;
        asiento = i;
      }
      i++;
    }
    return asiento;
  }
  
  public String toString() {
    String aux;
    aux = "Patente: " + this.patente + "Destino: " + this.dest + "Hora de salida: " + this.horaS;
    return aux;
  }
}