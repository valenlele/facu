program ej6;

const
  dimF=2;
  cantGases=10;

type
  vectorGases=array[1..cantGases] of string;
  rangoGases=0..cantGases;
  estrella = record
    nombre:string;
    sup:real;
    gases:vectorGases;
    dimLGases:rangoGases;
    dist:integer;
  end;
  estrellas=array[1..dimF] of estrella;
  rango=0..dimF;

procedure cargarGases(var g:vectorGases; var dimLGases:rangoGases);
var
  pos:integer;
begin
  pos:=1;
  dimLGases:=0;
  write('Ingrese el nombre de un gas: ');
  readln(g[pos]);
  while (pos<cantGases) and (g[pos]<>'.') do begin
    dimLGases:=dimLGases+1;
    pos:=pos+1;
    write('Ingrese el nombre de un gas: ');
    readln(g[pos]);
  end;
end;

procedure leerRegistro(var e:estrella);
begin
  write('Ingrese el nombre de la estrella: ');
  readln(e.nombre);
  write('Ingrese la superficie de la estrella: ');
  readln(e.sup);
  cargarGases(e.gases,e.dimLGases);
  write('Ingrese la distancia a la tierra de la estrella: ');
  readln(e.dist);
end;

procedure cargarInfo(var e:estrellas);
var
  pos:rango;
begin
  for pos:=1 to dimF do begin
    writeln('Datos estrella ',pos,': ');
    leerRegistro(e[pos]);
  end;
end;

procedure dosMayorSup(e:estrellas);
var
  i:rango;
  max1Sup,max2Sup:real;
  max1SupNom,max2SupNom:string;
begin
  max1Sup:=-1;                                                                                                                          
  max1SupNom:=' ';
  max2Sup:=-1;
  for i:=1 to dimF do begin
    if (e[i].sup>max1Sup) then begin
      max2Sup:=max1Sup;
      max2SupNom:=max1SupNom;
      max1Sup:=e[i].sup;
      max1SupNom:=e[i].nombre;
    end
    else if (e[i].sup>max2Sup) then begin
      max2Sup:=e[i].sup;
      max2SupNom:=e[i].nombre;
    end;
  end;
  writeln('Los nombres de las dos estrellas con mayor superficie son: ',max1SupNom,' y ',max2SupNom);
end;

function cincoGases(e:estrellas):integer;
var
  estrella,cant5gases:integer;
begin
  cant5gases:=0;
  for estrella:=1 to dimF do if (e[estrella].dimLGases>=5) then cant5gases:=cant5gases+1;
  cincoGases:=cant5gases;
end;

procedure sumDigParImpar(e:estrellas);
var
  i:rango;
  dig,sumDigP,sumDigI:integer;
begin
  for i:=1 to dimF do begin
    sumDigP:=0;
    sumDigI:=0;
    while (e[i].dist<>0) do begin
      dig:=e[i].dist mod 10;
      if (dig mod 2 = 0) then sumDigP:=sumDigP+dig
      else if (dig mod 2 <> 0) then sumDigI:=sumDigI+dig;
      e[i].dist:=e[i].dist div 10;
    end;
    if (sumDigP>sumDigI) then writeln('La suma de los digitos pares de la distancia a la tierra de la estrella ',e[i].nombre,' es mayor a la suma de los digitos impares');
  end;
end;

var
  e:estrellas;

begin
  cargarInfo(e);
  dosMayorSup(e);
  writeln('La cantidad de estrellas que tienen al menos 5 gases es: ',cincoGases(e));
  sumDigParImpar(e);
  readln;
end.
