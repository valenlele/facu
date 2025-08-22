program ejercicioEntreganb;

const
 MAX_MATERIAS = 3;
 fin='zzz';

type
 TMateria = record
   codigo:string[6];
   nombre:string[50];
 end;
 TMaterias = array[1..MAX_MATERIAS] of TMateria;

 materia=record
   nota:integer;
   cod:string[6];
 end;
 vectorMaterias=array[1..MAX_MATERIAS] of materia;
 alumno=record
   nombre:string;
   legajo:integer;
   materiasAp:vectorMaterias;
   cantAp:integer;
 end;

 lista=^nodo;
 nodo=record
   datos:alumno;
   sig:lista;
 end;

const
  MATERIAS: TMaterias = (
 (codigo: 'E0228'; nombre: 'Práctica Profesional Supervisada'),
 (codigo: 'E0282'; nombre: 'Electrotecnia y Electrónica'),
 (codigo: 'E0301'; nombre: 'Introducción al Diseño Lógico')

 );

procedure nombreMateria(MATERIAS:TMaterias; cod:string; var nombre:string);
var
  j,i,res:integer;
begin
  i:=1;
  j:=MAX_MATERIAS;
  res:=((i+j) div 2);
  while (i<=j) and (MATERIAS[res].codigo<>cod) do begin
    res:=((i+j) div 2);
    if (MATERIAS[res].codigo<cod) then i:=res+1
    else if (MATERIAS[res].codigo>cod) then j:=res-1;
  end;
  if (i>j) then nombre:=' '
  else if (MATERIAS[res].codigo=cod) then begin
    nombre:=MATERIAS[res].nombre;
  end;
end;

function existeCodigoMateria(MATERIAS:TMaterias; cod:string; var nombre:string):boolean;
begin
  nombreMateria(MATERIAS,cod,nombre);
  if (nombre=' ') then existeCodigoMateria:=false
  else if (nombre<>' ') then existeCodigoMateria:=true;
end;

procedure insertarEnVectorMaterias(var alu:alumno; mat:materia);
begin
  if (mat.nota>=6) and (mat.nota<=10) then begin
    alu.cantAp:=alu.cantAp+1;
    alu.materiasAp[alu.cantAp].nota:=mat.nota;
    alu.materiasAp[alu.cantAp].cod:=mat.cod;
  end;
end;

procedure leerInfoAlumno(var alu:alumno; var mat:materia);
var
  cantMaterias:integer;
  nombre:string;
begin
  cantMaterias:=0;
  alu.cantAp:=0;
  writeln('INGRESE INFORMACION DE UN ALUMNO: ');
  write('Nombre: ');
  readln(alu.nombre);
  if (alu.nombre<>fin) then begin
    write('Legajo: ');
    readln(alu.legajo);
    while (cantMaterias<MAX_MATERIAS) do begin
      write('Codigo materia: ');
      readln(mat.cod);
      if (not existeCodigoMateria(MATERIAS,mat.cod,nombre)) then begin
        while (existeCodigoMateria(MATERIAS,mat.cod,nombre)<>true) do begin
          write('El codigo de materia no existe, ingrese otro: ');
          readln(mat.cod);
        end;
      end;
      cantMaterias:=cantMaterias+1;
      write('Nota de materia con codigo (',nombre,') ',mat.cod,': ');
      readln(mat.nota);
      insertarEnVectorMaterias(alu,mat);
    end;
  end;
end;

procedure insertarListaOrdenada(var pri:lista; var alu:alumno);
var
  nue,act,ant:lista;
  encontre:boolean;
begin
  encontre:=false;
  act:=pri;
  ant:=pri;
  new(nue);
  nue^.datos:=alu;
  while (act<>nil) and (not encontre) do begin
    if (alu.nombre<act^.datos.nombre) then encontre:=true
    else begin
      ant:=act;
      act:=act^.sig;
    end;
  end;
  if (ant=act) then pri:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure cargarLista(var pri:lista; var alu:alumno; var mat:materia);
begin
  pri:=nil;
  leerInfoALumno(alu,mat);
  while (alu.nombre<>fin) do begin
    insertarListaOrdenada(pri,alu);
    leerInfoAlumno(alu,mat);
  end;
end;

function notaPromedio(pri:lista):real;
var
  i:integer;
  tot:real;
begin
  tot:=0;
  for i:=1 to pri^.datos.cantAp do tot:=tot+pri^.datos.materiasAp[i].nota;
  if (pri^.datos.cantAp<>0) then notaPromedio:=tot/pri^.datos.cantAp
  else if (pri^.datos.cantAp=0) then notaPromedio:=-1;
end;

procedure mayorNota(pri:lista);
var
  maxNota,i:integer;
  maxNom,maxCod,nombre:string;
begin
  maxNota:=-1;
  for i:=1 to pri^.datos.cantAp do begin
    if (pri^.datos.materiasAp[i].nota>maxNota) then begin
      nombreMateria(MATERIAS,pri^.datos.materiasAp[i].cod,nombre);
      maxNota:=pri^.datos.materiasAp[i].nota;
      maxNom:=nombre;
      maxCod:=pri^.datos.materiasAp[i].cod;
    end;
  end;
  writeln('Materia con mayor nota: ');
  writeln('Nombre: ',maxNom); writeln('Nota: ',maxNota); writeln('Codigo: ',maxCod);
end;

procedure informarAlumnos(pri:lista);
begin
  while (pri<>nil) do begin
    writeln('INFORMACION DE UN ALUMNO: ');
    writeln('Nombre: ',pri^.datos.nombre);
    writeln('Nota promedio: ',notapromedio(pri):2:2);
    mayorNota(pri);
    pri:=pri^.sig;
  end;
end;

procedure liberarMemoria(var pri:lista);
var
  aux:lista;
begin
  while (pri<>nil) do begin
    aux:=pri;
    pri:=pri^.sig;
    dispose(aux);
  end;
end;

var
  alu:alumno;
  pri:lista;
  mat:materia;

begin
  cargarLista(pri,alu,mat);
  informarAlumnos(pri);
  liberarMemoria(pri);
  readln;
end.
