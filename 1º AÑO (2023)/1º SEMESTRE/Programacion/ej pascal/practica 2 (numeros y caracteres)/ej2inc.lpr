program ej2inc;

const
  fin = 9999;

var
  num:integer;
  dig:integer;
  max_dig1:integer;
  max_dig2:integer;

begin
  writeln('Ingrese un numero: ');
  readln(num);
  while num <> fin do
  begin
    max_dig1:=-1;
    max_dig2:=-1;
    while num <> 0 do
    begin
      dig:=num mod 10;
      if dig > max_dig1 then
      begin
        max_dig2:=max_dig1;
        max_dig1:=dig;
      end
      else if dig > max_dig2 then
      begin
        max_dig2:=dig;
      end;
      num:=num div 10;
    end;
    writeln('Los dos mayores digitos del numero son: ',max_dig1,' y ',max_dig2);
    writeln('Ingrese un numero: ');
    readln(num);
  end;
end.
