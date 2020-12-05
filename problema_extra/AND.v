/*
 4 bit AND module
 This AND  gate compare bit per bit it's inputs and generate an output vector
*/
// Inputs     Output
//  a  b       cout

module AND ( input [3:0] a, b, output [3:0] cout );
   assign cout = a&b;
endmodule // AND

   
