public abstract class Empleado {
  private String nombre;
  private int dni;
  private double sueldoB;
  
  public Empleado (String nombre, int dni, double sueldoB) {
    this.setNombre(nombre);
    this.setDni(dni);
    this.setSueldoB(sueldoB);
  }
  
  public Empleado () {

  }
  
  public String getNombre() {
    return this.nombre;  
  }
  
  public int getDni() {
    return this.dni;  
  }
  
  public double getSueldoB() {
    return this.sueldoB;  
  }
  
  public void setNombre(String nombre) {
    this.nombre = nombre;
  }
  
  public void setDni(int dni) {
    this.dni = dni;
  }
  
  public void setSueldoB(double sueldoB) {
    this.sueldoB = sueldoB;
  }
  
  public String toString () {
    String aux;
    aux = "Nombre: " + this.getNombre() + ". Sueldo basico: " + this.getSueldoB();  
    return aux;
  }
  
  abstract double calcularSueldoACobrar();
}