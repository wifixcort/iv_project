`timescale 1ns/1ps

module testcom();
   reg [4:0]a;
   wire [4:0]b2_out;

   b2comp b2comp_tb(a, b2_out);
   
   initial 
	 begin
		//Inicial configurations
		a = 0; 
		$dumpfile("test2comp.vcd");
		$dumpvars(0, testcom);
	 end // initial begin

   initial 
	 begin
		#1 a = 5'b00001;
		#1 a = 5'b00010;
		#1 a =  5'b11101;
		#2
		  $finish;
	 end
   
endmodule
