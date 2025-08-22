program ej3;

type
  fechas = record
    dia:1..31;
    mes:1..12;
    anio:1970..2000;
  end;
  ingresante = record
    apellido,nombre,ciudad:string;
    fecha:fechas;
    titulo:boolean;
    codCarrera:char;
  end;
  lista = ^nodo;
  nodo = record
    datos:ingresante;
    sig:lista;
  end;
  vectorAnios = array[1970..2000] of integer;
  vectorCarreras = array['A'..'C'] of integer; {A = APU. B = LI. C = LS}

procedure eliminar(var l:lista; p:ingresante);
var ant,act:lista;
begin
  act:=l;
  while (act <> nil) and (act^.datos <> p) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (act <> nil) then begin
    if act = l then l:=act^.sig;
    else ant^.sig:=act^.sig;
    dispose(act);
  end;
end;

procedure liberarMemoria(var l:lista);
var sig:lista;
begin
  while (l <> nil) do begin
    sig:=l^.sig;
    dispose(l);
    l:=sig;
  end;
end;

var
  l,act:lista;
  i,j,maxAnio,maxCantAnio,maxInsc,maxCarrera:integer;
  vAnios:vectorAnios;
  vCarreras:vectorCarreras;

begin
  l:=nil;
  cargarLista(l); {se dispone}
  act:=l;
  for i:=1970 to 2000 do vAnios[i]:=0;
  for j:='A' to 'C' do vCarreras[j]:=0;
  while (act <> nil) do begin
    if act^.datos.ciudad = 'Brandsen' then writeln('El apellido del ingresante de Brandsen es: ',act^.datos.apellido);
    vAnios[act^.datos.anio]:=vAnios[act^.datos.anio]+1;
    vCarreras[act^.datos.codCarrera]:=vCarreras[act^.datos.codCarrera]+1;
    if (act^.datos.titulo = false) then eliminar(l,act^.datos))
    act:=act^.sig;
  end;
  maxCantAnio:=-1;
  for i:=1970 to 2000 do begin
    if vAnio[i] > maxCantAnio then begin
      maxCantAnio:=vAnio[i];
      maxAnio:=i;
    end;
  end;
  maxCarrera:=-1;
  for j:='A' to 'C' do begin
    if vCarrera[j] > maxInsc then begin
      maxInsc:=vCarrera[j];
      maxCarrera:=j;
    end;
  end;
  writeln('El anio en el que mas nacieron los ingresantes es: ',maxAnio);
  writeln('La carrera con mayor cantidad de inscriptos es: ',maxCarrera);
  liberarMemoria(l);
  liberarMemoria(act);
end.
