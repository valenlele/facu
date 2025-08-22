program final;

const
  fin=-1;

type
  viaje=record
    codVehiculo:integer;
    anti,codLocalidad:integer;
    fecha:string;
    dist:real;
  end;

  listaLocalidades=^nodoL;
  nodoL=record
    codLocalidad:integer;
    sig:listaLocalidades;
  end;

  datosA=record
    codVehiculo:integer;
    totKm:real;
    lLocalidades:listaLocalidades;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:datosA;
    HI:arbol;
    HD:arbol;
  end;

procedure leerInfo(var v:viaje);
begin
  writeln('Se ingresa informacion de los viajes de una mudadora: ');
  with (v) do begin
    write('Codigo identificador del vehiculo: ');
    readln(codVehiculo);
    if (codVehiculo<>fin) then begin
      write('Antiguedad del vehiculo en anios: ');
      readln(anti);
      write('Fecha (dia/mes/anio): ');
      readln(fecha);
      write('Distancia recorrida en km: ');
      readln(dist);
      write('Codigo de localidad del destino: ');
      readln(codLocalidad);
      writeln(' ');
    end;
  end;
end;

procedure insertarFinal(var lLocalidades:listaLocalidades; codLocalidad:integer);
var
  nue,act:listaLocalidades;
begin
  new(nue);
  nue^.codLocalidad:=codLocalidad;
  nue^.sig:=nil;
  if (lLocalidades<>nil) then begin
    act:=lLocalidades;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lLocalidades:=nue;
end;

procedure insertarDatos(var a:arbol; v:viaje);
begin
  a^.datos.codVehiculo:=v.codVehiculo;
  a^.datos.totKm:=v.dist;
  a^.datos.lLocalidades:=nil;
  insertarFinal(a^.datos.lLocalidades,v.codLocalidad);
end;

procedure insertarArbol(var a:arbol; v:viaje);
begin
  if (a=nil) then begin
    new(a);
    a^.HI:=nil;
    a^.HD:=nil;
    insertarDatos(a,v);
  end
  else if (a^.datos.codVehiculo>v.codVehiculo) then insertarArbol(a^.HI,v)
  else if (a^.datos.codVehiculo<v.codVehiculo) then insertarArbol(a^.HD,v)
  else begin
    a^.datos.totKm:=a^.datos.totKm+v.dist;
    insertarFinal(a^.datos.lLocalidades,v.codLocalidad);
  end;
end;

procedure cargarArbol(var a:arbol);
var
  v:viaje;
begin
  leerInfo(v);
  while (v.codVehiculo<>fin) do begin
    insertarArbol(a,v);
    leerInfo(v);
  end;
end;

procedure imprimirListadoLocalidades(lLocalidades:listaLocalidades);
begin
  while (lLocalidades<>nil) do begin
    writeln('Localidad: ',lLocalidades^.codLocalidad);
    writeln(' ');
    lLocalidades:=lLocalidades^.sig;
  end;
end;

procedure imprimirVehiculo(v:datosA);
begin
  writeln('Codigo identificador del vehiculo: ',v.codVehiculo);
  writeln('Kilometros totales recorridos: ',v.totKm:2:2);
  writeln('Listado localidades visitadas: ');
  imprimirListadoLocalidades(v.lLocalidades);
  writeln(' ');
end;

procedure recorrerEimprimirArbol(a:arbol);
begin
  if (a<>nil) then begin
    recorrerEimprimirArbol(a^.HI);
    imprimirVehiculo(a^.datos);
    recorrerEimprimirArbol(a^.HD);
  end;
end;

procedure imprimirEnRango(a:arbol; inf,sup:integer);
begin
  if (a<>nil) then
    if (a^.datos.codVehiculo>=inf) then
      if (a^.datos.codVehiculo<=sup) then begin
        imprimirEnRango(a^.HD,inf,sup);
        writeln('Codigo: ',a^.datos.codVehiculo);
        imprimirEnRango(a^.HI,inf,sup);
      end
      else
        imprimirEnRango(a^.HI,inf,sup)
    else
      imprimirEnRango(a^.HD,inf,sup);
end;

function evaluar(totKm:real):boolean;
begin
  evaluar:=(totKm>=10000) and (totKm<=30000);
end;

procedure imprimirKmEnRango(a:arbol);
begin
  if (a<>nil) then begin
    imprimirKmEnRango(a^.HI);
    if (evaluar(a^.datos.totKm)) then writeln('Codigo: ',a^.datos.codVehiculo);
    imprimirKmEnRango(a^.HD);
  end;
end;

var
  a:arbol;

begin
  a:=nil;
  cargarArbol(a);
  writeln(' ');
  writeln('Arbol generado: ');
  recorrerEimprimirArbol(a);

  writeln(' ');

  writeln('Se imprimen codigos identificadores de vehiculos entre 20 y 40: ');
  imprimirEnRango(a,20,40);

  writeln(' ');

  writeln('Se imprimen codigos de identificadores de vehiculos cuya distancia recorrida se encuentra entre 10000 y 30000: ');
  imprimirKmEnRango(a);
  readln;
end.
