program ej7;

const
  dimF = 3;
  max_carac = 140;

type
  rango_dias = 1..31;
  rango_mes = 1..12;
  rango_anio = 2005..2023;
  cadena_carac = string [max_carac];

  tuit = record
    fecha : record
      dia:rango_dias;
      mes:rango_mes;
      anio:rango_anio;
    end;
    texto:cadena_carac;
  end;

  secuencia_tuits = array [1..dimF] of tuit;

var
  t:secuencia_tuits;
  i:integer;
  cant_tuits:integer;
  anio_act:rango_anio;
  mes_act:rango_mes;
  dia_act:rango_dias;

procedure cargar(var t:secuencia_tuits; var anio_act:rango_anio; var mes_act:rango_mes; var dia_act:rango_dias);
begin
  for i:=1 to dimF do
  begin
    writeln('Ingrese la fecha del tuit ',i,': ');
    writeln('Dia: ');
    readln(t[i].fecha.dia);
    writeln('Mes: ');
    readln(t[i].fecha.mes);
    writeln('Anio: ');
    readln(t[i].fecha.anio);
    writeln('Ingrese el contenido del tuit: ');
    readln(t[i].texto);
    t[i].fecha.anio:=anio_act;
    t[i].fecha.mes:=mes_act;
    t[i].fecha.dia:=dia_act;
  end;
end;

function hashtags(t:secuencia_tuits):integer;
var
  cant_hashtags:integer;
begin
  cant_hashtags:=0;
  for i:=1 to dimF do
  begin
    if (t[i].texto[1] = '#') then
    cant_hashtags:=cant_hashtags+1;
  end;
  hashtags:=cant_hashtags;
end;

function usuarios(t:secuencia_tuits):integer;
var
  cant_usuarios:integer;
begin
  cant_usuarios:=0;
  for i:=1 to dimF do
  begin
    if (t[i].texto[1] = '@') then
    cant_usuarios:=cant_usuarios+1;
  end;
  usuarios:=cant_usuarios;
end;

procedure cantidad_tuits_dia(var t:secuencia_tuits; var cant_tuits:integer; var anio_act:rango_anio; var mes_act:rango_mes; var dia_act:rango_dias);
var
  anio_ant:rango_anio;
  mes_ant:rango_mes;
  dia_ant:rango_dias;
begin
  cant_tuits:=0;
  for i:=1 to dimF do
  begin
    anio_ant:=t[i-1].fecha.anio;
    mes_ant:=t[i-1].fecha.mes;
    dia_ant:=t[i-1].fecha.dia;
    if (anio_act = anio_ant) and (mes_act = mes_ant) and (dia_act = dia_ant) then
    begin
      cant_tuits:=cant_tuits+1;
    end
    else if (anio_act <> anio_ant) or (mes_act <> mes_ant) or (dia_act <> dia_ant) then
    begin
      writeln('La cantidad de tuits en el dia ',dia_act,'/',mes_act,'/',anio_act,' es: ',cant_tuits);
      cant_tuits:=0;
    end;
  end;
end;

begin
  cant_tuits:=0;
  anio_act:=2005;
  mes_act:=1;
  dia_act:=1;
  cargar(t,anio_act,mes_act,dia_act);
  writeln('La cantidad de hashtags son: ',hashtags(t));
  writeln('La cantidad de usuarios son: ',usuarios(t));
  cantidad_tuits_dia(t,cant_tuits,anio_act,mes_act,dia_act);
  readln;
end.

