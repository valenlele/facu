Program twitter;
Uses
     sysutils;
Type
     tweet = record
	      codUsuario: integer;
	      nomUsuario: string;
	      cont: string;
	      RT: boolean;
     end;

     listaTweets = ^nodoLista;
     nodoLista = record
               datos: tweet;
               sig: listaTweets;
     end;


     dTweets = record
       cont:string;
       RT:boolean;
     end;

     listaTweetsPt2 = ^nodoTweets;
     nodoTweets = record
       datos:dTweets;
       sig:listaTweetsPt2;
     end;

     usuarios = record
       nom:string;
       cod:integer;
       tweets:listaTweetsPt2;
     end;

     listaUsuarios = ^nodoUsuarios;
     nodoUsuarios = record
       datos:usuarios;
       sig:listaUsuarios;
     end;


{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.datos := t;
     aux^.sig := l;
     l:= aux;
end;

{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
   v : array [1..10] of string;
begin
     v[1]:= 'juan';
     v[2]:= 'pedro';
     v[3]:= 'carlos';
     v[4]:= 'julia';
     v[5]:= 'mariana';
     v[6]:= 'gonzalo';
     v[7]:='alejandro';
     v[8]:= 'silvana';
     v[9]:= 'federico';
     v[10]:= 'ruth';

     t.codUsuario := random(11);
     while (t.codUsuario <> 0) do Begin
          texto:= Concat(v[t.codUsuario], '-mensaje-', IntToStr(random (200)));
          t.nomUsuario := v[t.codUsuario];
          t.cont := texto;
          t.RT := (random(2)=0);
          agregarAdelante(l, t);
          t.codUsuario := random(11);
     end;
end;

{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nomUsuario, ' con codigo ',codUsuario, ': ', cont, ' RT:');
          if(RT)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;

{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.datos);
          l:= l^.sig;
     end;
end;

{agregarElemento - Resuelve la inserción de la estructura ordenada}
procedure agregarOrdenado(var pri:listaTweets; t:tweet);
var
   nuevo, anterior, actual: listaTweets;
begin
     new (nuevo);
     nuevo^.datos:= t;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.datos.nomUsuario < nuevo^.datos.nomUsuario) do begin
               anterior := actual;
               actual:= actual^.sig;
          end;
          if (anterior = actual) then
               pri := nuevo
          else
               anterior^.sig := nuevo;
          nuevo^.sig := actual;
     end;
end;

{generarNuevaEstructura - Resuelve la generación estructura ordenada}
procedure generarNuevaEstructura (lT: listaTweets; VAR listaOrdenada: listaTweets);
begin
     while(lT <> nil) do begin
          agregarOrdenado(listaOrdenada, lT^.datos);
          lT := lT^.sig;
     end;
end;

procedure agregarFinal(var lUsuarios:listaUsuarios; dUsuario:usuarios);
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

procedure agregarFinalTweet(var lTweets:listaTweetsPt2; lOrdenada:listaTweets);
var
  act,nue:listaTweetsPt2;
begin
  new(nue);
  nue^.datos.cont:=lOrdenada^.datos.cont;
  nue^.datos.RT:=lOrdenada^.datos.RT;
  nue^.sig:=nil;
  if (lTweets<>nil) then begin
    act:=lTweets;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lTweets:=nue;
end;

procedure generarListaDeListas(var lUsuarios:listaUsuarios; lOrdenada:listaTweets);
var
  datosUsuario:usuarios;
  nomAct:string;
  usuarioAct:listaUsuarios;
begin
  while (lOrdenada<>nil) do begin
    nomAct:=lOrdenada^.datos.nomUsuario;
    datosUsuario.nom:=lOrdenada^.datos.nomUsuario;
    datosUsuario.cod:=lOrdenada^.datos.codUsuario;
    datosUsuario.tweets:=nil;
    agregarFinal(lUsuarios,datosUsuario);
    usuarioAct:=lUsuarios;
    while (usuarioAct^.sig<>nil) do usuarioAct:=usuarioAct^.sig;
    while (lOrdenada<>nil) and (lOrdenada^.datos.nomUsuario=nomAct) do begin
      agregarFinalTweet(usuarioAct^.datos.tweets,lOrdenada);
      lOrdenada:=lOrdenada^.sig;
    end;
  end;
end;

procedure imprimirListaUsuarios(lUsuarios:listaUsuarios);
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

procedure liberarMemoria(var l:listaTweets);
var
  aux:listaTweets;
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
  aux2:listaTweetsPt2;
begin
  while (lUsuarios<>nil) do begin
    aux:=lUsuarios;
    while (lUsuarios^.datos.tweets<>nil) do begin
      aux2:=lUsuarios^.datos.tweets;
      lUsuarios^.datos.tweets:=lUsuarios^.datos.tweets^.sig;
      dispose(aux2);
    end;
    lUsuarios:=lUsuarios^.sig;
    dispose(aux);
  end;
end;

var
   l,lOrdenada: listaTweets;
   lUsuarios:listaUsuarios;

begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     writeln(' ');

     lOrdenada:= nil;
     generarNuevaEstructura(l,lOrdenada);
     writeln ('Lista ordenada: ');
     imprimirLista(lOrdenada);

     writeln(' ');

     lUsuarios:=nil;
     generarListaDeListas(lUsuarios,lOrdenada);
     writeln('Lista de usuarios ordenada: ');
     imprimirListaUsuarios(lUsuarios);

     liberarMemoria(l);
     liberarMemoria(lOrdenada);
     liberarMemoriaUsuarios(lUsuarios);

     imprimirLista(l);
     imprimirLista(lOrdenada);
     imprimirListaUsuarios(lUsuarios);

     writeln('Fin del programa');
     readln;
end.
