public class Entrenador extends Empleado {
  private int camp;
  
  public Entrenador (String nombre,int dni, double sueldoB, int camp) {
    super(nombre,dni,sueldoB);
    this.setCamp(camp);
  }
  
  public Entrenador () {
      
  }
  
  public int getCamp() {
    return this.camp;
  }
  
  public void setCamp(int camp) {
    this.camp = camp;  
  }
  
  public double calcularSueldoACobrar () {
    double sueldoTot=this.getSueldoB();
    if ((this.getCamp()>=1) && (this.getCamp()<=4)) sueldoTot+=5000;
    else if ((this.getCamp()>=5) && (this.getCamp()<=10)) sueldoTot+=30000;
    else if (this.getCamp()>=10) sueldoTot+=50000;
    return sueldoTot;
  }
  
  public String toString () {
    String aux;
    System.out.println("Entrenador: " + super.toString());
    aux = "Cantidad de campeonatos ganados: " + getCamp();
    return aux;
  }
}