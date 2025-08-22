program ej2;

const
  fin=0;

type
  libro=record
    titulo,clasif:string;
    isbn:integer;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:libro;
    HI,HD:arbol;
  end;

procedure cargarArbol(var a:arbol);

  procedure leerInfoLibro(var l:libro);
  begin
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

  procedure insertarArbol(var a:arbol; l:libro);
  begin
    if (a=nil) then begin
      new(a);
      a^.datos.isbn:=l.isbn;
      a^.datos.titulo:=l.titulo;
      a^.datos.clasif:=l.clasif;
      a^.HI:=nil;
      a^.HD:=nil;
    end
    else if (a^.datos.isbn>l.isbn) then insertarArbol(a^.HI,l)
    else if (a^.datos.isbn<l.isbn) then insertarArbol (a^.HD,l);
  end;

var
  l:libro;
begin
  writeln('SE INGRESA INFORMACION DE LIBROS: ');
  leerInfoLibro(l);
  while (l.isbn<>fin) do begin
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

procedure buscarISBN(a:arbol; isbn:integer; var encontreISBN:boolean);
begin
  if (a<>nil) then begin
    if (isbn>a^.datos.isbn) then buscarISBN(a^.HD,isbn,encontreISBN)
    else if (isbn<a^.datos.isbn) then buscarISBN(a^.HI,isbn,encontreISBN)
    else encontreISBN:=true;
  end;
end;

procedure cantCodClasif(a:arbol; cod:string; var cantCod:integer);
begin
  if (a<>nil) then begin
    cantCodClasif(a^.HI,cod,cantCod);
    if (a^.datos.clasif=cod) then cantCod:=cantCod+1;
    cantCodClasif(a^.HD,cod,cantCod);
  end;
end;

procedure buscarTitulo(a:arbol; titulo:string; var encontreTitulo:boolean);
begin
  if (a<>nil) then begin
    if (titulo>a^.datos.titulo) then buscarTitulo(a^.HD,titulo,encontreTitulo)
    else if (titulo<a^.datos.titulo) then buscarTitulo(a^.HI,titulo,encontreTitulo)
    else encontreTitulo:=true;
  end;
end;

var
  a:arbol;
  isbn,cantCod:integer;
  encontreISBN,encontreTitulo:boolean;
  cod,titulo:string;

begin
  a:=nil;
  cargarArbol(a);
  writeln(' ');
  {writeln('ARBOL GENERADO: ');
  imprimirArbol(a);}

  write('Ingrese el ISBN de un libro para saber si esta en el arbol: ');
  readln(isbn);
  encontreISBN:=false;
  buscarISBN(a,isbn,encontreISBN);
  if (encontreISBN) then writeln('Existe libro con ISBN ',isbn)
  else writeln('No existe libro con ISBN ',isbn);

  writeln(' ');

  write('Ingrese un codigo clasificador bibliografico para saber cuantas veces aparece en el arbol: ');
  readln(cod);
  cantCod:=0;
  cantCodClasif(a,cod,cantCod);
  writeln('La cantidad de veces que aparece el codigo ',cod,' en el arbol es: ',cantCod);

  writeln(' ');

  write('Ingrese el titulo de un libro para saber si esta en el arbol: ');
  readln(titulo);
  encontreTitulo:=false;
  buscarTitulo(a,titulo,encontreTitulo);
  if (encontreTitulo) then writeln('Existe libro ',titulo)
  else writeln('No existe libro ',titulo);

  readln;
end.
