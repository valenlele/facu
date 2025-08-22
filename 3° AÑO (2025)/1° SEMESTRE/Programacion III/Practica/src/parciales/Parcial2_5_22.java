package parciales;

import tp2.ejercicio1.*;
import java.util.List;
import java.util.ArrayList;

public class Parcial2_5_22 {

  private BinaryTree<Integer> ab;	
  
  public Parcial2_5_22(BinaryTree<Integer> ab) {
    this.ab = ab;	  
  }
  
  public Parcial2_5_22() {
	  
  }

  public BinaryTree<Integer> getAb() {
    return ab;
  }

  public void setAb(BinaryTree<Integer> ab) {
	this.ab = ab;
  }
  
  public List<BinaryTree<Integer>> procesar() {
    return procesarRecursivo(this.ab);
  }
  
  private List<BinaryTree<Integer>> procesarRecursivo(BinaryTree<Integer> ab) {
    List<BinaryTree<Integer>> lista = new ArrayList<>();  
    
    if (ab != null) {
      if ((ab.hasLeftChild() && ab.hasRightChild()) && (ab.getLeftChild().getData() <= ab.getRightChild().getData())) {
        lista.add(ab);	  
      }
      lista.addAll(procesarRecursivo(ab.getLeftChild()));
      lista.addAll(procesarRecursivo(ab.getRightChild()));     
      //addAll porque el metodo puede devolver una lista
    }
    
    return lista;
  }
 
	
}
