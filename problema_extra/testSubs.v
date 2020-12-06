`timescale 1ns/1ps

module testcom();
   reg [3:0]a;
   reg [3:0]b;
   wire [3:0] subs_out;
   wire carry_out;//Always generate a carry but it's ignored
   

   substractor subs_tb(a, b, subs_out, carry_out);
   
   initial 
	 begin
		//Inicial configurations
		a = 0;
		b = 0;
		$dumpfile("testsubs.vcd");
		$dumpvars(0, testcom);
	 end // initial begin

   initial 
	 begin
		#1 a = 4'b0001; b = 4'b0001;
		#1 a = 4'b0010; b = 4'b1001;
		#1 a = 4'b1101; b = 4'b1000;
		#2
		  $finish;
	 end
   
endmodule
