{Una casa de venta de pastas frescas lee la información de las ventas que se realizaron durante
un determinado mes. De cada venta se conoce: el código de pasta, cantidad (en kilos), fecha y
número de cliente. Dicha información se procesa hasta que se lee el número de cliente “0000”.
a. Se nos pide generar de forma eficiente, una estructura donde se almacene por cada
código de pasta, la cantidad total vendida durante dicho mes. Esta estructura debe ser
la más eficiente en cuanto a la búsqueda de un código de pasta en particular.
b. Creen un programa que muestre un menú de opciones para:
- Inicializar las estructuras de datos a utilizar en su funcionamiento.
- Leer una venta e incorporar la información a la estructura generada.
- Imprimir la información contenida en la estructura de datos utilizada.
- Buscar e informar el código de pasta menos vendido.
- Informar los códigos de pasta que tuvieron más de 10 kilos en ventas.}

program actColaborativa2;

const
  fin=0;

type
  tFecha=record
    dia:1..31;
    mes:1..12;
  end;

  ventaPasta=record
    cod,cant,nroCliente:integer;
    fecha:tFecha;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:ventaPasta;
    HI:arbol;
    HD:arbol;
  end;

procedure leerDatos(var v:ventaPasta; var nroCliente:integer);
var
  fecha:tFecha;
begin
  write('Numero de cliente: ');
  readln(nroCliente);
  if (nroCliente<>fin) then begin
    write('Codigo de pasta: ');
    readln(v.cod);
    write('Cantidad en kg: ');
    readln(v.cant);
    writeln('Fecha (dia/mes): ');
    readln(fecha.dia);
    readln(fecha.mes)
  end;
end;

procedure insertarArbol(var a:arbol; v:ventaPasta);
begin
  if (a=nil) then begin
    new(a);
    a^.datos:=v;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.cod>v.cod) then insertarArbol(a^.HI,v)
  else if (a^.datos.cod<v.cod) then insertarArbol(a^.HD,v)
  else a^.datos.cant:=a^.datos.cant+v.cant;
end;

procedure generarArbol(var a:arbol);
var
  v:ventaPasta;
  nroCliente:integer;
begin
  writeln('Se ingresan datos de ventas de pastas: ');
  leerDatos(v,nroCliente);
  while (nroCliente<>fin) do begin
    insertarArbol(a,v);
    writeln(' ');
    leerDatos(v,nroCliente);
  end;
end;

procedure cargarUnaVenta(var a:arbol);
var
  v:ventaPasta;
  nroCliente:integer;
begin
  writeln('Se ingresan datos de una venta de pastas: ');
  leerDatos(v,nroCliente);
  if (nroCliente<>fin) then insertarArbol(a,v);
end;

procedure imprimirEnOrden(a:arbol);
begin
  if (a<>nil) then begin
    imprimirEnOrden(a^.HI);
    writeln('Codigo de pasta: ',a^.datos.cod,'. Cantidad de pasta (en kg): ',a^.datos.cant);
    imprimirEnOrden(a^.HD);
  end;
end;

procedure imprimirVenta(v:arbol);
begin
  writeln('Codigo de pasta: ',v^.datos.cod,'. Cantidad de pasta (en kg): ',v^.datos.cant);
end;

procedure buscarEinformarCodMenosVendido(a:arbol);

  function buscarMin(a:arbol; var minCod:arbol; var min:integer):arbol;
  begin
    if (a<>nil) then begin
      if (a^.datos.cant<min) then begin
        min:=a^.datos.cant;
        minCod:=a;
      end;
      buscarMin(a^.HI,minCod,min);
      buscarMin(a^.HD,minCod,min);
    end;
    buscarMin:=minCod;
  end;

var
  minCod:arbol;
  min:integer;
begin
  min:=9999;
  imprimirVenta(buscarMin(a,minCod,min));
end;

procedure buscarEinformarMas10kg(a:arbol);
begin
  if (a<>nil) then begin
    if (a^.datos.cant>10) then imprimirVenta(a);
    buscarEinformarMas10kg(a^.HI);
    buscarEinformarMas10kg(a^.HD);
  end;
end;

procedure menuDeOpciones(var a:arbol);

  procedure mostrarOpciones;
  begin
    writeln('1- Leer una venta e incorporar la información a la estructura generada.');
    writeln('2- Imprimir la información contenida en la estructura de datos utilizada.');
    writeln('3- Buscar e informar el código de pasta menos vendido.');
    writeln('4- Informar los códigos de pasta que tuvieron más de 10 kilos en ventas.');
  end;

var
  opcion:integer;
begin
  writeln('Se muestran opciones para realizar acciones del programa: ');
  mostrarOpciones;
  writeln(' ');
  writeln('Seleccione una opcion o presione 0 para terminar el programa: ');
  readln(opcion);
  while (opcion<>0) do begin
    if (opcion=1) then cargarUnaVenta(a)
    else if (opcion=2) then imprimirEnOrden(a)
    else if (opcion=3) then buscarEinformarCodMenosVendido(a)
    else if (opcion=4) then buscarEinformarMas10kg(a);
    writeln(' ');
    writeln('Seleccione una opcion o presione 0 para terminar el programa: ');
    readln(opcion);
  end;
end;

var
  a:arbol;

begin
  a:=nil;
  generarArbol(a);
  writeln(' ');
  menuDeOpciones(a);
  readln;
end.
