Program programaEncomiendas;
Type

   encomienda = record
     cod: integer;
     peso: integer;
   end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    datos: encomienda;
    sig: lista;
  end;

  listaCodigos=^nodoLcod;
  nodoLcod=record
    cod:integer;
    sig:listaCodigos;
  end;

  datosA=record
    peso:integer;
    lCod:listaCodigos;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:datosA;
    HI:arbol;
    HD:arbol;
  end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.datos := enc;
  aux^.sig := l;
  l:= aux;
end;

{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.cod := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;

{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.datos.cod, '  Peso: ', l^.datos.peso);
   l:= l^.sig;
 End;
end;

procedure agregarFinalListaCodigos(var lCod:listaCodigos; cod:integer);
var
  nue,act:listaCodigos;
begin
  new(nue);
  nue^.cod:=cod;
  nue^.sig:=nil;
  if (lCod<>nil) then begin
    act:=lCod;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lCod:=nue;
end;

procedure insertarEnArbol(var a:arbol; e:encomienda);
begin
  if (a=nil) then begin
    new(a);
    a^.datos.peso:=e.peso;
    a^.datos.lCod:=nil;
    agregarFinalListaCodigos(a^.datos.lCod,e.cod);
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.peso>e.peso) then insertarEnArbol(a^.HI,e)
  else if (a^.datos.peso<e.peso) then insertarEnArbol(a^.HD,e)
  else agregarFinalListaCodigos(a^.datos.lCod,e.cod);
end;

procedure crearArbolDeListas(var a:arbol; l:lista);
begin
  a:=nil;
  while (l<>nil) do begin
    insertarEnArbol(a,l^.datos);
    l:=l^.sig;
  end;
end;

procedure imprimirListaCodigos(lCod:listaCodigos);
begin
  while (lCod<>nil) do begin
    writeln('Codigo: ',lCod^.cod);
    lCod:=lCod^.sig;
  end;
end;

procedure imprimirArbolDeListasEnOrden(a:arbol);
begin
  if (a<>nil) then begin
    imprimirArbolDeListasEnOrden(a^.HI);
    writeln('Codigos de encomiendas con peso ',a^.datos.peso,': ');
    imprimirListaCodigos(a^.datos.lCod);
    imprimirArbolDeListasEnOrden(a^.HD);
  end;
end;

Var
 l: lista;
 a:arbol;

begin
  Randomize;

  crearLista(l);
  writeln ('Lista de encomiendas generada: ');
  imprimirLista(l);

  writeln(' ');

  crearArbolDeListas(a,l);
  writeln('El arbol de listas generado es: ');
  imprimirArbolDeListasEnOrden(a);

  readln;
end.
