public abstract class Ejemplar {
  private String cod;
  private int cantPag;
  private String resumen;
  private int año;
  private Responsable resp;
  
  public Ejemplar (String cod, int cantPag, String resumen, int año, Responsable resp) {
    this.setCod(cod);
    this.setCantPag(cantPag);
    this.setResumen(resumen);
    this.setAño(año);
    this.setResp(resp);
  }
  
  public Ejemplar () {
      
  }
  
  public String getCod() {
    return cod;
  }
  
  public int getCantPag() {
    return cantPag;
  }
  
  public String getResumen() {
    return resumen;
  }
  
  public int getAño() {
    return año;
  }
  
  public Responsable getResp() {
    return resp;
  }
  
  public void setCod(String cod) {
    this.cod = cod;    
  }
  
  public void setCantPag(int cantPag) {
    this.cantPag = cantPag;    
  }
  
  public void setResumen(String resumen) {
    this.resumen = resumen;    
  }
  
  public void setAño(int año) {
    this.año = año;    
  }
  
  public void setResp(Responsable resp) {
    this.resp = resp;    
  }
  
  public abstract String toString ();
  
}