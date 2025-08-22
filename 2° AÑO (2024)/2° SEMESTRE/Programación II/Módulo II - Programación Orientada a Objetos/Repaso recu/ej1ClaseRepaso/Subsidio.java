public class Subsidio {
  private double monto;
  private String motivo;
  private boolean entregado;
  
  public Subsidio (double mont, String motivo) {
    this.setMonto(mont);
    this.setMotivo(motivo);
    this.entregado = false;
  }
  
  public Subsidio () {
      
  }
  
  public double getMonto() {
    return monto;
  }
  
  public String getMotivo() {
    return motivo;
  }
  
  public boolean getEntregado() {
    return entregado;
  }
  
  public void setMonto(double mont) {
    this.monto = mont;
  }
  
  public void setMotivo(String motivo) {
    this.motivo = motivo;
  }
  
  public void setEntregado(boolean entregado) {
    this.entregado = entregado;
  }
  
  public String toString() {
    String aux;
    aux = "Monto: " + this.getMonto() + "Motivo: " + this.getMotivo() + "Entregado: " + this.getEntregado();
    return aux;
  }
}