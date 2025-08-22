program ej3;

type
  cadena=string[20];
  paises=record
    pais:cadena;
    prov:cadena;
    ciudad:cadena;
    ingreso:integer;
    hab:integer;
  end;

procedure leerInfo(var p:paises);
begin
  with p do begin
    write('Ingrese el nombre del pais: ');
    readln(pais);
    if (pais<>'zzz') then begin
      write('Ingrese el nombre de la provincia: ');
      readln(prov);
      write('Ingres el nombre de la ciudad: ');
      readln(ciudad);
      write('Ingrese los ingresos de la ciudad: ');
      readln(ingreso);
      write('Ingrese los habitantes de la ciudad: ');
      readln(hab);
    end;
  end;
end;

function ingresoPorHabitante(ingreso,hab:integer):real;
begin
  if (hab<>0) then ingresoPorHabitante:=ingreso/hab;
end;

procedure procesar(p:paises);
var
  ingProv,habProv,ingPais,habPais:integer;
  provAct,paisAct:cadena;
begin
  while (p.pais<>'zzz') do begin
  paisAct:=p.pais;
  habPais:=0;
  ingPais:=0;
  while (p.pais=paisAct) do begin
    provAct:=p.prov;
    habProv:=0;
    ingProv:=0;
    while (p.prov=provAct) and (p.pais=paisAct) do begin
      habProv:=habProv+p.hab;
      ingProv:=ingProv+p.ingreso;
      writeln('El ingreso por habitante de la ciudad ',p.ciudad,' es: ',ingresoPorHabitante(p.ingreso,p.hab):2:2);
      leerInfo(p);
    end;
    writeln('El ingreso por habitante de la provincia ',provAct,' es: ',ingresoPorHabitante(ingProv,habProv):2:2);
    habPais:=habPais+habProv;
    ingPais:=ingPais+ingProv;
  end;
  writeln('El ingreso por habitante del pais ',paisAct,' es: ',ingresoPorHabitante(ingPais,habPais):2:2);
  end;
end;

var
  p:paises;

begin
  leerInfo(p);
  procesar(p);
  readln;
end.

