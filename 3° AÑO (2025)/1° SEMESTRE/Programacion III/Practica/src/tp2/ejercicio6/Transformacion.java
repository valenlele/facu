package tp2.ejercicio6;

import tp2.ejercicio1.BinaryTree;

public class Transformacion {
	
  private BinaryTree<Integer> ab;
  
  public BinaryTree<Integer> getArbol() {
    return this.ab;
  }
  
  public void setArbol(BinaryTree<Integer> ab) {
    this.ab = ab;
  }
  
  public BinaryTree<Integer> suma() { 
	BinaryTree<Integer> abTransformado = new BinaryTree<Integer>();
    sumaRecursivo(this.getArbol(),abTransformado);  
    return abTransformado;
  }
  
  private static int sumaRecursivo(BinaryTree<Integer> ab, BinaryTree<Integer> abTransformado) {  
    if (ab!=null) {
      
      BinaryTree<Integer> aux = new BinaryTree<>();
      abTransformado.addLeftChild(aux);
      int izq = sumaRecursivo(ab.getLeftChild(),abTransformado.getLeftChild());
      
      aux = new BinaryTree<>();
      abTransformado.addRightChild(aux);
      int der = sumaRecursivo(ab.getRightChild(),abTransformado.getRightChild());
    	
      abTransformado.setData(izq + der);
      
      return ab.getData() + izq+ der;
    }
    
    return 0;
  }
  
}
