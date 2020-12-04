//Testbench Logic Aritmetic Unid(ALU) ...  
//Compile and run test with Makefile or :
//$iverilog AND.v OR.v XOR.v MUX4x1.v test_b_ejercicio_dos.v -o testb.out && vvp testb.out && gtkwave testbench.vcd

`timescale 1ns/1ps

module alu_tb;
   //=================Data types definitions=================
   //------------------------Inputs--------------------------
   reg [3:0]a;//Input port "a"
   reg [3:0]b;//Input port "b"
   reg [1:0] alu_select;
   reg alu_carry_in;
   
   
   
   //------------------------Outputs------------------------
   wire [3:0]alu_output;//Full Adder output
   wire alu_carry_out;// Full Adder carry output
   
   //=================Modules Instanciations=================
   ALU alu_tb(a, b, alu_select, alu_carry_in, alu_output, alu_carry_out);

   //===============Stimulous signals to apply===============
   initial 
	 begin
		//Inicial configurations
		a = 0; 
		b = 0;
		alu_carry_in = 1;
		alu_select = 3'd0;//ALU initial stimulous
//		$monitor($time, "    %b   %b   %b   %b   %b  %b  %b  %b", a, b, and_out, or_out, xor_out, adder_carry_in, adder_output, adder_carry_out);
		$dumpfile("testbench_alu.vcd");
		$dumpvars(0, alu_tb);
	 end // initial begin

   initial 
	 begin
		//Test input states
//		$display("                  Time    A      B     AND    OR    XOR Cin Adder Cout");
		//---------------------------------------------------
		#1 alu_carry_in = 0; alu_select = 3'd1;
		#1 a = 4'h1; b = 4'hE; alu_select = 3'd2;
		#1 a = 4'hE; b = 4'h1; alu_select = 3'd3; alu_carry_in = 1; 
		#1 a = 4'hF; b = 4'hF; alu_select = 3'd0;
		#1 alu_carry_in = 0; alu_select = 3'd2;
		#1 a = 4'h0; b = 4'h0; alu_select = 3'd1;
		
		//---------------------------------------------------
		#2 
		  $finish;
	 end // initial begin

   
endmodule
	  
   
