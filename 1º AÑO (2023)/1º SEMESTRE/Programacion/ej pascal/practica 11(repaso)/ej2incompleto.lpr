program ej2incompleto;

const
  dimF = 70;

type
  vDireccion = array[1..dimF] of char;
  persona = record
    nombre,apellido:string;
    catServicio:1..4;
    montBasico:integer;
    direc:vDireccion;
  end;
  lista = ^nodo;
  nodo = record
    datos:persona;
    sig:lista;
  end;
  vectorExtra = array[1..4] of integer;

  conj = set of char;

function cumpleDireccion(direc:vector):boolean;
var
  A:set of char;
  i:integer;
begin
  cumpleDireccion:=true;
  i:=1;
  A:=['A'..'G'] + ['0','2','4','6','8'];
  while (cumpleDireccion = true) and i <= dimF do begin
    while (direc[i] <> '%') and (cumpleDireccion = true) do begin
      if (direc[i] in A) then cumpleDireccion:=true
      else cumpleDireccion:=false;
      i:=i+1;
    end;
  end;
end;

procedure liberarMemoria(var l:lista);
var sig:lista;
begin
  while (l <> nil) do begin
    sig:=l^.sig;
    dispose(l);
    l:=sig;
  end;
end;

var
  l,act:lista;
  extra:vectorExtra;
  totCat:vectorExtra;
  i,maxCat2:integer;
  maxCat2Nombre:string;

begin
  l:=nil;
  cargarLista(l); {se dispone}
  cargarVector(extra); {se dispone}
  act:=l;
  for i:= 1 to 4 do totCat[i]:=0;
  maxCat2:=-1;
  while (act <> nil) do begin
    totCat[act^.datos.catServicio]:=totCat[act^.datos.catServicio]+act^.datos.montBasico+extra[act^.datos.catServicio];
    if act^.datos.catServicio = 2 then begin
      montTot:=0;
      montTot:=act^.datos.montBasico+extra[act^.datos.catServicio];
      if montTot > maxCat2 then begin
        maxCat2:=montTot;
        maxCat2Nombre:=act^.datos.nombre;
      end;
    end;
    if cumpleDireccion(act^.datos.direc) then writeln('La direccion cumple');
    else writeln('La direccion no cumple');
    act:=act^.sig;
  end;
  for i:=1 to 4 do writeln('El monto recaudado en cada categoria es: ',totCat[i]);
  if maxCat2 <> -1 then writeln('El nombre de la persona que mas pago en la categoria 2 es: ',maxCat2Nombre)
  else writeln('Nadie pago servicio de cable categoria 2');
  liberarMemoria(l);
  liberarMemoria(act);
end.
