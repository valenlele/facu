public class Investigador {
  private String nom,esp;
  private int cat,dimL;
  private Subsidio [] vecSubsidios;
  
  public Investigador (String nom, int cat, String esp) {
    this.setNom(nom);
    this.setCat(cat);
    this.setEspecialidad(esp);
    this.vecSubsidios = new Subsidio [5];
    this.dimL = 0;
  }
  
  public Investigador () {
      
  }
  
  public String getNom() {
    return nom;
  }
  
  public int getCat() {
    return cat;
  }
  
  public String getEspecialidad() {
    return esp;
  }
  
  
  public void setNom(String nom) {
    this.nom = nom;
  }
  
  public void setCat(int cat) {
    this.cat = cat;
  }
  
  public void setEspecialidad(String esp) {
    this.esp = esp;
  }
  
  public void agregarSubsidio(Subsidio sub) {
    if (this.dimL<5) {
      vecSubsidios[this.dimL] = sub;
      this.dimL++;
    }
  }
  
  public void subOtorgar() {
    for (int i=0; i<this.dimL; i++) vecSubsidios[i].setEntregado(true);     
  }
  
  public double subDineroTot() {
    double totSub = 0;
    for (int i=0; i<this.dimL; i++) {
      if (this.vecSubsidios[i].getEntregado()) totSub += this.vecSubsidios[i].getMonto();     
    }
    return totSub;
  }
  
  public String toString() {
    String aux;
    aux = " Nombre: " + this.getNom() + ". Categoria: " + this.getCat() + ". Especialidad: " + this.getEspecialidad() + ". Total dinero entregado en subsidios: " + this.subDineroTot();
    return aux;
  }
}