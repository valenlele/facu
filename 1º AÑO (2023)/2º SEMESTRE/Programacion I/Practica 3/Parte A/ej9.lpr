program ej9;

var
  car:char;
  cantPA:integer;

procedure palabrasPA(var car:char; var cantPA:integer);
var
  empiezaConP:boolean;
begin
  empiezaConP:=(car='P');
  if (empiezaConP) then begin
    writeln('Ingrese un caracter: ');
    readln(car);
    if (car='A') then cantPA:=cantPA+1;
  end;
  while (car<>' ') and (car<>'.') do begin
    writeln('Ingrese un caracter: ');
    readln(car);
  end;
end;

begin
  cantPA:=0;
  writeln('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    writeln('Ingrese un caracter: ');
    readln(car);
  end;
  while (car<>'.') do begin
    palabrasPA(car,cantPA);
    while (car=' ') do begin
      writeln('Ingrese un caracter: ');
      readln(car);
    end;
  end;
  writeln('La cantidad de palabras que comienzan con una P seguida de una A es: ',cantPA);
  readln;
end.
