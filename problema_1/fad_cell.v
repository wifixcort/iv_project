//Typical cell for full adder
//fad_cell = full adder cell
module fad_cell(input A, B, Cin, output Sum, Cout);
   assign Sum = A^B^Cin;
   initial begin $monitor("%b,%b,%b = %b", A, B, Cin); end
   assign Cout = A & Cin | B & Cin | A & B;
endmodule // fad_cell

