Program ej1;
Uses
     sysutils;

const
  infCod=100;
  supCod=700;

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
       cod,cantMsj:integer;
       usuario:string;
     end;

     arbol=^nodoA;
     nodoA=record
       datos:datosA;
       HI,HD:arbol;
     end;

Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;

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

procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure cargarArbol(var a:arbol; l:listaTweets);

  procedure insertarArbol(var a:arbol; l:listaTweets);
  begin
    if (a=nil) then begin
      new(a);
      a^.datos.cod:=l^.dato.codigoUsuario;
      a^.datos.usuario:=l^.dato.nombreUsuario;
      a^.datos.cantMsj:=1;
      a^.HI:=nil;
      a^.HD:=nil;
    end
    else if (a^.datos.cod>l^.dato.codigoUsuario) then insertarArbol(a^.HI,l)
    else if (a^.datos.cod<l^.dato.codigoUsuario) then insertarArbol(a^.HD,l)
    else a^.datos.cantMsj:=a^.datos.cantMsj+1;
  end;

begin
  if (l<>nil) then begin
    insertarArbol(a,l);
    cargarArbol(a,l^.sig);
  end;
end;

procedure imprimirArbol(a:arbol);
begin
  if (a<>nil) then begin
    imprimirArbol(a^.HI);
    writeln('Usuario: ',a^.datos.usuario,' con codigo: ',a^.datos.cod,' .Cantidad de tweets: ',a^.datos.cantMsj);
    imprimirArbol(a^.HD);
  end;
end;

procedure cantTweets(a:arbol);
begin
  if (a<>nil) then begin
    if (a^.datos.cod>=infCod) then begin
      if (a^.datos.cod<=supCod) then begin
        writeln('Cantidad de tweets usuario ',a^.datos.usuario,': ',a^.datos.cantMsj);
        cantTweets(a^.HI);
        cantTweets(a^.HD);
      end
      else cantTweets(a^.HI);
    end
    else cantTweets(a^.HD);
  end;
end;

procedure usuarioMaxTweets(a:arbol; var maxT:integer; var maxU:string);
begin
  if (a<>nil) then begin
    usuarioMaxTweets(a^.HI,maxT,maxU);
    if (a^.datos.cantMsj>maxT) then begin
      maxT:=a^.datos.cantMsj;
      maxU:=a^.datos.usuario;
    end;
    usuarioMaxTweets(a^.HD,maxT,maxU);
  end;
end;

var
   l: listaTweets;
   a:arbol;
   maxT:integer;
   maxU:string;

begin
     Randomize;
     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     writeln(' ');

     a:=nil;
     cargarArbol(a,l);
     writeln('ESTRUCTURA GENERADA: ');
     imprimirArbol(a);
     {writeln('Cantidad de tweets de cada usuario con codigo entre 100 y 700: ');
     cantTweets(a);}

     writeln(' ');

     maxT:=-1;
     usuarioMaxTweets(a,maxT,maxU);
     writeln('El nombre de usuario con mayor cantida de tweets es: ',maxU);

     writeln('Fin del programa');
     readln;
end.
