program ej2;

const
  fin='Fin';

type

  venta=record
    codVuelo,nomAp,clase:string;
    cantMillas:real;
    dni:longint;
  end;

  dLista=record
    codVuelo:string;
    punt:real;
  end;

  listaVuelos=^nodoL;
  nodoL=record
    datos:dLista;
    sig:listaVuelos;
  end;

  datosA=record
    dni:longint;
    nomAp:string;
    puntTot:real;
    lVuelos:listaVuelos;
  end;

  arbolPasajeros=^nodoA;
  nodoA=record
    datos:datosA;
    HI:arbolPasajeros;
    HD:arbolPasajeros;
  end;

procedure leerInfoVenta(var v:venta);
begin
  writeln('Se ingresa informacion de una venta de pasaje: ');
  with (v) do begin
    write('Codigo de vuelo: ');
    readln(codVuelo);
    if (codVuelo<>fin) then begin
      write('Cantidad de millas recorridas: ');
      readln(cantMillas);
      write('DNI del pasajero: ');
      readln(dni);
      write('Nombre y apellido: ');
      readln(nomAp);
      write('Clase en que solicito el vuelo: ');
      readln(clase);
      writeln(' ');
    end;
  end;
end;

function calcularPuntos(cantMillas:real; clase:string):real;
begin
  if (clase='ejecutiva') then calcularPuntos:=cantMillas*100
  else if (clase='turista') then calcularPuntos:=cantMillas*25;
end;

procedure agregarFinalListaVuelos(var lVuelos:listaVuelos; codVuelo:string; puntos:real);
var
  nue,act:listaVuelos;
begin
  new(nue);
  nue^.datos.codVuelo:=codVuelo;
  nue^.datos.punt:=puntos;
  nue^.sig:=nil;
  if (lVuelos<>nil) then begin
    act:=lVuelos;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lVuelos:=nue;
end;

procedure insertarDatos(var a:arbolPasajeros; v:venta; puntos:real);
begin
  a^.datos.dni:=v.dni;
  a^.datos.nomAp:=v.nomAp;
  puntos:=calcularPuntos(v.cantMillas,v.clase);
  a^.datos.puntTot:=puntos;
  a^.datos.lVuelos:=nil;
  agregarFinalListaVuelos(a^.datos.lVuelos,v.codVuelo,puntos);
end;

procedure insertarArbol(var a:arbolPasajeros; v:venta);
var
  puntos:real;
begin
  if (a=nil) then begin
    new(a);
    insertarDatos(a,v,puntos);
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.dni>v.dni) then insertarArbol(a^.HI,v)
  else if (a^.datos.dni<v.dni) then insertarArbol(a^.HD,v)
  else begin
    puntos:=calcularPuntos(v.cantMillas,v.clase);
    agregarFinalListaVuelos(a^.datos.lVuelos,v.codVuelo,puntos);
    a^.datos.puntTot:=a^.datos.puntTot+puntos;
  end;
end;

procedure cargarArbol(var a:arbolPasajeros);
var
  v:venta;
begin
  a:=nil;
  leerInfoVenta(v);
  while (v.codVuelo<>fin) do begin
    insertarArbol(a,v);
    leerInfoVenta(v);
  end;
end;

procedure imprimirListaVuelos(lVuelos:listaVuelos);
begin
  while (lVuelos<>nil) do begin
    writeln('Codigo de vuelo: ',lVuelos^.datos.codVuelo,'. Puntaje: ',lVuelos^.datos.punt:2:2);
    lVuelos:=lVuelos^.sig;
  end;
end;

procedure imprimirEnOrden(a:arbolPasajeros);
begin
  if (a<>nil) then begin
    imprimirEnOrden(a^.HI);
    writeln('DNI: ',a^.datos.dni,'. Nombre y apellido: ',a^.datos.nomAp,'. Puntaje total: ',a^.datos.puntTot:2:2,'. Lista de vuelos: ');
    imprimirListaVuelos(a^.datos.lVuelos);
    imprimirEnOrden(a^.HD);
  end;
end;

procedure maxPuntaje(a:arbolPasajeros; var max:real; var maxDni:longint);
begin
  if (a<>nil) then begin
    maxPuntaje(a^.HI,max,maxDni);
    if (a^.datos.puntTot>max) then begin
      max:=a^.datos.puntTot;
      maxDni:=a^.datos.dni;
    end;
    maxPuntaje(a^.HD,max,maxDni);
  end;
end;

procedure recorrerEinformar(lVuelos:listaVuelos; dni:longint);
var
  max:real;
begin
  max:=-1;
  while (lVuelos<>nil) do begin
    if (lVuelos^.datos.punt>max) then max:=lVuelos^.datos.punt;
    lVuelos:=lVuelos^.sig;
  end;
  writeln('Mayor puntaje de pasajero con DNI ',dni,': ',max:2:2);
end;

procedure maxPuntajeRango(a:arbolPasajeros; inf,sup:integer);
begin
  if (a<>nil) then
    if (a^.datos.dni>=inf) then
      if (a^.datos.dni<=sup) then begin
        recorrerEinformar(a^.datos.lVuelos,a^.datos.dni);
        maxPuntajeRango(a^.HI,inf,sup);
        maxPuntajeRango(a^.HD,inf,sup);
      end
      else
        maxPuntajeRango(a^.HI,inf,sup)
    else
      maxPuntajeRango(a^.HD,inf,sup);
end;

var
  a:arbolPasajeros;
  max:real;
  maxDni:longint;

begin
  cargarArbol(a);
  writeln('Estructura generada: ');
  imprimirEnOrden(a);

  writeln(' ');

  max:=-1;
  maxPuntaje(a,max,maxDni);
  writeln('El DNI de la persona con mayor puntaje es: ',maxDni,'. Su puntaje es: ',max:2:2);

  writeln('Mayores puntajes de pasajeros cuyo DNI se encuentre entre 40000000 y 50000000: ');
  maxPuntajeRango(a,40000000,50000000);

  readln;
end.
