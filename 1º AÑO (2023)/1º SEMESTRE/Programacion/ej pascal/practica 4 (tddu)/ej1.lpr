program ej1;

type
  prisma = record
    ancho:real;
    alto:real;
    profundidad:real;
  end;

var
  p:prisma;

procedure leer(var p:prisma);
begin
  with p do
    begin
      writeln('Ingrese el ancho del prisma: ');
      readln(ancho);
      writeln('Ingrese el alto del prisma: ');
      readln(alto);
      writeln('Ingrese la profundidad del prisma: ');
      readln(profundidad);
    end;
end;

procedure informar(var p:prisma);
var
  volumen:real;
  area:real;
begin
  volumen:=p.ancho*p.alto*p.profundidad;
  area:=(2*p.alto*p.ancho)+(2*p.alto*p.profundidad)+(2*p.ancho*p.profundidad);
  writeln('El volumen de un prisma rectangular es: ',volumen:0:2);
  writeln('El area de un prisma rectangular es: ',area:0:2);
  readln;
end;

begin
  p.ancho:=0;
  p.alto:=0;
  p.profundidad:=0;
  leer(p);
  informar(p);
end.
