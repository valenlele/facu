program ej6;

var
  carac:char;
  cant7:integer;

procedure procesamiento(carac:char);
var
  cant_carac:integer;
begin
  cant_carac:=0;
  while carac <> '*' do
  begin
    while carac = ' ' do
    begin
      writeln('Ingrese un caracter: ');
      readln(carac);
    end;
  while (carac <> ' ') and (carac <> '*') do
  begin
    cant_carac:=cant_carac+1;
    writeln('Ingrese un caracter: ');
    readln(carac);
  end;
  if carac = ' ' then
  begin
    if cant_carac = 7 then
    begin
      cant7:=cant7+1;
      cant_carac:=0;
    end;
  end;
  end;
end;

begin
  cant7:=0;
  writeln('Ingrese un caracter: ');
  readln(carac);
  procesamiento(carac);
  writeln('La cantidad de palabras de longitud 7 son: ',cant7);
  readln;
end.
