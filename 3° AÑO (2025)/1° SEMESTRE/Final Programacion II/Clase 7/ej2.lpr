program ej2;

const
  fin=0;

type
  libro=record
    isbn:integer;
    titulo,clasif:string;
  end;

  arbol=^nodoArbol;
  nodoArbol=record
    datos:libro;
    HI:arbol;
    HD:arbol;
  end;

procedure leerInfoLibro(var l:libro);
begin
  writeln('Se ingresan datos de un libro: ');
  with (l) do begin
    write('ISBN: ');
    readln(isbn);
    if (isbn<>fin) then begin
      write('Titulo: ');
      readln(titulo);
      write('Clasificador bibliografico: ');
      readln(clasif);
      writeln(' ');
    end;
  end;
end;

procedure insertarDatos(var a:arbol; l:libro);
begin
  a^.datos.isbn:=l.isbn;
  a^.datos.titulo:=l.titulo;
  a^.datos.clasif:=l.clasif;
end;

procedure insertarArbol(var a:arbol; l:libro);
begin
  if (a=nil) then begin
    new(a);
    insertarDatos(a,l);
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.isbn>l.isbn) then insertarArbol(a^.HI,l)
  else if (a^.datos.isbn<l.isbn) then insertarArbol(a^.HD,l)
end;

procedure cargarArbol(var a:arbol);
var
  l:libro;
begin
  leerInfoLibro(l);
  while (l.ISBN<>fin) do begin
    insertarArbol(a,l);
    leerInfoLibro(l);
  end;
end;

procedure imprimirArbol(a:arbol);
begin
  if (a<>nil) then begin
    imprimirArbol(a^.HI);
    writeln('ISBN: ',a^.datos.isbn,'. Titulo: ',a^.datos.titulo,'. Clasificador bibliografico: ',a^.datos.clasif);
    imprimirArbol(a^.HD);
  end;
end;

function existeLibroISBN(a:arbol; isbn:integer):boolean;
begin
  if (a<>nil) then begin
    if (a^.datos.isbn=isbn) then existeLibroISBN:=true
    else if (a^.datos.isbn>isbn) then existeLibroISBN:=existeLibroISBN(a^.HI,isbn)
    else existeLibroISBN:=existeLibroISBN(a^.HD,isbn);
  end
  else existeLibroISBN:=false;
end;

procedure contarClasif(a:arbol; clasif:string; var cantClasif:integer);
begin
  if (a<>nil) then begin
    if (a^.datos.clasif=clasif) then cantClasif:=cantClasif+1;
    contarClasif(a^.HI,clasif,cantClasif);
    contarClasif(a^.HD,clasif,cantClasif);
  end;
end;

function existeLibroTitulo(a:arbol; titulo:string):boolean;
begin
  if (a<>nil) then begin
    if (a^.datos.titulo=titulo) then existeLibroTitulo:=true;
    existeLibroTitulo(a^.HI,titulo);
    existeLibroTitulo(a^.HD,titulo);
  end
  else existeLibroTitulo:=false;
end;

var
  a:arbol;
  isbn,cantClasif:integer;
  clasif,titulo:string;

begin
  a:=nil;
  cargarArbol(a);
  writeln('Arbol generado: ');
  imprimirArbol(a);

  writeln(' ');


  write('Ingrese un ISBN de un libro para saber si existe o no en el arbol: ');
  readln(isbn);
  if (existeLibroISBN(a,isbn)) then writeln('Existe el libro en el arbol')
  else writeln('No existe el libro en el arbol');

  writeln(' ');

  write('Ingrese un clasificador bibliografico para saber cuantas veces aparece en el arbol: ');
  readln(clasif);
  cantClasif:=0;
  contarClasif(a,clasif,cantClasif);
  writeln('La cantidad de veces que aparece el clasificador bibliografico es: ',cantClasif);
  
  writeln(' ');

  write('Ingrese un titulo de un libro para saber si existe o no en el arbol: ');
  readln(titulo);
  if (existeLibroTitulo(a,titulo)) then writeln('Existe el titulo en el arbol')
  else writeln('No existe el titulo en el arbol');

  readln;
end.
