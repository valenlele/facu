program ej2;

function factorial(n:integer):integer;
var
  i:integer;
  fact:integer;
begin
  fact:=n;
  for i:=n-1 downto 2 do
    begin
      fact:=fact*i;
    end;
  factorial:=fact;
end;

function combinatorio(m:integer):integer;
var
  n:integer;
begin
  combinatorio:=factorial(m) div (factorial(m-n) * factorial(n));
end;
