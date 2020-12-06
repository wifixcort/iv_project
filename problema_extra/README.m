#Compile and Test

Se dispone de un Makefile para compilar todos los archivos y crear el banco de pruebas necesario.

-----------Ejercio Extra-----------

Se reutilizan todos los módulos creados en el ejercio uno y dos:

  *---------------------------------------------
  * AND.v módulo de una AND de 4 entradas
  * OR.v módulo de una OR de 4 entradas
  * XOR.v módulo de una XOR de 4 entradas
  * MUX4x1.v módulo de multiplexor de entradas y salida de 4bits
  * fad_cell.v (full adder cell), módulo de una celda típica para constuir un sumador completo de 4 bits
  * full_adder.v módulo de sumador completo de 4 bits
  * ALU.v módulo de Unidad Lógica Aritmética
  *---------------------------------------------

A la ALU creada se agrega la funcionalidad de operación NOT y resta
  por lo que es necesario amplicar el mux a MUX8x1

  * test_b_ejercicio_extra.v "banco" de pruebas realizada a los módulos creados para el ejercicio extra
  

  

