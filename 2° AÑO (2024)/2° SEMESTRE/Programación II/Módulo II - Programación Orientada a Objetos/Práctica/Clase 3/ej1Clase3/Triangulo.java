public class Triangulo {
  private double l1,l2,l3;
  private String colorRelleno;
  private String colorLinea;
  
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
    return ("Triangulo l1= " + l1 + "l2= " + l2 + "l3= " + l3 + "Color relleno: " + colorRelleno + "Color linea: " + colorLinea);  
  }
}