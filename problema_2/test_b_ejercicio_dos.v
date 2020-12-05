//Testbench Logic Aritmetic Unid(ALU) ...  
//Compile and run this test with Makefile or :
//$iverilog ALU.v test_b_ejercicio_dos.v -o testb.out && vvp testb.out && gtkwave testbench_alu.vcd

`timescale 1ns/1ps

module alu_tb;
   //=================Data types definitions=================
   //------------------------Inputs--------------------------
   reg [3:0]a;//Input port "a"
   reg [3:0]b;//Input port "b"
   reg [1:0] alu_select;
   
   
   
   //------------------------Outputs------------------------
   wire [3:0]alu_output;//Full Adder output
   wire alu_carry_out;// Full Adder carry output
   
   //=================Modules Instanciations=================
   ALU alu_tb(a, b, alu_select, alu_output, alu_carry_out);

   //===============Stimulous signals to apply===============
   initial 
	 begin
		//Inicial configurations
		a = 0; 
		b = 0;
		alu_select = 2'd0;//ALU initial stimulous

		$dumpfile("testbench_alu.vcd");
		$dumpvars(0, alu_tb);
	 end // initial begin

   initial 
	 begin
		//Test input cases
		//---------------------------------------------------
		#1 a = 4'hF; b = 4'hF; //Perform AND operation
		#1 a = 4'h1; b = 4'hE; alu_select = 2'd1;//Perform OR operation
		#1 a = 4'hE; b = 4'h1; alu_select = 2'd2;//Perform XOR operation
		#1 a = 4'hF; b = 4'hF; alu_select = 2'd3;//Perform Add operation
		#1 a = 4'h0; b = 4'h0; alu_select = 2'd0;//Perform AND operation
		
		//---------------------------------------------------
		#2 
		  $finish;
	 end // initial begin

   
endmodule
	  
   
