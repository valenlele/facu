program ejPractica;

const
  fin='ZZZ';

type
  alumno=record
    nom,ap:string;
    dni:integer;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:alumno;
    HI:arbol;
    HD:arbol;
  end;

procedure leerDatos(var alu:alumno);
begin
  with (alu) do begin
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

procedure insertarArbol(var a:arbol; alu:alumno);
begin
  if (a=nil) then begin
    new(a);
    a^.datos:=alu;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.dni>alu.dni) then insertarArbol(a^.HI,alu)
  else if (a^.datos.dni<alu.dni) then insertarArbol(a^.HD,alu);
end;

procedure cargarArbol(var a:arbol);
var
  alu:alumno;
begin
  writeln('Se ingresan datos de alumnos de un curso de postgrado: ');
  leerDatos(alu);
  while (alu.nom<>fin) do begin
    insertarArbol(a,alu);
    writeln(' ');
    leerDatos(alu);
  end;
end;

procedure imprimirDatos(alu:alumno);
begin
  writeln('Nombre: ',alu.nom,'. Apellido: ',alu.ap,'. DNI: ',alu.dni);
end;

procedure imprimirEnOrden(a:arbol);
begin
  if (a<>nil) then begin
    imprimirEnOrden(a^.HI);
    imprimirDatos(a^.datos);
    imprimirEnOrden(a^.HD);
  end;
end;

procedure buscarEimprimirDatosDNI(a:arbol; dni:integer; var encontre:boolean);
begin
  if (a<>nil) then begin
    if (a^.datos.dni=dni) then begin
      encontre:=true;
      imprimirDatos(a^.datos);
    end
    else if (a^.datos.dni>dni) then buscarEimprimirDatosDNI(a^.HI,dni,encontre)
    else buscarEimprimirDatosDNI(a^.HD,dni,encontre);
  end
end;

procedure buscarEimprimirDatosAp(a:arbol; ap:string);
begin
  if (a<>nil) then begin
    buscarEimprimirDatosAp(a^.HI,ap);
    if (a^.datos.ap=ap) then imprimirDatos(a^.datos);
    buscarEimprimirDatosAp(a^.HD,ap);
  end;
end;

var
  a:arbol;
  dni:integer;
  encontre:boolean;
  ap:string;

begin
  a:=nil;
  cargarArbol(a);
  writeln('Arbol generado: ');
  imprimirEnOrden(a);

  writeln(' ');

  writeln('Ingrese el DNI del alumno cuyos datos quiere imprimir: ');
  readln(dni);
  encontre:=false;
  buscarEimprimirDatosDNI(a,dni,encontre);
  if (not encontre) then writeln('El alumno con DNI ',dni,' no existe');

  writeln(' ');

  writeln('Ingrese el apellido de los alumnos cuyos datos quiere imprimir: ');
  readln(ap);
  buscarEimprimirDatosAp(a,ap);
  readln;
end.
