`timescale 	1ns	/ 100ps

`include "mux_2x1_1.v"
`include "mux_2x1_2.v"


module testbench;

reg clk, reset, In_0, In_1, Select;
wire Y_out_1, Y_out_2;


initial begin
    $dumpfile("muxes.vcd");
    $dumpvars(0);

    $monitor("Mux values: A:%b B:%b Select:%b Y_1:%b Y_2:%b at %0t", In_0, In_1, Select, Y_out_1, Y_out_2, $time);

    clk = 0;
    reset = 1'b0;
    {In_0,In_1} = 1'b0;
    Select = 1'b0;

    @(posedge clk) begin
        In_1 = 1'b1;
    end

    #5; reset = 1'b1;

    @(posedge clk) begin
        Select = 1'b1;
    end

    repeat(5) begin
        @(posedge clk) begin
            Select = Select + 1;
        end
    end


    #20;

    $finish;
end

always #10 clk = ~clk;

mux_2x1_1 mux_not_memry(.A_in(In_0),
                        .B_in(In_1),
                        .Select_in(Select),
                        .Y_out(Y_out_1));

mux_2x1_2 mux_memory(   .clk(clk),
                        .reset(reset),
                        .A_in(In_0),
                        .B_in(In_1),
                        .Select_in(Select),
                        .Y_out(Y_out_2));
    
endmodule