package parciales;

import java.util.List;

public class Valores {

  private List<Integer> lista;
  private int cantImapar;	
	
  public Valores(List<Integer> lista, int cantImapar) {
		super();
		this.lista = lista;
		this.cantImapar = cantImapar;
	}
  
    public Valores () {
    	
    }
   
public List<Integer> getLista() {
	return lista;
}
public void setLista(List<Integer> lista) {
	this.lista = lista;
}
public int getCantImapar() {
	return cantImapar;
}
public void setCantImapar(int cantImapar) {
	this.cantImapar = cantImapar;
}
	
}
