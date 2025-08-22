Program repasoListas;
Uses
     sysutils;
Type
     producto = record
          codigo: integer;
	  nombre: string;
	  marca: string;
	  anio: 2000..2022;
	  precio: real;
     end;

     listaProductos = ^nodoLista;
     nodoLista = record
       dato: producto;
       sig: listaProductos;
     end;


  dListaProd = record
    nom:string;
    cod:integer;
    anio:2000..2022;
    precio:real;
  end;

  listaProd = ^nodoProd;
  nodoProd = record
    datos:dListaProd;
    sig:listaProd;
  end;

  dListaMarca = record
    marca:string;
    lProd:listaProd;
  end;

  listaMarca = ^nodoListaMarca;
  nodoListaMarca = record
    datos:dListaMarca;
    sig:listaMarca;
  end;

Procedure agregarAdelante(var l: listaProductos; p: producto);
var
   aux: listaProductos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;

{crearLista - Genera una lista con productos aleatorios}
procedure crearLista(var l: listaProductos);
var
   i,j:integer;
   p: producto;

   v : array [1..10] of string;
begin
     v[1]:= 'Abercom';
     v[2]:= 'Aluminium';
     v[3]:= 'ClearWindows';
     v[4]:= 'IndArg';
     v[5]:= 'La Foret';
     v[6]:= 'Open';
     v[7]:= 'Portal';
     v[8]:= 'Puertamania';
     v[9]:= 'PVCPremium';
     v[10]:= 'Ventalum';

	 for i:=random(10) downto 1 do {for de marca}
	 begin
	     p.marca:= v[i];
		 for j:=random(5) downto 1 do {for de anio}
	     begin
		 	p.anio:= 2016+j;
			p.codigo:= random(10);
			while (p.codigo <> 0) do Begin
				p.nombre:= Concat('Producto-', IntToStr(random (200)));
				p.precio := random(1000000);
				agregarAdelante(l, p);
                p.codigo:= random(10);
		   end;
		 end;
	 end;
end;

