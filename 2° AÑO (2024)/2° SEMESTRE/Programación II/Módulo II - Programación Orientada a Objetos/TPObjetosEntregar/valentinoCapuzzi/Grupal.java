public class Grupal extends Visita {
  private String lugar,tDoc;
  private int nroDoc,dimL;
  private int [] vecEdad;
  
  public Grupal(int nroVisita, int dia, int mes, int año, boolean ingresoEgreso, String lugar, String tDoc, int nroDoc) {
    super(nroVisita,dia,mes,año,ingresoEgreso);
    this.setLugar(lugar);
    this.setTDoc(tDoc);
    this.setNroDoc(nroDoc);
    this.vecEdad = new int[6];
    this.dimL = 0;
  }
  
  public Grupal() {
 
  }
  
  public String getLugar() {
    return lugar;
  }
  
  public String getTDoc() {
    return tDoc;
  }
  
  public int getNroDoc() {
    return nroDoc;
  }
  
  public void setLugar(String lugar) {
    this.lugar = lugar;
  }
  
  public void setTDoc(String tDoc) {
    this.tDoc = tDoc;
  }
  
  public void setNroDoc(int NroDoc) {
    this.nroDoc = nroDoc;
  }
  
  public void agregarEdad(int edad) {
    if (this.dimL<6) {
      vecEdad[this.dimL] = edad;
      this.dimL++;
    }
  }
  
  public double costoVisita() {
    double costo = 0, porcTotMay = 0, porcTotMen = 0;
    int cantMay = 0, cantMen = 0;
    for (int i=0;i<this.dimL;i++) {
      if (this.vecEdad[i]>=18) {
        costo += 8000;
        cantMay++;
      }
      else if (this.vecEdad[i]<18) {
        costo += 2500;
        cantMen++;
      }
    }
    if (this.dimL>4) {
      porcTotMay += cantMay*7.5;
      costo += (porcTotMay*costo)/100;
      porcTotMen += cantMen*5;
      costo += (porcTotMen*costo)/100;
    }
    if (getIngresoEgreso()) {
      if ((this.lugar.equals("chile")) || (this.lugar.equals("paraguay")) || (this.lugar.equals("bolivia")) || (this.lugar.equals("brasil")) || (this.lugar.equals("uruguay"))) {
        costo -= (12.5*costo)/100;    
      }
      if ((this.lugar.equals("colombia")) || (this.lugar.equals("peru")) || (this.lugar.equals("ecuador")) || (this.lugar.equals("venezuela"))) {
        costo += 1000*this.dimL;    
      }
    }
    super.calcularAdicional(costo);
    return costo;
  }
  
  public String toString() {
    String aux="";
    aux += super.toString();
    if (!getIngresoEgreso()) {
      aux += "Ingresan desde: " + this.getLugar();  
    }
    else {
      aux += "Egresan desde: " + this.getLugar();   
    }
    aux += "Tipo de documento: " + this.getTDoc() + ". Numero documento: " + this.getNroDoc() + "Edades: ";
    for (int i=0;i<this.dimL;i++) {
      aux += this.vecEdad[i] + " ";  
    }
    return aux;
  }
}