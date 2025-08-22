package tp3.ejercicio1;

import java.util.List;
import java.util.LinkedList;
import tp1.ejercicio8.*;

public class GeneralTree<T> {

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>();

	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}
	
	public GeneralTree() {
		
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}

	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}

	public boolean hasChildren() {
		return children != null && !children.isEmpty();
	}

	public boolean isEmpty() {
		return this.data == null && !hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren()) {
			List<GeneralTree<T>> children = this.getChildren();
			if (children.contains(child))
				children.remove(child);
		}
	}

	public int altura () {     //hacer encolando null en vez de usar otra cola
	  int alt = 0;
	  GeneralTree<T> abAux;    
	  Queue<GeneralTree<T>> cola = new Queue<>();
	  Queue<GeneralTree<T>> altSig = new Queue<>();
	  
	  cola.enqueue(this);
	  
	  while (!cola.isEmpty()) {
	    while (!cola.isEmpty()) {
	      abAux = cola.dequeue();	    
		  List<GeneralTree<T>> children = abAux.getChildren();
		  for (GeneralTree<T> child: children) {
		    altSig.enqueue(child);
		  }
        }
	    alt++;
	    cola = altSig;
	    altSig = new Queue<>();
	  }
	  
	  return alt;	
	}
	
	public int nivel(T dato) {
	  int prof = 0;
	  GeneralTree<T> abAux;    
	  Queue<GeneralTree<T>> cola = new Queue<>();
	  Queue<GeneralTree<T>> altSig = new Queue<>();
	  
	  cola.enqueue(this);
		  
	  while (!cola.isEmpty()) {
	    while (!cola.isEmpty()) {
	      abAux = cola.dequeue();
	      if (abAux.getData() == dato) {
	        return prof;  	  
	      }
	      List<GeneralTree<T>> children = abAux.getChildren();
		  for (GeneralTree<T> child: children) {
		    altSig.enqueue(child);
		  }
	    }
	    prof++;
	    cola = altSig;
	    altSig = new Queue<>();
	  }
	  return -1;
	}
	
	public int ancho() {
	  int cantNodos;
	  int maxNodos = -1;
	  GeneralTree<T> abAux;    
	  Queue<GeneralTree<T>> cola = new Queue<>();
	  Queue<GeneralTree<T>> altSig = new Queue<>();
		  
	  cola.enqueue(this);
		  
	  while (!cola.isEmpty()) {
	    cantNodos = 0;
	    while (!cola.isEmpty()) {
		  abAux = cola.dequeue();
		  cantNodos++;
		  List<GeneralTree<T>> children = abAux.getChildren();
		  for (GeneralTree<T> child: children) {
		    altSig.enqueue(child);
	      }
	    }
		cola = altSig;
		altSig = new Queue<>();
		if (cantNodos>maxNodos) {
		  maxNodos = cantNodos;	
		}
	  }
		  
      return maxNodos;		  
	}
	
	public boolean esAncestro(T a, T b) {
	  GeneralTree<T> nodoA = buscarNodo(this,a);
	  if (nodoA!=null) {
	    return buscarNodo(nodoA,b) != null;	  
	  }
	  else return false;
	}
	
	private GeneralTree<T> buscarNodo(GeneralTree<T> ag, T dato) {
      if (ag.getData().equals(dato)) return ag;
      else {
        for (GeneralTree<T> child : ag.getChildren()) {
          GeneralTree<T> resultado = buscarNodo(child,dato);  
          if (resultado != null) return resultado;  //una vez que encuentro el nodo corto con el for y devuelvo el nodo
        }
      }
      return null;  //retorno null cuando llego a una hoja y no enontre el dato
	}

}
