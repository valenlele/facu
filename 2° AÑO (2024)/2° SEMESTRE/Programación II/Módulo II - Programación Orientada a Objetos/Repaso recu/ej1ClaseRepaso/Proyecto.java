public class Proyecto {
  private String nom,nomDirec;
  private int cod,dimL;
  private Investigador [] vecInvestigadores;
  
  public Proyecto (String nom, int cod, String nomDirec) {
    this.setNom(nom);
    this.setCod(cod);
    this.setNomDirec(nomDirec);
    this.vecInvestigadores = new Investigador [50];
    this.dimL = 0;
  }
  
  public Proyecto () {
      
  }
  
  public String getNom() {
    return nom;
  }
  
  public int getCod() {
    return cod;
  }
  
  public String getNomDirec() {
    return nomDirec;
  }
  
  public void setNom(String nom) {
    this.nom = nom;
  }
  
  public void setCod(int cod) {
    this.cod = cod;
  }
  
  public void setNomDirec(String nomDirec) {
    this.nomDirec = nomDirec;
  }
  
  public void agregarInvestigador (Investigador inv) {
    if (this.dimL<50) {
      vecInvestigadores[this.dimL] = inv;  
      this.dimL++;
    }
  }
  
  public void otorgarTodos (String nom) {
    int i = 0;
    while (!vecInvestigadores[i].getNom().equals(nom) && (i<this.dimL)) i++;
    if (vecInvestigadores[i].getNom().equals(nom)) {
      this.vecInvestigadores[i].subOtorgar();
    }
  }
  
  public double dineroTotalOtorgado() {
    double tot = 0;
    for (int i=0; i<this.dimL; i++) {
      tot += this.vecInvestigadores[i].subDineroTot();  
    }
    return tot;
  }  
  
  @Override
  public String toString () {
    String aux;
    aux = "Nombre del proyecto: " + this.getNom() + ". Codigo: " + this.getCod() + ". Nombre del director: " + this.getNomDirec() + ". Dinero total otorgado: " + this.dineroTotalOtorgado() + ". Informacion investigadores:";
    for (int i=0; i<3; i++) aux += vecInvestigadores[i].toString();
    return aux;
  }
}