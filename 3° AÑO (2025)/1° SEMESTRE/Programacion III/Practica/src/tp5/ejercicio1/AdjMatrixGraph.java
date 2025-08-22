package tp5.ejercicio1;

import java.util.List;
import java.util.ArrayList;

public class AdjMatrixGraph<T> implements Graph<T> {
  private static final int EMPTY_VALUE = 0;
  private int maxVertices;
  private List<AdjMatrixVertex<T>> vertices;
  private int[][] adjMatrix;
  
  public AdjMatrixGraph(int maxVertices) {
    this.maxVertices = maxVertices;	  
    this.vertices = new ArrayList<>();
    this.adjMatrix = new int[maxVertices][maxVertices];
  }
  
  @Override
  public Vertex<T> createVertex(T data) {
    if (vertices.size() == this.maxVertices) {
      return null;	
    }
    AdjMatrixVertex<T> vertice = new AdjMatrixVertex<>(data, vertices.size());
    vertices.add(vertice);
    return vertice;
  }
  
  @Override
  public void removeVertex(Vertex<T> vertex) {
  	
  	if (!vertices.remove(vertex)) {
  		// el vértice no está en el grafo
  		return;
  	}

      int index = vertex.getPosition();
      int total = vertices.size();
      // Elimino la fila
      for (int fila = index; fila < total; fila++) {
          adjMatrix[fila] = adjMatrix[fila + 1];
      }
      // Elimino la columna
      for (int fila = 0; fila < total; fila++) {
          for (int col = index; col < total; col++) {
              adjMatrix[fila][col] = adjMatrix[fila][col + 1];
          }
      }
      // Reasigno las posiciones
      for (int fila = index; fila < total; fila++) {
          vertices.get(fila).decrementPosition();
      }
      // Limpio la ultima fila
      for (int col = 0; col < total; col++) {
          adjMatrix[total][col] = EMPTY_VALUE;
      }
      // Limpio la ultima columna
      for (int fila = 0; fila < total; fila++) {
          adjMatrix[fila][total] = EMPTY_VALUE;
      }
  }
  
  @Override
	public Vertex<T> search(T data) {
		for (Vertex<T> vertice : this.vertices) {
			if (vertice.getData().equals(data)) {
				return vertice;
			}
		}
		return null;
	}
  
	/**
	 * Indica si el vértice recibido pertenece al grafo.
	 */
	private boolean belongs(Vertex<T> vertex) {
		int pos = vertex.getPosition();
		return pos >= 0 && pos < this.vertices.size() 
			&& this.vertices.get(pos) == vertex;
	}

  @Override
  public void connect(Vertex<T> origin, Vertex<T> destination) {
  	connect(origin, destination, 1);
  }

  @Override
  public void connect(Vertex<T> origin, Vertex<T> destination, int weight) {
  	if (this.belongs(origin) && this.belongs(destination)) {
  		adjMatrix[((AdjMatrixVertex<T>) origin).getPosition()]
  				[((AdjMatrixVertex<T>) destination).getPosition()] = weight;
  	}
  }

  @Override
  public void disconnect(Vertex<T> origin, Vertex<T> destination) {
  	if (this.belongs(origin)) {
  		this.connect(origin, destination, EMPTY_VALUE);
  	}
  }

  @Override
  public boolean existsEdge(Vertex<T> origin, Vertex<T> destination) {
      return this.weight(origin, destination) != EMPTY_VALUE;
  }

  @Override
  public boolean isEmpty() {
      return vertices.isEmpty();
  }

  @Override
  public List<Vertex<T>> getVertices() {
  	return new ArrayList<>(this.vertices);
  }

  @Override
  public int weight(Vertex<T> origin, Vertex<T> destination) {
  	int weight = 0;
  	if (this.belongs(origin) && this.belongs(destination)) {
  		weight = adjMatrix[((AdjMatrixVertex<T>) origin).getPosition()]
  				[((AdjMatrixVertex<T>) destination).getPosition()];
  	}
 		return weight;
  }
  
  @Override
  public List<Edge<T>> getEdges(Vertex<T> vertex) {
    List<Edge<T>> ady = new ArrayList<>();
    int verticePos = vertex.getPosition();
    for (int i = 0; i < this.vertices.size(); i++) {
      if (adjMatrix[verticePos][i] != EMPTY_VALUE) {
        ady.add(new AdjMatrixEdge<>(this.vertices.get(i), adjMatrix[verticePos][i]));	  
      }
    }
    return ady;
  }
  
  @Override
  public Vertex<T> getVertex(int position) {
  	if (position < 0 || position >= this.vertices.size()) {
  		return null;
  	}
      return vertices.get(position);
  }
  
  @Override
  public int getSize() {
  	return this.vertices.size();
  }
}
