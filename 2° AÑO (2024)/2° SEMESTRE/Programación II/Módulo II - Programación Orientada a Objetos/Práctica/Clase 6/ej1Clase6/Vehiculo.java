public abstract class Vehiculo {
  private int año;
  private double imp;
  private Propietario p;
  
  public Vehiculo (int año, double imp, Propietario p) {
    this.setAño(año);
    this.setImp(imp);
    this.setPropietario(p);
  }
  
  public Vehiculo () {
    
  }
  
  public int getAño() {
    return año;
  }
  
  public double getImp() {
    return imp;
  }
  
  public Propietario getPropietario () {
    return p;
  }
  
  public void setAño(int año) {
    this.año = año;
  }
  
  public void setImp(double imp) {
    this.imp = imp;
  }
  
  public void setPropietario (Propietario p){
    this.p = p;
  }
  
  public abstract double calcularCostosImpuestos();
      
}