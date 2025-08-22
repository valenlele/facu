program modulosfinal;

type
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




//agregar ordenado listas
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

//liberar memoria lista
procedure eliminarLista(var list:listado);
var
  aux:listado;
begin
  while (list<>nil) do begin
    aux:=list;
    list:=list^.sig;
    dispose(aux);
  end;
end;

//insertar en arbol de listas
procedure insertarArbol(var a:arbol; v:visita);

  procedure insertarFinal(var lVisitas:listaVisitas; v:visita);
  var
    nue,act:listaVisitas;
  begin
    new(nue);
    nue^.datos.id:=v.id;
    nue^.datos.fechaVisita:=v.fechaVisita;
    nue^.datos.ingresoEgreso:=v.ingresoEgreso;
    nue^.datos.destino:=v.destino;
    nue^.sig:=nil;
    if (lVisitas<>nil) then begin
      act:=lVisitas;
      while (act^.sig<>nil) do act:=act^.sig;
      act^.sig:=nue;
    end
    else lVisitas:=nue;
  end;

  procedure insertarDatos(var a:arbol; v:visita);
  begin
    a^.datos.:=;
    a^.datos.:=;
    a^.datos.:=;
    a^.datos.:=1;
    a^.datos.:=nil;
    insertarFinal(a^.datos.,);
  end;

begin
  if (a=nil) then begin
    new(a);
    a^.HI:=nil;
    a^.HD:=nil;
    insertarDatos(a,);
  end
  else if (a^.datos.>) then insertarArbol(a^.HI,)
  else if (a^.datos.dni<) then insertarArbol(a^.HD,)
  else begin
    a^.datos.:=a^.datos.+;
    insertarFinal(a^.datos.,);
  end;
end;

//imprimir arbol de listas
procedure recorrerEimprimirArbol(a:arbol);

  procedure imprimirListadoVisitas(lVisitas:listaVisitas);
  begin
    while (lVisitas<>nil) do begin
      writeln('Identificador visita: ',lVisitas^.datos.id);
      writeln('Fecha(dia/mes/anio): ',lVisitas^.datos.fechaVisita.dia,'/',lVisitas^.datos.fechaVisita.mes,'/',lVisitas^.datos.fechaVisita.anio);
      if (lVisitas^.datos.ingresoEgreso='i') then writeln('Es un ingreso')
      else if (lVisitas^.datos.ingresoEgreso='e') then writeln('Es un egreso');
      writeln('Destino: ',lVisitas^.datos.destino);
      writeln(' ');
      lVisitas:=lVisitas^.sig;
    end;
  end;

  procedure imprimirPersona(p:datosA);
  begin
    writeln('DNI: ',p.dni,'. Edad: ',p.edad);
    if (p.esExtranjera) then writeln('Es extranjera')
    else writeln('No es extranjera');
    writeln('Listado visitas: ');
    imprimirListadoVisitas(p.lVisitas);
    writeln(' ');
    writeln(' ');
  end;

begin
  if (a<>nil) then begin
    recorrerEimprimirArbol(a^.HI);
    imprimirPersona(a^.datos);
    recorrerEimprimirArbol(a^.HD);
  end;
end;

//recorrido pre-orden
procedure preOrden(a:arbol);
begin
  if (a<>nil) then begin
    write(a^.dato,' ');
    preOrden(a^.HI);
    preOrden(a^.HD);
  end;
end;

//recorrido en-orden
procedure enOrden(a:arbol);
begin
  if (a<>nil) then begin
    enOrden(a^.HI);
    write(a^.dato,' ');
    enOrden(a^.HD);
  end;
end;

//recorrido post-orden
procedure postOrden(a:arbol);
begin
  if (a<>nil) then begin
    write(a^.dato,' ');
    postOrden(a^.HD);
    postOrden(a^.HI);
  end;
end;

//buscar que devuelve un nodo
function buscar(a:arbol; num:integer):arbol;
begin
  if (a<>nil) then begin
    if (a^.dato=num) then buscar:=a
    else if (a^.dato>num) then buscar:=buscar(a^.HI,num)
    else buscar:=buscar(a^.HD,num);
  end
  else buscar:=nil;
