# Makefile
#
# Documentación en http://www.gnu.org/software/make/
#
# Un makefile contiene reglas, que indican como se procesan porciones 
# del programa y las dependencias de cada una
#
# Cada regla tiene la siguiente sintaxis:
#
# target: dependencias
# 	comandos

# También pueden definirse variables

# Ejecutable final
PROG=testb

# Compilador
IV=iverilog
VP =vvp
GT = gtkwave
# Regla de creación del ejecutable final
#mux_2x1_1.v  mux_2x1_2.v
$(PROG):
	$(IV) testbench.v -o $@.out
	$(VP) $@.out
	$(GT) muxes.vcd


# Los target PHONY son targets que realizan funciones miscelaneas, no 
# construyen archivos nuevos
.PHONY: clean

# Limpieza. Elimina todos los archivos creados
clean:
	rm -f *.out *.vcd

