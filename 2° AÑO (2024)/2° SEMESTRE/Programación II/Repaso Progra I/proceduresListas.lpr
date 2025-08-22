//DECLARACION GENERICA LISTAS

type
  lista=^nodo;
  nodo=record
    datos:tDatos;
    sig:lista;
  end;

//AGREGAR AL INICIO DE LA LISTA

procedure agregarInicio(var l:lista; num:integer);
var
  nue:lista;
begin
  new(nue);  //reservo espacio para nuevo nodo
  nue^.datos:=num; //cargo el dato
  nue^.sig:=l //hago que el nuevo nodo apunte al mismo nodo al que apunta l (osea el primer nodo de la lista)
  l:=nue; //hago que el nuevo primer nodo sea el ultimo que agregué
end;

//AGREGAR AL FINAL DE LA LISTA

procedure agregarFinal(var l:lista; num:integer);
var
  act,nue:lista;
begin
  new(nue);
  nue^datos:=num;
  nue^.sig:=nil;
  if (l<>nil) then begin
    act:=l;
    while (act^.sig<>nil) do act:=act^.sig; //recorro la lista hasta el final con un puntero auxiliar
    act^.sig:=nue;
  end
  else l:=nue;
end;

//INSTERTAR EN LISTA ORDENANDA

procedure insertarOrdenado(var l:lista; num:integer);
var
  nue,act,ant:lista;
begin
  new(nue);
  nue^.datos:=num;
  ant:=l;
  act:=l;
  while (act<>nil) and (act^.datos<num) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (ant=act) then l:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;






