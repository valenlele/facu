public class Clasificado extends Piloto {
  private int horas,mins;
  
  public Clasificado(String nom, String ap, int rank, int horas, int mins) {
    super(nom,ap,rank);
    this.setHoras(horas);
    this.setMins(mins);
  }
  
  public Clasificado() {
    
  }
  
  public int getHoras() {
    return horas;
  }
  
  public int getMins() {
    return mins;
  }
  
  public void setHoras(int horas) {
    this.horas = horas;
  }
  
  public void setMins(int mins) {
    this.mins = mins;
  }
  
  public double sumarPuntos(int pos) {
    double puntaje = 0;
    TablaPuntajesF1 tp = new TablaPuntajesF1();
    puntaje += tp.obtenerPuntaje(pos);
    if (this.horas==1) {
      if (this.mins<5) puntaje += 2;
      else if ((this.mins>=5) && (this.mins<8)) puntaje++;
    }
    return puntaje;
  }
  
  public String toString() {
    String aux;
    aux = super.toString() + ". Horas: " + this.getHoras() + ". Minutos: " + this.getMins() + ". ";
    return aux;
  }
}