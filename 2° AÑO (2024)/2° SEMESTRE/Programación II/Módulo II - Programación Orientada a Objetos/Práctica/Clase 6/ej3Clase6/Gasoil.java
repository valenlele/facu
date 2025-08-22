public class Gasoil extends Surtidor {
  private String vecPatentes[] = new String[20];
  private int dimF;
  
  public Gasoil (int nroSurtidor, double impTot, int dni, String nombre, String apellido, String[] vecPatentes, int dimF) {
    super(nroSurtidor,impTot,dni,nombre,apellido);
    this.setVecPatentes(vecPatentes);
    this.setDimF(dimF);
  }
  
  public Gasoil () {
    
  }
  
  public String[] getVecPatentes() {
    return vecPatentes;
  }
  
  public int getDimF() {
    return dimF;
  }
  
  public void setVecPatentes (String [] vecPatentes) {
    this.vecPatentes = vecPatentes;
  }
  
  public void setDimF(int dimF) {
    this.dimF = dimF;
  }
  
  public void calcularImpuestoAPagar () {
    if (this.getDimF()<=5) this.setImpTot(this.getImpTot()-((5*this.getImpTot())/100));   
    else if (this.getDimF()>5 && this.getDimF()<=15) this.setImpTot(this.getImpTot()-((3*this.getImpTot())/100));
    else if (this.getDimF()>15) this.setImpTot(this.getImpTot()-((1.5*this.getImpTot())/100));
  }
  
  @Override
  public String toString () {
    String aux;
    aux = super.toString() + ". Numero de vehiculos atendidos: " + this.getDimF() + ". Patentes de vehiculos atendidos: ";
    for (int i=0;i<this.getDimF();i++) {
      aux += vecPatentes[i] + " ";
    }
    return aux;
  }
}