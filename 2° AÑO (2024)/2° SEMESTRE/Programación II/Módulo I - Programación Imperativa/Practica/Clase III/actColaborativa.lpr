program actColaborativa;

const
  fin=0000;

type
  venta=record
    cod:integer;
    totKg:integer;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:venta;
    HI:arbol;
    HD:arbol;
  end;

  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;

  lista=^nodo;
  nodo=record
    cod:integer;
    sig:lista;
  end;

procedure insertarArbol(var a:arbol; v:venta; kg:integer);
begin
  if (a=nil) then begin
    new(a);
    a^.datos.cod:=v.cod;
    a^.datos.totKg:=kg;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.cod>v.cod) then insertarArbol(a^.HI,v,kg)
  else if (a^.datos.cod<v.cod) then insertarArbol(a^.HD,v,kg)
  else a^.datos.totKg:=a^.datos.totKg+kg;
end;

procedure cargarArbol(var a:arbol; var v:venta);
var
  kg:integer;
begin
  write('Ingrese el codigo de pasta: ');
  readln(v.cod);
  if (v.cod<>fin) then begin
    write('Ingrese la cantidad vendida en kilos: ');
    readln(kg);
    insertarArbol(a,v,kg);
    cargarArbol(a,v);
  end;
end;

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
                      write (l^.info^.datos.cod,' ',l^.info^.datos.totKg,' - ');
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

function codMenosVendido(a:arbol; var minKg,minCod:integer):integer;
begin
 if (a<>nil) then begin
   if (a^.datos.totKg<minKg) then begin
     minKg:=a^.datos.totKg;
     minCod:=a^.datos.cod;
   end;
   minCod:=codMenosVendido(a^.HI,minKg,minCod);
   minCod:=codMenosVendido(a^.HD,minKg,minCod);
 end;
 codMenosVendido:=minCod;
end;

procedure insertarLista(var l:lista; cod:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.cod:=cod;
  nue^.sig:=l;
  l:=nue;
end;

procedure codMas10kg(a:arbol; var l:lista);
begin
 if (a<>nil) then begin
   if (a^.datos.totKg>10) then insertarLista(l,a^.datos.cod);
   codMas10kg(a^.HI,l);
   codMas10kg(a^.HD,l);
 end;
end;

procedure imprimirLista(l:lista);
begin
 writeln('CODIGOS DE PASTAS QUE VENDIERON MAS DE 10 KG: ');
 while (l<>nil) do begin
   write(l^.cod,' ');
   l:=l^.sig;
 end;
end;

procedure ejecutarOpcion(a:arbol; var minKg,minCod:integer; var l:lista; opcion:integer);
begin
  if (opcion=3) then imprimirPorNivel(a)
  else if (opcion=4) then codMenosVendido(a,minKg,minCod)
  else if (opcion=5) then imprimirLista(l);
  end;
end;

procedure menuOpciones(a:arbol; var minKg,minCod:integer; var l:lista);
var
  opcion:integer;
begin
  writeln('ELIJA UNA OPCION PARA REALIZAR: ');
  writeln('(1): Inicializar estructuras de datos');
  writeln('(2): Leer una venta e ingresarla');
  writeln('(3): Imprime informacion de ventas');
  writeln('(4): Informar codigo de pasta menos vendido');
  writeln('(5): Buscar codigos de pasta que tuvieron mas de 10kg en ventas');
  readln(opcion);
  if (opcion<>0) then begin
    ejecutarOpcion(a,minKg,minCod,l,opcion);
    menuOpciones(a,minKg,minCod,l);
  end;
end;

var
  a:arbol;
  v:venta;
  minCod,minKg:integer;
  l:lista;

begin
  a:=nil;
  cargarArbol(a,v);
  imprimirPorNivel(a);

  minKg:=9999;
  writeln('El codigo de pasta menos vendido es: ',codMenosVendido(a,minKg,minCod));

  l:=nil;
  codMas10kg(a,l);
  imprimirLista(l);

  writeln(' ');

  menuOpciones(a,minKg,minCod,l);
  readln;
end.
