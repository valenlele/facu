program maximoYsuma;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of LongInt;

    dim = 0..dimF;


{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( var vec: vector; var dimL: dim);
var
   d: integer;
begin
     Randomize;  { Inicializa la secuencia de random a partir de una semilla}
     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;



{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }
Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

function maxValor(v:vector; max,pos:integer):integer;
begin
  if (pos<=8) then begin
    if (v[pos]>max) then max:=v[pos];
    max:=maxValor(v,max,pos+1);
  end;
  maxValor:=max;
end;

function sumaVector(v:vector; pos,suma:integer):integer;
begin
  if (pos<=8) then suma:=suma+v[pos]+sumaVector(v,pos+1,suma);
  sumaVector:=suma;
end;

var
   v: vector;
   dimL : dim;
   max,pos,suma:integer;

begin

     cargarVector(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);

     max:=-1;
     pos:=1;
     writeln('El maximo valor del vector es: ',maxValor(v,max,pos));
     pos:=1;
     suma:=0;
     write('La suma de los valores del vector es: ',sumaVector(v,pos,suma));
     readln;
end.
