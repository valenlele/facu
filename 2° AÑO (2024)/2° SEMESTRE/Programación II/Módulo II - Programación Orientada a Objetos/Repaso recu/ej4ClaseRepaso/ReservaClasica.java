public class ReservaClasica extends Reserva {
  private int dni,nroAsiento;
  
  public ReservaClasica (int nroReserva, String aeroOrigen, String aeroDestino, String fecha, double imp, int dni, int nroAsiento) {
    super(nroReserva,aeroOrigen,aeroDestino,fecha,imp);
    this.setDni(dni);
    this.setNroAsiento(nroAsiento);
  }
  
  public ReservaClasica () {
      
  }
  
  public int getDni() {
    return dni;
  }
  
  public int getNroAsiento() {
    return nroAsiento;
  }
  
  public void setDni(int dni) {
    this.dni = dni;
  }
  
  public void setNroAsiento(int nroAsiento) {
    this.nroAsiento = nroAsiento;
  }
  
  public void aplicarPromocion () {
    setImp(getImp()-((10*getImp())/100));
  }
  
  public String toString() {
    String aux;
    aux = super.toString() + "DNI pasajero: " + this.getDni() + ". Nro de asiento: " + this.getNroAsiento();   
    return aux;
  }
}