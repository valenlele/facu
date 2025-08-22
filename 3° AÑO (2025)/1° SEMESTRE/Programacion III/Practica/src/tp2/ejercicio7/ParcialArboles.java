package tp2.ejercicio7;

import tp2.ejercicio1.*;

public class ParcialArboles {
  
  private BinaryTree<Integer> ab;
  
  public ParcialArboles(BinaryTree<Integer> ab) {
    this.ab = null;
  }
  
  public ParcialArboles() {
	  
  }
  
  public BinaryTree<Integer> getAb() {
    return this.ab;
  }

  public void setAb(BinaryTree<Integer> ab) {
    this.ab = ab;
  }
  
  public boolean isLeftTree(int num) {
    return this.isLeftTreeRecursivo(this.ab,num);    	
  }
  
  private boolean isLeftTreeRecursivo(BinaryTree<Integer> ab, int num) { //hacer funcion buscarNumero. funciones especificas
    if ((ab!=null) && (ab.getData()!=num)) {
      this.isLeftTreeRecursivo(ab.getLeftChild(),num);
      this.isLeftTreeRecursivo(ab.getRightChild(),num);
    }
    
    if (ab==null) return false;
    else {
      return (this.recorrerYcontarSubArbol(ab.getLeftChild()) > this.recorrerYcontarSubArbol(ab.getLeftChild()) ? true : false);   
    }
  }
  
  private int recorrerYcontarSubArbol(BinaryTree<Integer> ab) {
	int cont = 0;
    if (ab!=null) {
      if (this.tieneUnSoloHijo(ab)) cont ++;
      this.recorrerYcontarSubArbol(ab.getLeftChild());
      this.recorrerYcontarSubArbol(ab.getRightChild());
    }
    return cont;
  }
  
  private boolean tieneUnSoloHijo(BinaryTree<Integer> ab) {
    if (((ab.hasLeftChild()) && (!ab.hasRightChild())) || ((!ab.hasLeftChild()) && (ab.hasRightChild()))) return true;
    else return false;
  }
  
}
