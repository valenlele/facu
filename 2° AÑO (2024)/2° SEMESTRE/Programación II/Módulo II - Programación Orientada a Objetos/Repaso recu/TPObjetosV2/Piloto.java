public abstract class Piloto {
  private String nom,ap;
  private int rank;
  
  public Piloto(String nom, String ap, int rank) {
    this.setNom(nom);  
    this.setAp(ap);
    this.setRank(rank);
  }
  
  public Piloto() {
  }
  
  public String getNom() {
    return nom;
  }
  
  public String getAp() {
    return ap;
  }
  
  public int getRank() {
    return rank;
  }
  
  public void setNom(String nom) {
    this.nom = nom;
  }
  
  public void setAp(String ap) {
    this.ap = ap;
  }
  
  public void setRank(int rank) {
    this.rank = rank;
  }
  
  public abstract double sumarPuntos(int pos);
  
  public String toString() {
    String aux;
    aux = "Nombre: " + this.getNom() + ". Apellido: " + this.getAp() + ". Ranking mundial: " + this.getRank();
    return aux;
  }
}