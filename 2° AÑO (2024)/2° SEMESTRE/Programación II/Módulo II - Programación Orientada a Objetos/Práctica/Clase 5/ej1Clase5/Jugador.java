public class Jugador extends Empleado {
  private int part;
  private int goles;
  
  public Jugador (String nombre,int dni, double sueldoB, int part, int goles) {
    super(nombre,dni,sueldoB);
    this.setPart(part);
    this.setGoles(part);
  }
  
  public Jugador () {
      
  }
  
  public int getPart() {
    return this.part;
  }
  
  public int getGoles() {
    return this.goles;
  }
  
  public void setPart(int part) {
    this.part = part;  
  }
  
  public void setGoles(int goles) {
    this.goles = goles;  
  }
  
  public double calcularSueldoACobrar () {
    double sueldoTot=this.getSueldoB();
    if (this.getGoles()/this.getPart()>0.5) sueldoTot+=sueldoTot;
    return sueldoTot;
  }
  
  public String toString () {
    String aux;
    System.out.println("Jugador: " + super.toString());
    aux = "Cantidad de goles: " + getGoles() + ". Partidos jugados: " + getPart();
    return aux;
  }
}