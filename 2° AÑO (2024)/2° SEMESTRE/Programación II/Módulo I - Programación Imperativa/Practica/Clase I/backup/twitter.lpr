program twitter;

const
  fin=-1;

type
  tweet=record
    cod:integer;
    nom,cont:string;
    esRT:boolean;
  end;

  lista=^nodo;
  nodo=record
    datos:tweet;
    sig:lista;
  end;

  tweetLista=record
    cont:string;
    RT:boolean;
  end;

  listaTweets=^nodoTweets;
  nodoTweets=record
    datos:tweetLista;
    sig:listaTweets;
  end;

  usuario=record
    nom:string;
    cod:integer;
    tweet:listaTweets;
  end;

  listaUsuarios=^nodoUsuario;
  nodoUsuario=record
    datos:usuario;
    sig:listaUsuarios;
  end;

procedure leerInfo(var t:tweet);
var
  rt:string;
begin
  with t do begin
    write('Nombre de usuario: ');
    readln(nom);
    write('Contenido del mensaje: ');
    readln(cont);
    write('¿Es o no RT?: ');
    readln(rt);
    if (rt='si') then esRT:=true
    else if (rt='no') then esRT:=false;
  end;
end;

procedure insertarLista(var l:lista; t:tweet);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=t;
  nue^.sig:=l;
  l:=nue;
end;

procedure cargarLista(var l:lista);
var
  t:tweet;
begin
  writeln('Se ingresa informacion de tweets posteados en los ultimos 5 segundos: ');
  writeln(' ');
  write('Codigo de usuario: ');
  readln(t.cod);
  while (t.cod<>fin) do begin
    leerInfo(t);
    insertarLista(l,t);
    writeln(' ');
    write('Codigo de usuario: ');
    readln(t.cod);
  end;
end;

procedure imprimirLista(l:lista);
begin
  while (l<>nil) do begin
    writeln('Codigo del tweet: ',l^.datos.cod);
    writeln('Nombre de usuario: ',l^.datos.nom);
    writeln('Contenido del mensaje: ',l^.datos.cont);
    writeln('¿Es RT?',l^.datos.esRT);
    l:=l^.sig;
  end;
end;

procedure insertarOrdenado(var lOrdenada:lista; datos:tweet);
var
  nue,act,ant:lista;
begin
  new(nue);
  nue^.datos:=datos;
  nue^.sig:=nil;
  if (lOrdenada=nil) then lOrdenada:=nue
  else begin
    act:=lOrdenada;
    ant:=lOrdenada;
    while (act<>nil) and (act^.datos.nom<nue^.datos.nom) do begin
      ant:=act;
      act:=act^.sig;
    end;
    if (ant=act) then lOrdenada:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
  end;
end;

procedure cargarListaOrdenada(l:lista; var lOrdenada:lista);
begin
  while(l<>nil) do begin
    insertarOrdenado(lOrdenada,l^.datos);
    l:=l^.sig;
  end;
end;

procedure insertarFinalUsuario(var lUsuarios:listaUsuarios; dUsuario:usuario);
var
  act,nue:listaUsuarios;
begin
  new(nue);
  nue^.datos:=dUsuario;
  nue^.sig:=nil;
  if (lUsuarios<>nil) then begin
    act:=lUsuarios;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lUsuarios:=nue;
end;

procedure insertarFinalTweet(var lTweets:listaTweets; lOrdenada:lista);
var
  act,nue:listaTweets;
begin
  new(nue);
  nue^.datos.cont:=lOrdenada^.datos.cont;
  nue^.datos.RT:=lOrdenada^.datos.esRT;
  nue^.sig:=nil;
  if (lTweets<>nil) then begin
    act:=lTweets;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lTweets:=nue;
end;

procedure cargarListaUsuarios(lOrdenada:lista; var lUsuarios:listaUsuarios);
var
  nomAct:string;
  dUsuario:usuario;
  usuarioAct:listaUsuarios;
begin
  while (lOrdenada<>nil) do begin
     nomAct:=lOrdenada^.datos.nom;
     dUsuario.nom:=lOrdenada^.datos.nom;
     dUsuario.cod:=lOrdenada^.datos.cod;
     dUsuario.tweet:=nil;
     insertarFinalUsuario(lUsuarios,dUsuario); //inserto nombre y codigo de usuario en la lista de usuarios
     usuarioAct:=lUsuarios;
     while (usuarioAct^.sig<>nil) do usuarioAct:=usuarioAct^.sig;
     while (lOrdenada<>nil) and (lOrdenada^.datos.nom=nomAct) do begin
       insertarFinalTweet(usuarioAct^.datos.tweet,lOrdenada);
       lOrdenada:=lOrdenada^.sig;
     end;
  end;
end;

procedure imprimirListaUsuarios(lUsuarios:listaUsuarios);
  procedure imprimirListaTweets(lTweets:listaTweets);
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
    imprimirListaTweets(lUsuarios^.datos.tweet);
    writeln('------------------------');
    lUsuarios:=lUsuarios^.sig;
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

procedure liberarMemoriaUsuarios(var lUsuarios:listaUsuarios);
var
  aux:listaUsuarios;
begin
  while (lUsuarios<>nil) do begin
    aux:=lUsuarios;
    lUsuarios:=lUsuarios^.sig;
    dispose(aux);
  end;
end;

var
  l,lOrdenada:lista;
  lUsuarios:listaUsuarios;

begin
  l:=nil;
  cargarLista(l);
  writeln(' ');
  writeln('LISTA: ');
  imprimirLista(l);

  writeln(' ');

  lOrdenada:=nil;
  cargarListaOrdenada(l,lOrdenada);
  writeln('LISTA ORDENADA: ');
  imprimirLista(lOrdenada);

  writeln(' ');

  lUsuarios:=nil;
  cargarListaUsuarios(lOrdenada,lUsuarios);
  writeln('LISTA DE USUARIOS: ');
  imprimirListaUsuarios(lUsuarios);

  liberarMemoria(l);
  liberarMemoria(lOrdenada);
  liberarMemoriaUsuarios(lUsuarios);
  readln;
end.
