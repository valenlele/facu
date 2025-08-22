public class Gira extends Recital {
  private String nombre;
  private Fecha [] vecFechas;
  private int cantFechas,dimL,act;
  
  public Gira(String nomBanda, int cantTemas, String nombre, int cantFechas) {
    super(nomBanda,cantTemas); 
    this.setNombre(nombre);
    this.setCantFechas(cantFechas);
    this.vecFechas = new Fecha [cantFechas];
    this.dimL = 0;
    this.act = 0;
  }
  
  public Gira() {
    
  }
  
  public String getNombre() {
    return nombre;
  }
  
  public int getCantFechas() {
    return cantFechas;
  }
  
  public void setNombre(String nombre) {
    this.nombre = nombre;
  }
  
  public void setCantFechas(int cantFechas) {
    this.cantFechas = cantFechas;
  }
  
  public void agregarFecha(Fecha f) {
    if (this.dimL<cantFechas) {
      this.vecFechas[this.dimL] = f;
      this.dimL++;
    }
  }
  
  public String actuar() {
    String aux="";
    aux = "Buenas noches " + vecFechas[act].getCiudad() + super.actuar();
    act++;
    return aux;
  }
  
  public double calcularCosto() {
    double costo=0;
    for (int i=0; i<dimL; i++) {
      costo += 30000;
    }
    return costo;
  }
}