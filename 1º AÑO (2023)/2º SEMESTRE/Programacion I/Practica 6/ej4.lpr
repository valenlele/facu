program ej4;

const
  dimF=600;
  fin='.';

type
  caracteres=array[1..dimF] of char;
  rango=0..dimF;
  letras=set of char;
  vocales=letras;
  caracAlfa=letras;
  consonantes=letras;
  digitos=letras;
  letrasMayus=letras;
  letrasMin=letras;

procedure cargarVector(var c:caracteres; var dimL:rango);
var
  carac:char;
begin
  dimL:=0;
  write('Ingrese un caracter para cargar el vector: ');
  readln(carac);
  while (dimL<dimF) and (carac<>fin) do begin
    dimL:=dimL+1;
    c[dimL]:=carac;
    if (dimL<>dimF) then begin
      write('Ingrese un caracter para cargar el vector: ');
      readln(carac);
    end;
  end;
end;


procedure cantYPorcCons(c:caracteres; dimL:rango; var cons:consonantes; var cAlfa:caracAlfa);
var
  cantCons,cantCAlfa,i:integer;
  voc:vocales;
begin
  cantCons:=0;
  cantCAlfa:=0;
  cons:=['A'..'Z','a'..'z'];
  voc:=['a','e','i','o','u','A','E','I','O','U'];
  cons:=cons-voc;
  cALfa:=['A'..'Z','a'..'z'];
  for i:=1 to dimL do begin
    if (c[i] in cons) then cantCons:=cantCons+1;
    if (c[i] in cAlfa) then cantCAlfa:=cantCAlfa+1;
  end;
  writeln('La cantidad de consonantes son: ',cantCons);
  if (cantCAlfa<>0) then writeln('El porcentaje de consonantes sobre el total de caracteres alfabeticos es: ',(cantCons*100)/cantCAlfa:2:2);
end;

procedure porcDigMayusMin(c:caracteres; dimL:rango; var dig:digitos; var mayus:letrasMayus; var min:letrasMin);
var
  cantDig,cantMayus,cantMin,i:integer;
begin
  dig:=['0'..'9'];
  mayus:=['A'..'Z'];
  min:=['a'..'z'];
  cantDig:=0;
  cantMayus:=0;
  cantMin:=0;
  for i:=1 to dimL do begin
    if (c[i] in dig) then cantDig:=cantDig+1;
    if (c[i] in mayus) then cantMayus:=cantMayus+1;
    if (c[i] in min) then cantMin:=cantMin+1;
  end;
  writeln('La cantidad de caracteres que son digitos es: ',cantDig);
  writeln('El porcentaje de caracteres que son digitos sobre el total de caracteres es: ',(cantDig*100)/dimF:2:2);
  writeln('La cantidad de caracteres que son letras mayusuclas es: ',cantMayus);
  writeln('El porcentaje de caracteres que son letras mayusuculas sobre el total de caracteres es: ',(cantMayus*100)/dimF:2:2);
  writeln('La cantidad de caracteres que son letrasMinusculas es: ',cantMin);
  writeln('El porcentaje de caracteres que son letras minusculas sobre el total de caracteres es: ',(cantMin*100)/dimF:2:2);
end;

var
  c:caracteres;
  dimL:rango;
  cons:consonantes;
  cAlfa:caracAlfa;
  dig:digitos;
  mayus:letrasMayus;
  min:letrasMin;

begin
  cargarVector(c,dimL);
  cantYPorcCons(c,dimL,cons,cAlfa);
  porcDigMayusMin(c,dimL,dig,mayus,min);
  readln;
end.
