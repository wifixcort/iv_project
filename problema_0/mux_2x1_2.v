module mux_2x1_2 (
    input clk,
    input reset,
    input A_in,
    input B_in,
    input Select_in,
    output reg Y_out
);

always @(posedge clk) begin
    if(~reset)
        Y_out <= 1'b0; 
    else begin
        case(Select_in)
            1'b0: Y_out <= A_in;
            1'b1: Y_out <= B_in;
        endcase
    end
end
    
endmodule