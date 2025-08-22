program ej2;
var
  dividendo,divisor:integer;

function miDiv(dividendo,divisor:integer):integer;
var
  cociente:integer;
begin
  cociente:=0;
  while (dividendo>=divisor) do begin
    dividendo:=dividendo-divisor;
    cociente:=cociente+1;
  end;
  miDiv:=cociente;
end;

function resto(dividendo,divisor:integer):integer;
begin
  resto:=dividendo-(divisor*miDiv(dividendo,divisor));
end;

begin
  write('Ingrese el dividendo: ');
  readln(dividendo);
  write('Ingrese el divisor: ');
  readln(divisor);
  writeln('El cociente es: ',miDiv(dividendo,divisor));
  write('El resto es: ',resto(dividendo,divisor));
  readln;
end.
