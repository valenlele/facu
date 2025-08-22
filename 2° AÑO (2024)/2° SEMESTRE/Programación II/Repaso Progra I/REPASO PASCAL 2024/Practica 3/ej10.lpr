program ej10;

const
  fin='.';

procedure pa(var car:char; var cantpa:integer);
var
  empiezaConp:boolean;
begin
  empiezaConp:=(car='p');
  if (empiezaConp) then begin
    write('Ingrese un caracter: ');
    readln(car);
    if (car='a') then cantpa:=cantpa+1;
  end;
  while (car<>fin) and (car<>' ') and (empiezaConp) do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
end;

var
  car:char;
  cantpa:integer;

begin
  cantpa:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
  while (car<>fin) do begin
    pa(car,cantpa);
    if (car<>fin) and (car<>'p') then begin
      write('Ingrese un caracter: ');
      readln(car);
    end;
  end;
  write('La cantidad de palabras que contienen la p seguida de la a son: ',cantpa);
  readln;
end.
