program ej2actcolaborativa2;

const
  fin=-1;

type
  paciente=record
    dni:longint;
    codPostal:integer;
    ciudad:string;
  end;

  listaPacientes=^nodoLPacientes;
  nodoLPacientes=record
    dni:longint;
    sig:listaPacientes;
  end;

  datosA=record
    codPostal,cantPacientes:integer;
    ciudad:string;
    lPacientes:listaPacientes;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:datosA;
    HI:arbol;
    HD:arbol;
  end;

procedure leerInfoPaciente(var p:paciente);
begin
  writeln('Se ingresa informacion de un paciente infectado por COVID: ');
  with (p) do begin
    write('DNI: ');
    readln(dni);
    if (dni<>fin) then begin
      write('Codigo postal: ');
      readln(codPostal);
      write('Ciudad donde vive: ');
      readln(ciudad);
      writeln(' ');
    end;
  end;
end;

procedure agregarFinalListaPacientes(var lPacientes:listaPacientes; p:paciente);
  var
    nue,act:listaPacientes;
  begin
    new(nue);
    nue^.dni:=p.dni;
    nue^.sig:=nil;
    if (lPacientes<>nil) then begin
      act:=lPacientes;
      while (act^.sig<>nil) do act:=act^.sig;
      act^.sig:=nue;
    end
    else lPacientes:=nue;
  end;

procedure insertarArbol(var a:arbol; p:paciente);

  procedure insertarDatos(var a:arbol; p:paciente);
  begin
    a^.datos.codPostal:=p.codPostal;
    a^.datos.ciudad:=p.ciudad;
    a^.datos.cantPacientes:=1;
    a^.datos.lPacientes:=nil;
    agregarFinalListaPacientes(a^.datos.lPacientes,p)
  end;

begin
  if (a=nil) then begin
    new(a);
    insertarDatos(a,p);
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.codPostal>p.codPostal) then insertarArbol(a^.HI,p)
  else if (a^.datos.codPostal<p.codPostal) then insertarArbol(a^.HD,p)
  else begin
    agregarFinalListaPacientes(a^.datos.lPacientes,p);
    a^.datos.cantPacientes:=a^.datos.cantPacientes+1;
  end;
end;

procedure crearArbol(var a:arbol);
var
  p:paciente;
begin
  a:=nil;
  leerInfoPaciente(p);
  while (p.dni<>fin) do begin
    insertarArbol(a,p);
    leerInfoPaciente(p);
  end;
end;

procedure imprimirListaPacientes(lPacientes:listaPacientes);
begin
  while (lPacientes<>nil) do begin
    writeln('DNI: ',lPacientes^.dni);
    lPacientes:=lPacientes^.sig;
  end;
end;

procedure imprimirEnOrden(a:arbol);
begin
  if (a<>nil) then begin
    imprimirEnOrden(a^.HI);
    writeln('Codigo postal: ',a^.datos.codPostal,'. Ciudad: ',a^.datos.ciudad,'. Cantidad de pacientes infectados: ',a^.datos.cantPacientes,'. Lista de pacientes infectados: ');
    imprimirListaPacientes(a^.datos.lPacientes);
    imprimirEnOrden(a^.HD);
  end;
end;

procedure cantInfectadosCodPostal(a:arbol; inf,sup:integer; var cantInf:integer);
begin
  if (a<>nil) then
    if (a^.datos.codPostal>=inf) then
      if (a^.datos.codPostal<=sup) then begin
        cantInf:=cantInf+a^.datos.cantPacientes;
        cantInfectadosCodPostal(a^.HI,inf,sup,cantInf);
        cantInfectadosCodPostal(a^.HD,inf,sup,cantInf);
      end
      else
        cantInfectadosCodPostal(a^.HI,inf,sup,cantInf)
    else
      cantInfectadosCodPostal(a^.HD,inf,sup,cantInf);
end;

var
  a:arbol;
  cantInf:integer;

begin
  crearArbol(a);
  writeln('Arbol generado: ');
  imprimirEnOrden(a);
  writeln(' ');
  cantInf:=0;
  cantInfectadosCodPostal(a,1800,1900,cantInf);
  writeln('La cantidad de pacientes infectados de aquellas localidades con codigo postal entre 1800 y 1900 es: ',cantInf);
  readln;
end.
