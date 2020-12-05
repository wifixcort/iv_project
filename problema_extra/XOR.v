/*
 4 bit XOR module
 This XOR gate compare bit per bit it's inputs and generate an output vector
*/
// Inputs     Output
//  a  b       cout

module XOR ( input [3:0] a, b, output [3:0] cout);
   assign cout = a^b;
endmodule // XOR

