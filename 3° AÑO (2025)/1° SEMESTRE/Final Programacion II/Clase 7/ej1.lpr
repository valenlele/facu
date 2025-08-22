Program ej1;
Uses
     sysutils;
Type
  tweet = record
    codigoUsuario: integer;
    nombreUsuario: string;
    mensaje: string;
    esRetweet: boolean;
  end;

  listaTweets = ^nodoLista;
  nodoLista = record
    dato: tweet;
    sig: listaTweets;
  end;

  datosA=record
    codUsuario,cantTweets:integer;
    nomUsuario:string;
  end;

  arbol=^nodoArbol;
  nodoArbol=record
    datos:datosA;
    HI:arbol;
    HD:arbol;
  end;

{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;

{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
begin
     t.codigoUsuario := random(2000);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(IntToStr(t.codigoUsuario), '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := Concat('Usuario-',IntToStr(t.codigoUsuario));
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(2000);
     end;
end;

{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;

{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure insertarDatos(var a:arbol; t:tweet);
begin
  a^.datos.codUsuario:=t.codigoUsuario;
  a^.datos.nomUsuario:=t.nombreUsuario;
  a^.datos.cantTweets:=1;
end;

procedure insertarArbol(var a:arbol; t:tweet);
begin
  if (a=nil) then begin
    new(a);
    insertarDatos(a,t);
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.codUsuario>t.codigoUsuario) then insertarArbol(a^.HI,t)
  else if (a^.datos.codUsuario<t.codigoUsuario) then insertarArbol(a^.HD,t)
  else a^.datos.cantTweets:=a^.datos.cantTweets+1;
end;

procedure crearArbol(var a:arbol; l:listaTweets);
begin
  while (l<>nil) do begin
    insertarArbol(a,l^.dato);
    l:=l^.sig;
  end;
end;

procedure imprimirArbol(a:arbol);
begin
  if (a<>nil) then begin
    imprimirArbol(a^.HI);
    writeln('Codigo de usuario: ',a^.datos.codUsuario,'. Nombre de usuario: ',a^.datos.nomUsuario,'. Cantidad de mensajes publicados: ',a^.datos.cantTweets);
    imprimirArbol(a^.HD);
  end;
end;

procedure informarRango(a:arbol; inf,sup:integer);
begin
  if (a<>nil) then
    if (a^.datos.codUsuario>=inf) then
      if (a^.datos.codUsuario<=sup) then begin
        writeln('Cantidad tweets usuario con codigo ',a^.datos.codUsuario,': ',a^.datos.cantTweets);
        informarRango(a^.HI,inf,sup);
        informarRango(a^.HD,inf,sup);
      end
      else
        informarRango(a^.HI,inf,sup)
    else
      informarRango(a^.HD,inf,sup);
end;

procedure nomUsuarioMaxTweets(a:arbol; var maxNomUsuario:string; var maxTweets:integer);
begin
  if (a<>nil) then begin
    if (a^.datos.cantTweets>maxTweets) then begin
      maxTweets:=a^.datos.cantTweets;
      maxNomUsuario:=a^.datos.nomUsuario;
    end;
    nomUsuarioMaxTweets(a^.HI,maxNomUsuario,maxTweets);
    nomUsuarioMaxTweets(a^.HD,maxNomUsuario,maxTweets);
  end;
end;

var
   l: listaTweets;
   a:arbol;
   maxTweets:integer;
   maxNomUsuario:string;

begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     writeln(' ');

     a:=nil;
     crearArbol(a,l);
     writeln('Estructura generada: ');
     imprimirArbol(a);

     writeln(' ');

     writeln('Se informa la cantidad de tweets de los usuarios con codigo entre 100 y 700: ');
     informarRango(a,100,700);

     writeln(' ');

     maxTweets:=-1;
     maxNomUsuario:=' ';
     nomUsuarioMaxTweets(a,maxNomUsuario,maxTweets);
     writeln('El nombre de usuario del usuario con la mayor cantidad de tweets es: ',maxNomUsuario);

     writeln('Fin del programa');
     readln;
end.
