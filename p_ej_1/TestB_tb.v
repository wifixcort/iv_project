//Testbench for AND, OR, XOR ... 
//Compile and run test with
//$iverilog AND.v OR.v XOR.v AND_tb.v -o testb.out && vvp testb.out && gtkwave testbench.vcd

`timescale 1ns/1ps

module test_tb;
   reg [3:0]a;//Input ports
   wire y_out;//AND output port
   wire o_out;//OR output port
   wire xo_out;//XOR output port      

   
   AND and_tb((a), (y_out));
   OR or_tb((a), (o_out));
   XOR xor_tb((a), (xo_out));
   
   initial begin
	  a = 0; // Initial state = All input down
	  $dumpfile("testbench.vcd");
	  $dumpvars(0, test_tb);
	  //Test input states	  
	  //---------------------------------------------------
	  #1 a[0] = 1;
	  #1 a[1] = 1; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[2] = 1; a[1] = 0; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[1] = 1; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[3] = 1; a[2] = 0; a[1] = 0; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[1] = 1; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[2] = 1; a[1] = 0; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[1] = 1; a[0] = 0;
	  #1 a[0] = 1;
	  #1 a[3] = 0; a[2] = 0; a[1] = 0; a[0] = 0;
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
	  
   
