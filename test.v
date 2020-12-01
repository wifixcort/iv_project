//Test file for iverilog
`timescale 1ns/1ps

module test();
   reg [2:0]a;
   reg [2:0] b;
   

   wire [2:0]salida;

   segunda_and una_and((a), (b), (salida));// Instanciarlo
   
   initial begin
	  a = 0;
	  b = 0;		  
	 $display("Hello World");
	  $dumpfile("testb.vcd");
      $dumpvars(0, test);
   end
   initial
	 begin

		#1 a[2] = 0; a[1] = 0; a[0] = 1;
		   b[2] = 0; b[1] = 0; b[0] = 1;
		
		#1 a[2] = 1; a[1] = 0; a[0] = 1;
		   b[2] = 1; b[1] = 1; b[0] = 0;
		
		#1 a[2] = 1; a[1] = 1; a[0] = 0;
		   b[2] = 0; b[1] = 0; b[0] = 0;
		
		#1 a[2] = 1; a[1] = 1; a[0] = 1;
		   b[2] = 0; b[1] = 0; b[0] = 0;
		
		#1 a[2] = 0; a[1] = 0; a[0] = 0;
		   b[2] = 0; b[1] = 0; b[0] = 0;
		#3
		  $finish;
		
	 end
endmodule // test

/*
Compiling and runnig this code on linux
 $ iverlog filename.v -o file_output.out
 $vvp file_output.out
*/

module and_a(input a, input b, output c);
  //Celda tipica
   assign c = a&b;
endmodule

module segunda_and(input [2:0]a, input [2:0]b, output [2:0]c);
   //Construir el Moduludo Sumador
   and_a and1(a[2], b[2], c[2]);
   and_a and2(a[1], b[1], c[1]);
   and_a and3(a[0], b[0], c[0]);
endmodule   


