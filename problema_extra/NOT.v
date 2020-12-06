/*
 4 bit NOT module
 This NOT  gate compare bit per bit it's inputs and generate an output vector
*/
// Inputs     Output
//  a          cout

module NOT ( input [3:0] a, output [3:0] cout );
   assign cout = ~a;
endmodule // NOT
