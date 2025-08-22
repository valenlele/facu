Program ej3;
Uses
     sysutils;
Type
  pedido= record
    codSeg: integer;
    fechaYhora: string;
    dni: integer;
    codArea: integer;
    domicilio: string;
    tel: string;
  end;

  listaPedidos = ^nodoLista;
  nodoLista = record
    dato:pedido;
    sig:listaPedidos;
  end;

  listaDni=^nodoListaDni;
  nodoListaDni=record
    dni:integer;
    sig:listaDni;
  end;

  datosA=record
    codArea,totPedidos:integer;
    lDni:listaDni;
  end;

  arbol=^nodoArbol;
  nodoArbol=record
    datos:datosA;
    HI:arbol;
    HD:arbol;
  end;

procedure agregarLista(var pri:listaPedidos; p:pedido);
var
  nuevo, anterior, actual: listaPedidos;
begin
    new (nuevo);
    nuevo^.dato:= p;
    nuevo^.sig := nil;
    if (pri = nil) then
         pri := nuevo
    else
    begin
         actual := pri;
         anterior := pri;
         while (actual<>nil) and (actual^.dato.dni < nuevo^.dato.dni) do begin
              anterior := actual;
              actual:= actual^.sig;
         end;
         if (anterior = actual) then
              pri := nuevo
         else
              anterior^.sig := nuevo;
         nuevo^.sig := actual;
    end;
end;

function cargarFecha(): string;{Genera una FECHA aleatoria}
var
  dia, mes, hora, seg: integer;
  s: string;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  s := Concat(IntToStr(dia),'/',IntToStr(mes),'/2020 - ');
  hora := random(24);
  seg := random(60);
  if(hora < 10)then
	s := Concat(s, '0', IntToStr(hora))
  else
	s:= Concat(s, IntToStr(hora));
  if(seg < 10)then
	s := Concat(s, ':0', IntToStr(seg))
  else
	s:= Concat(s,':', IntToStr(seg));
  cargarFecha:= s;
end;

procedure crearLista(var l: listaPedidos);
var
   cant, cod: integer;
   p: pedido;
begin
     cant:= random(10); {genera hasta 100 elementos}
     cod:= 1;
     while (cant <> 0) do Begin
          p.codSeg:= cod;  {codigo de seguimiento}
          p.fechaYhora := cargarFecha();
          p.dni := random(60000000);  {dni}
          p.codArea := (random(4000)); {codigo de área}
          p.domicilio:= Concat('Domicilio', IntToStr(cod)); {domicilio}
          p.tel:= IntToStr(random(999999)+4000000); {telefono}
          agregarLista(l, p);
          cant:= cant-1;
          cod := cod+1;
     end;
end;

procedure imprimirPedido(p:pedido);
begin
    with(p)do
         writeln('El pedido ',codSeg, ' del cliente ', dni, ' sera atendido en la fecha ', fechaYhora, ' en el codigo de area ', codArea, ' y domicilio ', domicilio, ' con tel. de contacto ', tel);
end;

procedure imprimirLista(l:listaPedidos);
begin
    while(l<>nil)do
    begin
         imprimirPedido(l^.dato);
         l:=l^.sig;
    end;
end;

procedure agregarFinal(var lDni:listaDni; dni:integer);
var
  nue,act:listaDni;
begin
  new(nue);
  nue^.dni:=dni;
  nue^.sig:=nil;
  if (lDni<>nil) then begin
    act:=lDni;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lDni:=nue;
end;

procedure insertarDatos(var a:arbol; p:pedido);
begin
  a^.datos.codArea:=p.codArea;
  a^.datos.totPedidos:=1;
  a^.datos.lDni:=nil;
  agregarFinal(a^.datos.lDni,p.dni);
end;

procedure insertarArbol(var a:arbol; p:pedido);
begin
  if (a=nil) then begin
    new(a);
    insertarDatos(a,p);
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.codArea>p.codArea) then insertarArbol(a^.HI,p)
  else if (a^.datos.codArea<p.codArea) then insertarArbol(a^.HD,p)
  else begin
    a^.datos.totPedidos:=a^.datos.totPedidos+1;
    agregarFinal(a^.datos.lDni,p.dni);
  end;
