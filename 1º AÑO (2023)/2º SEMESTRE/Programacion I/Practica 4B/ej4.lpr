program ej4;

type
  cadena=string[20];
  juego=record
    nombre:cadena;
    cat:cadena;
    idioma:cadena;
    votos:integer;
  end;

procedure leerInfo(var j:juego);
begin
  with j do begin
    write('Ingrese la categoria del juego: ');
    readln(cat);
    if (cat<>'fin') then begin
      write('Ingres el idioma del juego: ');
      readln(idioma);
      write('Ingrese el nombre del juego: ');
      readln(nombre);
      write('Ingresela cantidad de votos que recibio el juego: ');
      readln(votos);
    end;
  end;
end;

procedure masJuegosVotos(catAct:cadena; var maxVotosCat,maxJuegosCat: integer; var nomMaxVotosCat,nomMaxJuegosCat:cadena; votosCat,juegosCat:integer);
begin
  if (votosCat>maxVotosCat) then begin
    maxVotosCat:=votosCat;
    nomMaxVotosCat:=catAct;
  end;
  if (juegosCat>maxJuegosCat) then begin
    maxJuegosCat:=juegosCat;
    nomMaxJuegosCat:=catAct;
  end;
end;

procedure mayorVotos(j:juego; var maxVotos:integer; var nomMaxVotos,idiomMaxVotos:cadena);
begin
  if (j.votos>maxVotos) then begin
    maxVotos:=j.votos;
    nomMaxVotos:=j.nombre;
    idiomMaxVotos:=j.idioma;
  end;
end;

procedure procesar(j:juego);
var
  catAct,idiomaAct:cadena;
  juegosCat,votosCat:integer;
  juegosIdiom,votosIdiom:integer;
  maxJuegosCat,maxVotosCat:integer;
  nomMaxJuegosCat,nomMaxVotosCat:cadena;
  juegosEdu:integer;
  maxVotos:integer;
  nomMaxVotos,idiomMaxVotos:cadena;
begin
  leerInfo(j);
  maxJuegosCat:=-1;
  maxVotosCat:=-1;
  maxVotos:=-1;
  while (j.cat<>'fin') do begin
    catAct:=j.cat;
    votosCat:=0;
    juegosCat:=0;
    while (j.cat=catAct) do begin
      idiomaAct:=j.idioma;
      votosIdiom:=0;
      juegosIdiom:=0;
      juegosEdu:=0;
      while (j.idioma=idiomaAct) and (j.cat=catAct) do begin
        votosIdiom:=votosIdiom+j.votos;
        juegosIdiom:=juegosIdiom+1;
        if (catAct='educativo') then juegosEdu:=juegosEdu+1;
        mayorVotos(j,maxVotos,nomMaxVotos,idiomMaxVotos);
        leerInfo(j);
      end;
      votosCat:=votosCat+votosIdiom;
      juegosCat:=juegosCat+juegosIdiom;
      masJuegosVotos(catAct,maxVotosCat,maxJuegosCat,nomMaxVotosCat,nomMaxJuegosCat,votosCat,juegosCat);
      if (catAct='educativo') and (juegosEdu<>0) then writeln('El promedio de votos para los juegos educativos en ',idiomaAct,' es: ',(votosIdiom/juegosEdu):2:2);
    end;
  end;
  writeln('La categoria que tiene mas juegos es: ',nomMaxJuegosCat,'. La categoria que tiene mas votos es: ',nomMaxVotosCat);
  write('El nombre del juego mas votado es: ',nomMaxVotos,'. Su idioma es: ',idiomMaxVotos);
end;

var
  j:juego;

begin
  leerInfo(j);
  procesar(j);
  readln;
end.
