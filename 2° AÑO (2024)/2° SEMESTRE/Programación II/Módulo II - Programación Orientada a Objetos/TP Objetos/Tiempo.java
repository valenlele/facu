public class Tiempo{
   private int horas;
   private int minutos;
   
   public Tiempo (int horas,int minutos){
       this.horas=horas;
       this.minutos=minutos;
   }
   
   public Tiempo(){
       
   }
   
   public int getHoras(){
       return horas;
   }
   
   public int getMinutos(){
       return minutos;
   }
   
   public void setHoras(int horas){
       this.horas=horas;
   }
   
   public void setMiuntos(int minutos){
       this.minutos=minutos;
   }
}