program ej4;

const
  fin = '#';

type
  conj_letras = set of char;

var
  carac:char;
  cant:integer;
  conj:conj_letras;

procedure leer(var carac:char; var conj:conj_letras);
begin
  conj:=['a'..'z'];
  writeln('Ingrese un caracter: ');
  readln(carac);
  while carac <> fin do
  begin
    if carac in conj then
    begin
      cant:=cant+1;
      conj:=conj-[carac];
    end;
    writeln('Ingrese un caracter: ');
    readln(carac);
  end;
  writeln('La cantidad de caracteres ingresados es: ',cant);
end;

procedure imprimir(conj:conj_letras);
var
  letra:char;
begin
  writeln('El resultado del conjunto es: ');
  for letra:='a' to 'z' do
  begin
    if letra in conj then
    writeln(letra);
  end;
end;

begin
  cant:=0;
  leer(carac,conj);
  imprimir(conj);
  readln;
end.

