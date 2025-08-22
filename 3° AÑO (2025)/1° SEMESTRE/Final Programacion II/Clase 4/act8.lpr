Program act8;
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

{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }
Procedure imprimirPorNivel(a: arbol);
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

procedure insertar(var a:arbol; n:integer);
begin
  if (a=nil) then begin
    new(a);
    a^.dato:=n;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.dato>n) then insertar(a^.HI,n)
  else if (a^.dato<n) then insertar(a^.HD,n);
end;

procedure cargarArbol(var a:arbol; l:lista);
begin
  while (l<>nil) do begin
   insertar(a,l^.dato);
   l:=l^.sig;
  end;
end;

procedure agregarOrdenado(var l:lista; num:integer);
var
   nue,ant,act:lista;
begin
  new(nue);
  nue^.dato:=num;
  nue^.sig:=nil;
  if (l=nil) then l:= nue
  else begin
    act:=l;
    ant:=l;
    while (act<>nil) and (act^.dato < nue^.dato) do begin
      ant:=act;
      act:=act^.sig;
    end;
    if (ant=act) then l:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
  end;
end;

procedure cargarListaOrdenada(var lOrdenada:lista; l:lista);
begin
  while(l<>nil) do begin
    agregarOrdenado(lOrdenada,l^.dato);
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

procedure enOrden(a:arbol);
begin
  if (a<>nil) then begin
    enOrden(a^.HI);
    write(a^.dato,' ');
    enOrden(a^.HD);
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

function buscar(a:arbol; num:integer):arbol;
begin
  if (a<>nil) then begin
    if (a^.dato=num) then buscar:=a
    else if (a^.dato>num) then buscar:=buscar(a^.HI,num)
    else buscar:=buscar(a^.HD,num);
  end
  else buscar:=nil;
end;

function verMin(a:arbol; min:integer):integer;
begin
  if (a<>nil) then begin
    min:=a^.dato;
    min:=verMin(a^.HI,min);
  end;
  verMin:=min;
end;

function verMax(a:arbol; max:integer):integer;
begin
  if (a<>nil) then begin
    max:=a^.dato;
    max:=verMax(a^.HD,max);
  end;
  verMax:=max;
end;

procedure verValoresEnRango(a:arbol; inf,sup:integer);
begin
  if (a<>nil) then
    if (a^.dato>=inf) then
      if (a^.dato<=sup) then begin
        write(a^.dato,' ');
        verValoresEnRango(a^.HI,inf,sup);
        verValoresEnRango(a^.HD,inf,sup);
      end
      else
        verValoresEnRango(a^.HI,inf,sup)
    else
      verValoresEnRango(a^.HD,inf,sup);
end;

procedure borrarElemento(var a:arbol; num:integer; var encontre:boolean);
var
  aux:arbol;
  min:integer;
begin
  min:=9999;
  if (a=nil) then encontre:=false
  else begin
    if (a^.dato>num) then borrarElemento(a^.HI,num,encontre)
    else if (a^.dato<num) then borrarElemento(a^.HD,num,encontre)
    else begin
      encontre:=true;
      if (a^.HI=nil) and (a^.HD=nil) then begin
        dispose(a);
        a:=nil;                             //por que?
      end
      else begin
        if (a^.HI=nil) and (a^.HD<>nil) then begin
          aux:=a;
          a:=a^.HD;
          dispose(aux);           //como se hace el enganche?
        end
        else if (a^.HI<>nil) and (a^.HD=nil) then begin
          aux:=a;
          a:=a^.HI;
          dispose(aux);          //como se hace el enganche?
        end
        else begin
          a^.dato:=verMin(a^.HD,min);
          borrarElemento(a^.HD,a^.dato,encontre);
        end;
      end;
    end;
  end;
end;

Var
 l,lOrdenada: lista;
 a,encontre:arbol;
 num,min,max,inf,sup:integer;
 resultado:boolean;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);

 writeln(' ');

 a:=nil;
 cargarArbol(a,l);
 writeln('Arbol generado: ');
 imprimirPorNivel(a);

 {lOrdenada:=nil;
 cargarListaOrdenada(lOrdenada,l);
 writeln('Lista ordenada: ');
 imprimirLista(lOrdenada);
 a:=nil;
 cargarArbol(a,lOrdenada);
 writeln('Arbol generado con lista ordenada: ');
 imprimirPorNivel(a);}

 {writeln('Arbol impreso Pre-Orden: ');
 preOrden(a);
 writeln(' ');
 writeln('Arbol impreso En-Orden: ');
 enOrden(a);
 writeln(' ');
 writeln('Arbol impreso Post-Orden: ');
 postOrden(a);}

 {writeln('Escriba un valor para buscar en el arbol: ');
 readln(num);
 encontre:=buscar(a,num);
 if (encontre<>nil) then writeln('El valor esta en el arbol')
 else writeln('El valor no esta en el arbol');}

 {min:=9999;
 writeln('El valor minimo del arbol es: ',verMin(a,min));
 max:=-1;
 writeln('El valor maximo del arbol es: ',verMax(a,max));}

 {writeln(' ');

 writeln('Contenido del arbol en forma creciente: ');
 enOrden(a);

 writeln(' ');

 writeln('Ingrese un limite superior en inferior para buscar en el arbol: ');
 readln(inf);
 readln(sup);
 verValoresEnRango(a,inf,sup);}

 writeln(' ');

 writeln('Ingrese un dato a borrar del arbol: ');
 readln(num);
 resultado:=false;
 borrarElemento(a,num,resultado);
 if (resultado) then writeln('El numero ',num,' se borro con exito')
 else writeln('El numero ',num,' no se encuentra en el arbol');
 writeln('Arbol resultante: ');
 imprimirPorNivel(a);

 readln;
end.
