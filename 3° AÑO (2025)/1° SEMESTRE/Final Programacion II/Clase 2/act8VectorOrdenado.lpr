program act8VectorOrdenado;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

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

function busquedaDicotomica(v:vector; n,i,j:integer):integer;
var
  med:integer;
begin
  if (i>j) then busquedaDicotomica:=-1
  else begin
    med:=(i+j) div 2;
    if (v[med]=n) then busquedaDicotomica:=med
    else if (n>v[med]) then busquedaDicotomica:=busquedaDicotomica(v,n,med+1,j)
    else busquedaDicotomica:=busquedaDicotomica(v,n,i,med-1);
  end;
end;

var
   v: vector;
   dimL : dim;
   n,i,j:integer;

begin

     cargarVectorOrdenado(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);

     writeln(' ');

     writeln('Ingrese un numero para buscar en el vector: ');
     readln(n);
     i:=1;
     j:=dimF;
     writeln('El numero ',n,' se encuentra en la posicion: ',busquedaDicotomica(v,n,i,j));

     readln;
end.
