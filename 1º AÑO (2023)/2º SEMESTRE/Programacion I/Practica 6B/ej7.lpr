program ej7;

const
  maxTuits=2;
  maxCarac=140;

type
  rangoDias=1..31;
  rangoCar=1..maxCarac;
  rangoTuits=1..maxTuits;
  vecText=array[rangoCar] of char;
  tuit=record
    fecha:rangoDias;
    txt:vecText;
    dimLCar:rangoCar;
  end;
  vecFechas=array[rangoDias] of integer;
  tuits=array[rangoTuits] of tuit;

procedure cargarDias(var vf:vecFechas);
var
  i:rangoDias;
begin
  for i:=1 to 31 do vf[i]:=0;
end;

procedure cargarTexto(var texto:vecText; var dimL:rangoCar);
var
  pos:rangoCar;
begin
  pos:=1;
  readln(texto[pos]);
  while (pos<maxCarac) and (texto[pos]<>'.') do begin
    pos:=pos+1;
    readln(texto[pos]);
  end;
  dimL:=pos;
end;

procedure leerRegistro(var t:tuit; var vf:vecFechas);
begin
  write('Ingrese el dia en que se publico el tuit: ');
  readln(t.fecha);
  vf[t.fecha]:=vf[t.fecha]+1;
  write('Ingrese el texto del tuit: ');
  cargarTexto(t.txt,t.dimLCar);
end;

procedure cargarTuits(var t:tuits; var vf:vecFechas);
var
  pos:rangoTuits;
begin
  cargarDias(vf);
  for pos:=1 to maxTuits do begin
    writeln('SE LEE INFO DEL TUIT ',pos,': ');
    leerRegistro(t[pos],vf);
  end;
end;

procedure hashtagsUsuarios(t:tuits);
var
  i:rangoCar;
  pos:rangoCar;
  cantHash,cantArr,cantP:integer;
begin
  cantHash:=0;
  cantArr:=0;
  cantP:=0;
  for i:=1 to maxTuits do begin
    pos:=1;
    while (pos<t[i].dimLCar) do begin
      while (pos<t[i].dimLCar) and (t[i].txt[pos]=' ') do pos:=pos+1;
      cantP:=cantP+1;
      if (t[i].txt[pos]='#') then cantHash:=cantHash+1
      else if (t[i].txt[pos]='@') then cantArr:=cantArr+1;
      while (pos<t[i].dimLCar) and (t[i].txt[pos]<>' ') do pos:=pos+1;
    end;
  end;
  writeln('La cantidad de hashtags es: ',cantHash);
  writeln('La cantidad de usuarios es: ',cantArr);
  writeln('La cantidad promedio por tuit es: ',cantP/maxTuits:2:2);
  readln;
end;

procedure tuitsPorDia(vf:vecFechas);
var
  pos:rangoDias;
begin
  for pos:=1 to 31 do writeln('La cantidad de tuits publicados en el dia ',pos,' es: ',vf[pos]);
end;

var
  t:tuits;
  vf:vecFechas;

begin
  cargarTuits(t,vf);
  hashtagsUsuarios(t);
  tuitsPorDia(vf);
  readln;
end.
