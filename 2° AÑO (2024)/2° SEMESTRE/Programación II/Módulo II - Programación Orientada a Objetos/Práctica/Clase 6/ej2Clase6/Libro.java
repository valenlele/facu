public class Libro extends Ejemplar {
  private String titulo;
  private int cantCap;
  private boolean esBolsillo;
  
  public Libro (String cod, int cantPag, String resumen, int año, Responsable resp, String titulo, int cantCap, boolean esBolsillo) {
    super (cod,cantPag,resumen,año,resp);
    this.setTitulo(titulo);
    this.setCantCap(cantCap);
    this.setEsBolsillo(esBolsillo);
  }
  
  public Libro () {

  }
  
   public String getTitulo() {
    return titulo;
  }
  
  public int getCantCap() {
    return cantCap;
  }
  
  public boolean getEsBolsillo() {
    return esBolsillo;
  }
  
  public void setTitulo(String titulo) {
    this.titulo = titulo;
  }
  
  public void setCantCap (int cantCap) {
    this.cantCap = cantCap;
  }
  
  public void setEsBolsillo(boolean esBolsillo) {
    this.esBolsillo = esBolsillo;
  }
  
  public String toString () {
    String aux;
    aux = "Codigo: " + this.getCod() + ", titulo: " + this.getTitulo() + ", nombre del responsable: " + this.getResp().getNom() ; 
    return aux;
  }
}