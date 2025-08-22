public class Propietario {
  private String cit;
  private String nom;
  private String ap;
  
  public Propietario (String cit, String nom, String ap) {
    this.setCit(cit);
    this.setNom(nom);
    this.setAp(ap);
  }
  
  public Propietario () {
    
  }
  
  public String getCit() {
    return cit;
  }
  
  public String getNom() {
    return nom;
  }
  
  public String getAp() {
    return ap;
  }
  
  public void setCit(String cit) {
    this.cit = cit;
  }
  
  public void setNom(String nom) {
    this.nom = nom;
  }
  
  public void setAp(String ap) {
    this.ap = ap;
  }
}