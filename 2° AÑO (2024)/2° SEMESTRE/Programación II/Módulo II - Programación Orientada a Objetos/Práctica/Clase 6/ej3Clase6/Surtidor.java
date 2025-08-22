public abstract class Surtidor {

  private int nroSurtidor;
  private double impTot;
  private int dni;
  private String nombre;
  private String apellido;

  public Surtidor (int nroSurtidor, double impTot, int dni, String nombre, String apellido) {
    this.setNroSurtidor(nroSurtidor); 
    this.setImpTot(impTot);
    this.setDni(dni);
    this.setNombre(nombre);
    this.setApellido(apellido);
  }

  public Surtidor () {
  }
  
  public int getNroSurtidor() {
    return nroSurtidor;
  }
  
  public double getImpTot() {
    return impTot;
  }
  
  public int getDni () {
    return dni;
  }
  
  public String getNombre() {
    return nombre;
  }
  
  public String getApellido() {
    return apellido;
  }
  
  public void setNroSurtidor(int nroSurtidor) {
    this.nroSurtidor = nroSurtidor;
  }
  
  public void setImpTot(double impTot) {
    this.impTot = impTot;
  }
  
  public void setDni(int dni) {
    this.dni = dni;
  }
  
  public void setNombre(String nombre) {
    this.nombre = nombre;
  }
  
  public void setApellido(String apellido) {
    this.apellido = apellido;
  }
  
  public abstract void calcularImpuestoAPagar();
  
  @Override
  public String toString () {
    String aux;
      aux = "Numero de surtidor: " + this.getNroSurtidor() + ". Importe total facturado en el dia: " + this.getImpTot() + ". DNI, nombre y apellido del playero que administro el surtidor: " + this.getDni() + ", " + this.getNombre() + ", " + this.getApellido();
    return aux;
  }
 } 
  
