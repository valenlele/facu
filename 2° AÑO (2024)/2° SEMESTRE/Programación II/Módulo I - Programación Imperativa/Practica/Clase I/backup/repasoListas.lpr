program repasoListas;

const
  fin=-1;

type
  prod=record
    cod:integer;
    marca:string;
    nom:string;
    anio:integer;
    precio:integer;
  end;

  lista=^nodo;
  nodo=record
    datos:prod;
    sig:lista;
  end;

procedure leerInfo(var d:prod);
begin
  with d do begin
    write('Marca: ');
    readln(marca);
    write('Nombre: ');
    readln(nom);
    write('Anio de fabricacion: ');
    readln(anio);
    write('Precio: ');
    readln(precio);
    writeln(' ');
  end;
end;

procedure insertarOrdenado(var l:lista; d:prod);
var
  nue,act,ant:lista;
  marcaAct:string;
begin
  new(nue);
  nue^.datos:=d;
  act:=l;
  ant:=l;
  while (act<>nil) and (act^.datos.marca<d.marca) do begin
    ant:=act;
    act:=act^.sig;
  end;
  marcaAct:=d.marca;
  while (act<>nil) and (act^.datos.anio<d.anio) and (act^.datos.marca=marcaAct) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (ant=act) then l:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure cargarLista(var l:lista);
var
  d:prod;
begin
  writeln('Se ingresan datos de productos: ');
  write('Codigo: ');
  readln(d.cod);
  while (d.cod<>fin) do begin
    leerInfo(d);
    insertarOrdenado(l,d);
    write('Codigo: ');
    readln(d.cod);
  end;
end;

function abercom(l:lista):integer;
begin
  abercom:=0;
  while (l<>nil) do begin
    if (l^.datos.anio>=2020) and (l^.datos.anio<=2023) and (l^.datos.precio>100000) and (l^.datos.marca='abercom') then abercom:=abercom+1;
    l:=l^.sig;
  end;
end;

procedure reporte(l:lista);
var
  marcaAct:string;
  anioAct,prodAnio,prodMarca:integer;
begin
  while (l<>nil) do begin
    writeln('Marca: ',l^.datos.marca);
    marcaAct:=l^.datos.marca;
    prodMarca:=0;
    while (l<>nil) and (l^.datos.marca=marcaAct) do begin
      prodAnio:=0;
      writeln('Anio: ',l^.datos.anio);
      anioAct:=l^.datos.anio;
      while (l<>nil) and (l^.datos.anio=anioAct) and (l^.datos.marca=marcaAct) do begin
        write('         '); write(l^.datos.cod); write(' '); write(l^.datos.nom); write(' '); writeln(l^.datos.precio);
        prodAnio:=prodAnio+1;
        prodMarca:=prodMarca+1;
        l:=l^.sig;
      end;
      writeln('Total productos anio ',anioAct,': ',prodAnio);
    end;
    writeln('Total productos ',marcaAct,': ',prodMarca);
    writeln(' ');
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

procedure imprimirLista(l:lista);
begin
  writeln('LISTA: ');
  while (l<>nil) do begin
    writeln('MARCA: ',l^.datos.marca);
    writeln('NOMBRE: ',l^.datos.nom);
    writeln('ANIO: ',l^.datos.anio);
    writeln('PRECIO: ',l^.datos.precio);
    writeln(' ');
    l:=l^.sig;
  end;
end;

var
  l:lista;

begin
  l:=nil;
  cargarLista(l);
  writeln(' ');
  writeln('La cantidad de productos marca Abercom fabricados entre los años 2020 y 2023 inclusive que cuyo precio supero los 100000 son: ',abercom(l));
  writeln(' ');
  reporte(l);
  {writeln(' ');
  imprimirLista(l);}
  liberarMemoria(l);
  readln;
end.
