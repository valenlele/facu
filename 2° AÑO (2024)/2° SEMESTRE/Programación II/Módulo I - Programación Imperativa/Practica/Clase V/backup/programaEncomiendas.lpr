Program programaEncomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;

  listaCod=^nodoCod;
  nodoCod=record
    cod:integer;
    sig:listaCod;
  end;

  datosA=record
    peso:integer;
    cod:listaCod;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:datosA;
    HI,HD:arbol;
  end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
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
   e.codigo := i;
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
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;

procedure insertarListaCod(var l:listaCod; cod:integer);
var
  nue:listaCod;
begin
  new(nue);
  nue^.cod:=cod;
  nue^.sig:=l;
  l:=nue;
end;

procedure insertarArbol(var a:arbol; e:encomienda);
begin
  if (a=nil) then begin
    new(a);
    a^.datos.peso:=e.peso;
    a^.datos.cod:=nil;
    a^.HI:=nil;
    a^.HD:=nil;
    insertarListaCod(a^.datos.cod,e.codigo);
  end
  else begin
    if (a^.datos.peso>e.peso) then insertarArbol(a^.HI,e)
    else if (a^.datos.peso<e.peso) then insertarArbol(a^.HD,e)
    else insertarListaCod(a^.datos.cod,e.codigo);
  end;
end;

procedure cargarArbol(var a:arbol; l:lista);
begin
  if (l<>nil) then begin
    insertarArbol(a,l^.dato);
    cargarArbol(a,l^.sig);
  end;
end;

procedure imprimirArbol(a:arbol);

  procedure mostrarInfo(datos:datosA);

    procedure imprimirListaCodigos(l:listaCod);
    begin
      if (l<>nil) then begin
        write(l^.cod,' ');
        imprimirListaCodigos(l^.sig);
      end;
    end;

  begin
    writeln('Peso: ',datos.peso);
    write('Codigo(s): ');
    imprimirListaCodigos(a^.datos.cod);
  end;

begin
  if (a<>nil) then begin
    imprimirArbol(a^.HI);
    mostrarInfo(a^.datos);
    writeln(' ');
    imprimirArbol(a^.HD);
  end;
end;

Var
  l:lista;
  a:arbol;

begin
  Randomize;
  crearLista(l);
  writeln ('Lista de encomiendas generada: ');
  imprimirLista(l);

  writeln(' ');

  a:=nil;
  cargarArbol(a,l);
  writeln('Arbol generado: ');
  imprimirArbol(a);

  readln;
end.
