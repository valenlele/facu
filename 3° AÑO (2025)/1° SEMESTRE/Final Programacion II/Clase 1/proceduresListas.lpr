program proceduresListas;

type
  nodo = record   {declaracion lista}
    dato:integer;
    sig:^nodo;
  end;

  lista = ^nodo;

procedure insertarInicio(var pri:lista; n:integer); {agregar elemento al principio de la lista}
var
  nue:lista;
begin
  new(nue);
  nue^.dato:=n;
  nue^.sig:=pri;
  pri:=nue;
end;

procedure insertarFinal(var lMarca:listaMarca; marca:string);
var
  nue,act:listaMarca;
begin
  new(nue);
  nue^.datos.marca:=marca;
  nue^.sig:=nil;
  if (lMarca<>nil) then begin
    act:=lMarca;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lMarca:=nue;
end;

procedure insertarOrdenado(var pri:lista; n:integer);
var
  nue,ant,act:lista;
begin
  new(nue);
  nue^.dato:=n;
  nue^.sig:=nil;

  if (pri=nil) then pri:=nue;

  else begin
    ant:=pri;
    act:=pri;
    while (act<>nil) and (act^.dato < nue^.dato) do begin
      ant:=act;
      act:=act^.sig;
    end;

    if (ant=act) then pri:=nue
    else ant^.sig:=nue;

    nue^.sig:=act;
  end;
end;

procedure recorrerLista(pri:lista);
var
  aux:lista;
begin
  aux:=pri;
  while (aux<>nil) do aux:=aux^sig;
end;

procedure eliminarNodo(var pri:lista; n:integer);
var
  ant,act:lista;
begin
  ant:=nil;
  act:=lista;

  while (act<>nil) and (atc^.dato<>dato) do begin
    ant:=act;
    act:=act^.sig;
  end;

  if (act<>nil) then begin
    if (ant=nil) then pri:=atc^.sig; //es el primer elemento
    else ant^.sig:=act^.sig;

    dispose(act);
  end;
end;

procedure liberarMemoria(var l:lista);
var
  aux:lista;
begin
  while (l<>nil) do begin
    aux:=l;
    l:=l^.sig;
    dispose(aux);
  end;
end;

procedure imprimirListaDeListas(lUsuarios:listaUsuarios);
  procedure imprimirListaTweets(lTweets:listaTweetsPt2);
  begin
    while (lTweets<>nil) do begin
      writeln('Contenido: ',lTweets^.datos.cont);
      write('Es RT: ');
      if (lTweets^.datos.RT=true) then writeln('Si')
      else writeln('No');
      lTweets:=lTweets^.sig;
    end;
  end;
begin
  while (lUsuarios<>nil) do begin
    writeln('Nombre: ',lUsuarios^.datos.nom);
    writeln('Codigo de usuario: ',lUsuarios^.datos.cod);
    writeln('Tweets: ');
    imprimirListaTweets(lUsuarios^.datos.tweets);
    writeln('------------------------');
    lUsuarios:=lUsuarios^.sig;
  end;
end;






