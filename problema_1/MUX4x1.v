//MUX4x1 module with 4bit inputs and output
module MUX ( input [3:0] A1. A2, A3 , input [1:0]S, input EN, output F);
   //Handling with ternary expretion to select Input
   assign F = S[1] ? 
			  ( S[0] ? A3 : A2 ) :
			  (S[0] ? A1 : A0 );
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
//Third with 11 expected selection A3
// 1 ? ( 0 ? A3 : A2 ) : ( 0 ? A1 : A0 )
// 1 ? ( A3 ) : ( A1 )
// A3
