program ej3;

type
  lugar=record
    nombre:string;
    pais:string;
  end;
  lista=^nodo;
  nodo=record
    datos:lugar;
    sig:lista;
  end;

procedure agregarFinal(var pri:lista; nom,p:string);
var
  nue,pos:lista;
begin
  new(nue);
  nue^.datos.nombre:=nom;
  nue^.datos.pais:=p;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else begin
    pos:=pri;
    while (pos^.sig<>nil) do pos:=pos^.sig;
    pos^.sig:=nue;
  end;
end;

function longitudLista(pri:lista):integer;
var
  long:integer;
begin
  long:=0;
  while (pri<>nil) do begin
    long:=long+1;
    pri:=pri^.sig;
  end;
  longitudLista:=long;
end;

function cantidadVecesPais(pri:lista; p:string):integer;
var
  cant:integer;
begin
  cant:=0;
  while (pri<>nil) do begin
    if (pri^.datos.pais=p) then cant:=cant+1;
    pri:=pri^.sig;
  end;
  cantidadVecesPais:=cant;
end;

function existePais(pri:lista; p:string):boolean;
var
  existe:boolean;
begin
  existe:=false;
  while (pri<>nil) and (not existe) do begin
    if (pri^.datos.pais=p) then existe:=true
    else pri:=pri^.sig;
  end;
  existePais:=existe;
end;

procedure nuevaLista(pri:lista; var pri2:lista; p:string);
begin
  if (existePais(pri,p)=true) then begin
    while (pri<>nil) do begin
      if (pri^.datos.pais=p) then agregarFinal(pri2,pri^.datos.nombre,p);
      pri:=pri^.sig;
    end;
  end
  else writeln('El pais ingresado no existe');
end;

procedure imprimirLista(pri:lista);
begin
  while(pri<>nil) do begin
    writeln('DATOS LUGAR: ');
    writeln(pri^.datos.nombre);
    writeln(pri^.datos.pais);
    pri:=pri^.sig;
  end;
end;

var
  pri,pri2:lista;
  nom,p:string;

begin
  pri:=nil;
  pri2:=nil;
  writeln('Ingrese informacion de un lugar turistico: ');
  write('Ingrese el nombre del lugar: ');
  readln(nom);
  while (nom<>'.') do begin
    write('Ingrese el pais donde se encuentra el lugar: ');
    readln(p);
    agregarFinal(pri,nom,p);
    writeln('Ingrese informacion de un lugar turistico: ');
    write('Ingrese el nombre del lugar: ');
    readln(nom);
  end;
  imprimirLista(pri);
  writeln('La longitud de la lista es: ',longitudLista(pri));
  writeln('Ingrese un pais para saber cuantas veces esta en la lista: ');
  readln(p);
  writeln('La cantidad de veces que el pais ',p,' esta en la lista es: ',cantidadVecesPais(pri,p));
  writeln('Ingrese un pais para crear una lista con sus lugares turisticos: ');
  readln(p);
  nuevaLista(pri,pri2,p);
  imprimirLista(pri2);
  writeln('Ingrese un lugar para agregar al final de la lista: ');
  readln(nom);
  agregarFinal(pri2,nom,p);
  imprimirLista(pri2);
  readln;
end.


