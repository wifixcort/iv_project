//MUX8x1 module with 4bit inputs and output

//Simplier way to define a MUX8x1 with "case" statemant
module MUX (input [3:0] A0, A1, A2, A3, A4, A5, input [2:0]M_select, output reg [3:0]M_out);

always @(*) begin
   case(M_select)
	 3'b000: M_out = A0;
	 3'b001: M_out = A1;
	 3'b010: M_out = A2;
	 3'b011: M_out = A3;
	 3'b100: M_out = A4;
	 3'b101: M_out = A5;
   endcase // case (M_select)
end
endmodule // MUX

