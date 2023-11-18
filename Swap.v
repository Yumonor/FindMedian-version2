//--------PDSD homework 1-2 (Median circuit)---------------------------------------------
//--------Swap---------------------------------------------------------------------------

`include "ByteAdder_OnlyCarryOut.v"

module Swap(A,B,A_,B_);
	input [7:0] A,B;
	output [7:0] A_,B_;
	
	wire C_out;
	
	ByteAdder_OnlyCarryOut AO0(A,~B,C_out);
	assign A_ = (C_out) ? A : B ;
	assign B_ = (C_out) ? B : A ;
endmodule