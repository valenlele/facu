program actColaborativa2Ej2;

const
  fin=-1;

type
  paciente=record
    cod:integer;
    ciudad:string;
  end;

  listaDNIs=^nodoDNIs;
  nodoDNIs=record
    dni:integer;
    sig:listaDNIs;
  end;

  datosA=record
    p:paciente;
    DNIs:listaDNI;
  end;

  arbol=^nodoA;
  nodoA=record
    datosP:datosA;
    HI,HD:arbol;
  end;

procedure leerPaciente(var p:paciente; var dni:integer);
begin
  write('DNI: ');
  readln(dni);
  if (dni<>fin) then begin
    write('Codigo postal: ');
    readln(p.cod);
    write('Ciudad: ');
    readln(p.ciudad);
  end;
end;

procedure insertarArbol(var a:arbol; p:paciente);
begin
  if (a=nil) then begin
    new(a);
    a^.datosP.cod:=p.cod;
    a^.datosP.ciudad:=p.ciudad;
    a^.datosP.DNIs:=nil;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else begin
    if (a^.datosP.cod>p.cod) then insertarArbol(a^.HI,p)
    else if (a^.datosP.cod<p.cod) then insertarArbol(a^.HD,p)
    else a^.datosP.cantP:=a^.datosP.cantP+1;
  end;
end;

procedure cargarArbol(var a:arbol);
var
  p:paciente;
  dni:integer;
begin
  leerPaciente(p,dni);
  if (dni<>fin) then begin
    insertarArbol(a,p);
    writeln(' ');
    cargarArbol(a);
  end;
end;

procedure enOrden(a:arbol);

  procedure imprimirInfo(p:paciente);
  begin
    writeln('Codigo postal: ',p.cod);
    writeln('Ciudad: ',p.ciudad);
    writeln('Cantidad de habitantes infectados: ',p.cantP);
  end;

begin
  if (a<>nil) then begin
    enOrden(a^.HI);
    imprimirInfo(a^.datosP);
    enOrden(a^.HD);
  end;
end;

{procedure cantInf(a:arbol; inf,sup:integer);
begin
  if (a<>nil) then begin
    if (a^.datosP.cod>=inf) then begin
      if (a^.datosP.cod<=sup) then begin
        writeln('Infectados ',a^.datosP.ciudad,': ',a^.datosP.cantP);
        cantInf(a^.HI,inf,sup);
        cantInf(a^.HD,inf,sup);
      end
      else cantInf(a^.HI,inf,sup);
    end
    else cantInf(a^.HD,inf,sup);
  end;
end;}

var
  a:arbol;

begin
  a:=nil;
  writeln('SE INGRESA INFORMACION DE PACIENTES: ');
  cargarArbol(a);
  writeln(' ');

  write('INFORMACION GENERADA: ');
  enOrden(a);

  {writeln('La cantidad de infectados en localidades cuyo codigo postal esta entre 1800 y 1900 es: ');
  cantInf(a,1800,1900);}

  readln;
end.
