public class Carrera {
  private String lugar;
  private Piloto [] vecPilotos;
  private int dimL;
  
  public Carrera(String lugar) {
    this.setLugar(lugar);
    this.vecPilotos = new Piloto[10];
    this.dimL = 0;
  }
  
  public Carrera() {
  }
  
  public String getLugar() {
    return lugar;
  }
  
  public void setLugar(String lugar) {
    this.lugar = lugar;
  }
  
  public void agregarPiloto(Piloto p) {
    if (this.dimL<10) {
      this.vecPilotos[this.dimL] = p;
      this.dimL++;
    }
  }
  
  public double sumarPuntos() {
    double puntos = 0;
    for (int i=0; i<this.dimL; i++) {
      puntos += vecPilotos[i].sumarPuntos(i + 1);
      if ((this.lugar.equals("japon")) || (this.lugar.equals("china"))) puntos += 3;
      if ((this.lugar.equals("hungria")) || (this.lugar.equals("belgica"))) puntos += 1;
    }
    return puntos;
  }
  
  public String toString() {
    String aux;
    aux = "Lugar: " + this.getLugar() + ". Informacion pilotos: ";
    for (int i=0; i<10; i++) {
      aux += vecPilotos[i].toString();
    }
    return aux;
  }
}