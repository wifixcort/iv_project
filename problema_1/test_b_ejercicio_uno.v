//Testbench for AND, OR, XOR Full Adder MUX...  
//Compile and run this test with Makefile or :
//$iverilog AND.v OR.v XOR.v full_adder.v MUX4x1.v test_b_ejercicio_uno.v -o testb.out && vvp testb.out && gtkwave testbench.vcd

`timescale 1ns/1ps

module test_tb;
   //=================Data types definitions=================
   //------------------------Inputs--------------------------
   reg [3:0]a;//Input port "a"
   reg [3:0]b;//Input port "b"
   reg adder_carry_in;// Full Adder carry input
   reg [3:0] mux_A0, mux_A1, mux_A2, mux_A3;//Mux input ports
   reg [1:0] mux_select;//Mux selection port
   
   //------------------------Outputs------------------------
   wire [3:0]and_out;//AND output port
   wire [3:0]or_out;//OR output port
   wire [3:0]xor_out;//XOR output port      
   wire [3:0]adder_output;//Full Adder output
   wire adder_carry_out;// Full Adder carry output
   wire [3:0] mux_out;
   
   //=================Modules Instanciations=================
   AND and_tb((a), (b), (and_out));
   OR or_tb((a), (b), (or_out));
   XOR xor_tb((a), (b), (xor_out));
   fullAdder full_adder_4bits((a), (b), (adder_carry_in), (adder_output), (adder_carry_out));
   MUX mux4_1(mux_A0, mux_A1, mux_A2, mux_A3, mux_select, mux_out);

   //===============Stimulous signals to apply===============
   initial 
	 begin
		//Inicial configurations
		a = 0; 
		b = 0;
		adder_carry_in = 1;
		//Mux Test Inputs
		mux_A0 = 4'hE;
		mux_A1 = 4'hA;
		mux_A2 = 4'hB;
		mux_A3 = 4'h4;
		mux_select = 3'd0;//Mux initial stimulous
		$monitor($time, "    %b   %b   %b   %b   %b  %b  %b  %b", a, b, and_out, or_out, xor_out, adder_carry_in, adder_output, adder_carry_out);
		$dumpfile("testbench.vcd");
		$dumpvars(0, test_tb);
	 end // initial begin

   initial 
	 begin
		//Test input cases
		$display("                  Time    A      B     AND    OR    XOR Cin Adder Cout");
		//---------------------------------------------------
		#1 adder_carry_in = 0; mux_select = 3'd1;
		#1 a = 4'h1; b = 4'hE; mux_select = 3'd2;
		#1 a = 4'hE; b = 4'h1; mux_select = 3'd3; adder_carry_in = 1; 
		#1 a = 4'hF; b = 4'hF; 
		#1 adder_carry_in = 0;
		#1 a = 4'h0; b = 4'h0;
		#1 adder_carry_in = 1;
		#1 a = 4'h1; b = 4'h1;
		#1 a = 4'h2; b = 4'h2;
		#1 a = 4'h4; b = 4'h4;
		//---------------------------------------------------
		//----Expected behavior----|
		//   Input  |  AND  |  OR  |  XOR  |
		// A = 0000   
		//---------   0000    0000   0000
		// B = 0000
		//---------------------------------
		// A = 0001   
		//---------   0000    1111   1111
		// B = 1110
		//---------------------------------
		// A = 1110   
		//---------   0000    1111   1111
		// B = 0001
		//---------------------------------
		// A = 1111   
		//---------   0000    0000   0000
		// B = 1111
		//--------------------------------- 	  
		// 0000     |  0  |  0  |  0  |	  
		#2 
		  $finish;
	 end // initial begin

   
endmodule
	  
   
