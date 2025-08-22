public class ReservaGrupal extends Reserva {
  private int [] vecDnis;
  private int dimL;
  
  public ReservaGrupal(int nroReserva, String aeroOrigen, String aeroDestino, String fecha, double imp) {
    super(nroReserva,aeroOrigen,aeroDestino,fecha,imp);
    this.vecDnis = new int[30];
    this.dimL = 0;
  }
  
  public ReservaGrupal() {
      
  }
  
  public void agregarPasajero(int dni) {
    if (dimL<30) {
      vecDnis[this.dimL] = dni;
      this.dimL++;
    }
  }
  
  public void aplicarPromocion () {
    if (this.dimL<6) {
      setImp(getImp()-((6*getImp())/100));
    }
  }
  
  public String toString() {
    String aux;
    aux = super.toString() + "Listado DNI's pasajeros: ";
    for (int i=0; i<dimL; i++) {
      aux += vecDnis[i] + " ";
    }
    return aux;
  }
}