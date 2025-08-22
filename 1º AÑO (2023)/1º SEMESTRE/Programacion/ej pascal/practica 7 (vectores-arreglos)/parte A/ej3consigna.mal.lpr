program ej3consigna.mal;

const
  dimF = 600;

type
  vector = array [1..dimF] of char;
  alfabeto = set of char;
  vocales = set of char;
  digitos = set of 0..9;
  alfa = set of char;

var
  v:vector;
  a:alfabeto;
  voc:vocales;
  cant_cons:integer;
  porc_cons:real;
  cant_dig:integer;
  d:digitos;
  aM:alfa;
  porc_dig:real;

procedure leer(var v:vector);
var
  i:integer;
begin
  for i:=1 to dimF do
  begin
    writeln('Ingrese un caracter: ');
    readln(v[i]);
  end;
end;

procedure cant_porc(var v:vector; var cant_cons:integer; var porc_cons:real);
var
  i:integer;
  es_vocal:boolean;
  carac_alfa:integer;
begin
  a:=['a'..'z'];
  voc:=['a','e','i','o','u'];
  cant_cons:=0;
  carac_alfa:=0;
  for i:=1 to dimF do
  begin
    es_vocal:=v[i] in voc;
    if (not es_vocal) and ((v[i]) in a) then
    cant_cons:=cant_cons+1;
    if (v[i] in a) then
    carac_alfa:=carac_alfa+1;
  end;
  porc_cons:=(cant_cons*100)/carac_alfa;
end;

procedure caracteres(var v:vector; var cant_dig:integer; var porc_dig:real);
var
  i:integer;
begin
  for i:=1 to dimF do
  begin
    if (v[i] in aM) then
    cant_dig:=cant_dig+1;
  end;
  porc_dig:=(cant_dig*100)/dimF;
end;

begin
  cant_cons:=0;
  porc_cons:=0;
  cant_dig:=0;
  porc_dig:=0;
  d:=[0..9];
  aM:=['A'..'z'];
  leer(v);
  cant_porc(v,cant_cons,porc_cons);
  caracteres(v,cant_dig,porc_dig);
  writeln('La cantidad de consonantes son: ',cant_cons,'. El porcentaje de consonantes sobre caracteres alfabeticos es: ',porc_cons:0:2);
  writeln('La cantidad de caracteres que son digitos o letras mayusculas o minusculas es: ',cant_dig,' .El porcentaje sobre todos los caracteres ingresados es: ',porc_dig);
  readln;
end.
