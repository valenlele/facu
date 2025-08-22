program ej3ab;

function max4(n1,n2,n3,n4:integer):integer;
  function max(n1,n2:integer):integer;
  begin
    max:=-9999;
    if (n1>max) then max:=n1;
    if (n2>max) then max:=n2;
  end;
begin
  max4:=max(n1,n2);
  if (max(n3,n4)>max4) then max4:=max(n3,n4);
end;

var
  n1,n2,n3,n4:integer;

begin
  writeln('Ingrese cuatro numeros enteros: ');
  readln(n1);
  readln(n2);
  readln(n3);
  readln(n4);
  write('El mayor de esos numeros es: ',max4(n1,n2,n3,n4));
  readln;
end.
