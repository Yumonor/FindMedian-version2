/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun May 10 23:42:38 2020
/////////////////////////////////////////////////////////////
`timescale 1ns/10ps

module HalfAdder_0 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module CLAAdder_2bit_0 ( A, B, CarryIn, Sum, CarryOut );
  input [1:0] A;
  input [1:0] B;
  output [1:0] Sum;
  input CarryIn;
  output CarryOut;
  wire   n4, n5, n6;

  XOR2X1 U1 ( .A(n4), .B(n5), .Y(Sum[1]) );
  XOR2X1 U2 ( .A(CarryIn), .B(n6), .Y(Sum[0]) );
  OAI2BB2XL U3 ( .B0(n5), .B1(n4), .A0N(B[1]), .A1N(A[1]), .Y(CarryOut) );
  XNOR2X1 U4 ( .A(A[1]), .B(B[1]), .Y(n4) );
  AOI22X1 U5 ( .A0(n6), .A1(CarryIn), .B0(A[0]), .B1(B[0]), .Y(n5) );
  XOR2X1 U6 ( .A(A[0]), .B(B[0]), .Y(n6) );
endmodule


module HalfAdder_1 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module HalfAdder_2 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module HalfAdder_3 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module HalfAdder_4 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module HalfAdder_5 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module CLAAdder_2bit_1 ( A, B, CarryIn, Sum, CarryOut );
  input [1:0] A;
  input [1:0] B;
  output [1:0] Sum;
  input CarryIn;
  output CarryOut;
  wire   n4, n5, n6;

  XOR2X1 U1 ( .A(n4), .B(n5), .Y(Sum[1]) );
  XOR2X1 U2 ( .A(CarryIn), .B(n6), .Y(Sum[0]) );
  OAI2BB2XL U3 ( .B0(n5), .B1(n4), .A0N(B[1]), .A1N(A[1]), .Y(CarryOut) );
  XNOR2X1 U4 ( .A(A[1]), .B(B[1]), .Y(n4) );
  AOI22X1 U5 ( .A0(n6), .A1(CarryIn), .B0(A[0]), .B1(B[0]), .Y(n5) );
  XOR2X1 U6 ( .A(A[0]), .B(B[0]), .Y(n6) );
endmodule


module CLAAdder_2bit_2 ( A, B, CarryIn, Sum, CarryOut );
  input [1:0] A;
  input [1:0] B;
  output [1:0] Sum;
  input CarryIn;
  output CarryOut;
  wire   n4, n5, n6;

  XOR2X1 U1 ( .A(n4), .B(n5), .Y(Sum[1]) );
  XOR2X1 U2 ( .A(CarryIn), .B(n6), .Y(Sum[0]) );
  OAI2BB2XL U3 ( .B0(n5), .B1(n4), .A0N(B[1]), .A1N(A[1]), .Y(CarryOut) );
  XNOR2X1 U4 ( .A(A[1]), .B(B[1]), .Y(n4) );
  AOI22X1 U5 ( .A0(n6), .A1(CarryIn), .B0(A[0]), .B1(B[0]), .Y(n5) );
  XOR2X1 U6 ( .A(A[0]), .B(B[0]), .Y(n6) );
endmodule


module vote ( a, b, c, d, e, winner );
  input [2:0] a;
  input [2:0] b;
  input [2:0] c;
  input [2:0] d;
  input [2:0] e;
  output [2:0] winner;
  wire   n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83;
  wire   [1:0] s0;
  wire   [1:0] t0;
  wire   [2:0] count0;
  wire   [1:0] s1;
  wire   [1:0] t1;
  wire   [2:0] count1;
  wire   [1:0] s2;
  wire   [1:0] t2;
  wire   [2:0] count2;

  HalfAdder_0 HA0 ( .x(a[0]), .y(b[0]), .s(s0[0]), .c(s0[1]) );
  HalfAdder_5 HA1 ( .x(c[0]), .y(d[0]), .s(t0[0]), .c(t0[1]) );
  CLAAdder_2bit_0 CA0 ( .A(s0), .B(t0), .CarryIn(e[0]), .Sum(count0[1:0]), 
        .CarryOut(count0[2]) );
  HalfAdder_4 HA3 ( .x(a[1]), .y(b[1]), .s(s1[0]), .c(s1[1]) );
  HalfAdder_3 HA4 ( .x(c[1]), .y(d[1]), .s(t1[0]), .c(t1[1]) );
  CLAAdder_2bit_2 CA1 ( .A(s1), .B(t1), .CarryIn(e[1]), .Sum(count1[1:0]), 
        .CarryOut(count1[2]) );
  HalfAdder_2 HA5 ( .x(a[2]), .y(b[2]), .s(s2[0]), .c(s2[1]) );
  HalfAdder_1 HA6 ( .x(c[2]), .y(d[2]), .s(t2[0]), .c(t2[1]) );
  CLAAdder_2bit_1 CA2 ( .A(s2), .B(t2), .CarryIn(e[2]), .Sum(count2[1:0]), 
        .CarryOut(count2[2]) );
  MXI2X1 U47 ( .A(n66), .B(n67), .S0(n68), .Y(winner[2]) );
  NAND2X1 U48 ( .A(n69), .B(n70), .Y(n67) );
  NAND2X1 U49 ( .A(n71), .B(n72), .Y(n66) );
  AOI21X1 U50 ( .A0(n70), .A1(n69), .B0(n73), .Y(winner[1]) );
  NAND2X1 U51 ( .A(count1[2]), .B(n74), .Y(n69) );
  OAI221XL U52 ( .A0(count1[1]), .A1(n75), .B0(count1[2]), .B1(n74), .C0(n76), 
        .Y(n70) );
  OAI2BB1X1 U53 ( .A0N(count1[1]), .A1N(n75), .B0(count2[1]), .Y(n76) );
  NOR2BX1 U54 ( .AN(count1[0]), .B(count2[0]), .Y(n75) );
  AOI21X1 U55 ( .A0(n72), .A1(n71), .B0(n68), .Y(winner[0]) );
  CLKINVX1 U56 ( .A(n73), .Y(n68) );
  OAI2BB1X1 U57 ( .A0N(n77), .A1N(count0[2]), .B0(n78), .Y(n73) );
  OAI221XL U58 ( .A0(count0[1]), .A1(n79), .B0(count0[2]), .B1(n77), .C0(n80), 
        .Y(n78) );
  OAI2BB2XL U59 ( .B0(count1[0]), .B1(n81), .A0N(n79), .A1N(count0[1]), .Y(n80) );
  CLKINVX1 U60 ( .A(count1[1]), .Y(n79) );
  CLKINVX1 U61 ( .A(count1[2]), .Y(n77) );
  NAND2X1 U62 ( .A(count0[2]), .B(n74), .Y(n71) );
  OAI221XL U63 ( .A0(count0[1]), .A1(n82), .B0(count0[2]), .B1(n74), .C0(n83), 
        .Y(n72) );
  OAI2BB1X1 U64 ( .A0N(count0[1]), .A1N(n82), .B0(count2[1]), .Y(n83) );
  CLKINVX1 U65 ( .A(count2[2]), .Y(n74) );
  NOR2X1 U66 ( .A(n81), .B(count2[0]), .Y(n82) );
  CLKINVX1 U67 ( .A(count0[0]), .Y(n81) );
endmodule

