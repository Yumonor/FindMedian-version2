//--------PDSD homework 1-1 (Carry look-ahead)-------------------------------------------
//--------AdderSubtractor----------------------------------------------------------------

`include "ByteAdder.v"

module addsub8(A,B,Add_ctrl,SUM,C_out);
	input [7:0] A,B;
	input Add_ctrl;
	output [7:0] SUM;
	output C_out;
	
	wire [7:0] _B;
	
	xor (_B[0],B[0],Add_ctrl);
	xor (_B[1],B[1],Add_ctrl);
	xor (_B[2],B[2],Add_ctrl);
	xor (_B[3],B[3],Add_ctrl);
	xor (_B[4],B[4],Add_ctrl);
	xor (_B[5],B[5],Add_ctrl);
	xor (_B[6],B[6],Add_ctrl);
	xor (_B[7],B[7],Add_ctrl);
	
	ByteAdder BA0(.A(A),.B(_B),.CarryIn(Add_ctrl),.SUM(SUM),.CarryOut(C_out));
    
endmodule