program ej7;

type
  letras=set of char;

var
  car:char;
  secuenV,secuenQ,secuenW:boolean;

procedure descartarBlancos(var car:char);
begin
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
end;

procedure secuenciaV(var car:char; var secuenV:boolean);
var
  empiezaConO,terminaConN:boolean;
  ant:char;
begin
  descartarBlancos(car);
  while (car<>'&') and (car<>'*') do begin
    empiezaConO:=(car='o');
    while (car<>' ') and (car<>'&') and (car<>'*') do begin
      ant:=car;
      write('Ingrese un caracter: ');
      readln(car);
    end;
    terminaConN:=(ant='n');
    if not (empiezaConO) and not (terminaConN) then secuenV:=false;
    descartarBlancos(car);
  end;
end;

procedure secuenciaQ(var car:char; var secuenQ:boolean);
var
  voc:letras;
begin
  descartarBlancos(car);
  while (car<>'%') and (car<>'*') do begin
    voc:=['a','e','i','o','u'];
    while (car<>' ') and (car<>'%') and (car<>'*') do begin
      if (car in voc) then voc:=voc-[car];
      write('Ingrese un caracter: ');
      readln(car);
    end;
    if (voc<>[]) then secuenQ:=false;
    descartarBlancos(car);
  end;
end;

procedure secuenciaW(var car:char; var secuenW:boolean);
var longP,cantS:integer;
begin
  descartarBlancos(car);
  while (car<>'*') do begin
    longP:=0;
    cantS:=0;
    while (car<>' ') and (car<>'*') do begin
      longP:=longP+1;
      if (car='s') then cantS:=cantS+1;
      write('Ingrese un caracter: ');
      readln(car);
    end;
    if (longP>5) then if (cantS<>3) then secuenW:=false;
    descartarBlancos(car);
  end;
end;

begin
  secuenV:=true;
  secuenQ:=true;
  secuenW:=true;
  write('Ingrese un caracter: ');
  readln(car);
  secuenciaV(car,secuenV);
  if (secuenV) then begin
    secuenciaQ(car,secuenQ);
    if (secuenQ) then begin
      secuenciaW(car,secuenW);
      if (secuenW) then write('El patron se cumple correctamente')
      else write('El patron no cumple W');
    end
    else write('El patron no cumple Q');
  end
  else write('El patron no cumple V');
  readln;
end.
