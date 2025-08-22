public class Personal extends Visita {
  private boolean esExtranjero;
  
  public Personal(int nroVisita, int dia, int mes, int año, boolean ingresoEgreso, boolean esExtranjero) {
    super(nroVisita,dia,mes,año,ingresoEgreso);
    this.setEsExtranjero(esExtranjero);
  }
  
  public Personal() {
      
  }
  
  public boolean getEsExtranjero() {
    return esExtranjero;
  }
  
  public void setEsExtranjero(boolean esExtranjero) {
    this.esExtranjero = esExtranjero;
  }
  
  public double costoVisita() {
    double costo = 0;
    if (!this.esExtranjero) {
      if (getIngresoEgreso()) costo += 7000;
    }
    else {
      if (!getIngresoEgreso()) costo += 15000;
      else costo += 10000;
    }
    super.calcularAdicional(costo);
    return costo;
  }
  
  public String toString() {
    String aux="";
    aux += super.toString();
    if (!this.esExtranjero) {
      aux += ". Es argentino" + " ";
    }
    if (this.esExtranjero) {
      aux += ". Es extranjero" + " ";
    }
    return aux;
  }
}