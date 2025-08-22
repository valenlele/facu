program ej11sinterminar;

const
  dimF = 100;

type
  numeros = array [1..dimF] of real;

var
  n: numeros;
  i, j: integer;
  num, maximo: real;

procedure leer_max(var n: numeros; var maximo: real);
begin
  i := 1;
  writeln('Ingrese un número: ');
  readln(num);

  while (num <> 50) and (i <= dimF) do
  begin
    n[i] := num;

    if (i <= 7) or (num > maximo) then
    begin
      if (i > 7) then
      begin
        // Eliminar el número máximo actual de los mayores
        for j := 1 to 7 do
        begin
          if n[j] = maximo then
            n[j] := 0;
        end;
      end;

      // Encontrar el nuevo número máximo
      maximo := n[1];
      for j := 2 to i do
      begin
        if n[j] > maximo then
          maximo := n[j];
      end;
    end;

    i := i + 1;
    writeln('Ingrese un número: ');
    readln(num);
  end;
end;

procedure mostrar_mayores(const n: numeros);
var
  k: integer;
begin
  writeln('Los 7 números mayores son:');
  for k := 1 to dimF do
  begin
    if n[k] <> 0 then
      writeln(n[k]:0:2);
  end;
end;

begin
  maximo := 0;
  leer_max(n, maximo);
  mostrar_mayores(n);
  readln;
end.

