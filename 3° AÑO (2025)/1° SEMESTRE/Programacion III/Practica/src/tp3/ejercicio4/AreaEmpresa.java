package tp3.ejercicio4;

public class AreaEmpresa {

  private String id;
  private int delayTransmision;	
	
  public AreaEmpresa(String id, int delayTransmision) {
    this.setId(id);
    this.setDelayTransmision(delayTransmision);
  }
  
  public AreaEmpresa() {
	  
  }
  
  public String getId() {
    return id;
  }
  public void setId(String id) {  
	this.id = id;
  }
  public int getDelayTransmision() {
	return delayTransmision;
  }
  public void setDelayTransmision(int delayTransmision) {
	this.delayTransmision = delayTransmision;
  }
  	
}
