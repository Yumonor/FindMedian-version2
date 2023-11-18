//--------PDSD homework 1-2 (Median circuit)---------------------------------------------
//--------CLAAdder_OnlyCarryOut----------------------------------------------------------

module CLAAdder_OnlyCarryOut(A,B,CarryIn,CarryOut);
	input [3:0] A,B;
	input CarryIn;
	output CarryOut;

	wire [3:0] p,g;
	
	assign p[0] = A[0]|B[0];
	assign p[1] = A[1]|B[1];
	assign p[2] = A[2]|B[2];
	assign p[3] = A[3]|B[3];
	
	assign g[0] = A[0]&B[0];
	assign g[1] = A[1]&B[1];
	assign g[2] = A[2]&B[2];
	assign g[3] = A[3]&B[3];
	
	assign CarryOut = g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(CarryIn&p[3]&p[2]&p[1]&p[0]);

endmodule
