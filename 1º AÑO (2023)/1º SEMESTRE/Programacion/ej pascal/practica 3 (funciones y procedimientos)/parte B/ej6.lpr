program ej6;

const
  fin = '.';

type
  mayusculas = set of char;
  conjuntoA = set of char;

var
  carac:char;
  mayus:mayusculas;
  conjA:conjuntoA;
  cumpleA:boolean;
  cumpleB:boolean;

procedure secuenciaA(carac:char);
begin
  writeln('Ingrese una secuencia de letras mayusculas: ');
  readln(carac);
  while (carac <> fin) and (cumpleA = true) do
  begin
    if not (carac in mayus) then
    cumpleA:=false;
    conjA:=conjA+[carac];
    if (cumpleA = true) then
    begin
      writeln('Ingrese una secuencia de letras mayusculas: ');
      readln(carac);
    end;
  end;
end;

procedure secuenciaB(carac:char);
begin
  writeln('Ingrese una secuencia de caracteres que no aparecieron en la secuencia A: ');
  readln(carac);
  while (carac <> fin) and (cumpleB = true) do
  begin
    if carac in conjA then
    cumpleB:=false;
    if cumpleB = true then
    begin
      writeln('Ingrese una secuencia de caracteres que no aparecieron en la secuencia A: ');
      readln(carac);
    end;
  end;
end;

begin
  mayus:=['A'..'Z'];
  conjA:=[];
  cumpleA:=true;
  cumpleB:=true;
  secuenciaA(carac);
  writeln('Escriba el caracter @');
  readln(carac);
  secuenciaB(carac);
  if (cumpleA = true) and (cumpleB = true) then
    writeln('La secuencia cumple con el patron')
  else if (cumpleA = false) and (cumpleB = false) then
    writeln('Ninguna de las dos secuencias cumple con el patron')
  else if (cumpleA = false) then
    writeln('La parte que no cumplio fue la secuencia A')
  else if cumpleB = false then
    writeln('La parte que no cumplio fue l secuencia B');
  readln;
end.
