Program ejercicio3;
Uses
     sysutils;

const
  infCod=1000;
  supCod=2000;

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
               dato: pedido;
               sig: listaPedidos;
     end;

  listaDNIs=^nodoL;
  nodoL=record
    dni:integer;
    sig:listaDNIs;
  end;

  datosA=record
    cod,totPedidos:integer;
    DNIs:listaDNIs;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:datosA;
    HI,HD:arbol;
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
         writeln(' ');
end;

procedure imprimirLista(l:listaPedidos);
begin
    while(l<>nil)do
    begin
         imprimirPedido(l^.dato);
         l:=l^.sig;
    end;
end;

procedure cargarArbol(var a:arbol; l:listaPedidos);

  procedure insertarArbol(var a:arbol; l:listaPedidos);

    procedure insertarListaDNIs(var lD:listaDNIs; dni:integer);
    var
      nue:listaDNIs;
    begin
      new(nue);
      nue^.dni:=dni;
      nue^.sig:=lD;
      lD:=nue;
    end;

  begin
    if (a=nil) then begin
      new(a);
      a^.datos.cod:=l^.dato.codArea;
      a^.datos.totPedidos:=1;
      a^.datos.DNIs:=nil;
      insertarListaDNIs(a^.datos.DNIs,l^.dato.dni);
      a^.HI:=nil;
      a^.HD:=nil;
    end
    else if (a^.datos.cod>l^.dato.codArea) then insertarArbol(a^.HI,l)
    else if (a^.datos.cod<l^.dato.codArea) then insertarArbol (a^.HD,l)
    else begin
      insertarListaDNIs(a^.datos.DNIs,l^.dato.dni);
      a^.datos.totPedidos:=a^.datos.totPedidos+1;
    end;
end;

begin
  if (l<>nil) then begin
    insertarArbol(a,l);
    cargarArbol(a,l^.sig);
  end;
end;

procedure imprimirListaDNIs(lD:listaDNIs);
begin
  if (lD<>nil) then begin
    writeln(lD^.dni,' ');
    imprimirListaDNIs(lD^.sig);
  end;
end;

procedure imprimirArbol(a:arbol);

  procedure mostrarInfo(datos:datosA);
  begin
    writeln('Codigo de area: ',datos.cod);
    writeln('Total de pedidos en area: ',datos.totPedidos);
    write('DNIs de clientes: ');
    imprimirListaDNIs(a^.datos.DNIs);
    writeln(' ');
  end;

begin
  if (a<>nil) then begin
    imprimirArbol(a^.HI);
    mostrarInfo(a^.datos);
    writeln(' ');
    imprimirArbol(a^.HD);
  end;
end;

procedure minCodArea(a:arbol; var minCod,minPedidos:integer);
begin
  if (a<>nil)then begin
    minCodArea(a^.HI,minCod,minPedidos);
    if (a^.datos.totPedidos<minPedidos)then begin
      minPedidos:=a^.datos.totPedidos;
      minCod:=a^.datos.cod;
    end;
    minCodArea(a^.HD,minCod,minPedidos);
  end;
end;

procedure imprimirDNIs(a:arbol);
begin
  if (a<>nil) then begin
    if (a^.datos.cod>=infCod) then begin
      if (a^.datos.cod<=supCod) then begin
        writeln('CODIGO DE AREA ',a^.datos.cod,': ');
        imprimirListaDNIs(a^.datos.DNIs);
        imprimirDNIs(a^.HI);
        imprimirDNIs(a^.HD);
      end
      else imprimirDNIs(a^.HI);
    end
    else imprimirDNIs(a^.HD);
  end;
end;

procedure imprimirDNIsCod(a:arbol; cod:integer);
begin
  if (a<>nil) then begin
    if (cod>a^.datos.cod) then imprimirDNIsCod(a^.HD,cod)
    else if (cod<a^.datos.cod) then imprimirDNIsCod(a^.HI,cod)
    else imprimirListaDNIs(a^.datos.DNIs);
  end;
end;

var
   l_inicial: listaPedidos;
   a:arbol;
   minCod,minPedidos,cod:integer;

begin
  Randomize;
  l_inicial:= nil;
  crearLista(l_inicial);
  writeln ('Lista: ');
  imprimirLista(l_inicial);

  a:=nil;
  cargarArbol(a,l_inicial);
  {writeln('ESTRUCTURA GENERADA: ');
  imprimirArbol(a);}

  writeln(' ');

  minPedidos:=9999;
  minCodArea(a,minCod,minPedidos);
  writeln('Codigo de area con menor cantidad de pedidos de servicio: ',minCod);

  writeln(' ');

  writeln('DNIs de clientes cuyo codigo de area se encuentra entre 1000 y 2000: ');
  imprimirDNIs(a);

  writeln(' ');

  write('Ingrese un codigo de area: ');
  readln(cod);
  writeln('DNIs de clientes que solicitan conexion en area con codigo ',cod,': ');
  imprimirDNIsCod(a,cod);

  readln;
end.
