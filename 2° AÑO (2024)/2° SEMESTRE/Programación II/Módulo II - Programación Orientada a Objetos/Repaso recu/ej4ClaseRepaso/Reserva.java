public abstract class Reserva {
  private int nroReserva;
  private String aeroOrigen,aeroDestino,fecha;
  private double imp;
  
  public Reserva (int nroReserva, String aeroOrigen, String aeroDestino, String fecha, double imp) {
    this.setNroReserva(nroReserva);
    this.setAeroOrigen(aeroOrigen);
    this.setAeroDestino(aeroDestino);
    this.setFecha(fecha);
    this.setImp(imp);
  }
  
  public Reserva () {
    
  }
  
  public int getNroReserva() {
    return nroReserva;
  }
  
  public String getAeroOrigen() {
    return aeroOrigen;
  }
  
  public String getAeroDestino() {
    return aeroDestino;
  }
  
  public String getFecha() {
    return fecha;
  }
  
  public double getImp() {
    return imp;
  }
  
  public void setNroReserva(int nroReserva) {
    this.nroReserva = nroReserva;
  }
  
  public void setAeroOrigen(String aeroOrigen) {
    this.aeroOrigen = aeroOrigen;
  }
  
  public void setAeroDestino(String aeroDestino) {
    this.aeroDestino = aeroDestino;
  }
  
  public void setFecha(String fecha) {
    this.fecha = fecha;
  }
  
  public void setImp(double imp) {
    this.imp = imp;
  }
  
  public abstract void aplicarPromocion ();
  
  @Override         
  public String toString() {
    String aux;
    aux = "Nro reserva: " + this.getNroReserva() + ". Aeropuerto de origen: " + this.getAeroOrigen() + ". Aeropuerto de destino: " + this.getAeroDestino() + ". Fecha: " + this.getFecha() + ". Importe: " + this.getImp() + " ";   
    return aux;
  }
}