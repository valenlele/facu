public abstract class Visita {
  private int nroVisita,dia,mes,año;
  private boolean ingresoEgreso; //falso para ingreso, true para egreso
  
  public Visita(int nroVisita, int dia, int mes, int año, boolean ingresoEgreso) {
    this.setNroVisita(nroVisita);
    this.setDia(dia);
    this.setMes(mes);
    this.setAño(año);
    this.setIngresoEgreso(ingresoEgreso);
  }
  
  public Visita() {
      
  }
  
  public int getNroVisita() {
    return nroVisita;
  }
  
  public int getDia() {
    return dia;
  }
  
  public int getMes() {
    return mes;
  }
  
  public int getAño() {
    return año;
  }
  
  public boolean getIngresoEgreso() {
    return ingresoEgreso;
  }
  
  public void setNroVisita(int nroVisita) {
    this.nroVisita = nroVisita;
  }
  
  public void setDia(int dia) {
    this.dia = dia;
  }
  
  public void setMes(int mes) {
    this.mes = mes;
  }
  
  public void setAño(int año) {
    this.año = año;
  }
  
  public void setIngresoEgreso(boolean ingresoEgreso) {
    this.ingresoEgreso = ingresoEgreso;
  }
  
  public abstract double costoVisita();
  
  public double calcularAdicional(double tot) {
    double adicional=0;
    if (this.año==2024) {
      if (this.mes==10) {
        if (this.dia==11) {
          adicional += (10*tot)/100;  
        }
      }
      if (this.mes==11) {
        if (this.dia==18) {
          adicional += (10*tot)/100;  
        }
      }
    }
    return adicional;
  }
  
  public String toString() {
    String aux="";
    aux += "Numero de visita: " + this.getNroVisita() + ". Fecha: " + this.getDia() + " " + this.getMes() + " " + this.getAño();                    
    if (!this.ingresoEgreso) {
      aux += ". Ingreso ";
    }
    else {
      aux += ". Egreso ";
    }
    return aux;
  }
}