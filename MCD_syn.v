/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Mon May 11 00:29:42 2020
/////////////////////////////////////////////////////////////


module CLAAdder_OnlyCarryOut_0 ( A, B, CarryIn, CarryOut );
  input [3:0] A;
  input [3:0] B;
  input CarryIn;
  output CarryOut;
  wire   n1, n2, n3, n4, n5, n6;

  OAI2BB1X1 U1 ( .A0N(A[3]), .A1N(B[3]), .B0(n1), .Y(CarryOut) );
  OAI221XL U2 ( .A0(B[2]), .A1(A[2]), .B0(B[3]), .B1(A[3]), .C0(n2), .Y(n1) );
  CLKINVX1 U3 ( .A(n3), .Y(n2) );
  AOI221XL U4 ( .A0(A[2]), .A1(B[2]), .B0(A[1]), .B1(B[1]), .C0(n4), .Y(n3) );
  CLKINVX1 U5 ( .A(n5), .Y(n4) );
  OAI222XL U6 ( .A0(B[0]), .A1(A[0]), .B0(CarryIn), .B1(n6), .C0(B[1]), .C1(
        A[1]), .Y(n5) );
  AND2X1 U7 ( .A(A[0]), .B(B[0]), .Y(n6) );
endmodule


module CLAAdder_OnlyCarryOut_5 ( A, B, CarryIn, CarryOut );
  input [3:0] A;
  input [3:0] B;
  input CarryIn;
  output CarryOut;
  wire   n1, n2, n3, n4, n5, n6;

  OAI2BB1X1 U1 ( .A0N(A[3]), .A1N(B[3]), .B0(n1), .Y(CarryOut) );
  OAI221XL U2 ( .A0(B[2]), .A1(A[2]), .B0(B[3]), .B1(A[3]), .C0(n2), .Y(n1) );
  CLKINVX1 U3 ( .A(n3), .Y(n2) );
  AOI221XL U4 ( .A0(A[2]), .A1(B[2]), .B0(A[1]), .B1(B[1]), .C0(n4), .Y(n3) );
  CLKINVX1 U5 ( .A(n5), .Y(n4) );
  OAI222XL U6 ( .A0(B[0]), .A1(A[0]), .B0(CarryIn), .B1(n6), .C0(B[1]), .C1(
        A[1]), .Y(n5) );
  AND2X1 U7 ( .A(A[0]), .B(B[0]), .Y(n6) );
endmodule


