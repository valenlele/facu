program maximominimoej3;
var
  altura,max1,max2:real;
  dni,i:integer;
begin
  max1:=-1;
  max2:=-1;
  for i:= 1 to 20 do begin;
    write('decime la altura de un jugador de basquet: ');
    readln(altura);
      if altura > max1 then
        begin
          max2:=max1;
          altura:=max1;
      end
      else if altura > max2 then
        begin
          max2:=altura;
        end;
    write('decime su dni');
      readln(dni);
  end;
  writeln('el jugador mas alto es: ',max1);
  writeln('el segundo jugador mas alto es: ',max2);
end.

