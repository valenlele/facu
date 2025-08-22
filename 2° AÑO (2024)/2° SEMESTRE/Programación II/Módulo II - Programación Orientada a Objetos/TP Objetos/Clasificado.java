public class Clasificado extends Piloto{
    private Tiempo T;
    
    public Clasificado(String nombre,String apellido, int ranking,int puntaje,int pos,Tiempo T){
        super( nombre,apellido, ranking, puntaje,pos);
        this.setTiempo(T);
    }
    
    public Clasificado(){
        
    }
    
    public Tiempo getTiempo  (){
        return T ;
    }

    public void setTiempo  (Tiempo T ){
        this.T=T ;
    }
    
    public void CalcularPuntaje(String lugar){
        super.CalcularPuntaje(lugar);
        TablaPuntajesF1 Tabla=new TablaPuntajesF1();
        if ((getTiempo().getHoras()==1)){
           if((getTiempo().getMinutos()>=0)&& (getTiempo().getMinutos()<5)){
               setPuntaje(Tabla.obtenerPuntaje(getPos())+2);  //falta getPuntaje()
           }
           else if ((getTiempo().getMinutos()>=5)&& (getTiempo().getMinutos()<=8)){
              setPuntaje(getPuntaje()+(Tabla.obtenerPuntaje(getPos())+1));
           }
           
        }
    }
    
    public String toString() {
      String aux;
      aux = super.toString() + getTiempo();
      return aux;
    }
    
}