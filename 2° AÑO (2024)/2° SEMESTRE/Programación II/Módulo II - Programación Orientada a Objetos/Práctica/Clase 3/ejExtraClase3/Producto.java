public class Producto {
  private int cod,un;
  private String nombre,desc,marca;
  
  public int getCod() {
        return cod;
    }
    
  public String getNombre() {
        return nombre;
    }
  
  public String getDesc() {
        return desc;
    }
    
  public String getMarca() {
        return marca;
    }
    
  public int getUn() {
        return un;
    }
    
  public void setCod(int unCod) {
        cod = unCod;
    } 
    
  public void setNombre(String unNombre) {
        nombre = unNombre;
    } 
    
  public void setDesc(String unaDesc) {
        desc = unaDesc;
    } 
    
  public void setMarca(String unaMarca) {
        marca = unaMarca;
    } 
    
  public void setUnidades(int unaUn) {
        un = unaUn;
    } 
    
  public String toString(){
        String aux; 
        aux = "Atributos producto. Codigo " + cod + ". Nombre: " + nombre + ". Descripcion: " + desc + ". Marca: " + marca + ". Unidades disponibles: " + un;
        return aux;
  }
}