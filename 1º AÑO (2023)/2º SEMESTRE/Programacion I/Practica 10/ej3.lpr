program ej3;

const
  fin='zzz';

type
  rangoAnio=1970..2000;
  rFecha=record
    dia:1..30;
    mes:1..12;
    anio:rangoAnio;
  end;

  estudiante=record
    ap,nom,ciudad:string;
    fecha:rFecha;
    titulo:boolean;
    cod:char;
  end;

  lista=^nodo;
  nodo=record
    datos:estudiante;
    sig:lista;
  end;

  vectorAnios=array[rangoAnio] of integer;

  rangoCarrera='A'..'C';
  vecCarreras=array[rangoCarrera] of integer;

procedure leerInfo(var e:estudiante);
var
  resp:string[2];
begin
  with e do begin
    writeln('INGRESE INFORMACION DE UN ESTUDIANTE: ');
    write('Apellido: ');
    readln(ap);
    if (ap<>fin) then begin
      write('Nombre: ');
      readln(nom);
      write('Ciudad de origen: ');
      readln(ciudad);
      write('Fecha de nacimiento: ');
      readln(fecha.dia);
      readln(fecha.mes);
      readln(fecha.anio);
      write('¿Presento titulo del colegio secundario?: ');
      readln(resp);
      if (resp='si') then titulo:=true
      else if (resp='no') then titulo:=false;
      write('Codigo de carrera: ');
      readln(cod);
      writeln(' ');
    end;
  end;
end;

procedure insertarFinal(var pri,ult:lista; e:estudiante);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=e;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure cargarLista(var pri,ult:lista);  //se dispone enunciado
var
  e:estudiante;
begin
  leerInfo(e);
  while (e.ap<>fin) do begin
    insertarFinal(pri,ult,e);
    leerInfo(e);
  end;
end;

procedure informarBrandsen(ciudad,apellido:string);
begin
  if (ciudad='Brandsen') then writeln('Apellido de ingresante con ciudad de origen en Branden: ',apellido);
end;

procedure inicializarVecAnios(var vecAnios:vectorAnios);
var
  i:rangoAnio;
begin
  for i:=1970 to 2000 do vecAnios[i]:=0;
end;

procedure insertarVecAnios(var vecAnios:vectorAnios; anio:rangoAnio);
begin
  vecAnios[anio]:=vecAnios[anio]+1;
end;

procedure informarMaxAnio(vecAnios:vectorAnios);
var
  i,maxAnio:rangoAnio;
  maxIng:integer;
begin
  maxIng:=-1;
  for i:=1970 to 2000 do begin
    if (vecAnios[i]>maxIng) then begin
      maxIng:=vecAnios[i];
      maxAnio:=i;
    end;
  end;
  if (maxIng=1) then writeln('No hay un anio en el que mas ingresantes nacieron')
  else writeln('El anio en que mas ingresantes nacieron es: ',maxAnio);
end;

procedure inicializarVecCarreras(var vecCarr:vecCarreras);
var
  i:rangoCarrera;
begin
  for i:='A' to 'C' do vecCarr[i]:=0;
end;

procedure insertarVecCarreras(var vecCarr:vecCarreras; carrera:char);
begin
  vecCarr[carrera]:=vecCarr[carrera]+1;
end;

procedure informarMaxInscriptos(vecCarr:vecCarreras);
var
  i,maxCarr:rangoCarrera;
  maxInsc:integer;
begin
  maxInsc:=-1;
  for i:='A' to 'C' do begin
    if (vecCarr[i]>maxInsc) then begin
      maxInsc:=vecCarr[i];
      maxCarr:=i;
    end;
  end;
  writeln('La carrera con mayor cantidad de inscriptos es: ',maxCarr);
end;

procedure eliminar(var pri:lista; e:estudiante);
var
  ant,act:lista;
begin
  ant:=pri;
  act:=pri;
  while (act<>nil) and (act^.datos.ap<>e.ap) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (act<>nil) then begin
    if (pri=act) then pri:=act^.sig
    else ant^.sig:=act^.sig;
    dispose(act);
  end;
end;

procedure recorrerLista(var pri:lista; var vecAnios:vectorAnios; var vecCarr:vecCarreras);
var
  aux:lista;
begin
  aux:=pri;
  while (aux<>nil) do begin
    informarBrandsen(aux^.datos.ciudad,aux^.datos.ap);
    insertarVecAnios(vecAnios,aux^.datos.fecha.anio);
    insertarVecCarreras(vecCarr,aux^.datos.cod);
    if (aux^.datos.titulo=false) then eliminar(pri,aux^.datos);
    aux:=aux^.sig;
  end;
  informarMaxAnio(vecAnios);
  informarMaxInscriptos(vecCarr);
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
  pri,ult:lista;
  vecAnios:vectorAnios;
  vecCarr:vecCarreras;

begin
  pri:=nil;
  inicializarVecAnios(vecAnios);
  inicializarVecCarreras(vecCarr);
  cargarLista(pri,ult); //se dispone enunciado
  recorrerLista(pri,vecAnios,vecCarr);
  liberarMemoria(pri);
  readln;
end.
