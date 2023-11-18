//--------PDSD homework 1-2 (Voting circuit)---------------------------------------------
//--------1-bit half adder---------------------------------------------------------------

module HalfAdder(x,y,s,c);
	input x,y;
	output s,c;
	
	xor (s,x,y);
	and (c,x,y);
endmodule
