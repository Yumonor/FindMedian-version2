//--------PDSD homework 1-2 (Voting circuit)---------------------------------------------
//--------2-bit carry look-ahead adder---------------------------------------------------

module CLAAdder_2bit(A,B,CarryIn,Sum,CarryOut);
	input [1:0] A,B;
	input CarryIn;
	output [1:0] Sum;
	output CarryOut;
	
	wire c1;
	wire [1:0] p,g;
	
	assign p[0] = A[0] | B[0];
	assign p[1] = A[1] | B[1];
	assign g[0] = A[0] & B[0];
	assign g[1] = A[1] & B[1];
	
	assign c1 = g[0] | (CarryIn & p[0]);
	assign CarryOut = g[1] | (g[0] & p[1]) | (CarryIn & p[0] & p[1]);
	assign Sum[0] = A[0]^B[0]^CarryIn;
	assign Sum[1] = A[1]^B[1]^c1;
	
endmodule