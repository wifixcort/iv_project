/*
 4 bit OR module
 This OR gate compare bit per bit it's inputs and generate an output vector
*/
// Inputs     Output
//  a  b       cout

module OR ( input [3:0] a, b, output [3:0] cout );
   assign cout = a|b;
endmodule // OR

