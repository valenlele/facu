public class Centro {
  private Carrera [] vecCarreras;
  private int dimL;
  
  public Centro () {
    this.vecCarreras = new Carrera[5];
    this.dimL = 0;
  }
  
  public void agregarCarrera(Carrera c) {
    if (this.dimL<5) {
      this.vecCarreras[this.dimL] = c;
      this.dimL++;
    }
  }
  
  public double sumarPuntos() {
    double totPuntos = 0;
    for (int i=0; i<this.dimL; i++) {
      totPuntos += vecCarreras[i].sumarPuntos();    
    }
    return totPuntos;
  }
  
  public String toString() {
    String aux;
    aux = "Total puntos entre todas las carreras: " + this.sumarPuntos();
    return aux;
  }
}