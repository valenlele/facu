package parciales;

import tp2.ejercicio1.*;

public class Parcial23_5_22 {

  private BinaryTree<Character> ab;	

  public int procesar(int k) {
    return this.procesarRecursivo(ab, k, 0);
  }
  
  private int procesarRecursivo(BinaryTree<Character> ab, int k, int cantHijos) {
	if (ab == null) return 0;  
	  
    if (ab.isLeaf()) {
      if (cantHijos == k) return 1;
      return 0;
    }
    
    else {
      int cantArboles = 0;
      if (this.tieneUnSoloHijo(ab)) cantHijos++;
      cantArboles += procesarRecursivo(ab.getLeftChild(),k,cantHijos);
      cantArboles += procesarRecursivo(ab.getRightChild(),k,cantHijos);
      
      return cantArboles;
    }
  }
  
  private boolean tieneUnSoloHijo(BinaryTree<Character> ab) {
    return ((ab.hasLeftChild() && !ab.hasRightChild()) || (!ab.hasLeftChild() && ab.hasRightChild()));  
  }
  
}
