public class Responsable {
  private int dni;
  private String nom;
  private String ap;
  
  public Responsable (int dni, String nom, String ap) {
    this.setDni(dni);
    this.setNom(nom);
    this.setAp(ap);
  }
  
  public Responsable () {
      
  }
  
  public int getDni() {
    return dni;
  }
  
  public String getNom() {
    return nom;
  }
  
  public String getAp() {
    return ap;
  }
  
  public void setDni(int dni) {
    this.dni = dni;
  }
  
  public void setNom(String nom) {
    this.nom = nom;
  }
  
  public void setAp(String ap) {
    this.ap = ap;
  }
}