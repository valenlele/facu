program ej5ayb;

type
  consonantes=set of char;
  vocales=set of char;

var
  car:char;
  cantCons,cantVoc,posPalabra,maxCons,maxVoc,maxPosCons,maxPosVoc:integer;

procedure cantConsVoc(var car:char; var cantCons:integer; var cantVoc:integer);
var
  cons:consonantes;
  voc:vocales;
begin
  voc:=['a','e','i','o','u'];
  cons:=['a'..'z']-voc;
  while (car<>'*') and (car<>' ') do begin
    if (car in cons) then cantCons:=cantCons+1
    else if (car in voc) then cantVoc:=cantVoc+1;
    write('Ingrese un caracter: ');
    readln(car);
  end;
  writeln('La cantidad de consonantes de la palabra es: ',cantCons);
  writeln('La cantidad de vocales de la palabra es: ',cantVoc);
end;

begin
  posPalabra:=0;
  maxCons:=-1;
  maxVoc:=-1;
  maxPosCons:=-1;
  maxPosVoc:=-1;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
  while (car<>'*') do begin
    cantCons:=0;
    cantVoc:=0;
    cantConsVoc(car,cantCons,cantVoc);
    posPalabra:=posPalabra+1;
    if (cantCons>maxCons) then begin
      maxCons:=cantCons;
      maxPosCons:=posPalabra;
    end;
    if (cantVoc>maxVoc) then begin
      maxVoc:=cantVoc;
      maxPosVoc:=posPalabra;
    end;
    while (car=' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
    end;
  end;
  writeln('La posicion de la palabra con la mayor cantidad de consonantes es: ',maxPosCons);
  writeln('La posicion de la palabra con la mayor cantidad de vocales es: ',maxPosVoc);
  readln;
end.
