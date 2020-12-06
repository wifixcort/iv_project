/*
 This module perform a 2's complement of a signed digit
 */
module b2comp(input [4:0]a, output [4:0]cout);
   assign cout =  -a;
endmodule // b2comp

	
