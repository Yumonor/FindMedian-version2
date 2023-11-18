//--------PDSD homework 1-1 (Carry look-ahead)-------------------------------------------
//--------CLAAdder-----------------------------------------------------------------------

module CLAAdder(A,B,CarryIn,SUM,CarryOut);
	input [3:0] A,B;
	input CarryIn;
	output [3:0] SUM;
	output CarryOut;
	
	wire c0,c1,c2;
	wire [3:0] p,g;
	wire z00,z10,z11,z20,z21,z22,z30,z31,z32,z33;
	
	or (p[0],A[0],B[0]);
	or (p[1],A[1],B[1]);
	or (p[2],A[2],B[2]);
	or (p[3],A[3],B[3]);
	and (g[0],A[0],B[0]);
	and (g[1],A[1],B[1]);
	and (g[2],A[2],B[2]);
	and (g[3],A[3],B[3]);
	
	and (z00,CarryIn,p[0]);
	or (c0,g[0],z00);
	and (z10,p[1],g[0]);
	and (z11,CarryIn,p[1],p[0]);
	or (c1,g[1],z10,z11);
	and (z20,p[2],g[1]);
	and (z21,p[2],p[1],g[0]); 
	and (z22,CarryIn,p[2],p[1],p[0]);
	or (c2,g[2],z20,z21,z22);
	and (z30,p[3],g[2]);
	and (z31,p[3],p[2],g[1]);
	and (z32,p[3],p[2],p[1],g[0]);
	and (z33,CarryIn,p[3],p[2],p[1],p[0]);
	or (CarryOut,g[3],z30,z31,z32,z33);
	
	xor (SUM[0],A[0],B[0],CarryIn);
	xor (SUM[1],A[1],B[1],c0);
	xor (SUM[2],A[2],B[2],c1);
	xor (SUM[3],A[3],B[3],c2);
	
endmodule
