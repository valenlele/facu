package paqueteFuncionesArboles;

import tp1.ejercicio8.*;
import tp2.ejercicio1.*;
import java.util.Scanner;

public class FuncionesArboles {

	public void cargarArbolInteger(BinaryTree<Integer> ab,Scanner in) {
		if(ab!=null) {
			DoubleEndedQueue<String> ops_ant = new DoubleEndedQueue<String>();
			DoubleEndedQueue<BinaryTree<Integer>> nodos_ant = new DoubleEndedQueue<BinaryTree<Integer>>();
			DoubleEndedQueue<BinaryTree<Integer>> nodos_padre = new DoubleEndedQueue<BinaryTree<Integer>>();
			BinaryTree<Integer> aux_ab = null;
			DoubleEndedQueue<Integer> cargas_ant = new DoubleEndedQueue<Integer>();
			String aux_op="";
			BinaryTree<Integer> nodo_act=ab;
			System.out.print("Operaciones: Cargar, Salir: ");
			aux_op = in.next();
			aux_op= aux_op.toLowerCase();
			if(aux_op.equals("cargar")) {
				cargarI(nodo_act,in);
			}
			while(!aux_op.equals("salir")) {
				System.out.print("Operaciones(Nodo act:"+nodo_act.getData()+"): Cargar, Salir, Volver, Imprimir, Hd, Hi, P: ");
				aux_op = in.next();
				aux_op=aux_op.toLowerCase();
				switch (aux_op){
				
				case "cargar":
					cargas_ant.enqueueFirst(nodo_act.getData());
					cargarI(nodo_act,in);
					ops_ant.enqueueFirst(aux_op);
					break;
					
				case "hi":	
				case "hd":					
					nodos_padre.enqueueFirst(nodo_act);
					nodos_ant.enqueueFirst(nodo_act);
					if(aux_op.equals("hi")) {
						if(!nodo_act.hasLeftChild()) {
							cargarIH(nodo_act,in,true);
							ops_ant.enqueueFirst("hi_cargar");
						}
						else ops_ant.enqueueFirst("hi_mover");
						nodo_act = nodo_act.getLeftChild();
					}
					else {
						if(!nodo_act.hasRightChild()) {
							cargarIH(nodo_act,in,false);
							ops_ant.enqueueFirst("hd_cargar");
						}
						else ops_ant.enqueueFirst("hd_mover");
						nodo_act = nodo_act.getRightChild();
					}
					break;
					
				case "p":
					if(!nodos_padre.isEmpty()) {
						aux_ab=nodo_act;
						nodo_act=nodos_padre.dequeue();
						ops_ant.enqueueFirst("p_mover");
						nodos_ant.enqueueFirst(aux_ab);
					}
					break;
					
				case "volver":
					if(!ops_ant.isEmpty()){
						String op_ant=(ops_ant.dequeue());
						if(!nodos_ant.isEmpty()&&!op_ant.equals("cargar")) {
							if(nodos_ant.head()==nodo_act.getLeftChild()||nodos_ant.head()==nodo_act.getRightChild())nodos_padre.enqueueFirst(nodo_act);
							nodo_act=nodos_ant.dequeue();
							if(op_ant.equals("hd_cargar")||op_ant.equals("hi_cargar")) {
						        if(op_ant.equals("hi_cargar"))nodo_act.removeLeftChild();
						        else nodo_act.removeRightChild();
							}
						}
						if(op_ant.equals("cargar")) {
						nodo_act.setData(cargas_ant.dequeue());
						}
					}
				case "salir":
					break;
				case "imprimir":
					imprimirArbolP(ab,0,nodo_act);
					break;
				default:
					System.out.print("Operación no válida");
				}
			
			}
		}
	}
	private void cargarI(BinaryTree<Integer> nodo_act,Scanner in) {
		System.out.print("Cargar Dato: ");
		Integer aux_data = in.nextInt();
		nodo_act.setData(aux_data);
	}
	private void cargarIH(BinaryTree<Integer> nodo_act,Scanner in,boolean hi) {
		BinaryTree<Integer> aux_ab = new BinaryTree<Integer>();
		cargarI(aux_ab,in);
		if(hi)nodo_act.addLeftChild(aux_ab);
		else nodo_act.addRightChild(aux_ab);
	}
	
	private void imprimirArbolP(BinaryTree<?> ab,int i,BinaryTree<?> act) {
		/*Primero llega al hijo más derecho y lo imprime con una cantidad de espacios que fue aumentando
		mientrass bajaba en profundiad, así va imprimiendose en manera triangular horizontal el árbol. Además 
		cuando el nodo es coincidente con el nodo_act agrega un '-' para indicar posición*/
		if(ab!=null&&!ab.isEmpty()) {
			this.imprimirArbolP(ab.getRightChild(),i+1,act);
			int a=0;
			if(ab==act) {
				System.out.print("-  ");
				a++;
			}
			for(;a<i+1;a++) {
				System.out.print("   ");
			}
			System.out.println(ab.getData());
			this.imprimirArbolP(ab.getLeftChild(),i+1,act);
		}
	}
	
	public  void imprimirArbol(BinaryTree<?> ab,int i) {
		/*Primero llega al hijo más derecho y lo imprime con una cantidad de espacios que fue aumentando
		mientrass bajaba en profundiad, así va imprimiendose en manera triangular horizontal el árbol*/
		if(ab!=null&&!ab.isEmpty()) {
			this.imprimirArbol(ab.getRightChild(),i+1);
			int a=0;
			for(;a<i+1;a++) {
				System.out.print("   ");
			}
			System.out.println(ab.getData());
			this.imprimirArbol(ab.getLeftChild(),i+1);
		}
	}
	
}
