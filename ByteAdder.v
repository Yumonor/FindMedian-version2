//--------PDSD homework 1-1 (Carry look-ahead)-------------------------------------------
//--------ByteAdder----------------------------------------------------------------------

`include "CLAAdder.v"

module ByteAdder(A,B,CarryIn,SUM,CarryOut);
	input [7:0] A,B;
	input CarryIn;
	output [7:0] SUM;
	output CarryOut;
	wire c0;
	
	CLAAdder CA0(.A(A[3:0]),.B(B[3:0]),.CarryIn(CarryIn),.SUM(SUM[3:0]),.CarryOut(c0));
	CLAAdder CA1(.A(A[7:4]),.B(B[7:4]),.CarryIn(c0),.SUM(SUM[7:4]),.CarryOut(CarryOut));
	
endmodule