end;

//buscar dato por el que arbol este ordenado
function existeLibroISBN(a:arbol; isbn:integer):boolean;
begin
  if (a<>nil) then begin
    if (a^.datos.isbn=isbn) then existeLibroISBN:=true
    else if (a^.datos.isbn>isbn) then existeLibroISBN:=existeLibroISBN(a^.HI,isbn)
    else existeLibroISBN:=existeLibroISBN(a^.HD,isbn);
  end
  else existeLibroISBN:=false;
end;

//buscar dato por el que el arbol no este ordenado
procedure dniPromedioVisitas(a:arbol; var max:real; var maxDni:longint);
var
  cantVisitasMarzoNoviembre:integer;
  promedioVisitas:real;
begin
  if (a<>nil) then begin
    cantVisitasMarzoNoviembre:=contarVisitas(a^.datos.lVisitas);
    promedioVisitas:=calcularPromedioVisitas(cantVisitasMarzoNoviembre);
    if (promedioVisitas>max) then begin
      max:=promedioVisitas;
      maxDni:=a^.datos.dni;
    end;
    dniPromedioVisitas(a^.HI,max,maxDni);
    dniPromedioVisitas(a^.HD,max,maxDni);
  end;
end;

//procedure buscar en rango
procedure enRango(a:arbol; inf,sup:longint);
begin
  if (a<>nil) then
    if (a^.datos.dni>=inf) then
      if (a^.datos.dni<=sup) then begin
        enRango(a^.HD,inf,sup);
        imprimirJugador(a^.datos);
        enRango(a^.HI,inf,sup);
      end
      else
        enRango(a^.HI,inf,sup)
    else
      enRango(a^.HD,inf,sup);
end;

//funcion buscar en rango
function cantEnRango(a:arbol; inf,sup:longint; var cant:integer):integer;
begin
  if (a<>nil) then
    if (a^.datos.dni>=inf) then
      if (a^.datos.dni<=sup) then begin
        cant:=cant+1;
        cantEnRango(a^.HI,inf,sup,cant);
        cantEnRango(a^.HD,inf,sup,cant);
      end
      else
        cantEnRango(a^.HI,inf,sup,cant)
    else
      cantEnRango(a^.HD,inf,sup,cant);
  cantEnRango:=cant;
end;

//buscar dato maximo por el que arbol este ordenado
function verMax(a:arbol; max:integer):integer;
begin
  if (a<>nil) then begin
    max:=a^.dato;
    max:=verMax(a^.HD,max);
  end;
  verMax:=max;
end;

//buscar dato minimo por el que el arbol este ordenado
function verMin(a:arbol; min:longint):longint;
begin
  if (a<>nil) then begin
    min:=a^.datos.dni;
    min:=verMin(a^.HI,min);
  end;
  verMin:=min;
end;

//borrar nodo de arbol de listas
procedure borrarElemento(var a:arbol; dni:longint; var encontre:boolean);
var
  aux:arbol;
  min:integer;
begin
  min:=9999;
  if (a=nil) then encontre:=false
  else begin
    if (a^.datos.dni>dni) then borrarElemento(a^.HI,dni,encontre)
    else if (a^.datos.dni<dni) then borrarElemento(a^.HD,dni,encontre)
    else begin
      encontre:=true;
      if (a^.HI=nil) and (a^.HD=nil) then begin
        eliminarLista(a^.datos.list);
        dispose(a);
        a:=nil;
      end
      else begin
        if (a^.HI=nil) and (a^.HD<>nil) then begin
          aux:=a;
          a:=a^.HD;
          eliminarLista(aux^.datos.list);
          dispose(aux);
        end
        else if (a^.HI<>nil) and (a^.HD=nil) then begin
          aux:=a;
          a:=a^.HI;
          eliminarLista(aux^.datos.list);
          dispose(aux);
        end
        else begin
          a^.datos.dni:=verMin(a^.HD,min);
          borrarElemento(a^.HD,a^.datos.dni,encontre);
        end;
      end;
    end;
  end;
end;

begin
end.
