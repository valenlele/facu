program ej6;

const
  dimF=8;

type
  binario=0..1;
  secuencia=array[1..dimF] of binario;
  rango=0..dimF;

procedure cargarVector(var s:secuencia; var dimL:rango);
var
  valor:binario;
begin
  dimL:=0;
  write('Ingrese un valor binario: ');
  readln(valor);
  while (dimL<dimF) do begin
    dimL:=dimL+1;
    s[dimL]:=valor;
    if (dimL<>dimF) then begin
      write('Ingrese un valor binario: ');
      readln(valor);
    end;
  end;
end;

procedure opNOT(s:secuencia);
var
  i:rango;
  res:secuencia;
begin
  for i:=1 to dimF do begin
    if (s[i]=1) then res[i]:=0
    else res[i]:=1;
  end;
  writeln('La secuencia de bits con la operacion NOT es: ');
  for i:=1 to dimF do writeln(res[i]);
end;

procedure opOR(s:secuencia);
var
  i,dimLop:rango;
  op,res:secuencia;
begin
  writeln('Ingrese los valores para cargar el vector con el que se va a operar OR: ');
  cargarVector(op,dimLOp);
  for i:=1 to dimF do begin
    if (s[i]=1) and (op[i]=1) then res[i]:=1
    else res[i]:=s[i]+op[i];
  end;
  writeln('La secuencia de bits con la operacion OR y una MASK es: ');
  for i:=1 to dimF do writeln(res[i]);
end;

procedure opAND(s:secuencia);
var
  i,dimLop:rango;
  op,res:secuencia;
begin
  writeln('Ingrese los valores para cargar el vector con el que se va a operar AND: ');
  cargarVector(op,dimLOp);
  for i:=1 to dimF do begin
    if (s[i]=1) and (op[i]=1) then res[i]:=1
    else res[i]:=s[i]*op[i];
  end;
  writeln('La secuencia de bits con la operacion AND y una MASK es: ');
  for i:=1 to dimF do writeln (res[i]);
end;

var
  s:secuencia;
  dimL:rango;

begin
  cargarVector(s,dimL);
  opNOT(s);
  opOR(s);
  opAND(s);
  readln;
end.
