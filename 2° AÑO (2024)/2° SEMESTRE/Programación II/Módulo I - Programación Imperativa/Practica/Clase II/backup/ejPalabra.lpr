program ejPalabra;

const
  dimF=10;
  fin=' ';

type
  rangoDimf=1..dimF;
  letras=array[rangoDimf] of char;
  palabra=record
    l:letras;
    long:integer;
  end;

procedure cargarPalabra(var p:palabra);
var
  letra:char;
begin
  p.long:=0;
  writeln('SE INGRESAN LETRAS DE UNA PALABRA: ');
  readln(letra);
  while (p.long<dimF) and (letra<>fin) do begin
    p.long:=p.long+1;
    p.l[p.long]:=letra;
    readln(letra);
  end;
end;

procedure imprimirPalabra(p:palabra);
var
  i:integer;
begin
  write('PALABRA: ');
  for i:=1 to p.long do write(p.l[i]);
end;

function esPalindromo(l:letras; pri,ult:integer):boolean;
begin
  if (pri=ult) or (ult<pri) then esPalindromo:=true
  else if (l[pri]<>l[ult]) then esPalindromo:=false
  else esPalindromo:=esPalindromo(l,pri+1,ult-1);
end;

function palindromo(p:palabra):boolean;
var
  pri,ult:integer;
begin
  pri:=1;
  ult:=p.long;
  palindromo:=esPalindromo(p.l,pri,ult);
end;

var
  p:palabra;

begin
  cargarPalabra(p);
  writeln(' ');
  imprimirPalabra(p);
  writeln(' ');
  if (palindromo(p)) then write('La palabra es palindromo')
  else write('La palabra no es palindromo');
  readln;
end.