module ByteAdder_OnlyCarryOut_0 ( A, B, CarryOut );
  input [7:0] A;
  input [7:0] B;
  output CarryOut;
  wire   c0;

  CLAAdder_OnlyCarryOut_0 CO0 ( .A(A[3:0]), .B(B[3:0]), .CarryIn(1'b1), 
        .CarryOut(c0) );
  CLAAdder_OnlyCarryOut_5 CO1 ( .A(A[7:4]), .B(B[7:4]), .CarryIn(c0), 
        .CarryOut(CarryOut) );
endmodule


module Swap_0 ( A, B, A_, B_ );
  input [7:0] A;
  input [7:0] B;
  output [7:0] A_;
  output [7:0] B_;
  wire   C_out, n10, n11, n12, n13, n14, n15, n16, n17, n1, n2, n3, n4, n5, n6,
         n7, n8;

  ByteAdder_OnlyCarryOut_0 AO0 ( .A(A), .B({n10, n11, n12, n13, n14, n15, n16, 
        n17}), .CarryOut(C_out) );
  MXI2X1 U1 ( .A(n1), .B(n10), .S0(C_out), .Y(B_[7]) );
  MXI2X1 U2 ( .A(n2), .B(n11), .S0(C_out), .Y(B_[6]) );
  MXI2X1 U3 ( .A(n3), .B(n12), .S0(C_out), .Y(B_[5]) );
  MXI2X1 U4 ( .A(n4), .B(n13), .S0(C_out), .Y(B_[4]) );
  MXI2X1 U5 ( .A(n5), .B(n14), .S0(C_out), .Y(B_[3]) );
  MXI2X1 U6 ( .A(n6), .B(n15), .S0(C_out), .Y(B_[2]) );
  MXI2X1 U7 ( .A(n7), .B(n16), .S0(C_out), .Y(B_[1]) );
  MXI2X1 U8 ( .A(n8), .B(n17), .S0(C_out), .Y(B_[0]) );
  MXI2X1 U9 ( .A(n10), .B(n1), .S0(C_out), .Y(A_[7]) );
  CLKINVX1 U10 ( .A(A[7]), .Y(n1) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n10) );
  MXI2X1 U12 ( .A(n11), .B(n2), .S0(C_out), .Y(A_[6]) );
  CLKINVX1 U13 ( .A(A[6]), .Y(n2) );
  CLKINVX1 U14 ( .A(B[6]), .Y(n11) );
  MXI2X1 U15 ( .A(n12), .B(n3), .S0(C_out), .Y(A_[5]) );
  CLKINVX1 U16 ( .A(A[5]), .Y(n3) );
  CLKINVX1 U17 ( .A(B[5]), .Y(n12) );
  MXI2X1 U18 ( .A(n13), .B(n4), .S0(C_out), .Y(A_[4]) );
  CLKINVX1 U19 ( .A(A[4]), .Y(n4) );
  CLKINVX1 U20 ( .A(B[4]), .Y(n13) );
  MXI2X1 U21 ( .A(n14), .B(n5), .S0(C_out), .Y(A_[3]) );
  CLKINVX1 U22 ( .A(A[3]), .Y(n5) );
  CLKINVX1 U23 ( .A(B[3]), .Y(n14) );
  MXI2X1 U24 ( .A(n15), .B(n6), .S0(C_out), .Y(A_[2]) );
  CLKINVX1 U25 ( .A(A[2]), .Y(n6) );
  CLKINVX1 U26 ( .A(B[2]), .Y(n15) );
  MXI2X1 U27 ( .A(n16), .B(n7), .S0(C_out), .Y(A_[1]) );
  CLKINVX1 U28 ( .A(A[1]), .Y(n7) );
  CLKINVX1 U29 ( .A(B[1]), .Y(n16) );
  MXI2X1 U30 ( .A(n17), .B(n8), .S0(C_out), .Y(A_[0]) );
  CLKINVX1 U31 ( .A(A[0]), .Y(n8) );
  CLKINVX1 U32 ( .A(B[0]), .Y(n17) );
endmodule


module CLAAdder_OnlyCarryOut_1 ( A, B, CarryIn, CarryOut );
  input [3:0] A;
  input [3:0] B;
  input CarryIn;
  output CarryOut;
  wire   n1, n2, n3, n4, n5, n6;

  OAI2BB1X1 U1 ( .A0N(A[3]), .A1N(B[3]), .B0(n1), .Y(CarryOut) );
  OAI221XL U2 ( .A0(B[2]), .A1(A[2]), .B0(B[3]), .B1(A[3]), .C0(n2), .Y(n1) );
  CLKINVX1 U3 ( .A(n3), .Y(n2) );
  AOI221XL U4 ( .A0(A[2]), .A1(B[2]), .B0(A[1]), .B1(B[1]), .C0(n4), .Y(n3) );
  CLKINVX1 U5 ( .A(n5), .Y(n4) );
  OAI222XL U6 ( .A0(B[0]), .A1(A[0]), .B0(CarryIn), .B1(n6), .C0(B[1]), .C1(
        A[1]), .Y(n5) );
  AND2X1 U7 ( .A(A[0]), .B(B[0]), .Y(n6) );
endmodule


