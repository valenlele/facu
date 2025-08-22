Program generarArbol;
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

procedure buscar(a:arbol; num:integer; var encontre:boolean);
begin
  if (a<>nil) then begin
    if (num>a^.dato) then buscar(a^.HD,num,encontre)
    else if (num<a^.dato) then buscar(a^.HI,num,encontre)
    else encontre:=true;
  end;
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

procedure verValoresRango(a:arbol; inf,sup:integer);
begin
  if (a<>nil) then begin
    if (a^.dato>=inf) then begin
      if (a^.dato<=sup) then begin
        write(a^.dato,' ');
        verValoresRango(a^.HI,inf,sup);
        verValoresRango(a^.HD,inf,sup);
      end
      else verValoresRango(a^.HI,inf,sup);
    end
    else verValoresRango(a^.HD,inf,sup);
  end;
end;

procedure borrarElem(var a:arbol; num:integer; var res:boolean);
var
  min:integer;
  aux:arbol;
begin
  min:=9999;
  if (a=nil) then res:=false
  else begin
    if (a^.dato>num) then borrarElem(a^.HI,num,res)
    else if (a^.dato<num) then borrarElem(a^.HD,num,res)
    else begin
      res:=true;
      if (a^.HI=nil) and (a^.HD=nil) then begin
        dispose(a);
        a:=nil;
      end
      else begin
        if (a^.HI=nil) and (a^.HD<>nil) then begin
          aux:=a;
          a:=a^.HD;
          dispose(aux);
        end
        else if (a^.HI<>nil) and (a^.HD=nil) then begin
          aux:=a;
          a:=a^.HI;
          dispose(aux);
        end
        else begin
          a^.dato:=verMin(a^.HD,min);
          borrarElem(a^.HD,a^.dato,res);
        end;
      end;
    end;
  end;
end;

Var
 l,lOrdenada:lista;
 a:arbol;
 num,min,max,inf,sup,bor:integer;
 encontre,res:boolean;

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

  {writeln('Arbol impreso Pre-Orden: ');
  preOrden(a);
  writeln(' ');
  writeln('Arbol impreso En-Orden: ');
  enOrden(a);
  writeln(' ');
  writeln('Arbol impreso Post-Orden: ');
  postOrden(a);}

  {encontre:=false;
  write('Ingrese un numero para buscar en el arbol: ');
  readln(num);
  buscar(a,num,encontre);
  if (encontre) then writeln('El numero esta en el arbol')
  else writeln('El numero no esta en el arbol');}

  {min:=9999;
  max:=-1;
  writeln('El valor minimo del arbol es: ',verMin(a,min));
  writeln('El valor maximo del arbol es: ',verMax(a,max));}

  {writeln('Arbol impreso En-Orden: ');
  enOrden(a);
  writeln(' ');
  write('Ingrese el limite inferior del rango: ');
  readln(inf);
  write('Ingrese el limite superior del rango: ');
  readln(sup);
  write('Los valores del arbol comprendidos entre el rango son: ');
  verValoresRango(a,inf,sup);}

  write('Ingrese un valor para eliminar del arbol: ');
  readln(bor);
  borrarElem(a,bor,res);
  imprimirPorNivel(a);

  readln;
end.
