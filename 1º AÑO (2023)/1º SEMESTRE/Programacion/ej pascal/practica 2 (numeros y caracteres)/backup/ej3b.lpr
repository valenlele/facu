program ej3b;

var
  i,numero,digito,suma,cifra:integer;

begin
  for i := 1 to 10 do
  begin
    writeln('Ingrese un numero entero: ');
    readln(numero);
    suma := 0;
    while numero > 0 do
    begin
      digito := numero mod 10;
      suma := suma + digito;
      numero := numero div 10;
      if (numero = 0) and (suma >= 10) then
      begin
        numero := suma;
        suma := 0;
      end;
    end;
    cifra := suma;
    writeln('La suma del numero expresada en una cifra es: ');
    case cifra of
      0: writeln('cero');
      1: writeln('uno');
      2: writeln('dos');
      3: writeln('tres');
      4: writeln('cuatro');
      5: writeln('cinco');
      6: writeln('seis');
      7: writeln('siete');
      8: writeln('ocho');
      9: writeln('nueve');
    end;
  end;
end.

