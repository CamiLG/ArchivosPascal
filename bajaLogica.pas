program p3ej2;
type
    cadena=string[50];
    empleado=record
      cod:integer;
      nom:cadena;
      dir:cadena;
      tel:integer;
      dni:integer;
      fn:cadena;
    end;
    arch_emp= FIle of empleado;
procedure imprimir(var a: arch_emp);
var
 e:empleado;
begin
  reset(a);
  read(a,e);
  while(not(eof(a)))do begin
     with e do begin
        writeln(cod);
        writeln(nom);
        writeln(dir);
        writeln(tel);
        writeln(dni);
        writeln(fn);
     end;
     write('hola');
     read(a,e);
  end;
       with e do begin
        writeln(cod);
        writeln(nom);
        writeln(dir);
        writeln(tel);
        writeln(dni);
        writeln(fn);
     end;
  close(a);
end;

procedure crearArchivo(var a: arch_emp);
var
 e:empleado;
begin
  rewrite(a);
  writeln('Ingrese el codigo de empleado, nombre, direccion, telefono, dni, y fecha nac, para terminar ingrese 9999 como codigo ');
  readln(e.cod);
  while(e.cod <> 9999) do begin
     readln(e.nom);
     readln(e.dir);
     readln(e.tel);
     readln(e.dni);
     readln(e.fn);
     write(a, e);
     writeln('Ingrese el codigo de empleado, nombre, direccion, telefono, dni, y fecha nac, para terminar ingrese 9999 codigo');
     readln(e.cod);
  end;
  close(a);
end;
procedure borradoLogico(var a:arch_emp);
var
 e: empleado;
begin
     reset(a);
     read(a, e);
     while(not(eof(a)))do begin
        if(e.dni < 5000000 )then begin
          e.nom:= '*' + e.nom;
          seek(a, filepos(a)-1);
          write(a, e);
        end;
        read(a, e);
     end;
     close(a);
end;

var
 a: arch_emp;
begin
  assign(a, 'empleados.dat');
  crearArchivo(a);
  imprimir(a);
  borradoLogico(a);
  imprimir(a);
  readln();
end.
                              