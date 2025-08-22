public class Embarcacion extends Vehiculo{
  private int rey;
  private String nom;
  private String tipo;
  private double eslora;
  private double peso;
  private double valor;
  
  public Embarcacion (int año, double imp, Propietario p, int rey, String nom, String tipo, double eslora, double peso, double valor) {
    super(año,imp,p);
    this.setRey(rey);
    this.setNom(nom);
    this.setTipo(tipo);
    this.setEslora(eslora);
    this.setPeso(peso);
    this.setValor(valor);
  }
  
  public Embarcacion () {
    
  }
  
  public int getRey() {
    return rey;
  }
  
  public String getNombre() {
    return nom;
  }
  
  public String getTipo() {
    return tipo;
  }
  
  public double getEslora() {
    return eslora;
  }
  
  public double getPeso() {
    return peso;
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
  
  public void setPeso(double peso) {
    this.peso = peso;
  }
  
  public void setValor(double valor) {
    this.valor = valor;
  }
  public double calcularCostosImpuestos(){
    double impuestos = 0;
    if (this.getValor()<6000) impuestos += ((4*this.getValor())/100);  
    else if ((this.getValor()>=6000) && (this.getValor()<=180000)) impuestos += ((2*this.getValor())/100);
    else if (this.getValor()>=180000) impuestos += ((5*this.getValor())/100); 
    return impuestos;
  }
}