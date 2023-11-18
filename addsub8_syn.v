/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun May 10 23:12:22 2020
/////////////////////////////////////////////////////////////
`timescale 1ns/10ps

module CLAAdder_0 ( A, B, CarryIn, SUM, CarryOut );
  input [3:0] A;
  input [3:0] B;
  output [3:0] SUM;
  input CarryIn;
  output CarryOut;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  OR2X1 U1 ( .A(A[2]), .B(n5), .Y(n1) );
  XNOR2X1 U2 ( .A(n2), .B(n3), .Y(SUM[3]) );
  XNOR2X1 U3 ( .A(A[3]), .B(B[3]), .Y(n2) );
  XNOR2X1 U4 ( .A(n4), .B(n5), .Y(SUM[2]) );
  XNOR2X1 U5 ( .A(A[2]), .B(B[2]), .Y(n4) );
  XNOR2X1 U6 ( .A(n6), .B(n7), .Y(SUM[1]) );
  XNOR2X1 U7 ( .A(A[1]), .B(B[1]), .Y(n6) );
  XOR2X1 U8 ( .A(A[0]), .B(n8), .Y(SUM[0]) );
  XOR2X1 U9 ( .A(CarryIn), .B(B[0]), .Y(n8) );
  OAI2BB1X1 U10 ( .A0N(n3), .A1N(A[3]), .B0(n9), .Y(CarryOut) );
  OAI21XL U11 ( .A0(A[3]), .A1(n3), .B0(B[3]), .Y(n9) );
  AO22X1 U12 ( .A0(n1), .A1(B[2]), .B0(n5), .B1(A[2]), .Y(n3) );
  OAI2BB1X1 U13 ( .A0N(n7), .A1N(A[1]), .B0(n10), .Y(n5) );
  OAI21XL U14 ( .A0(A[1]), .A1(n7), .B0(B[1]), .Y(n10) );
  OAI2BB1X1 U15 ( .A0N(A[0]), .A1N(B[0]), .B0(n11), .Y(n7) );
  OAI21XL U16 ( .A0(A[0]), .A1(B[0]), .B0(CarryIn), .Y(n11) );
endmodule


module CLAAdder_1 ( A, B, CarryIn, SUM, CarryOut );
  input [3:0] A;
  input [3:0] B;
  output [3:0] SUM;
  input CarryIn;
  output CarryOut;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  OR2X1 U1 ( .A(A[2]), .B(n5), .Y(n1) );
  XNOR2X1 U2 ( .A(n2), .B(n3), .Y(SUM[3]) );
  XNOR2X1 U3 ( .A(A[3]), .B(B[3]), .Y(n2) );
  XNOR2X1 U4 ( .A(n4), .B(n5), .Y(SUM[2]) );
  XNOR2X1 U5 ( .A(A[2]), .B(B[2]), .Y(n4) );
  XNOR2X1 U6 ( .A(n6), .B(n7), .Y(SUM[1]) );
  XNOR2X1 U7 ( .A(A[1]), .B(B[1]), .Y(n6) );
  XOR2X1 U8 ( .A(A[0]), .B(n8), .Y(SUM[0]) );
  XOR2X1 U9 ( .A(CarryIn), .B(B[0]), .Y(n8) );
  OAI2BB1X1 U10 ( .A0N(n3), .A1N(A[3]), .B0(n9), .Y(CarryOut) );
  OAI21XL U11 ( .A0(A[3]), .A1(n3), .B0(B[3]), .Y(n9) );
  AO22X1 U12 ( .A0(n1), .A1(B[2]), .B0(n5), .B1(A[2]), .Y(n3) );
  OAI2BB1X1 U13 ( .A0N(n7), .A1N(A[1]), .B0(n10), .Y(n5) );
  OAI21XL U14 ( .A0(A[1]), .A1(n7), .B0(B[1]), .Y(n10) );
  OAI2BB1X1 U15 ( .A0N(A[0]), .A1N(B[0]), .B0(n11), .Y(n7) );
  OAI21XL U16 ( .A0(A[0]), .A1(B[0]), .B0(CarryIn), .Y(n11) );
endmodule


module ByteAdder ( A, B, CarryIn, SUM, CarryOut );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CarryIn;
  output CarryOut;
  wire   c0;

  CLAAdder_0 CA0 ( .A(A[3:0]), .B(B[3:0]), .CarryIn(CarryIn), .SUM(SUM[3:0]), 
        .CarryOut(c0) );
  CLAAdder_1 CA1 ( .A(A[7:4]), .B(B[7:4]), .CarryIn(c0), .SUM(SUM[7:4]), 
        .CarryOut(CarryOut) );
endmodule


module addsub8 ( A, B, Add_ctrl, SUM, C_out );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input Add_ctrl;
  output C_out;

  wire   [7:0] _B;

  ByteAdder BA0 ( .A(A), .B(_B), .CarryIn(Add_ctrl), .SUM(SUM), .CarryOut(
        C_out) );
  XOR2X1 U9 ( .A(B[7]), .B(Add_ctrl), .Y(_B[7]) );
  XOR2X1 U10 ( .A(B[6]), .B(Add_ctrl), .Y(_B[6]) );
  XOR2X1 U11 ( .A(B[5]), .B(Add_ctrl), .Y(_B[5]) );
  XOR2X1 U12 ( .A(B[4]), .B(Add_ctrl), .Y(_B[4]) );
  XOR2X1 U13 ( .A(B[3]), .B(Add_ctrl), .Y(_B[3]) );
  XOR2X1 U14 ( .A(B[2]), .B(Add_ctrl), .Y(_B[2]) );
  XOR2X1 U15 ( .A(B[1]), .B(Add_ctrl), .Y(_B[1]) );
  XOR2X1 U16 ( .A(B[0]), .B(Add_ctrl), .Y(_B[0]) );
endmodule

