/*
 4 bit OR module
 This OR gate compare bit per bit it's inputs and generate an output vector
*/
// Inputs     Output
//  a  b       or_

module OR ( input [3:0] a, b, output [3:0] or_ );
   assign or_ = a|b;
endmodule // OR

