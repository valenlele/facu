program ej6;

type
  letras=set of char;

var
  car:char;
  conjFinal:letras;
  secuenA,secuenB:boolean;

procedure secuenciaA(var car:char; var conjFinal:letras; var secuenA:boolean);
var
  conjA:letras;
begin
  conjA:=['A'..'Z'];
  while (car<>'@') and (car<>'.') do begin
    if not (car in conjA) then secuenA:=false;
    conjFinal:=conjFinal+[car];
    write('Ingrese un caracter: ');
    readln(car);
  end;
end;

procedure secuenciaB(var car:char; var conjFinal:letras; var secuenB:boolean);
begin
  while (car<>'.') do begin
    if (car in conjFinal) then secuenB:=false;
    write('Ingrese un caracter: ');
    readln(car);
  end;
end;

begin
  conjFinal:=[];
  secuenA:=true;
  secuenB:=true;
  write('Ingrese un caracter: ');
  readln(car);
  secuenciaA(car,conjFinal,secuenA);
  secuenciaB(car,conjFinal,secuenB);
  if (secuenA) and (secuenB) then write('El patron se cumple')
  else begin
    if (secuenA=false) and (secuenB=false) then write('Ninguna parte cumple el patron');
    if (secuenA=false) and (secuenB=true) then write('La parte que no cumple es la secuencia A');
    if (secuenB=false) and (secuenA=true) then write('La parte que no cumple es la secuencia B');
  end;
  readln;
end.
