program ejPractica;

const
  fin='ZZZ';

type
  alu=record
    nom,ap:string;
    dni:integer;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:alu;
    HI,HD:arbol;
  end;

  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;

procedure leerALumno(var al:alu);
begin
  with (al) do begin
    write('Nombre: ');
    readln(nom);
    if (nom<>fin) then begin
      write('Apellido: ');
      readln(ap);
      write('DNI: ');
      readln(dni);
    end;
  end;
end;

procedure insertarArbol(var a:arbol; al:alu);
begin
  if (a=nil) then begin
    new(a);
    a^.datos:=al;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.dni>al.dni) then insertarArbol(a^.HI,al)
  else if (a^.datos.dni<al.dni) then insertarArbol(a^.HD,al);
end;

procedure cargarArbol(var a:arbol);
var
  al:alu;
begin
  leerAlumno(al);
  if (al.nom<>fin) then begin
    insertarArbol(a,al);
    writeln(' ');
    cargarArbol(a);
  end;
end;

procedure imprimirDatos(al:alu);
begin
  writeln('Nombre: ',al.nom);
  writeln('Apellido: ',al.ap);
  writeln('DNI: ',al.dni);
end;

procedure imprimirEnOrden(a:arbol);
begin
  if (a<>nil) then begin
    imprimirEnOrden(a^.HI);
    imprimirDatos(a^.datos);
    imprimirEnOrden(a^.HD);
  end;
end;

procedure verDatosDNI(a:arbol; dni:integer; var al:alu);
begin
  if (a<>nil) then begin
    if (a^.datos.dni=dni) then al:=a^.datos
    else if (a^.datos.dni>dni) then verDatosDNI(a^.HI,dni,al)
    else verDatosDNI(a^.HD,dni,al)
  end
  else al.dni:=-1;
end;

procedure verDatosAp(a:arbol; apDatos:string);
begin
  if (a<>nil) then begin
    if (a^.datos.ap=apDatos) then imprimirDatos(a^.datos);
    verDatosAp(a^.HI,apDatos);
    verDatosAp(a^.HD,apDatos);
  end;
end;

var
  a:arbol;
  dniDatos:integer;
  apDatos:string;
  al:alu;

begin
  a:=nil;

  writeln('SE INGRESA INFORMACION DE ALUMNOS: ');
  cargarArbol(a);
  writeln(' ');
  writeln('INFORMACION ORDENADA POR DNI: ');
  imprimirEnOrden(a);

  writeln(' ');

  write('Ingrese el DNI de una persona para ver sus datos: ');
  readln(dniDatos);
  verDatosDNI(a,dniDatos,al);
  if (al.dni<>-1) then imprimirDatos(al)
  else writeln('El alumno no se encuentra en el arbol');

  writeln(' ');

  write('Ingrese un apellido: ');
  readln(apDatos);
  verDatosAp(a,apDatos);

  readln;
end.
