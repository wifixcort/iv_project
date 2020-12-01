module mux_2x1_1 (
    input A_in,
    input B_in,
    input Select_in,
    output Y_out
);
    
    wire and1;
    wire and2;

    and(and1,A_in,~Select_in);
    and(and2,B_in,Select_in);
    or(Y_out,and1,and2);


endmodule