program ej8;

const
  maxCombo=12;
  fin=0;

type
  rangoCombo=0..maxCombo;
  rangoDia=1..7;
  pedido=record
    combo:rangoCombo;
    dia:rangoDia;
    precio:real;
  end;
  lista=^nodo;
  nodo=record
    datos:pedido;
    sig:lista;
  end;

  vecDescripCombos=array[rangoCombo] of string;

  vecDescDias=array[rangoDia] of real;

  vecMontDias=array[rangoDia] of real;

  rPedidosYmont=record
    pedidos:integer;
    mont:real;
  end;
  vecPedidosYmontXcombo=array[rangoCombo] of rPedidosYmont;

procedure leerInfoPedido(var p:pedido);
begin
  with p do begin
    writeln('INGRESE INFORMACION DE UN PEDIDO: ');
    write('Codigo del combo: ');
    readln(combo);
    if (combo<>fin) then begin
      write('Dia de la semana en el que se pidio: ');
      readln(dia);
      write('Precio: ');
      readln(precio);
      writeln(' ');
    end;
  end;
end;

procedure insertarFinal(var pri,ult:lista; p:pedido);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=p;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure cargarLista(var pri,ult:lista); //se dispone enunciado
var
  p:pedido;
begin
  leerInfoPedido(p);
  while (p.combo<>fin) do begin
    insertarFinal(pri,ult,p);
    leerInfoPedido(p);
  end;
end;

procedure cargarDescripCombos(var descripCombos:vecDescripCombos); //se dispone enunciado
var
  i:rangoCombo;
begin
  writeln('INGRESE LAS DESCRIPCIONES DE LOS COMBOS: ');
  for i:=1 to maxCombo do begin
    write('Descripcion combo ',i,': ');
    readln(descripCombos[i]);
  end;
end;

procedure cargarDescDias(var descDias:vecDescDias); //se dispone enunciado
var
  i:rangoDia;
begin
  writeln('INGRESE LOS DESCUENTOS A APLICAR EN CADA DIA: ');
  for i:=1 to 7 do begin
    write('Descuento dia ',i,': ');
    readln(descDias[i]);
  end;
end;

procedure inicializarVecMontDias(var montDias:vecMontDias);
var
  i:rangoDia;
begin
  for i:=1 to 7 do montDias[i]:=0;
end;

procedure insertarVecMontDias(var montDias:vecMontDias; totMont:real; dia:rangoDia);
begin
  montDias[dia]:=montDias[dia]+totMont;
end;

procedure informarMontDia(montDias:vecMontDias);
var
  i:rangoDia;
begin
  writeln('EL MONTO TOTAL FACTURADO POR DIA ES: ');
  for i:=1 to 7 do writeln(montDias[i]:2:2);
end;

procedure inicializarVecPedidosYmontXcombo(var pedidosYmontXcombo:vecPedidosYmontXcombo);
var
  i:rangoCombo;
begin
  for i:=1 to maxCombo do begin
    pedidosYmontXcombo[i].pedidos:=0;
    pedidosYmontXcombo[i].mont:=0;
  end;
end;

procedure insertarPedidosYmontXcombo(var pedidosYmontXcombo:vecPedidosYmontXcombo; combo:rangoCombo; totMont:real);
begin
  pedidosYmontXcombo[combo].pedidos:=pedidosYmontXcombo[combo].pedidos+1;
  pedidosYmontXcombo[combo].mont:=pedidosYmontXcombo[combo].mont+totMont;
end;

procedure informar2maxCombos(pedidosYmontXcombo:vecPedidosYmontXcombo; descripCombos:vecDescripCombos);
var
  i:rangoCombo;
  maxP1,maxP2:integer;
  maxM1,maxM2:real;
  maxD1,maxD2:string;
begin
  maxP1:=-1;
  maxP2:=-1;
  for i:=1 to maxCombo do begin
    if (pedidosYmontXcombo[i].pedidos>maxP1) then begin
      maxP2:=maxP1;
      maxM2:=maxM1;
      maxD2:=maxD1;
      maxP1:=pedidosYmontXcombo[i].pedidos;
      maxM1:=pedidosYmontXcombo[i].mont;
      maxD1:=descripCombos[i];
    end
    else if (pedidosYmontXcombo[i].pedidos>maxP2) then begin
      maxP2:=pedidosYmontXcombo[i].pedidos;
      maxM2:=pedidosYmontXcombo[i].mont;
      maxD2:=descripCombos[i];
    end;
  end;
  writeln('La descripcion y monto facturado del combo mas pedido es: ');
  writeln('Monto: ',maxM1:2:2);
  writeln('Descripcion: ',maxD1);
  writeln(' ');
  writeln('La descripcion y monto facturado del segundo combo mas pedido es: ');
  writeln('Monto: ',maxM2:2:2);
  writeln('Descripcion: ',maxD2);
end;

procedure recorrerLista(pri:lista; var montDias:vecMontDias; var pedidosYmontXcombo:vecPedidosYmontXcombo; descDias:vecDescDias; descripCombos:vecDescripCombos; var lMenor100,lMayorIgual100,lCombo1_3,lComboMayor4:lista);
var
  totMont:real;
  ult1,ult2,ult3,ult4:lista;
begin
  inicializarVecMontDias(montDias);
  inicializarVecPedidosYmontXcombo(pedidosYmontXcombo);
  while (pri<>nil) do begin
    totMont:=pri^.datos.precio-descDias[pri^.datos.dia];
    insertarVecMontDias(montDias,totMont,pri^.datos.dia);
    insertarPedidosYmontXcombo(pedidosYmontXcombo,pri^.datos.combo,totMont);
    if (totMont<100) then insertarFinal(lMenor100,ult1,pri^.datos)
    else if (totMont>=100) then insertarFinal(lMayorIgual100,ult2,pri^.datos);
    if (pri^.datos.combo>=1) and (pri^.datos.combo<=3) then insertarFinal(lCombo1_3,ult3,pri^.datos)
    else if (pri^.datos.combo>=4) then insertarFinal(lComboMayor4,ult4,pri^.datos);
    pri:=pri^.sig;
  end;
  informarMontDia(montDias);
  writeln(' ');
  informar2maxCombos(pedidosYmontXcombo,descripCombos);
end;

procedure liberarMemoria(var pri:lista);
var
  aux:lista;
begin
  while (pri<>nil) do begin
    aux:=pri;
    pri:=pri^.sig;
    dispose(aux);
  end;
end;

var
  pri,ult,lMenor100,lMayorIgual100,lCombo1_3,lComboMayor4:lista;
  descripCombos:vecDescripCombos;
  descDias:vecDescDias;
  montDias:vecMontDias;
  pedidosYmontXcombo:vecPedidosYmontXcombo;

begin
  pri:=nil;
  lMenor100:=nil;
  lMayorIgual100:=nil;
  lCombo1_3:=nil;
  lComboMayor4:=nil;
  cargarLista(pri,ult); //se dispone enunciado
  writeln(' ');
  cargarDescripCombos(descripCombos); //se dispone enunciado
  writeln(' ');
  cargarDescDias(descDias); //se  dispone enunciado
  writeln(' ');
  recorrerLista(pri,montDias,pedidosYmontXcombo,descDias,descripCombos,lMenor100,lMayorIgual100,lCombo1_3,lComboMayor4);
  liberarMemoria(pri);
  liberarMemoria(lMenor100);
  liberarMemoria(lMayorIgual100);
  liberarMemoria(lCombo1_3);
  liberarMemoria(lComboMayor4);
  readln;
end.
