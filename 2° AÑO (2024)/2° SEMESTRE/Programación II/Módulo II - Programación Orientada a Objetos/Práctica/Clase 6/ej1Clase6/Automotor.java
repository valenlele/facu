public class Automotor extends Vehiculo{
  private String pat;
  private double impAd;
  private String desc;
  
  public Automotor (int año, double imp, Propietario p, String pat, double impAd, String desc) {
    super(año,imp,p);
    this.setPat(pat);
    this.setImpAd(impAd);
    this.setDesc(desc);
  }
  
  public Automotor () {
      
  }
  
  public String getPat() {
    return pat;
  }
  
  public double getImpAd() {
    return impAd;
  }
  
  public String getDesc() {
    return desc;
  }
  
  public void setPat(String pat) {
    this.pat = pat;
  }
  
  public void setImpAd(double impAd) {
    this.impAd = impAd;
  }
  
  public void setDesc(String desc) {
    this.desc = desc;
  }
  public double calcularCostosImpuestos(){
    double impuestos = this.getImp();
    impuestos += this.getImpAd();  
    return impuestos;
  }
}