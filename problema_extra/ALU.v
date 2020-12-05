//4 bit Logic Aritmetic Unit(ALU)
`include "AND.v"
`include "OR.v"
`include "XOR.v"
`include "full_adder.v"
`include "MUX4x1.v"

module ALU(input [3:0] A, B, input [1:0]alu_select, output [3:0] alu_out, output carry_out);
   wire [3:0] and_out, or_out, xor_out, adder_out;

   //=================Modules Instanciations=================
   AND and_tb((A), (B), (and_out));
   OR or_tb((A), (B), (or_out));
   XOR xor_tb((A), (B), (xor_out));
   fullAdder full_adder_4bits((A), (B), (1'b0), (adder_out), (carry_out));
   MUX mux4_1(and_out, or_out, xor_out, adder_out, alu_select, alu_out);
   
   
endmodule
