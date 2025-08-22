public class ProcesarBalanza {
  Balanza b = new Balanza();  
  int monto,cantItems;
    
  public void iniciarCompra() {
    monto = 0;
    cantItems = 0;
    b.setMonto(monto);
    b.setCantItems(cantItems);
    System.out.println(b.toString());
  }
  
  public void registrarProducto(int unPesoEnKg, int unPrecioPorKg){
    int monto,cantItems;
    monto = b.getMonto();
    cantItems = b.getCantItems();
    b.setMonto(monto+(unPesoEnKg*unPrecioPorKg));
    b.setCantItems(cantItems+1);
  }
  
  public String devolverResumenDeCompra() {
    return ("Total a pagar " + b.getMonto() + " por la compra de " + b.getCantItems() + " productos.");
  }
}