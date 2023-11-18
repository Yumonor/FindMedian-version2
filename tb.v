//-----------PDSD homework 1-1--------------------------------------------------------------
//-----------testbench------------------
`timescale 1ns/10ps
`include "addsub8_syn.v"
`include "/mnt3/CBDK_IC_Contest_v2.1/Verilog/tsmc13.v"
//`include "addsub8.v"

module tb;
	//input
	reg [7:0] A,B;
	reg Add_ctrl;
	//output
	wire [7:0] SUM;
	wire C_out;
	//Call function
	addsub8 uut(.A(A),.B(B),.Add_ctrl(Add_ctrl),.SUM(SUM),.C_out(C_out));
	//Apply stimulus
	initial begin
		A = 8'd0; B = 8'd0; Add_ctrl = 1'b0;
		#5 A = 8'b11001100; B = 8'b10101010; 
		#5 A = 8'b10011001; B = 8'b01010101; 
		#5 A = 8'b00110011; B = 8'b10101010; 
		#5 A = 8'b01100110; B = 8'b01010101; 
		#5 A = 8'b11111111; B = 8'b11111111; 
		#5 A = 8'b11001100; B = 8'b10101010; Add_ctrl = 1'b1;
		#5 A = 8'b10011001; B = 8'b01010101; 
		#5 A = 8'b00110011; B = 8'b10101010; 
		#5 A = 8'b01100110; B = 8'b01010101; 
		#5 A = 8'b11111111; B = 8'b11111111;
		#5 $finish;
	end
	
	initial
	$monitor($time,"A=%b B=%b SUM=%b C_out=%b\n",A,B,SUM,C_out);
	
	initial
	$sdf_annotate("addsub8.sdf",uut);
	
	initial begin
		$dumpfile("addsub8_syn.vcd");
		$dumpvars;
	end
endmodule