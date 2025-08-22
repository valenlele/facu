program ej12;

const fin=-1;

type
  lista=^nodo;
  nodo=record
    dato:integer;
    sig:lista;
  end;

procedure insertarOrdenado(var pri:lista; num:integer);
var
  nue,ant,act:lista;
begin
  new(nue);
  nue^.dato:=num;
  act:=pri;
  ant:=pri;
  while (act<>nil) and (num>act^.dato) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (ant=act) then pri:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure cargarLista(var pri:lista);
var
  num:integer;
begin
  write('Ingrese un numero: ');
  readln(num);
  while (num<>fin) do begin
    insertarOrdenado(pri,num);
    write('Ingrese un numero: ');
    readln(num);
  end;
end;

procedure insertarFinal(var pri,ult:lista; num:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.dato:=num;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure minimo(var pri,pri2:lista; var min:integer);
begin
  if (pri=nil) and (pri2=nil) then min:=fin
  else if (pri<>nil) and (pri2<>nil) then
    if (pri^.dato<=pri2^.dato) then begin
      min:=pri^.dato;
      pri:=pri^.sig;
    end
    else begin
      min:=pri2^.dato;
      pri2:=pri2^.sig;
    end
  else if (pri<>nil) and (pri2=nil) then begin
    min:=pri^.dato;
    pri:=pri^.sig;
  end
  else begin
    min:=pri2^.dato;
    pri2:=pri2^.sig;
  end;
end;

procedure merge(pri,pri2:lista; var pri3,ult:lista);
var
  min:integer;
begin
  minimo(pri,pri2,min);
  while (min<>fin) do begin
    insertarFinal(pri3,ult,min);
    minimo(pri,pri2,min);
  end;
end;

procedure lista2enLista1(var pri:lista; pri2:lista);
begin
  while (pri2<>nil) do begin
    insertarOrdenado(pri,pri2^.dato);
    pri2:=pri2^.sig;
  end;
end;

function existe(pri:lista; num:integer):boolean;
begin
  existe:=false;
  while (pri<>nil) and (not existe) do begin
    if (pri^.dato=num) then existe:=true
    else pri:=pri^.sig;
  end;
end;

procedure eliminarNumeroLista(var pri:lista; num:integer);
var
  ant,act:lista;
begin
  while (existe(pri,num)) do begin
    ant:=pri;
    act:=pri;
    while (act<>nil) and (act^.dato<>num) do begin
      ant:=act;
      act:=act^.sig;
    end;
    if (act<>nil) then begin
      if (act=pri) then pri:=act^.sig
      else ant^.sig:=act^.sig;
      dispose(act);
    end;
  end;
end;

procedure imprimirLista(pri:lista);
begin
  while (pri<>nil) do begin
    writeln(pri^.dato);
    pri:=pri^.sig;
  end;
end;

var
  pri,pri2,pri3:lista;
  num:integer;

begin
  pri:=nil;
  pri2:=nil;
  writeln('CARGAR LISTA 1');
  cargarLista(pri);
  writeln('CARGAR LISTA 2');
  cargarLista(pri2);
  writeln('LISTA 1: ');
  imprimirLista(pri);
  writeln('LISTA 2: ');
  imprimirLista(pri2);
  {pri3:=nil;
  merge(pri,pri2,pri3,ult);
  writeln('LISTA 3: ');}
  {lista2enLista1(pri,pri2);
  writeln('LISTA 1 CON LISTA 2: ');
  imprimirLista(pri);}
  writeln('Ingrese un numero para eliminar de la lista 1: ');
  readln(num);
  eliminarNumeroLista(pri,num);
  imprimirLista(pri);
  readln;
end.
