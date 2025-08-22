public class ProcesarSueldo {
  public int calcularSueldoACobrar(int sueldoB, int cantCamp) {
    int sueldoTot = sueldoB;
    if ((cantCamp>=1) && (cantCamp<=4)) sueldoTot+=5000;
    else if ((cantCamp>=5) && (cantCamp<=10)) sueldoTot+=30000;
    else if (cantCamp>10) sueldoTot+=50000;
    return sueldoTot;
  }
}