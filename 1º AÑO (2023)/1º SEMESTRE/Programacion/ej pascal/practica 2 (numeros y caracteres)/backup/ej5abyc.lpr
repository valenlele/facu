program ej6;

var
  carac,ant:char;
  tot:integer;

begin
  tot:=0;
  writeln('Ingrese un caracter: ');
    readln(carac);
  ant:=' ';
  while carac <> '.' do
    begin
      readln(carac);
      if ((ant = 'a') and (carac = 'e')) or ((ant = 'e') and (carac = 'a')) then
        tot:=tot+1;
      ant:=carac;
      writeln('Ingrese un caracter: ');
    end;
  writeln('La cantidad de veces que aparece una a seguida de una e o viceversa es: ',tot);
  readln;
end.
