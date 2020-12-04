
//MUX4x1 module with 4bit inputs and output
module MUX (input [3:0]A0, A1, A2, A3 , input [1:0]M_select, output [3:0]M_out);
   //Handling with ternary expretion to select Input
   assign M_out = M_select[1] ? 
			  ( M_select[0] ? A3 : A2 ) :
			  (M_select[0] ? A1 : A0 );
endmodule // MUX
//Solving process step by step for 00, 10 and 11 selections
//First with 00 expected selection A0
// 0 ? ( 0 ? A3 : A2 ) : ( 0 ? A1 : A0 )
// 0 ? ( A2 ) : ( A0 )
// A0
//Second with 10 expected selection A2
// 1 ? ( 0 ? A3 : A2 ) : ( 0 ? A1 : A0 )
// 1 ? ( A2 ) : ( A0 )
// A2
//01 have similar process to 10
//Third with 11 expected selection A3
// 1 ? ( 0 ? A3 : A2 ) : ( 0 ? A1 : A0 )
// 1 ? ( A3 ) : ( A1 )
// A3
