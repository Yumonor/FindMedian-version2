//--------PDSD homework 1-2 (Voting circuit)---------------------------------------------
//--------Main---------------------------------------------------------------------------

`include "HalfAdder.v"
`include "CLAAdder_2bit.v"

module vote(a,b,c,d,e,winner);
	input [2:0] a,b,c,d,e;
	output [2:0] winner;
	
	wire [1:0] s0,s1,s2,t0,t1,t2;
	wire [2:0] count0,count1,count2;
	
	reg [2:0] winner;
	
	HalfAdder HA0(a[0],b[0],s0[0],s0[1]);
	HalfAdder HA1(c[0],d[0],t0[0],t0[1]);
	CLAAdder_2bit CA0(.A(s0),.B(t0),.CarryIn(e[0]),.Sum(count0[1:0]),.CarryOut(count0[2]));
	
	HalfAdder HA3(a[1],b[1],s1[0],s1[1]);
	HalfAdder HA4(c[1],d[1],t1[0],t1[1]);
	CLAAdder_2bit CA1(.A(s1),.B(t1),.CarryIn(e[1]),.Sum(count1[1:0]),.CarryOut(count1[2]));
	
	HalfAdder HA5(a[2],b[2],s2[0],s2[1]);
	HalfAdder HA6(c[2],d[2],t2[0],t2[1]);
	CLAAdder_2bit CA2(.A(s2),.B(t2),.CarryIn(e[2]),.Sum(count2[1:0]),.CarryOut(count2[2]));
	
	always@(*) begin
		if(count0 > count1) begin
			if(count0 > count2) begin			
				winner = 3'b001;				//count0 > count1 & count2
			end
			else begin
				winner = 3'b100;				//count2 >= count0 > count1
			end
		end
		else begin
			if(count1 > count2) begin			
				winner = 3'b010;				//count1 > count0 & count2
			end
			else begin							
				winner = 3'b100;				//count2 > count1 & count0 
			end
		end	
	end
endmodule