module CLAAdder_OnlyCarryOut_2 ( A, B, CarryIn, CarryOut );
  input [3:0] A;
  input [3:0] B;
  input CarryIn;
  output CarryOut;
  wire   n1, n2, n3, n4, n5, n6;

  OAI2BB1X1 U1 ( .A0N(A[3]), .A1N(B[3]), .B0(n1), .Y(CarryOut) );
  OAI221XL U2 ( .A0(B[2]), .A1(A[2]), .B0(B[3]), .B1(A[3]), .C0(n2), .Y(n1) );
  CLKINVX1 U3 ( .A(n3), .Y(n2) );
  AOI221XL U4 ( .A0(A[2]), .A1(B[2]), .B0(A[1]), .B1(B[1]), .C0(n4), .Y(n3) );
  CLKINVX1 U5 ( .A(n5), .Y(n4) );
  OAI222XL U6 ( .A0(B[0]), .A1(A[0]), .B0(CarryIn), .B1(n6), .C0(B[1]), .C1(
        A[1]), .Y(n5) );
  AND2X1 U7 ( .A(A[0]), .B(B[0]), .Y(n6) );
endmodule


module ByteAdder_OnlyCarryOut_1 ( A, B, CarryOut );
  input [7:0] A;
  input [7:0] B;
  output CarryOut;
  wire   c0;

  CLAAdder_OnlyCarryOut_2 CO0 ( .A(A[3:0]), .B(B[3:0]), .CarryIn(1'b1), 
        .CarryOut(c0) );
  CLAAdder_OnlyCarryOut_1 CO1 ( .A(A[7:4]), .B(B[7:4]), .CarryIn(c0), 
        .CarryOut(CarryOut) );
endmodule


module Swap_1 ( A, B, A_, B_ );
  input [7:0] A;
  input [7:0] B;
  output [7:0] A_;
  output [7:0] B_;
  wire   C_out, n1, n2, n3, n4, n5, n6, n7, n8, n9, n17, n18, n19, n20, n21,
         n22, n23;

  ByteAdder_OnlyCarryOut_1 AO0 ( .A(A), .B({n23, n22, n21, n20, n19, n18, n17, 
        n9}), .CarryOut(C_out) );
  MXI2X1 U1 ( .A(n1), .B(n23), .S0(C_out), .Y(B_[7]) );
  MXI2X1 U2 ( .A(n2), .B(n22), .S0(C_out), .Y(B_[6]) );
  MXI2X1 U3 ( .A(n3), .B(n21), .S0(C_out), .Y(B_[5]) );
  MXI2X1 U4 ( .A(n4), .B(n20), .S0(C_out), .Y(B_[4]) );
  MXI2X1 U5 ( .A(n5), .B(n19), .S0(C_out), .Y(B_[3]) );
  MXI2X1 U6 ( .A(n6), .B(n18), .S0(C_out), .Y(B_[2]) );
  MXI2X1 U7 ( .A(n7), .B(n17), .S0(C_out), .Y(B_[1]) );
  MXI2X1 U8 ( .A(n8), .B(n9), .S0(C_out), .Y(B_[0]) );
  MXI2X1 U9 ( .A(n23), .B(n1), .S0(C_out), .Y(A_[7]) );
  CLKINVX1 U10 ( .A(A[7]), .Y(n1) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n23) );
  MXI2X1 U12 ( .A(n22), .B(n2), .S0(C_out), .Y(A_[6]) );
  CLKINVX1 U13 ( .A(A[6]), .Y(n2) );
  CLKINVX1 U14 ( .A(B[6]), .Y(n22) );
  MXI2X1 U15 ( .A(n21), .B(n3), .S0(C_out), .Y(A_[5]) );
  CLKINVX1 U16 ( .A(A[5]), .Y(n3) );
  CLKINVX1 U17 ( .A(B[5]), .Y(n21) );
  MXI2X1 U18 ( .A(n20), .B(n4), .S0(C_out), .Y(A_[4]) );
  CLKINVX1 U19 ( .A(A[4]), .Y(n4) );
  CLKINVX1 U20 ( .A(B[4]), .Y(n20) );
  MXI2X1 U21 ( .A(n19), .B(n5), .S0(C_out), .Y(A_[3]) );
  CLKINVX1 U22 ( .A(A[3]), .Y(n5) );
  CLKINVX1 U23 ( .A(B[3]), .Y(n19) );
  MXI2X1 U24 ( .A(n18), .B(n6), .S0(C_out), .Y(A_[2]) );
  CLKINVX1 U25 ( .A(A[2]), .Y(n6) );
  CLKINVX1 U26 ( .A(B[2]), .Y(n18) );
  MXI2X1 U27 ( .A(n17), .B(n7), .S0(C_out), .Y(A_[1]) );
  CLKINVX1 U28 ( .A(A[1]), .Y(n7) );
  CLKINVX1 U29 ( .A(B[1]), .Y(n17) );
  MXI2X1 U30 ( .A(n9), .B(n8), .S0(C_out), .Y(A_[0]) );
  CLKINVX1 U31 ( .A(A[0]), .Y(n8) );
  CLKINVX1 U32 ( .A(B[0]), .Y(n9) );