{imprimir - Muestra en pantalla el producto}
procedure imprimir(p: producto);
begin
     with (p) do begin
          writeln('Producto ', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;

{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaProductos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure insertarFinal(var lMarca:listaMarca; marca:string);
var
  nue,act:listaMarca;
begin
  new(nue);
  nue^.datos.marca:=marca;
  nue^.datos.lProd:=nil;
  nue^.sig:=nil;
  if (lMarca<>nil) then begin
    act:=lMarca;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lMarca:=nue;
end;

procedure insertarOrdenadoProducto(var lProd:listaProd; dProd:producto);
var
  nue,ant,act:listaProd;
begin
  new(nue);
  nue^.datos.anio:=dProd.anio;
  nue^.datos.cod:=dProd.codigo;
  nue^.datos.nom:=dProd.nombre;
  nue^.datos.precio:=dProd.precio;
  nue^.sig:=nil;
  if (lProd=nil) then lProd:=nue
  else begin
    ant:=lProd;
    act:=lProd;
    while (act<>nil) and (act^.datos.anio < nue^.datos.anio) do begin
      ant:=act;
      act:=act^.sig;
    end;
    if (ant=act) then lProd:=nue
    else ant^.sig:=nue;
    nue^.sig:=act;
  end;
end;

procedure crearListaMarca(var lMarca:listaMarca; l:listaProductos);
var
  marcaAct:string;
  nodoAct:listaMarca;
begin
  while (l<>nil) do begin
    marcaAct:=l^.dato.marca;
    insertarFinal(lMarca,marcaAct);
    nodoAct:=lMarca;
    while (nodoAct^.sig<>nil) do nodoAct:=nodoAct^.sig;
    while (l<>nil) and (l^.dato.marca=marcaAct) do begin
      insertarOrdenadoProducto(nodoAct^.datos.lProd,l^.dato);
      l:=l^.sig;
    end;
  end;
end;

procedure imprimirListaMarca(lMarca:listaMarca);
  procedure imprimirListaProd(lProd:listaProd);
  begin
    while (lProd<>nil) do begin
      writeln('Anio: ',lProd^.datos.anio);
      writeln('Codigo: ',lProd^.datos.cod);
      writeln('Nombre: ',lProd^.datos.nom);
      writeln('Precio: ',lProd^.datos.precio);
      lProd:=lProd^.sig;
    end;
  end;
begin
  while (lMarca<>nil) do begin
    writeln('Nombre marca: ',lMarca^.datos.marca);
    writeln('Productos: ');
    imprimirListaProd(lMarca^.datos.lProd);
    writeln('------------------------');
    lMarca:=lMarca^.sig;
  end;
end;

procedure liberarMemoria(var l:listaProductos);
var
  aux:listaProductos;
begin
  while (l<>nil) do begin
    aux:=l;
    l:=l^.sig;
    dispose(aux);
  end;
end;

procedure liberarMemoriaMarca(var lMarca:listaMarca);
var
  aux:listaMarca;
  aux2:listaProd;
begin
  while (lMarca<>nil) do begin
    aux:=lMarca;
    while (lMarca^.datos.lProd<>nil) do begin
      aux2:=lMarca^.datos.lProd;
      lmarca^.datos.lProd:=lMarca^.datos.lProd^.sig;
      dispose(aux2);
    end;
    lMarca:=lMarca^.sig;
    dispose(aux);
  end;
end;

function prodAbercom(lMarca:listaMarca):integer;
var
  cantAbercom:integer;
  aux:listaProd;
begin
  cantAbercom:=0;
  while (lMarca<>nil) and (lMarca^.datos.marca<>'Abercom') do lMarca:=lMarca^.sig;
  if (lMarca<>nil) then begin
    aux:=lMarca^.datos.lProd;
    while (aux<>nil) do begin
      if (aux^.datos.anio>2020) and (aux^.datos.anio<=2023) and (aux^.datos.precio>100000) then cantAbercom:=cantAbercom+1;
      aux:=aux^.sig;
    end;
  end;
  prodAbercom:=cantAbercom;
end;

procedure imprimirRecorte(lMarca:listaMarca);
  procedure imprimirListaProd(lProd:listaProd; var cantProdMarca:integer);
  var
    anioAct:2000..2022;
    cantProdAnio:integer;
  begin
    while (lProd<>nil) do begin
      writeln('Anio: ',lProd^.datos.anio);
      anioAct:=lProd^.datos.anio;
      cantProdAnio:=0;
      while (lProd<>nil) and (lProd^.datos.anio=anioAct) do begin
        writeln(lProd^.datos.cod,' ',lProd^.datos.nom,' ',lProd^.datos.precio,'$');
        cantProdAnio:=cantProdAnio+1;
        lProd:=lProd^.sig;
      end;
      writeln('Total productos anio ',anioAct,': ',cantProdAnio);
      cantProdMarca:=cantProdMarca+cantProdAnio;
    end;
  end;
var
  cantProdMarca:integer;
begin
  while (lMarca<>nil) do begin
    cantProdMarca:=0;
    writeln('Marca: ',lMarca^.datos.marca);
    imprimirListaProd(lMarca^.datos.lProd,cantProdMarca);
    writeln('Total productos anio ',lMarca^.datos.marca,': ',cantProdMarca);
    writeln(' ');
    writeln(' ');
    writeln(' ');
    lMarca:=lMarca^.sig;
  end;
end;

var
   l: listaProductos;
   lMarca:listaMarca;

begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     writeln('');

     lMarca:=nil;
     crearListaMarca(lMarca,l);
     writeln ('Lista ordenada por marca: ');
     imprimirListaMarca(lMarca);

     writeln('');

     writeln('Cantidad de productos Abercom fabricados entre 2020 y 2023 cuyo precio supera los 100000 pesos: ', prodAbercom(lMarca));

     writeln('');

     imprimirRecorte(lMarca);

     liberarMemoria(l);
     liberarMemoriaMarca(lMarca);

     readln;
end.
