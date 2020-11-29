//4 bit XOR module 
module XOR ( input [3:0] a, output xor_ );
   assign xor_ = ^a;
endmodule
