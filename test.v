//Test file for iverilog

module test();
   initial begin
	 $display("Hello World");
   end
endmodule // test

/*
Compiling and runnig this code on linux
 $ iverlog filename.v -o file_output.out
 $vvp file_output.out
*/
  
   