endmodule


module CLAAdder_OnlyCarryOut_3 ( A, B, CarryIn, CarryOut );
  input [3:0] A;
  input [3:0] B;
  input CarryIn;
  output CarryOut;
  wire   n1, n2, n3, n4, n5, n6;

  OAI2BB1X1 U1 ( .A0N(A[3]), .A1N(B[3]), .B0(n1), .Y(CarryOut) );
  OAI221XL U2 ( .A0(B[2]), .A1(A[2]), .B0(B[3]), .B1(A[3]), .C0(n2), .Y(n1) );
  CLKINVX1 U3 ( .A(n3), .Y(n2) );
  AOI221XL U4 ( .A0(A[2]), .A1(B[2]), .B0(A[1]), .B1(B[1]), .C0(n4), .Y(n3) );
  CLKINVX1 U5 ( .A(n5), .Y(n4) );
  OAI222XL U6 ( .A0(B[0]), .A1(A[0]), .B0(CarryIn), .B1(n6), .C0(B[1]), .C1(
        A[1]), .Y(n5) );
  AND2X1 U7 ( .A(A[0]), .B(B[0]), .Y(n6) );
endmodule


module CLAAdder_OnlyCarryOut_4 ( A, B, CarryIn, CarryOut );
  input [3:0] A;
  input [3:0] B;
  input CarryIn;
  output CarryOut;
  wire   n1, n2, n3, n4, n5, n6;

  OAI2BB1X1 U1 ( .A0N(A[3]), .A1N(B[3]), .B0(n1), .Y(CarryOut) );
  OAI221XL U2 ( .A0(B[2]), .A1(A[2]), .B0(B[3]), .B1(A[3]), .C0(n2), .Y(n1) );
  CLKINVX1 U3 ( .A(n3), .Y(n2) );
  AOI221XL U4 ( .A0(A[2]), .A1(B[2]), .B0(A[1]), .B1(B[1]), .C0(n4), .Y(n3) );
  CLKINVX1 U5 ( .A(n5), .Y(n4) );
  OAI222XL U6 ( .A0(B[0]), .A1(A[0]), .B0(CarryIn), .B1(n6), .C0(B[1]), .C1(
        A[1]), .Y(n5) );
  AND2X1 U7 ( .A(A[0]), .B(B[0]), .Y(n6) );
endmodule


