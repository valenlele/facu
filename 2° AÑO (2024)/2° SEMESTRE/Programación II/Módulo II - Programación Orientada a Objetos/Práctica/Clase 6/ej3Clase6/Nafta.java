public class Nafta extends Surtidor {
  private double cantLitros;
  
  public Nafta (int nroSurtidor, double impTot, int dni, String nombre, String apellido, double cantLitros) {
    super(nroSurtidor,impTot,dni,nombre,apellido);
    this.setCantLitros(cantLitros);
  }
  
  public Nafta () {
      
  }
  
  public double getCantLitros() {
    return cantLitros;
  }
  
  public void setCantLitros (double cantLitros) {
    this.cantLitros = cantLitros;
  }
  
  public void calcularImpuestoAPagar () {
    double porcLitros = 2*this.getCantLitros();;
    this.setImpTot(this.getImpTot()-((porcLitros*this.getImpTot())/100));
  }
  
  @Override
  public String toString() {
    String aux;
    aux = super.toString() + ". Cantidad de litros para proveer durante el dia: " + this.getCantLitros();
    return aux;
  }
}