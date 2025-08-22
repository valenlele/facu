public abstract class Piloto{
    private String nombre;
    private String apellido;
    private int ranking;
    private int puntaje;
    private int pos;
    
    public Piloto(String nombre,String apellido, int ranking,int puntaje,int pos){
        this.setNombre(nombre);
        this.setApellido(apellido);
        this.setRanking(ranking);
        this.setPuntaje(puntaje);
        this.setPos(pos);
    }
    
    public Piloto(){
        
    }
    
    public String getNombre  (){
        return nombre ;
    }

    public void setNombre  (String nombre ){
        this.nombre=nombre ;
    }

    public String getApellido(){
        return apellido;
    }

    public void setApellido(String apellido){
        this.apellido =apellido ;
    }
    
    public int getRanking(){
        return ranking;
    }
    
    public void setRanking(int ranking){
        this.ranking=ranking;
    }
    
    public int getPuntaje(){
        return puntaje;
    }
    
    public void setPuntaje(int puntaje){
        this.puntaje=puntaje;
    }
    
    public void setPos(int pos){
        this.pos=pos;
    }
    
    public int getPos(){
        return pos;
    }
    public void CalcularPuntaje(String lugar){
        
        if(lugar.equals("japon")||(lugar.equals("china"))){
            setPuntaje(3); //seria setPuntaje(getPuntaje()+3)
        }
        else if(lugar.equals("hungria")||(lugar.equals("belgica"))){
           setPuntaje(1); //seria setPuntaje(getPuntaje()+1)
        }
    }
    
    @Override
    public String toString() {
      String aux;
      aux =getNombre() + getApellido() + getPuntaje() + getPos();
      return aux;
    }
}