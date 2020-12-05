/*
 4 bit AND module
 This OR gate compare bit per bit it's inputs and generate an output vector
*/
// Inputs     Output
//  a  b       and_

module AND ( input [3:0] a, b, output [3:0] and_ );
   assign and_ = a&b;
endmodule // AND

   
