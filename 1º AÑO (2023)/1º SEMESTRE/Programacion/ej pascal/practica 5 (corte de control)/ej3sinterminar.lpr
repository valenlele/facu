program ej3sinterminar;

const
  fin = 'zzz';

type
  cadena20 = string[20];
  paises = record
    pais:cadena20;
    provincia:cadena20;
    ciudad:cadena20;
    dinero:integer;
    habitantes:integer;
  end;

var
  p:paises;

procedure leer(var p:paises);
begin
  with p do
  begin
    writeln('Ingrese el nombre del pais: ');
    readln(pais);
    writeln('Ingrese el nombre de la provincia: ');
    readln(provincia);
    writeln('Ingrese el nombre de la ciudad: ');
    readln(ciudad);
    writeln('Ingrese la cantidad de habitantes de la ciudad: ');
    readln(habitantes);
    writeln('Ingrese el dinero recaudado: ');
    readln(dinero);
  end;
end;

begin
  leer(p);
  while p.pais <> fin do
  begin
    leer(p);
  end;
end.
