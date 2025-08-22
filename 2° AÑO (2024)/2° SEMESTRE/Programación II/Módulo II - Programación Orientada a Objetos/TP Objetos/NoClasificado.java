public class NoClasificado extends Piloto{
    private int bestRanking;
    
    public NoClasificado(String nombre,String apellido, int ranking,int puntaje,int pos, int bestRanking){
        super(nombre,apellido,ranking,puntaje,pos);
        this.setBestRanking(bestRanking);
    }
    
    public NoClasificado(){
        
    }
    
    public int getBestRanking(){
        return bestRanking;
    }
    
    public void setBestRanking(int Ranking){
        this.bestRanking=bestRanking;
    }
    
    public void CalcularPuntaje(String lugar){
        super.CalcularPuntaje(lugar);
        if (getBestRanking()>=5){
            TablaPuntajesF1 Tabla=new TablaPuntajesF1();
            setPuntaje(getPuntaje()+(Tabla.obtenerPuntaje(getPos())+1));
        }
          
    }
    public String toString() {
      String aux;
      aux = super.toString() + getBestRanking();
      return aux;
    }
    
}