public class Jugador {
    private String nombre;
    private int DNI,edad,part,goles;

    public String getNombre() {
        return nombre;
    }    
    
    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public int getPart() {
        return part;
    }    
    
    public int getGoles() {
        return goles;
    }    
    
    public void setNombre(String unNombre) {
        nombre = unNombre;
    }    
    
    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }
    
    public void setPart(int unaPart) {
        part = unaPart;
    }    
    
    public void setGoles(int unaGoles) {
        goles = unaGoles;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " tengo " + edad + " años. Tengo " + part + " partidos jugados y " + goles + " goles anotados";  ;
        return aux;
    }    
}
