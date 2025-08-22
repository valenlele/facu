program parcial5_2_2016inc;

const
  fin=-1;

type
  rangoGenero=1..8;
  pelicula=record
    cod:integer;
    nom:string;
    codGenero:rangoGenero;
    puntajeProm:real;
  end;
  lista=^nodo;
  nodo=record
    datos:pelicula;
    sig:lista;
  end;

  critica=record
    dni:integer;
    apYnom:string;
    codPelicula:integer;
    punt:real;
  end;

procedure leerInfoPelicula(var p:pelicula);
begin
  writeln('INFORMACION PELIUCULA: ');
  write('Codigo: ');
  readln(p.cod);
  if (p.cod<>fin) then begin
    write('Nombre: ');
    readln(p.nom);
    write('Codigo del genero: ');
    readln(p.codGenero);
    write('Puntaje promedio: ');
    readln(p.puntajeProm);
  end;
end;

procedure insertarLista(var pri:lista; p:pelicula);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=p;
  nue^.sig:=pri;
  pri:=nue;
end;

procedure cargarListaPeliculas(var pri:lista); //se dispone enunciado
var
  p:pelicula;
begin
  leerInfoPelicula(p);
  while (p.cod<>-1) do begin
    insertarLista(pri,p);
    leerInfoPelicula(p);
  end;
end;

procedure leerCritica(var c:critica);
begin
  writeln('INFORMACION CRITICA: ');
  write('Puntaje otorgado: ');
  readln(c.punt);
  if (c.codPelicula<>fin) then begin
    write('DNI critico: ');
    readln(c.dni);
    write('Apellido y nombre del critico: ');
    readln(c.apYnom);
    write('Codigo de la pelicula: ');
    readln(c.codPelicula);
  end;
end;

procedure actualizarPuntaje(var pri:lista);
var
  c:critica;
  codAct,totCriticas:integer;
  totPuntaje,prom:real;
begin
  leerCritica(c);
  while (c.codPelicula<>fin) do begin
    codAct:=c.codPelicula;
    totCriticas:=0;
    totPuntaje:=0;
    prom:=0;
    while (c.codPelicula<>fin) and (c.codPelicula=codAct) do begin
      cantCriticas:=cantCriticas+1;
      totPuntaje:=totPuntaje+c.punt;
      leerCritica(c);
    end;
    if (codPelicula<>codAct) then begin
      prom:=totPuntaje/totCriticas;
      insertarPuntajeLista;
    end;
  end;
end;

var
  pri:lista;

begin
  pri:=nil;
  cargarListaPeliculas(pri);
  readln;
end.
