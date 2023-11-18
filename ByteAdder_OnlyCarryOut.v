//--------PDSD homework 1-2 (Median circuit)---------------------------------------------
//--------ByteAdder_OnlyCarryOut---------------------------------------------------------

`include "CLAAdder_OnlyCarryOut.v"

module ByteAdder_OnlyCarryOut(A,B,CarryOut);
	input [7:0] A,B;
	output CarryOut;
	wire c0;
	
	CLAAdder_OnlyCarryOut CO0(.A(A[3:0]),.B(B[3:0]),.CarryIn(1'b1),.CarryOut(c0));
	CLAAdder_OnlyCarryOut CO1(.A(A[7:4]),.B(B[7:4]),.CarryIn(c0),.CarryOut(CarryOut));
	
endmodule