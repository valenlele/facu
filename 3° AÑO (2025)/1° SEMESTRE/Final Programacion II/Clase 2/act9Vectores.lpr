program act9Vectores;

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

function maxValor(v:vector; dimL:dim; i,max:integer):integer;
begin
  if (i<=dimL) then begin
    if (v[i]>max) then max:=v[i];
    max:=maxValor(v,dimL,i+1,max);
  end;
  maxValor:=max;
end;

function sumaValores(v:vector; dimL:dim; i,suma:integer):integer;
begin
  if (i<=dimL) then suma:=suma+v[i]+sumaValores(v,dimL,i+1,suma);
  sumaValores:=suma;
end;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   i,max,suma:integer;

begin

     cargarVector(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);

     writeln('');

     i:=1;
     max:=-1;
     writeln('El numero maximo del vector es: ',maxValor(v,dimL,i,max));

     writeln('');

     i:=1;
     suma:=0;
     writeln('La suma de los valores del vector es: ',sumaValores(v,dimL,i,suma));

     readln;
end.
