public class Entrenador {
    private String nombre;
    private int sueldoB;
    private int cantCamp; 

    public String getNombre() {
        return nombre;
    }
    
    public int getSueldoB() {
        return sueldoB;
    }

    public int getcantCamp() {
        return cantCamp;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public void setSueldoB(int unSueldoB) {
        sueldoB = unSueldoB;
    }

    public void setCantCamp(int unaCantCamp) {
        cantCamp = unaCantCamp;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi sueldo basico es " + sueldoB + " y tengo " + cantCamp + " campeonatos ganados.";
        return aux;
    }    
}
