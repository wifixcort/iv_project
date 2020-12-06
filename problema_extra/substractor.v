/*
 4 bit Substractor module
 This module substract a word "B" from another word "A" -> A-B = C
*/

`include "base_2_complement.v"
//`include "full_adder.v"

module substractor(input [3:0] a, b, output [3:0]cout);
   //cout = a - b; cout is a non signed number
   //Since input vectors are not signed numbers we need to add it
   //and make 5bit numeber to get 2's complement of "B"
   reg [4:0]signed_B;
      
   wire [4:0] b2com_out;//2's complente of "b" with sign
   wire carry_out;//Always ignored for this particular case
                  //Two digits with diferent sign.
   
   b2comp b2com_(({1'b0, b}), (b2com_out));
   fullAdder subst_((a), (b2com_out[3:0]), (1'b0), (cout), (carry_out));

endmodule // substractor

