program ej10abc;

const
  dimF=2000;

type
  rangoVec=1..dimF;
  vector=array[rangoVec] of string;

procedure cargarVector(var v:vector; var dimL:integer); //se dispone consigna
var
  nombre:string;
begin
  dimL:=0;
  write('Ingrese un nombre para ingresar en el vector: ');
  readln(nombre);
  while (dimL<dimF) and (nombre<>'xxx') do begin
    dimL:=dimL+1;
    v[dimL]:=nombre;
    if (dimL<>dimF) or (nombre<>'xxx') then begin
      write('Ingrese un nombre para ingresar en el vector: ');
      readln(nombre);
    end;
  end;
end;

procedure ordenarVector(var v:vector; dimL:integer); //se dispone consigna
var
  i,j:integer;
  item:string;
begin
  for i:=2 to dimL do begin
    item:=v[i];
    j:=i-1;
    while (j>0) and (v[j]>item) do begin
      v[j+1]:=v[j];
      j:=j-1;
    end;
    v[j+1]:=item;
  end;
end;

{function buscarPosSecuencial(v:vector; dimL:integer; elem:string):integer;
var
  pos:integer;
begin
  pos:=0;
  while (pos<=dimL) and (elem>v[pos]) do pos:=pos+1;
  if (pos>dimL) or (elem<v[pos]) then pos:=-1
  else buscarPosSecuencial:=pos;
end;}

function buscarPosDicotomica(v:vector; dimL:integer; elem:string):integer;
var
  i,j,res:integer;
begin
  j:=dimL;
  i:=1;
  res:=((j+i)div 2);
  while (i<=j) and (v[res]<>elem) do begin
    res:=((j+i)div 2);
    if (v[res]<elem) then i:=res+1
    else if (v[res]>elem) then j:=res-1;
  end;
  if (i>j) or (v[res]<>elem) then res:=-1;
  buscarPosDicotomica:=res;
end;

function determinarPos(v:vector; dimL:integer; elem:string):rangoVec; //recorro el vector y determino la posicion donde insertar el elemento
var
  pos:rangoVec;
begin
  pos:=1;
  while (pos<=dimL) and (elem>v[pos]) do pos:=pos+1;
  determinarPos:=pos;
end;

procedure insertar(var v:vector; var dimL:integer; pos:rangoVec; elem:string);
var
  i:rangoVec;
begin
  for i:=dimL downto pos do v[i+1]:=v[i];
  v[pos]:=elem;
  dimL:=dimL+1;
end;

procedure insertarElemOrd(var v:vector; var dimL:integer; elem:string; var exito:boolean);
var
  pos:integer;
begin
  if (dimL<dimF) then begin
    pos:=determinarPos(v,dimL,elem);
    insertar(v,dimL,pos,elem);
    exito:=true;
  end
  else exito:=false;
end;

function determinarPosBorrar(v:vector; dimL:integer; elem:string):integer;
var
  pos:integer;
begin
  pos:=0;
  while (pos<=dimL) and (elem<>v[pos]) do pos:=pos+1;
  if (pos>dimL) then pos:=-1;
  determinarPosBorrar:=pos;
end;

procedure borrarElemPos(var v:vector; var dimL:integer; pos:integer);
var
  i:integer;
begin
  for i:=pos to dimL-1 do v[i]:=v[i+1];
  dimL:=dimL-1;
end;

procedure borrarElem(var v:vector; var dimL:integer; elem:string; var exito:boolean);
var
  pos:integer;
begin
  pos:=determinarPosBorrar(v,dimL,elem);
  if (pos<>0) then begin
    borrarElemPos(v,dimL,pos);
    exito:=true;
  end
  else exito:=false;
end;

var
  v:vector;
  dimL:integer;
  elem:string;
  exito:boolean;

begin
  cargarVector(v,dimL);
  ordenarVector(v,dimL);
  write('Ingrese un elemento para buscar en el vector: ');
  readln(elem);
  {write('La posicion del elemento en el vector es: ',buscarPosSecuencial(v,dimL,elem));}
  writeln('La posicion del elemento en el vector es: ',buscarPosDicotomica(v,dimL,elem));
  write('Ingrese un nombre para insertar en el vector: ');
  readln(elem);
  insertarElemOrd(v,dimL,elem,exito);
  if (exito) then writeln('El elemento se inserto con exito')
  else writeln('EL elemento no se pudo insertar');
  write('Ingrese un elemento para eliminar del vector: ');
  readln(elem);
  borrarElem(v,dimL,elem,exito);
  if (exito) then writeln('El elemento se borro con exito')
  else writeln('EL elemento no se pudo borrar');
  readln;
end.
