public class Fecha {
  private String ciudad,dia;
  
  public Fecha (String ciudad, String dia) {
    this.setCiudad(ciudad);
    this.setDia(dia);
  }
  
  public Fecha () {
    
  }
  
  public String getCiudad() {
    return ciudad;
  }
  
  public String getDia() {
    return dia;
  }
  
  public void setCiudad(String ciudad) {
    this.ciudad = ciudad;
  }
  
  public void setDia(String dia) {
    this.dia = dia;
  }
}