//Testbench for AND, OR, XOR ... 
//Compile and run test with
//$iverilog AND.v OR.v XOR.v AND_tb.v -o testb.out && vvp testb.out && gtkwave testbench.vcd

`timescale 1ns/1ps

module test_tb;
   reg [3:0]a;//Input ports
   reg [3:0]b;
   
   wire [3:0]adder;
   wire adder_carry;
   
   wire and_out;//AND output port
   wire or_out;//OR output port
   wire xor_out;//XOR output port      

   
   AND and_tb(a, and_out);
   OR or_tb((a), (or_out));
   XOR xor_tb((a), (xor_out));
   fullAdder full_adder_4bits((a), (b), (1'b0), (adder), (adder_carry));
   
   initial begin
	  a = 0; // Initial state = All input down
	  b = 0;
	  $dumpfile("testbench.vcd");
	  $dumpvars(0, test_tb);
	  //Test input states	  
	  //---------------------------------------------------
	  
	  #1 a[0] = 1; b[3] = 1; b[1] = 1; b[0] = 1;
	  #1 a[1] = 1; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[2] = 1; a[1] = 0; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[1] = 1; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[3] = 1; a[2] = 0; a[1] = 0; a[0] = 0;
	  #1 a[0] = 1; b[3] = 0;
	  #1 a[1] = 1; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[2] = 1; a[1] = 0; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[1] = 1; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[3] = 0; a[2] = 0; a[1] = 0; a[0] = 0;
	  b[1] = 0; b[0] = 0;
	  //---------------------------------------------------
	  //----Expected behavior----|
	  // Input | AND | OR | XOR |
	  // 0000 |  0  |  0  |  0  |
	  // 0001 |  0  |  1  |  1  |	  
	  // 0010 |  0  |  1  |  1  |
	  // 0011 |  0  |  1  |  0  |
	  // 0100 |  0  |  1  |  1  |
	  // 0101 |  0  |  1  |  0  |
	  // 0110 |  0  |  1  |  0  |
	  // 0111 |  0  |  1  |  1  |
	  // 1000 |  0  |  1  |  1  |
	  // 1001 |  0  |  1  |  0  |
	  // 1010 |  0  |  1  |  0  |
	  // 1011 |  0  |  1  |  1  |
	  // 1100 |  0  |  1  |  0  |
	  // 1101 |  0  |  1  |  1  |
	  // 1110 |  0  |  1  |  1  |
	  // 1111 |  1  |  1  |  0  |
	  // 0000 |  0  |  0  |  0  |	  
	  #2 
	  $finish;	    
   end
endmodule
	  
   
