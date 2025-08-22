Program act10Lista;
Type
  Lista= ^Nodo;
  Nodo= Record
           Datos: integer;
           Sig: Lista;
        End;

Procedure AgregarAdelante (var L:lista; num:integer);
Var nue:Lista;
  Begin
    New(nue);
    nue^.datos:=num;
    nue^.sig:=L;
    L:=nue;
  End;

Procedure Imprimir (pri:lista);
Begin
   while (pri <> NIL) do begin
     write (pri^.datos, ' ');
     pri:= pri^.sig
  end;
  writeln;
end;

function minValor(l:lista; min:integer):integer;
begin
  if (l<>nil) then begin
    if (l^.datos<min) then min:=l^.datos;
    min:=minValor(l^.sig,min);
  end;
  minValor:=min;
end;

procedure imprimirRecursivo(l:lista);
begin
  if (l<>nil) then begin
    write(l^.datos,' ');
    imprimirRecursivo(l^.sig);
  end;
end;

Var
 L: Lista;
 n,min: integer;

begin
  L:=nil;
  randomize;
  n := random (100);
  While (n<>0) do Begin
    AgregarAdelante (L, n);
    n := random (100);
  End;
  writeln ('Lista generada: ');
  imprimir (L);

  writeln('');

  min:=9999;
  writeln('El minimo valor de la lista es: ',minValor(l,min));

  writeln('');

  writeln('Lista generada recursivamente: ');
  imprimirRecursivo(l);

  readln
end.
