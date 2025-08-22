public class Triangulo {
  private double l1,l2,l3;
  private String colorRelleno;
  private String colorLinea;
  
  public Triangulo (double l1, double l2, double l3, String colorRelleno, String colorLinea) {
    this.l1 = l1;
    this.l2 = l2;
    this.l3 = l3;
    this.colorRelleno = colorRelleno;
    this.colorLinea = colorLinea;
  }
  
  public Triangulo () {
      
  }
  
  public double getL1() {
    return l1;
  }
  
  public double getL2() {
    return l2;
  }
  
  public double getL3() {
    return l3;
  }
  
  public String getColorRelleno() {
    return colorRelleno;
  }
  
  public String getColorLinea() {
    return colorLinea;
  }
  
  public void setL1(double unl1) {
    l1 = unl1;
  }
  
  public void setL2(double unl2) {
    l2 = unl2;
  }
  
  public void setL3(double unl3) {
    l3 = unl3;
  }
  
  public void setColorRelleno(String unColorRelleno) {
    colorRelleno = unColorRelleno;
  }
  
  public void setColorLinea(String unColorLinea) {
    colorLinea= unColorLinea;
  }
  
  public String toString() {
    return ("Triangulo l1= " + l1 + " l2= " + l2 + " l3= " + l3 + ". Color relleno: " + colorRelleno + " Color linea: " + colorLinea);  
  }
}