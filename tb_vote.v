//--------PDSD homework 1-2 (Voting circuit)---------------------------------------------
//--------Testbench----------------------------------------------------------------------
`timescale 1ns/10ps
`include "vote_syn.v"
`include "/mnt3/CBDK_IC_Contest_v2.1/Verilog/tsmc13.v"
//`include "vote.v"

module tb_vote;
	reg [2:0] a,b,c,d,e;
	wire [2:0] winner;
	
	vote uut(.a(a),.b(b),.c(c),.d(d),.e(e),.winner(winner));
	initial begin
		a = 3'b100; b = 3'b100; c = 3'b001; d = 3'b100; e = 3'b010;
		#5 a = 3'b010; b = 3'b010; c = 3'b100; d = 3'b100; e = 3'b010;
		#5 a = 3'b100; b = 3'b001; c = 3'b001; d = 3'b001; e = 3'b001;
		#5 a = 3'b010; b = 3'b001; c = 3'b100; d = 3'b100; e = 3'b010;
		#5 a = 3'b001; b = 3'b001; c = 3'b100; d = 3'b100; e = 3'b010;
		#5 a = 3'b010; b = 3'b100; c = 3'b001; d = 3'b010; e = 3'b001;
		#5 a = 3'b100; b = 3'b100; c = 3'b100; d = 3'b100; e = 3'b100;
		#5 a = 3'b010; b = 3'b010; c = 3'b010; d = 3'b010; e = 3'b010;
		#5 a = 3'b001; b = 3'b001; c = 3'b001; d = 3'b001; e = 3'b001;
		#5 $finish;
	end
	
	initial
	$monitor($time,"a=%b b=%b c=%b d=%b e=%b winner=%b\n",a,b,c,d,e,winner);

	initial
	$sdf_annotate("vote.sdf",uut);

	initial begin
		$dumpfile("vote_syn.vcd");
		$dumpvars;
	end
endmodule
