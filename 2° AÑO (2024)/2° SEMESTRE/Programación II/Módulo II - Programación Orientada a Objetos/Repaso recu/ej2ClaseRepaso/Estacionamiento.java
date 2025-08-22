public class Estacionamiento {
  private String nombre,direc,hApertura,hCierre;
  private int pisos,plazas;
  private Auto [][] matrizPos;
  private boolean [][] ocupados;
  
  public Estacionamiento (String nombre, String direc) {
    this.setNombre(nombre);
    this.setDirec(direc);
    this.setHApertura("8:00");
    this.setHCierre("21:00");
    this.setPisos(5);
    this.setPlazas(10);
    this.matrizPos = new Auto[5][10];
    this.ocupados = new boolean[5][10];
  }
  
  public Estacionamiento (String nombre, String direc, String hApertura, String hCierre, int pisos, int plazas) {
    this.setNombre(nombre);
    this.setDirec(direc);
    this.setHApertura(hApertura);
    this.setHCierre(hCierre);
    this.setPisos(pisos);
    this.setPlazas(plazas);
    this.matrizPos = new Auto[pisos][plazas];
    this.ocupados = new boolean[pisos][plazas];
  }
  
  public Estacionamiento () {
      
  }
  
  public String getNombre() {
    return nombre;
  }
  
  public String getDirec() {
    return direc;
  }
  
  public String getHApertura() {
    return hApertura;
  }
  
  public String getHCierre() {
    return hCierre;
  }
  
  public int getPisos() {
    return pisos;
  }
  
  public int getPlazas() {
    return plazas;
  }
  
  public void setNombre(String nombre) {
    this.nombre = nombre;
  }
  
  public void setDirec(String direc) {
    this.direc = direc;
  }
  
  public void setHApertura(String hApertura) {
    this.hApertura = hApertura;
  }
  
  public void setHCierre(String hCierre) {
    this.hCierre = hCierre;
  }
  
  public void setPisos(int pisos) {
    this.pisos = pisos;
  }
  
  public void setPlazas(int plazas) {
    this.plazas = plazas;
  }
    
  public void registrarAuto(Auto A, int piso, int plaza) {
    this.matrizPos[piso-1][plaza-1] = A;   
    this.ocupados[piso-1][plaza-1] = true;
  }
  
  public String estaEnEstacionamiento (String patente) {
    String pos;
    int i = 0;
    int j = 0;
    while ((i<pisos) && (this.ocupados[i][j]) && (!this.matrizPos[i][j].getPatente().equals(patente))) {
      while ((j<plazas) && (this.ocupados[i][j]) && (!this.matrizPos[i][j].getPatente().equals(patente))) j++;
      i++;
    }
    if (this.matrizPos[i][j].getPatente().equals(patente)) pos = "El auto esta en el piso: " + i + " plaza: " + j;
    else pos = "Auto inexsistente";
    return pos;
  }
  
  public String toString() {
    String rep="";
    for (int i=0; i<this.getPisos(); i++) {
      for (int j=0; j<this.getPlazas(); j++) {
        rep += "Piso " + i + " Plaza " + j + ": ";
        if (this.ocupados[i][j]==false) rep += "libre";
        else rep += this.matrizPos[i][j].toString();
      }
    }
    return rep;
  }
  
  public int obtenerAutosPorPlaza (int plaza) {
    int cant=0;
    for (int i=0; i<this.getPisos(); i++) {
      if (this.ocupados[i][plaza-1]) cant++;
    }
    return cant;
  }
}