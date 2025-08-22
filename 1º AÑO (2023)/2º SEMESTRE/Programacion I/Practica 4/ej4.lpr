program ej4;
type
  cadena=string[10];
  producto=record
    cod:integer;
    tipo:cadena;
    cantMes:integer;
    precio:integer;
  end;

var
  p:producto;
  totAlfajores,totPrecio,totMerm,max1Cod,max2Cod,max1,max2:integer;

procedure leerInfo(var p:producto);
begin
  with p do begin
    write('Ingrese el codigo del producto: ');
    readln(cod);
    if (cod<>9999) then begin
      write('Ingrese el tipo de producto: ');
      readln(tipo);
      write('Ingrese la cantidad de unidades fabricadas en el mes: ');
      readln(cantMes);
      write('Ingrese el precio del producto: ');
      readln(precio);
    end;
  end;
end;

function cantAlfajoresMes(p:producto; var totAlfajores:integer):integer;
begin
  if (p.tipo='alfajor') and (p.cod<>9999) then totAlfajores:=totAlfajores+p.cantMes;
  cantAlfajoresMes:=totAlfajores;
end;

function precioPromMermeladas(p:producto; var totPrecio,totMerm:integer):real;
begin
  if(p.tipo='mermelada') and (p.cod<>9999) then begin
    totPrecio:=totPrecio+p.precio;
    totMerm:=totMerm+1;
  end;
  if (totMerm>0) then precioPromMermeladas:=totPrecio/totMerm
  else precioPromMermeladas:=0;
end;

procedure dosCodMax(p:producto; var max1,max2,max1Cod,max2Cod:integer);
begin
  if (p.cantMes>max1) then begin
    max2:=max1;
    max2Cod:=max1Cod;
    max1:=p.cantMes;
    max1Cod:=p.cod;
  end
  else if (p.cantMes>max2) then begin
    max2:=p.cantMes;
    max2Cod:=p.cod;
  end;
end;

begin
  totAlfajores:=0;
  totPrecio:=0;
  totMerm:=0;
  max1Cod:=-1;
  max2Cod:=-1;
  max1:=-1;
  max2:=-1;
  leerInfo(p);
  while (p.cod<>9999) do begin
    cantAlfajoresMes(p,totAlfajores);
    precioPromMermeladas(p,totPrecio,totMerm);
    dosCodMax(p,max1,max2,max1Cod,max2Cod);
    leerInfo(p);
  end;
  writeln('La cantidad de alfajores fabricados en el mes es: ',cantAlfajoresMes(p,totAlfajores));
  writeln('El precio promedio de las mermeladas es: ',precioPromMermeladas(p,totPrecio,totMerm):2:2);
  write('El codigo de los productos con mayor cantidad de unidades de fabricacion es: ',max1Cod,' y ',max2Cod);
  readln;
end.
