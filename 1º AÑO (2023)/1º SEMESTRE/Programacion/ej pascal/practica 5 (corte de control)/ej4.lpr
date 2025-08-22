program ej4;

const
  fin='fin';

type
  cadena20 = string[20];
  juego = record
    nombre:cadena20;
    categoria:cadena20;
    idioma:cadena20;
    votos:integer;
  end;

var
  j:juego;
  c_actual:cadena20;
  i_actual:cadena20;
  cat_max_juegos:cadena20;
  cat_max_votos:cadena20;
  promedio:real;
  max_votos_juego:cadena20;
  max_votos_idioma:cadena20;

procedure leer(var j:juego; var c_actual:cadena20; var i_actual:cadena20);
begin
  with j do
  begin
    writeln('Ingrese el nombre del juego: ');
    readln(nombre);
    writeln('Ingrese la categoria del juego: ');
    readln(categoria);
    c_actual:=categoria;
    writeln('Ingrese el idioma del juego: ');
    readln(idioma);
    i_actual:=idioma;
    writeln('Ingrese la cantidad de votos positivos: ');
    readln(votos);
  end;
end;

procedure masjuegosvotos(var j:juego; var cat_max_juegos:cadena20; var cat_max_votos:cadena20);
var
  cant_juegos:integer;
  tot_votos:integer;
  max_juegos:integer;
  max_votos:integer;
begin
  cant_juegos:=0;
  tot_votos:=0;
  max_juegos:=-1;
  max_votos:=-1;
  while j.categoria <> fin do
  begin
    while j.categoria = c_actual do
    begin
      cant_juegos:=cant_juegos+1;
      tot_votos:=tot_votos+j.votos;
    end;
    if j.categoria <> c_actual then
    begin
      if cant_juegos > max_juegos then
      cat_max_juegos:=c_actual;
      if tot_votos > max_votos then
      cat_max_votos:=c_actual;
      c_actual:=j.categoria;
      cant_juegos:=0;
      tot_votos:=0;
    end;
  end;
end;

procedure prom_edu(var j:juego; var promedio:real);
var
  votos_edu:integer;
  cant_juegos:integer;
begin
  votos_edu:=0;
  cant_juegos:=0;
  while j.categoria <> fin do
  begin
    if j.categoria = 'educativo' then
    begin
      while j.idioma = i_actual do
      begin
        votos_edu:=votos_edu+j.votos;
        cant_juegos:=cant_juegos+1;
      end;
      if j.idioma <> i_actual then
      begin
        promedio:=votos_edu/cant_juegos;
        writeln('El promedio de votos recibidos del juego educativo en idioma ',i_actual,' es: ',promedio:0:2);
        votos_edu:=0;
        cant_juegos:=0;
      end;
    end;
  end;
end;

procedure max_votos_juego_idioma (var j:juego; var max_votos_juego:cadena20; var max_votos_idioma:cadena20);
var
  max_votos:integer;
begin
  max_votos:=-1;
  while j.categoria <> fin do
  begin
    while j.idioma = i_actual do
    begin
      if j.votos > max_votos then
      begin
        max_votos:=j.votos;
        max_votos_juego:=j.nombre;
        max_votos_idioma:=i_actual;
      end;
    end;
    if j.idioma <> i_actual then
    i_actual:=j.idioma;
  end;
end;

begin
  leer(j,c_actual,i_actual);
  while j.categoria <> fin do
  begin
    masjuegosvotos(j,cat_max_juegos,cat_max_votos);
    prom_edu(j,promedio);
    max_votos_juego_idioma(j,max_votos_juego,max_votos_idioma);
    leer(j,c_actual,i_actual);
  end;
  writeln('la categoria que tiene mas juegos es: ',cat_max_juegos,' y la que tiene mas votos es: ',cat_max_votos);
  writeln('El videojuego mas votado es: ',max_votos_juego,' su idioma es: ',max_votos_idioma);
  readln;
end.
