/*
 4 bit XOR module
 This OR gate compare bit per bit it's inputs and generate an output vector
*/
// Inputs     Output
//  a  b       xor_

module XOR ( input [3:0] a, b, output [3:0] xor_ );
   assign xor_ = a^b;
endmodule // XOR

