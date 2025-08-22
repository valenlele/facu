package tp5.ejercicio1;

public class AdjMatrixVertex<T> implements Vertex<T> {
  private T data;
  private int position;
  
  public AdjMatrixVertex(T data, int position) {
    this.data = data;
    this.position = position;
  }
  
  @Override
  public T getData() {
    return this.data;	  
  }
  
  @Override
  public void setData(T data) {
    this.data = data;	  
  }
  
  @Override
  public int getPosition() {
    return position;	  
  }
  
  public void setPosition(int position) {
    this.position = position;	  
  }
  
  public void decrementPosition() {
    this.position--;	  
  }
} 
