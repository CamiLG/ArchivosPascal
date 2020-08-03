program p1ej7;

type
   cadena= string[50];
   novela=record
      cod:integer;
      nom:cadena;
      gen:cadena;
      prec:integer;
   end;
   arch_nov= File of novelas;
procedure crearBinario(var a: arch_nov; var t: Text);
var
  n:novela;
  begin
       reset(t);
       rewrite(a);
       while(not(eof(t)))do begin
          with n do begin
              readln(t, cod, prec, gen);
              readln(t, nom);
          end;
          write(a, n);
       end;
       close(a);
       close(t);
       writeln('Archivo creado correctamente');
  end;
procedure agregarNovela(var a: arch_nov);
var
  n:novela;
begin
   reset(a);
   writeln('Ingrese codigo, nombre, precio y genero');
   with n do begin
      readln(cod);
      readln(nom);
      readln(prec);
      readln(gen);
   end;
   seek(a, filesize(a));
   write(a,n);
   close(a);
   writeln('Novela agregada correctamente');
end;
procedure modificarNovela(var a: arch_nov);
var
  n,na:novela;
begin
     reset(a);
     writeln('Ingrese codigo, nombre, precio y generoa modificar');
   with n do begin
      readln(cod);
      readln(nom);
      readln(prec);
      readln(gen);
   end;
   read(a, na);
   while(not(eof(a)) and (na.cod <> n.cod )) do begin
      read(a, na);
   end;
   if(na.cod = n.cod)then begin
     seek(a, filepos(a)-1);
     write(a, n);
   end
   else
       writeln('no se encontró la novela');
   close(a);
end;

procedure actualizarBinario(var a: arch_nov);
var
  opc:integer;
begin
    writeln('Si desea agregar una novela ingrese 1, si desea modificar una existente ingrese 2 si no desea hacer nada ingrese 0');
    readln(opc);
    while(opc <> 0 ) do begin
       case opc of
            1: agregarNovela(a);
            2: modificarNovela(a);
       end;
       writeln('Si desea agregar una novela ingrese 1, si desea modificar una existente ingrese 2 si no desea hacer nada ingrese 0');
       readln(opc);
    end;
    writeln('Archivo actualizado correctamente');
end;

var
  ab:arch_nov;
  at: Text;
begin
  assign(at, 'novelas.txt');
  assign(ab, 'novelas.dat');
  crearBinario(ab, at);
  actualizarBinario(ab);
  readln();
end.
{7. Realizar un programa que permita:
a. Crear un archivo binario a partir de la información almacenada en un archivo de texto. El nombre del archivo de texto es: “novelas.txt”
b. Abrir el archivo binario y permitir la actualización del mismo. Se debe poder agregar una novela y modificar una existente. Las búsquedas se realizan por código de novela.
NOTA: La información en el archivo de texto consiste en: código de novela, nombre,género y precio de diferentes novelas argentinas. De cada novela se almacena la información en dos líneas en el archivo de texto. La primera línea contendrá la siguiente información: código novela, precio, y género, y la segunda línea almacenará el nombre de la novela.
}  