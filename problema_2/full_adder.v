//4 bit Full Adder with carry
`include "fad_cell.v"

module fullAdder(input [3:0] A, B, input Cin, output [3:0] Sum, output Cout);
   wire C_0, C_1, C_2;//States
   
   fad_cell fulladder_cell_0((A[0]), (B[0]), Cin, Sum[0], C_0);//Initial Cell
   fad_cell fulladder_cell_1((A[1]), (B[1]), C_0, Sum[1], C_1);//Middle Cell
   fad_cell fulladder_cell_2((A[2]), (B[2]), C_1, Sum[2], C_2);//Middle Cell
   fad_cell fulladder_cell_3((A[3]), (B[3]), C_2, Sum[3], Cout);//Final Cell   
   
endmodule // fullAdder
