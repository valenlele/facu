public class Embarcacion extends Vehiculo{
  private int rey;
  private String nom,tipo;
  private double eslora,ton,valor;
  
  public Embarcacion (int año, double impBasico, Propietario p, int rey, String nom, String tipo, double eslora, double ton, double valor) {
    super(año,impBasico,p);
    this.setRey(rey);
    this.setNom(nom);
    this.setTipo(tipo);
    this.setEslora(eslora);
    this.setTon(ton);
    this.setValor(valor);
  }
  
  public Embarcacion () {
      
  }
  
  public int getRey() {
    return rey;
  }
  
  public String getNom() {
    return nom;
  }
  
  public String getTipo() {
    return tipo;
  }
  
  public double getEslora() {
    return eslora;
  }
  
  public double getTon() {
    return ton;
  }
  
  public double getValor() {
    return valor;
  }
  
  public void setRey(int rey) {
    this.rey = rey;
  }
  
  public void setNom(String nom) {
    this.nom = nom;
  }
  
  public void setTipo(String tipo) {
    this.tipo = tipo;
  }
  
  public void setEslora(double eslora) {
    this.eslora = eslora;
  }
  
  public void setTon(double ton) {
    this.ton = ton;
  }
  
  public void setValor(double valor) {
    this.valor = valor;
  }
  
  public double calcularTotImpuesto() {
    double totImp = this.getImpBasico();
    if (this.getValor()<6000) totImp += ((4*this.getValor())/100);
    else if ((this.getValor()>=6000) && (this.getValor()<=180000)) totImp += ((2*this.getValor())/100);
    else if (this.getValor()>=180000) totImp += ((5*this.getValor())/100);
    return totImp;
  }
}