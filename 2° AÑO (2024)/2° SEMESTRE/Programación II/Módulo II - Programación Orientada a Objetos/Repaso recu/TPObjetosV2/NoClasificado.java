public class NoClasificado extends Piloto {
  private int bestPuesto;
  
  public NoClasificado(String nom, String ap, int rank, int bestPuesto) {
    super(nom,ap,rank);
    this.setBestPuesto(bestPuesto);
  }
  
  public NoClasificado() {
  }
  
  public int getBestPuesto() {
    return bestPuesto;
  }
  
  public void setBestPuesto(int bestPuesto) {
    this.bestPuesto = bestPuesto;
  }
  
  public double sumarPuntos(int pos) {
    double puntaje = 0;
    TablaPuntajesF1 tp = new TablaPuntajesF1();
    puntaje += tp.obtenerPuntaje(pos);
    if (this.bestPuesto>=5) puntaje++;
    return puntaje;
  }
  
  public String toString() {
    String aux;
    aux = super.toString() + ". Mejor puesto entre todas las carreras: " + this.getBestPuesto() + ". ";
    return aux;
  }
}