module ByteAdder_OnlyCarryOut_2 ( A, B, CarryOut );
  input [7:0] A;
  input [7:0] B;
  output CarryOut;
  wire   c0;

  CLAAdder_OnlyCarryOut_4 CO0 ( .A(A[3:0]), .B(B[3:0]), .CarryIn(1'b1), 
        .CarryOut(c0) );
  CLAAdder_OnlyCarryOut_3 CO1 ( .A(A[7:4]), .B(B[7:4]), .CarryIn(c0), 
        .CarryOut(CarryOut) );
endmodule


module Swap_2 ( A, B, A_, B_ );
  input [7:0] A;
  input [7:0] B;
  output [7:0] A_;
  output [7:0] B_;
  wire   C_out, n1, n2, n3, n4, n5, n6, n7, n8, n9, n17, n18, n19, n20, n21,
         n22, n23;

  ByteAdder_OnlyCarryOut_2 AO0 ( .A(A), .B({n23, n22, n21, n20, n19, n18, n17, 
        n9}), .CarryOut(C_out) );
  MXI2X1 U1 ( .A(n1), .B(n23), .S0(C_out), .Y(B_[7]) );
  MXI2X1 U2 ( .A(n2), .B(n22), .S0(C_out), .Y(B_[6]) );
  MXI2X1 U3 ( .A(n3), .B(n21), .S0(C_out), .Y(B_[5]) );
  MXI2X1 U4 ( .A(n4), .B(n20), .S0(C_out), .Y(B_[4]) );
  MXI2X1 U5 ( .A(n5), .B(n19), .S0(C_out), .Y(B_[3]) );
  MXI2X1 U6 ( .A(n6), .B(n18), .S0(C_out), .Y(B_[2]) );
  MXI2X1 U7 ( .A(n7), .B(n17), .S0(C_out), .Y(B_[1]) );
  MXI2X1 U8 ( .A(n8), .B(n9), .S0(C_out), .Y(B_[0]) );
  MXI2X1 U9 ( .A(n23), .B(n1), .S0(C_out), .Y(A_[7]) );
  CLKINVX1 U10 ( .A(A[7]), .Y(n1) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n23) );
  MXI2X1 U12 ( .A(n22), .B(n2), .S0(C_out), .Y(A_[6]) );
  CLKINVX1 U13 ( .A(A[6]), .Y(n2) );
  CLKINVX1 U14 ( .A(B[6]), .Y(n22) );
  MXI2X1 U15 ( .A(n21), .B(n3), .S0(C_out), .Y(A_[5]) );
  CLKINVX1 U16 ( .A(A[5]), .Y(n3) );
  CLKINVX1 U17 ( .A(B[5]), .Y(n21) );
  MXI2X1 U18 ( .A(n20), .B(n4), .S0(C_out), .Y(A_[4]) );
  CLKINVX1 U19 ( .A(A[4]), .Y(n4) );
  CLKINVX1 U20 ( .A(B[4]), .Y(n20) );
  MXI2X1 U21 ( .A(n19), .B(n5), .S0(C_out), .Y(A_[3]) );
  CLKINVX1 U22 ( .A(A[3]), .Y(n5) );
  CLKINVX1 U23 ( .A(B[3]), .Y(n19) );
  MXI2X1 U24 ( .A(n18), .B(n6), .S0(C_out), .Y(A_[2]) );
  CLKINVX1 U25 ( .A(A[2]), .Y(n6) );
  CLKINVX1 U26 ( .A(B[2]), .Y(n18) );
  MXI2X1 U27 ( .A(n17), .B(n7), .S0(C_out), .Y(A_[1]) );
  CLKINVX1 U28 ( .A(A[1]), .Y(n7) );
  CLKINVX1 U29 ( .A(B[1]), .Y(n17) );
  MXI2X1 U30 ( .A(n9), .B(n8), .S0(C_out), .Y(A_[0]) );
  CLKINVX1 U31 ( .A(A[0]), .Y(n8) );
  CLKINVX1 U32 ( .A(B[0]), .Y(n9) );
endmodule


module MCD ( a, b, c, median );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  output [7:0] median;

  wire   [7:0] a1;
  wire   [7:0] b1;
  wire   [7:0] b2;

  Swap_0 s0 ( .A(a), .B(b), .A_(a1), .B_(b1) );
  Swap_2 s1 ( .A(b1), .B(c), .A_(b2) );
  Swap_1 s2 ( .A(a1), .B(b2), .B_(median) );
endmodule

