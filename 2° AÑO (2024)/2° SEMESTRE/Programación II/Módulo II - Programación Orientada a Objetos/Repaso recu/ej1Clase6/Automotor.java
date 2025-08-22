public class Automotor extends Vehiculo {
  private String patente,desc;
  private double impAd;
  
  public Automotor (int año, double impBasico, Propietario p, String patente, double impAd, String desc) {
    super(año,impBasico,p);
    this.setPatente(patente);
    this.setImpAd(impAd);
    this.setDesc(desc);
  }
  
  public Automotor () {
      
  }
  
  public String getPatente() {
    return patente;
  }
  
  public double getImpAd() {
    return impAd;
  }
  
  public String getDesc() {
    return desc;
  }
  
  public void setPatente(String patente) {
    this.patente = patente;
  }
  
  public void setImpAd(double impAd) {
    this.impAd = impAd;
  }
  
  public void setDesc(String desc) {
    this.desc = desc;
  }
  
  public double calcularTotImpuesto() {
    double totImp = this.getImpBasico();
    totImp += this.getImpAd();
    return totImp;
  }
  
}