program ej5sincompletar;

const
  fin = ' ';
  fin2 = '*';

type
  consonantes = set of char;
  vocales = set of char;

var
  carac:char;
  cons:consonantes;
  voc:vocales;
  cant_cons:integer;
  cant_voc:integer;

procedure secuencia(carac:char);
begin
  while (carac <> fin1) and (carac <> fin2) do
  begin
    if carac in cons then
    begin
      cant_cons:=cant_cons+1;
    end
    else if carac in voc then
    begin
      cant_voc:=cant_voc+1;
    end;
    writeln('Ingresa un caracter: ');
    readln(carac);
  end;
end;

begin
  voc:=['a','e','i','o','u'];
  cons:=['a'..'z']-voc;
  cant_cons:=0;
  cant_voc:=0;
  writeln('Ingrese un caracter: ');
  readln(carac);
  while carac <> fin2 do
  begin
    if carac <> fin then
    secuencia(carac);
    writeln('Ingrese un caracter: ');
    readln(carac);
  end;
end.

