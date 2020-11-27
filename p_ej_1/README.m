#Compile and Test

$iverilog AND.v OR.v XOR.v TestB_tb.v -o testb.out && vvp testb.out && gtkwave testbench.vc


