package tp1.ejercicio8;

public class CircularQueue<T> extends Queue<T> {
	T shift() {
		this.enqueue(data.get(0));
		return data.remove(0);
	}
}
