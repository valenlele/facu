public class Auto {
  private String nomDueño,patente;
  
  public Auto(String nomDueño, String patente) {
    this.setNomDueño(nomDueño);
    this.setPatente(patente);
  }
  
  public Auto() {
    
  }
  
  public String getNomDueño() {
    return nomDueño;
  }
  
  public String getPatente() {
    return patente;
  }
  
  public void setNomDueño(String nomDueño) {
    this.nomDueño = nomDueño;
  }
  
  public void setPatente(String patente) {
    this.patente = patente;
  }
  
  public String toString() {
    String aux;
    aux = "Nombre dueño: " + this.getNomDueño() + ". Patente: " + this.getPatente();
    return aux;
  }
}