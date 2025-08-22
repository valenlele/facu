program actcolaborativa1;

const
  fin='Fin';

type

  viaje=record
    nomDestino:string;
    dist:real;
    cantPasajes:integer;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:viaje;
    HI:arbol;
    HD:arbol;
  end;

procedure leerDatos(var d:viaje);
begin
  with d do begin
    write('Nombre destino: ');
    readln(nomDestino);
    if (nomDestino<>fin) then begin
      write('Distancia: ');
      readln(dist);
      write('Cantidad de pasajes vendidos: ');
      readln(cantPasajes);
    end;
  end;
end;

procedure insertarArbol(var a:arbol; v:viaje);
begin
  if (a=nil) then begin
    new(a);
    a^.datos:=v;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.nomDestino>v.nomDestino) then insertarArbol(a^.HI,v)
  else if (a^.datos.nomDestino<v.nomDestino) then insertarArbol(a^.HD,v);
end;

procedure cargarArbolDestinos(var a:arbol);
var
  v:viaje;
begin
  writeln('Se ingresan datos de destinos de viajes: ');
  leerDatos(v);
  while (v.nomDestino<>'Fin') do begin
    insertarArbol(a,v);
    writeln(' ');
    leerDatos(v);
  end;
end;

procedure cargarUnDestino(var a:arbol);
var
  v:viaje;
begin
  writeln('Se ingresan datos de un destino de viaje: ');
  leerDatos(v);
  if (v.nomDestino<>'Fin') then insertarArbol(a,v);
end;

procedure imprimirEnOrden(a:arbol);
begin
  if (a<>nil) then begin
    imprimirEnOrden(a^.HI);
    writeln('Nombre del destino: ',a^.datos.nomDestino,'. Distancia en km: ',a^.datos.dist:2:2,'. Cantidad de pasajes vendidos: ',a^.datos.cantPasajes);
    imprimirEnOrden(a^.HD);
  end;
end;

function buscar(a:arbol; nomDestino:string):arbol;
begin
  if (a<>nil) then begin
    if (a^.datos.nomDestino=nomDestino) then buscar:=a
    else if (a^.datos.nomDestino>nomDestino) then buscar:=buscar(a^.HI,nomDestino)
    else buscar:=buscar(a^.HD,nomDestino);
  end
  else buscar:=nil;
end;

procedure imprimirDestino(destino:arbol);
  begin
    writeln('Nombre del destino: ',destino^.datos.nomDestino,'. Distancia en km del destino: ',destino^.datos.dist:2:2,'. Cantidad de pasajes vendidos: ',destino^.datos.cantPasajes);
  end;

procedure buscarEimprimirDestino(a:arbol; nomDestino:string);
var
  destino:arbol;
begin
  destino:=buscar(a,nomDestino);
  if (destino<>nil) then imprimirDestino(destino)
  else writeln('El destino ingresado no existe');
end;

procedure buscarEinformarDestMasCercano(a:arbol);

  function buscarMin(a:arbol; var minDest:arbol; var min:real):arbol;
  begin
    if (a<>nil) then begin
      if (a^.datos.dist<min) then begin
        min:=a^.datos.dist;
        minDest:=a;
      end;
      buscarMin(a^.HI,minDest,min);
      buscarMin(a^.HD,minDest,min);
    end;
    buscarMin:=minDest;
  end;
var
  minDest:arbol;
  min:real;
begin
  min:=9999;
  imprimirDestino(buscarMin(a,minDest,min));
end;

procedure sumarPasajes(var a:arbol; nomDest:string; cantPasajes:integer);
var
  destBuscado:arbol;
begin
  destBuscado:=buscar(a,nomDest);
  destBuscado^.datos.cantPasajes:=destBuscado^.datos.cantPasajes+cantPasajes;
end;

procedure menuDeOpciones(var a:arbol);

  procedure mostrarOpciones;
  begin
    writeln('1- Cargar un destino a la estructura utilizada.');
    writeln('2- Imprimir la información contenida en la estructura de datos utilizada');
    writeln('3- Buscar un destino dentro de la estructura de datos utilizada y mostrar toda su información.');
    writeln('4- Buscar e informar el destino más cercano.');
    writeln('5- Sumar una cantidad X de pasajes a un destino.');
  end;

var
  opcion,cantPasajes:integer;
  nomDest:string;
begin
  writeln('Se muestran opciones para realizar acciones del programa: ');
  mostrarOpciones;
  writeln(' ');
  writeln('Seleccione una opcion o presione 0 para terminar el programa: ');
  readln(opcion);
  while (opcion<>0) do begin
    if (opcion=1) then cargarUnDestino(a)
    else if (opcion=2) then imprimirEnOrden(a)
    else if (opcion=3) then begin
      writeln('Ingrese el nombre del destino a buscar: ');
      readln(nomDest);
      buscarEimprimirDestino(a,nomDest);
    end
    else if (opcion=4) then buscarEinformarDestMasCercano(a)
    else if (opcion=5) then begin
      writeln('Ingrese el nombre del destino al que quiere sumar pasajes: ');
      readln(nomDest);
      writeln('Ingrese la cantidad de pasajes que quiere sumar: ');
      readln(cantPasajes);
      sumarPasajes(a,nomDest,cantPasajes);
    end;
    writeln(' ');
    writeln('Seleccione una opcion o presione 0 para terminar el programa: ');
    readln(opcion);
  end;
end;

var
  a:arbol;

begin
  a:=nil;
  cargarArbolDestinos(a);
  writeln(' ');
  menuDeOpciones(a);
  readln;
end.
