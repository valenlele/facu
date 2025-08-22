Program arboles;
Type

  // Lista de enteros
  lista = ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
end;

{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
procedure crearLista(var l: Lista);
var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   agregarAdelante(L, n);
   n := random (20);
 End;
end;

{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;

{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;
 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;

procedure insertarArbol(var a:arbol; num:integer);
begin
  if (a=nil) then begin
    new(a);
    a^.dato:=num;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.dato>num) then insertarArbol(a^.HI,num)
  else if (a^.dato<num) then insertarArbol (a^.HD,num);
end;

procedure cargarArbol(var a:arbol; l:lista);
begin
  while (l<>nil) do begin
    insertarArbol(a,l^.dato);
    l:=l^.sig;
  end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }

Procedure imprimirPorNivel(a:arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;

procedure insertarOrdenado(var lOrdenada:lista; dato:integer);
var
  nue,act,ant:lista;
begin
  new(nue);
  nue^.dato:=dato;
  nue^.sig:=nil;
  if (lOrdenada=nil) then lOrdenada:=nue
  else begin
    act:=lOrdenada;
    ant:=lOrdenada;
    while (act<>nil) and (act^.dato<nue^.dato) do begin
      ant:=act;
      act:=act^.sig;
    end;
    if (ant=act) then lOrdenada:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
  end;
end;

procedure cargarListaOrdenada(l:lista; var lOrdenada:lista);
begin
  while(l<>nil) do begin
    insertarOrdenado(lOrdenada,l^.dato);
    l:=l^.sig;
  end;
end;

procedure preOrden(a:arbol);
begin
  if (a<>nil) then begin
    write(a^.dato,' ');
    preOrden(a^.HI);
    preOrden(a^.HD);
  end;
end;

procedure postOrden(a:arbol);
begin
  if (a<>nil) then begin
    write(a^.dato,' ');
    postOrden(a^.HD);
    postOrden(a^.HI);
  end;
end;

Var
 l,lOrdenada:lista;
 a:arbol;

begin
  Randomize;
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);

  writeln(' ');

  a:=nil;
  cargarArbol(a,l);
  imprimirPorNivel(a);

  writeln(' ');

  {lOrdenada:=nil;
  cargarListaOrdenada(l,lOrdenada);
  writeln('Lista ordenada: ');
  imprimirLista(lOrdenada);
  writeln(' ');
  a:=nil;
  cargarArbol(a,lOrdenada);
  imprimirPorNivel(a);}

  writeln('Arbol impreso Pre-Orden: ');
  preOrden(a);
  writeln(' ');
  writeln('Arbol impreso Post-Orden: ');
  postOrden(a);

  readln;
end.
