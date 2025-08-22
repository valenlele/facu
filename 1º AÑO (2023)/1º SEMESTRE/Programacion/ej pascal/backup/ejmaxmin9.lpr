program numerosycaracteresej1;

var
  numero,digito:integer;

begin
  writeln('Ingrese un numero entero:');
    readln(numero);
  while numero <> 0 do
    begin
      digito:=numero mod 10;
      if digito mod 3 = 0 then
        begin
          writeln('El digito ',digito,' es multiplo de 3');
          end
        else
          begin
            writeln('El digito ',digito,' no es multiplo de 3');
          end;
      numero:=numero div 10;
    end;
  readln;
end.
