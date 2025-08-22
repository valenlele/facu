program ej8;

const
  fin = 'zzz';

type
  cadena20 = string [20];
  numeros = 0..100;
  examen = record
    nombre:cadena20;
    continente:cadena20;
    puntaje:numeros;
  end;

var
  e:examen;
  max_puntaje:integer;
  max_nombre:cadena20;
  apro_e:integer;
  apro_a:integer;
  apro_as:integer;
  prom_e:integer;
  prom_a:integer;
  prom_as:integer;
  promedio:real;

procedure leer(var e:examen);
begin
  with e do
    begin
      readln(nombre);
      readln(continente);
      readln(puntaje);
    end;
end;

procedure mejor_calif(var e:examen; var max_puntaje:integer; var max_nombre:cadena20);
begin
  if e.puntaje > max_puntaje then
    begin
      max_puntaje:=e.puntaje;
      max_nombre:=e.nombre;
    end;
end;

procedure aprobar(var e:examen; var apro_e:integer; var apro_a:integer; var apro_as:integer);
begin
  case e.continente of
    'europa':if (e.puntaje >= 70) and (e.puntaje < 90) then
      apro_e:=apro_e+1;
    'america':if (e.puntaje >= 70) and (e.puntaje < 90) then
      apro_a:=apro_a+1;
    'asia':if (e.puntaje >= 70) and (e.puntaje < 90) then
      apro_as:=apro_as+1;
  end;
end;

procedure promocion(var e:examen; var prom_e:integer; var prom_a:integer; var prom_as:integer);
begin
  case e.continente of
    'europa':if (e.puntaje >= 70) and (e.puntaje < 90) then
      prom_e:=prom_e+1;
    'america':if (e.puntaje >= 70) and (e.puntaje < 90) then
      prom_a:=prom_a+1;
    'asia':if (e.puntaje >= 70) and (e.puntaje < 90) then
      prom_as:=prom_as+1;
  end;
end;

procedure prom_eu(var e:examen; var promedio:real);
var
  cant_e:integer;
  tot_puntaje:integer;
begin
  cant_e:=apro_e+prom_e;
  tot_puntaje:=0;
  if e.continente = 'europa' then
    begin
      cant_e:=cant_e+1;
      tot_puntaje:=tot_puntaje+e.puntaje;
    end;
  promedio:=tot_puntaje/cant_e;
end;

begin
  max_puntaje:=0;
  max_nombre:=' ';
  apro_e:=0;
  apro_a:=0;
  apro_as:=0;
  prom_e:=0;
  prom_a:=0;
  prom_as:=0;
  promedio:=0;
  leer(e);
  while e.nombre <> fin do
    begin
      mejor_calif(e,max_puntaje,max_nombre);
      aprobar(e,apro_e,apro_a,apro_as);
      promocion(e,prom_e,prom_a,prom_as);
      prom_eu(e,promedio);
      leer(e);
    end;
  writeln(max_nombre);
  writeln(apro_e,prom_e);
  writeln(apro_a,prom_a);
  writeln(apro_as,prom_as);
  writeln(promedio:0:2);
  readln;
end.

