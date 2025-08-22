program ej9;

var
  carac:char;
  cant_pa:integer;

procedure pa(carac:char);
var
  ant:char;
begin
  while carac = ' ' do
  begin
    writeln('Ingrese un caracter: ');
      readln(carac);
  end;
    while carac <> '.' do
    begin
      ant:=carac;
      writeln('Ingrese un caracter: ');
        readln(carac);
        while carac = ' ' do
          begin
            ant:=carac;
            writeln('Ingrese un caracter: ');
              readln(carac);
          end;
        if (ant = 'p') and (carac = 'a') then
          cant_pa:=cant_pa+1;
    end;
  end;

begin
  cant_pa:=0;
  writeln('Ingrese un caracter: ');
    read(carac);
    pa(carac);
  writeln('La cantidad de palabras que empiezan con una p y siguen con una a son: ',cant_pa);
  readln;
end.
