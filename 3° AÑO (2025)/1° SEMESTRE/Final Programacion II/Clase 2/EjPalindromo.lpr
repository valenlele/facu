program EjPalindromo;

const
  dimF = 50;

type
  vecPalabras = array [1..dimF] of char;

  dim = 0..dimF;

procedure cargarVector(var v:vecPalabras; var dimL:dim);
var
  letra:char;
begin
  read(letra);
  while (dimL<dimF) and (letra<>' ') do begin
    dimL:=dimL+1;
    v[dimL]:=letra;
    read(letra);
  end;
end;

procedure imprimirVector(v:vecPalabras; dimL:dim);
var
  i:integer;
begin
  i:=1;
  while (i<=dimL) do begin
    write(v[i]);
    i:=i+1;
  end;
end;

function esPalindromo(v:vecPalabras; i:integer; dimL:dim; verif:boolean):boolean;
begin
  if (i>dimL) then begin
    if (v[i]<>v[dimL]) then verif:=false
    else esPalindromo(v,i+1,dimL-1,verif);
  end;
  esPalindromo:=verif;
end;

var
  v:vecPalabras;
  dimL:dim;
  i:integer;
  verif:boolean;

begin
  writeln('Se ingresan letras para formar una palabra: ');
  dimL:=0;
  cargarVector(v,dimL);

  writeln('Vector generado: ');
  imprimirVector(v,dimL);

  i:=1;
  verif:=true;
  if (esPalindromo(v,i,dimL,verif)) then write('La palabra es palindromo')
  else write('La palabra no es palindromo');

  readln;
  readln;
end.
