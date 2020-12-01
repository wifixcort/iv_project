`timescale 1ns/1ps

module sumt();
   reg a, b, cin;

   wire sum, cout;

   fad_cell cell_a(a, b, cin, sum, cout);
   initial begin
	  a = 0;
	  b = 0;
	  cin = 0;
	  $dumpfile("testSum.vcd");
	  $dumpvars(0, sumt);	  
   end
   initial begin
	  #1 a = 0; b = 0; cin = 1;
	  #1 a = 1; b = 0; cin = 0;
	  #1 a = 0; b = 1; cin = 1;
	  #1 a = 1; b = 1; cin = 0;
	  #1 a = 1; b = 1; cin = 1;
	  #1 a = 0; b = 0; cin = 0;
	  #2
		$finish;
	  
   end
   
endmodule
