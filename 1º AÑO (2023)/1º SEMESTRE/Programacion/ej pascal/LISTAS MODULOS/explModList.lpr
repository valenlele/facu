procedure AgregarAlFinal(var pri: lista; per: persona);
var
  act:lista; {recorre la lista}
  nue:lista; {crea nuevo nodo en la lista(nuevo dato que se quiere ingresar al final)}
begin
  new(nue); {se asigna espacio en la memoria dinamica}
  nue^.datos := per;
  nue^.sig := NIL; {se asigna como puntero vacio al siguiente para indicar que es el ultimo}

  if pri <> Nil then {se verifica si la lista no esta vacia, no se llego al final}
  begin {si no esta vacia, recorre la lista hasta llegar al ultimo nodo}
    act := pri;
    while (act^.sig <> NIL) do
      act := act^.sig; {se actualiza al puntero act para que apunte al siguiente nodo}
    act^.sig := nue; {agrega el nuevo nodo al final de la lista}
  end
  else
    pri := nue; {si inicialmente la lista estaba vacia el puntero pri apunta al nuevo nodo nue, convirtiendose en el primer y unico nodo}
end;

procedure AgregarAlFinal2 (var pri, ult: lista; per: persona); {se utiliza ult como ultimo nodo de la lista}
var nue : lista;
begin
new (nue);
nue^.datos:= per;
nue^.sig := NIL;
if pri <> Nil then
 ult^.sig := nue;
 else
 pri := nue;
ult := nue; {asegura que ult siempre apunte al ultimo nodo}
end;



Procedure BorrarElemento (var pri:lista; nom:cadena50; var exito: boolean);
var
  ant:lista; {apunta al nodo anterior del actual}
  act: lista; {recorre la lista}
begin
 exito := false;
 act := pri; {asegura que se recorra desde el primer nodo}
 {Recorro mientras no se termine la lista y no encuentre el elemento}
 while (act <> NIL) and (act^.datos.nom <> nom) do begin
 ant := act; {se establace como el nodo actual}
 act := act^.sig {se establece como nodo siguiente}
 end;
 {si se encuentra el elemento buscado}
 if (act <> NIL) then begin
 exito := true;
 if (act = pri) then pri := act^.sig; {si se encuentra en el primer nodo se elimina asignando pri al siguiente nodo}
 else ant^.sig:= act^.sig; {si el nodo actual no es el primer nodo de la lista, el nodo anterior apunta al nodo siguiente del actual}
 dispose (act); {se elimina el nodo actual}
 end;
end;



{Supongamos que se dispone de una lista de personas ordenada alfabéticamente
por el nombre y se desea incorporar la información de una persona a dicha lista.
Los datos de la persona se leen de teclado.}

Procedure InsertarElemento ( var pri: lista; per: persona);
var ant, nue, act: lista;
begin
 new (nue); {nuevo nodo para persona a instertar}
 nue^.datos := per;
 act := pri; {inicia recorrido desde el principio}
 ant := pri; {mantiene un puntero a un nodo anterior al actual}
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
 while (act<>NIL) and (act^.datos.nombre < per.nombre) do begin
 ant := act; {actualiza al nodo siguiente}
 act := act^.sig ; {va al sig nodo}
 end;
 {verifica la posicion correcta donde se inserta el nuevo nodo}
 if (ant = act){si ni siquiera entro al while(act y ant = pri)} then pri := nue {el dato va al principio}
 else ant^.sig := nue; {va entre otros dos o al final}
 nue^.sig := act ; {avanza al sig nodo}
end;

procedure CargarLista(var L: lista);
var
  p: persona;
begin
  L := NIL; // Inicializar la lista como vacía

  // Leer los datos de las personas desde el teclado hasta que se ingrese una condición de salida

  repeat
    leerPersona(p); // Llamar al procedimiento "leerPersona" para obtener los datos de una persona

    if p.nombre <> 'salir' then
      InsertarElemento(L, p); // Llamar al procedimiento "InsertarElemento" para agregar una persona a la lista

  until p.nombre = 'salir';
end;

Begin {prog. ppal}
 CargarLista (L); {inicializa la lista como vacia} {lee los datos} {llama a insertar elemento para agregar persona a la lista}
 leerPersona (p);
 InsertarElemento (L, p);
End.
