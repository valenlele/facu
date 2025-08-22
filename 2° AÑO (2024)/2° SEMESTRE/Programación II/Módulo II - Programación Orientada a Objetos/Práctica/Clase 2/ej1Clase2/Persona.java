public class Persona {
    private String nombre;    //tres variables de instancia o atributos
    private int DNI;          //tienen private --> están encapsuladas. no se pueden acceder desde afuera
    private int edad;     
    
    //*dos constructores "Persona". inicializan variables de instancia con los valores que le enviamos en el mensaje de creación:
    
    //recibe parámetros. no viene por defecto a diferencia del de abajo. Lo tengo que escribir
    public Persona(String unNombre, int unDNI, int unaEdad){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
    }
    
    //genera un objeto vacío (no hace falta declararlo, se crea por defecto. PERO, si escribí el que esta arriba ya también quiero este sí lo tengo que escribir, ya que sino el de arriba lo "pisa")
    public Persona(){
     
    }

    //*métodos
    
    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    //"setters". me permiten modificar variables de instancia
    
    public void setDNI(int unDNI) {
        DNI = unDNI;
    }
    
    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }
    
    
    
    
}