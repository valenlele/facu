program ej1;

type
  prisma=record
    ancho:integer;
    alt:integer;
    prof:integer;
  end;

var
  p:prisma;

procedure leerDatos(var p:prisma);
begin
  write('Ingrese el ancho del prisma: ');
  readln(p.ancho);
  write('Ingrese el alto del prisma: ');
  readln(p.alt);
  write('Ingrese la profundidad del prisma: ');
  readln(p.prof);
end;

function volumen(p:prisma):integer;
begin
  volumen:=(p.ancho*p.alt*p.prof);
end;

function area(p:prisma):integer;
begin
  area:=(2*p.ancho*p.prof)+(2*p.alt*p.ancho)+(2*p.prof*p.ancho);
end;

begin
  leerDatos(p);
  writeln('El volumen del prisma es: ',volumen(p));
  writeln('El area del prisma es: ',area(p));
  readln;
end.
