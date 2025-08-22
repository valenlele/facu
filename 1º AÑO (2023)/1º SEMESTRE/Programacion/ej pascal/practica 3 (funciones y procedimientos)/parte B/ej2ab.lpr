program ej2ab;

var
  n:integer;
  m:integer;

function factorial(n:integer):integer;
var
  i:integer;
  resultado:integer;
begin
  resultado:=n;
  for i:=n-1 downto 1 do
  begin
    resultado:=resultado*i;
  end;
  factorial:=resultado;
end;

function combinatorio(m:integer; n:integer):integer;
var
  numerador:integer;
  denominador:integer;
  resta:integer;
  resultado:integer;
begin
  resta:=m-n;
  numerador:=factorial(m);
  denominador:=factorial(resta)*factorial(n);
  resultado:=numerador div denominador;
  combinatorio:=resultado;
end;

begin
  writeln('Ingrese un numero para caluclar su factorial: ');
  readln(n);
  writeln('El factorial del numero ',n,' es: ',factorial(n));
  writeln('Ingrese la cantidad de elementos: ');
  readln(m);
  writeln('Ingrese la cantidad de grupos: ');
  readln(n);
  writeln('El numero combinatorio es: ',combinatorio(m,n));
  readln;
end.
