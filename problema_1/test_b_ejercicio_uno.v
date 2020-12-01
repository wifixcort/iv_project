//Testbench for AND, OR, XOR ... 
//Compile and run test with Makefile or :
//$iverilog AND.v OR.v XOR.v test_b_ejercicio_uno.v -o testb.out && vvp testb.out && gtkwave testbench.vcd

`timescale 1ns/1ps

module test_tb;
   // Data types definitions
   //Inputs
   reg [3:0]a;//Input port "a"
   reg [3:0]b;//Input port "b"
   reg adder_carry_in;// Full Adder carry input
   reg [3:0] s;//Mux selection
   
   //Outputs
   wire [3:0]and_out;//AND output port
   wire [3:0]or_out;//OR output port
   wire [3:0]xor_out;//XOR output port      
   wire [3:0]adder_output;//Full Adder output
   wire adder_carry_out;// Full Adder carry output

   //Modules Instanciations
   AND and_tb((a), (b), (and_out));
   OR or_tb((a), (b), (or_out));
   XOR xor_tb((a), (b), (xor_out));
   fullAdder full_adder_4bits((a), (b), (adder_carry_in), (adder_output), (adder_carry_out));

   
   initial 
	 begin
		// Initial state = All input down
		a = 0; 
		b = 0;
		adder_carry_in = 1;
		$monitor($time, " Vector a, b: [%b] , [%b]", a, b);
		$dumpfile("testbench.vcd");
		$dumpvars(0, test_tb);
	 end

   //Stimulous: signals to apply
   initial 
	 begin
		//Test input states	  
		//---------------------------------------------------
		#1 adder_carry_in = 0;
		#1 a = 4'h1; b = 4'hE;
		#1 a = 4'hE; b = 4'h1; adder_carry_in = 1;
		#1 a = 4'hF; b = 4'hF;
		#1 a = 4'hF; b = 4'hF; adder_carry_in = 0;
		#1 a = 4'h0; b = 4'h0;
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
	 end
endmodule
	  
   