end;

procedure cargarArbol(var a:arbol; l:listaPedidos);
begin
  a:=nil;
  while (l<>nil) do begin
    insertarArbol(a,l^.dato);
    l:=l^.sig;
  end;
end;

procedure imprimirListaDNIs(lDni:listaDni);
begin
  while (lDni<>nil) do begin
    writeln('DNI: ',lDni^.dni);
    lDni:=lDni^.sig;
  end;
end;

procedure imprimirEnOrden(a:arbol);
begin
  if (a<>nil) then begin
    imprimirEnOrden(a^.HI);
    writeln('Codigo de area: ',a^.datos.codArea,'. Pedidos totales: ',a^.datos.totPedidos,'. Lista de DNIs de clientes que solicitaron servicio: ');
    imprimirListaDNIs(a^.datos.lDni);
    imprimirEnOrden(a^.HD);
  end;
end;

function codAreaMenorPedidos(a:arbol; var minCodArea, minPedidos:integer):integer;
begin
  if (a<>nil) then begin
    if (a^.datos.totPedidos<minPedidos) then begin
      minPedidos:=a^.datos.totPedidos;
      minCodArea:=a^.datos.codArea;
    end;
    codAreaMenorPedidos(a^.HI,minCodArea,minPedidos);
    codAreaMenorPedidos(a^.HD,minCodArea,minPedidos);
  end;
  codAreaMenorPedidos:=minCodArea;
end;

procedure recorrerEinformar(lDni:listaDni);
begin
  while (lDni<>nil) do begin
    writeln('DNI: ',lDni^.dni);
    lDni:=lDni^.sig;
  end;
end;

procedure imprimirEnRango(a:arbol; inf,sup:integer);
begin
  if (a<>nil) then
    if (a^.datos.codArea>=inf) then
      if (a^.datos.codArea<=sup) then begin
        imprimirEnRango(a^.HI,inf,sup);
        writeln('Codigo de area: ',a^.datos.codArea);
        recorrerEinformar(a^.datos.lDni);
        imprimirEnRango(a^.HD,inf,sup);
      end
      else
        imprimirEnRango(a^.HI,inf,sup)
    else
      imprimirEnRango(a^.HD,inf,sup);
end;

procedure imprimirDNIsCodArea(a:arbol; codArea:integer; var encontre:boolean);
begin
  if (a^.datos.codArea>codArea) then imprimirDNIsCodArea(a^.HI,codArea,encontre)
  else if (a^.datos.codArea<codArea) then imprimirDNIsCodArea(a^.HD,codArea,encontre)
  else begin
    encontre:=true;
    writeln('DNIs de clientes que solicitan conexion en codigo de area ',codArea,': ');
    recorrerEinformar(a^.datos.lDni);
  end;
end;

var
  l_inicial:listaPedidos;
  a:arbol;
  minPedidos,minCodArea,codArea:integer;
  encontre:boolean;

begin
  Randomize;
  {Se crea la estructura inicial}
  l_inicial:= nil;
  crearLista(l_inicial);
  writeln ('Lista: ');
  imprimirLista(l_inicial);

  writeln(' ');

  cargarArbol(a,l_inicial);
  writeln('Estructura generada: ');
  imprimirEnOrden(a);

  writeln(' ');

  minPedidos:=9999;
  writeln('El codigo de area con la menor cantidad de pedidos de servicio: ',codAreaMenorPedidos(a,minCodArea,minPedidos));

  writeln(' ');

  writeln('DNIs de clientes cuyo código de área se encuentra entre 1000 y 2000: ');
  imprimirEnRango(a,1000,2000);

  writeln(' ');

  encontre:=false;
  write('Ingrese un codigo de area: ');
  readln(codArea);
  imprimirDNIsCodArea(a,codArea,encontre);

  writeln('Fin del programa');
  readln;
end.
