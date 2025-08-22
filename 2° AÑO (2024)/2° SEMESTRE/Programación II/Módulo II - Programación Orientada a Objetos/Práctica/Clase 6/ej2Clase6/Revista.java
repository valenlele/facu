public class Revista extends Ejemplar {
  private String nombre;
  private int numVol;
  private int cantArt;
  
  public Revista (String cod, int cantPag, String resumen, int año, Responsable resp, String nombre, int numVol, int cantArt) {
    super (cod,cantPag,resumen,año,resp);
    this.setNombre(nombre);
    this.setNumVol(numVol);
    this.setCantArt(cantArt);
  }
  
  public Revista () {

  }
  
   public String getNombre() {
    return nombre;
  }
  
  public int getNumVol() {
    return numVol;
  }
  
  public int getCantArt() {
    return cantArt;
  }
  
  public void setNombre(String nombre) {
    this.nombre = nombre;
  }
  
  public void setNumVol (int numVol) {
    this.numVol = numVol;
  }
  
  public void setCantArt(int cantArt) {
    this.cantArt = cantArt;
  }
  
  public String toString () {
    String aux;
    aux = "Nombre: " + this.getNombre() + ", numero de volumen: " + getNumVol() ;
    return aux;
  }
}