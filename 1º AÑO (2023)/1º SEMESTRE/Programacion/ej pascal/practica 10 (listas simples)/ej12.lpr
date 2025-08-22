program ej12;

type
  lista = ^nodo;
  nodo = record
    num:integer;
    sig:lista;
  end;

procedure agregarOrdenado(var l:lista; num:integer);
var nue,act,ant:lista;
begin
  new(nue);
  nue^.num:=num;
  act:=l;
  ant:=l;
  while (act <> nil) and (act^.num < num) do
  begin
    ant:=act;
    act:=act^.sig;
  end;
  if act = ant then l:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure union1(A,B:lista; var C:lista);
begin
  while (A <> nil) do begin
    agregarOrdenado(C,A^.num);
    A:=A^.sig;
  end;
  while (B <> nil) do begin
    agregarOrdenado(C,B^.num);
    B:=B^.sig;
  end;
end;

procedure union2(var a:lista; b:lista);
begin
  while (B <> nil) do begin
    agregarOrdenado(A,B^.num);
    B:=B^.sig;
  end;
end;

function existe(A:lista; num:integer):boolean;
begin
  existe:=false;
  while (A <> nil) and (num <> a^.num) do A:=A^.sig;
  if num = a^.num then existe:=true;
end;

procedure eliminarNumeroLista(var A:lista; num:integer; var exito:boolean);
var ant,act:lista;
begin
  exito:=false;
  while existe(A,num) do begin {mientras se encuentre el numero en la lista}
    act:=A; {act se convierte en el primer nodo de A}
    while (act <> nil) and (act^.num <> num) do begin {act recorre la lista A}
      ant:=act;
      act:=act^.sig;
    end;
    if (act <> nil) then begin {si al termianr el while act no llego al final de la lista}
      exito:=true; {se encontro el numero y se puede eliminar}
      if (act = A) then A:=act^.sig {si el numero que se quiere borrar esta en el primer nodo, se pasa el primer nodo a la siguinte direccion para no borrar toda la lista}
      else ant^.sig:=act^.sig; {los nodos anteriores al nodo que se quiere eliminar se pasan al nodo siguiente del nodo que se quiere elimianar}
      dispose(act);
    end;
  end;
end;

procedure imprimir(l:lista);
begin
  while l <> nil do begin
    writeln(l^.num);
    l:=l^.sig;
  end;
end;

var
  A,B,C:lista;
  num:integer;
  exito:boolean;

begin
  A:=nil;
  B:=nil;
  C:=nil;
  writeln('Carga lista A: ');
  readln(num);
  while num <> -1 do begin
    agregarOrdenado(A,num);
    readln(num);
  end;
  writeln('Carga lista B: ');
  readln(num);
  while num <> -1 do begin
    agregarOrdenado(B,num);
    readln(num);
  end;
  union1(A,B,C);
  writeln('Lista C: ');
  imprimir(C);
  union2(A,B);
  writeln('Nueva lista A: ');
  imprimir(A);
  writeln('Ingrese un numero para eliminarlo de la lista A: ');
  readln(num);
  eliminarNumeroLista(A,num,exito);
  if not exito then writeln('EL numero no estaba en la lista')
  else writeln('El numero estaba en la lista y se elimino');
  writeln('Nueva lista A: ');
  imprimir(A);
  readln;
end.
