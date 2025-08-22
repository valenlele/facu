program ej1;

type
  prisma=record
    ancho,alto,prof:integer;
  end;

procedure leerInfoPrisma(var p:prisma);
begin
  write('Ingrese el ancho: ');
  readln(p.ancho);
  write('Ingrese la altura: ');
  readln(p.alto);
  write('Ingrese la profundidad: ');
  readln(p.prof);
end;

procedure informarVolumen(p:prisma);
  function calcularVolumen(p:prisma):integer;
  begin
    calcularVolumen:=p.ancho*p.alto*p.prof;
  end;
begin
  writeln('El volumen del prisma es: ',calcularVolumen(p));
end;

procedure informarArea(p:prisma);
  function calcularArea(p:prisma):integer;
  begin
    calcularArea:=2*(p.ancho*p.prof)+2*(p.ancho*p.alto)+2*(p.prof*p.alto);
  end;
begin
  write('El area del prisma es: ',calcularArea(p));
end;

var
  p:prisma;

begin
  leerInfoPrisma(p);
  informarVolumen(p);
  informarArea(p);
  readln;
end.
