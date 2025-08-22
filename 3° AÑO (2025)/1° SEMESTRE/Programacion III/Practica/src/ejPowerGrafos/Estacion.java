package ejPowerGrafos;

public class Estacion {
  private String estacion;
  private int cantTrasbordos;
public Estacion(String estacion, int cantTrasbordos) {
	super();
	this.estacion = estacion;
	this.cantTrasbordos = cantTrasbordos;
}
public String getEstacion() {
	return estacion;
}
public void setEstacion(String estacion) {
	this.estacion = estacion;
}
public int getCantTrasbordos() {
	return cantTrasbordos;
}
public void setCantTrasbordos(int cantTrasbordos) {
	this.cantTrasbordos = cantTrasbordos;
}
  
  
}
