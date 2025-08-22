public abstract class Recital {
  private String nomBanda;
  private String [] vecTemas;
  private int cantTemas,dimL;
  
  public Recital(String nomBanda, int cantTemas) {
    this.setNomBanda(nomBanda);
    this.setCantTemas(cantTemas);
    this.vecTemas = new String [cantTemas];
    this.dimL = 0;
  }
  
  public Recital() {
  
  }
  
  public String getNomBanda() {
    return nomBanda;
  }
  
  public int getCantTemas() {
    return cantTemas;
  }
  
  public void setNomBanda(String nomBanda) {
    this.nomBanda = nomBanda;
  }
  
  public void setCantTemas(int cantTemas) {
    this.cantTemas = cantTemas;
  }
  
  public void agregarTema(String nombreTema) {
    if (this.dimL<this.cantTemas) {
      vecTemas[this.dimL] = nombreTema;
      this.dimL++;
    }
  }
  
  public String actuar() {
    String aux="";
    for (int i=0; i<dimL; i++) {
      aux += " y ahora tocaremos " + vecTemas[i];
    } 
    return aux;
  }
  
  public abstract double calcularCosto();
}