program ej7sinterminar;

type
  carac = array['a'..'z'] of char;

var
  c1:carac;
  c2:carac;

procedure union(c1:carac; c2:carac);
var
  ct:carac;
begin
  ct:=c1+c2;
  writeln('La union entre los dos conjuntos es: ',ct);
end;

begin
  c1:='a','e','o','z';
  c2:='f','g','h','x';
  union(c1,c2);
end.

