public class PasoFronterizo {
  private Visita [] vecVisita;
  private int dimL;
  
  public PasoFronterizo() {
    this.vecVisita = new Visita[10];
    this.dimL = 0;
  }
  
  public void agregarVisita(Visita v) {
    if (this.dimL<10) {
      vecVisita[this.dimL] = v;
      this.dimL++;
    }
  }
  
  public double porc20000() {
    double porc=0;
    int cant=0;
    for (int i=0;i<this.dimL;i++) {
      if (this.vecVisita[i].costoVisita()>20000) {
        cant++;    
      }      
    }
    porc += (cant*100)/this.dimL;
    return porc;
  }
  
  @Override
  public String toString() {
    String aux="";
    aux = "Informacion de visitas: ";
    for (int i=0;i<this.dimL;i++) {
      aux += this.vecVisita[i];   
    }    
    return aux;
  }
}