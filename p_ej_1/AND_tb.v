//Testbench for AND gate
`timescale 1ns/1ps

module and_tb;
   reg [3:0]a;//AND input ports
   wire out;//AND output port
   
   AND and_tb((a), (out));
   
   initial begin
	  a = 0;
	  $dumpfile("AND_tb.vcd");
	  $dumpvars(0, and_tb);
	  $finish;	    
   end
endmodule
	  
   
