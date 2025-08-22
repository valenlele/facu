public class Balanza {
  int monto,cantItems;
  
  public int getMonto() {
    return monto;
  }
  
  public int getCantItems() {
    return cantItems;
  }
  
  public void setMonto(int unMonto) {
    monto = unMonto;  
  }
  
  public void setCantItems(int unCantItems) {
    cantItems = unCantItems;  
  }
  
  public String toString() {
    return ("El monto total de la compra es: " + monto + ". La cantidad total de items comprados es: " + cantItems);
  }
}