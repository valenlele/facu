public abstract class Vehiculo {
  private int año;
  private double impBasico;
  private Propietario p;
  
  public Vehiculo (int año, double impBasico, Propietario p) {
    this.setAño(año);
    this.setImpBasico(impBasico);
    this.setPropietario(p);
  }
  
  public Vehiculo () {
      
  }
  
  public int getAño() {
    return año;    
  }
  
  public double getImpBasico() {
    return impBasico;    
  }
  
  public Propietario getPropietario() {
    return p;    
  }
  
  public void setAño(int año) {
    this.año = año;
  }
  
  public void setImpBasico(double impBasico) {
    this.impBasico = impBasico;
  }
  
  public void setPropietario(Propietario p) {
    this.p = p;
  }
  
  public abstract double calcularTotImpuesto ();
}