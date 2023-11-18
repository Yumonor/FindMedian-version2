//--------PDSD homework 1-2 (Median circuit)---------------------------------------------
//--------Main---------------------------------------------------------------------------

`include "Swap.v"

module MCD(a,b,c,median);
	input [7:0] a,b,c;
	output [7:0] median;
	wire [7:0] a1,b1,c1,b2,a2,b3;
	
	Swap s0(a,b,a1,b1);
	Swap s1(b1,c,b2,c1);
	Swap s2(a1,b2,a2,b3);
	assign median = b3;
	
endmodule 

