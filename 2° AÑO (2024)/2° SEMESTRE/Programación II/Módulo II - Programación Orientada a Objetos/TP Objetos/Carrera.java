public class Carrera{
    private String lugar;
    private Piloto vecPiloto[]= new Piloto[10];
    
    public Carrera(String lugar,Piloto[] vecPiloto){
        this.setLugar(lugar);
        this.setVecPiloto(vecPiloto);
    }
    
    public Carrera(){
        
    }
    
    public String getLugar(){
        return lugar;
    }

    public void setLugar(String lugar){
        this.lugar =lugar ;
    }
    
    public Piloto[] getVecPiloto(){
        return vecPiloto;
    }

    public void setVecPiloto(Piloto[] vecPiloto){
        this.vecPiloto =vecPiloto ;
    }
    
    @Override
    public String toString() {
      String aux;
      aux = "Lugar: " + getLugar() + "Pilotos: ";
      for (int i=0;i<10;i++) {
        aux += vecPiloto[i].toString();
      }
      return aux;
    }
    
}
