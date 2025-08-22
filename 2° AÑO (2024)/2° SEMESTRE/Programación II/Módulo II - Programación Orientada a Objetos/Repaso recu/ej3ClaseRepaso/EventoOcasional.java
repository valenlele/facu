public class EventoOcasional extends Recital {
  private String motivo,nomContratante,diaEvento;
  
  public EventoOcasional(String nomBanda, int cantTemas, String motivo, String nomContratante, String diaEvento) {
    super(nomBanda,cantTemas); 
    this.setMotivo(motivo);
    this.setNomContratante(nomContratante);
    this.setDiaEvento(diaEvento);
  }
  
  public EventoOcasional() {
    
  }
  
  public String getMotivo() {
    return motivo;
  }
  
  public String getNomContratante() {
    return nomContratante;
  }
  
  public String getdiaEvento() {
    return diaEvento;
  }
  
  public void setMotivo(String motivo) {
    this.motivo = motivo;
  }
  
  public void setNomContratante(String nomContratante) {
    this.nomContratante = nomContratante;
  }
  
  public void setDiaEvento(String diaEvento) {
    this.diaEvento = diaEvento;
  }
  
  public String actuar() {
    String aux="";
    if (motivo.equals("show de beneficiencia")) {
      aux += "Recuerden colaborar con " + nomContratante;
    }
    else if (motivo.equals("show de tv")) {
      aux += "Saludos amigos televidentes ";
    }
    super.actuar();
    return aux;
  }
  
  public double calcularCosto() {
    double costo=0;
    if (motivo.equals("show de tv")) costo = 50000;
    return costo;
  }
}