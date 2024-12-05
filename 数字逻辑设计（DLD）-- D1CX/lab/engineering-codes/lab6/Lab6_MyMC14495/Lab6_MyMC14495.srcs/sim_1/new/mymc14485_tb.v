`timescale 1ns / 1ps
module MyMC14495_MyMC14495_sch_tb();
// Inputs
reg D3;
reg D2;
reg D0;
reg D1;
reg LE;
reg Point;
// Output
wire a;
wire b;
wire c;
wire d;
wire e;
wire f;
wire g;
wire p;
// Instantiate the UUT
MyMC14495 UUT (
.D3(D3),
.D2(D2),
.D0(D0),
.a(a),
.b(b),
.c(c),
.d(d),
.e(e),
.f(f),
.D1(D1),
.g(g),
.LE(LE),
.Point(Point),
.p(p)
);
// Initialize Inputs
integer i;
initial begin
D3 = 0;
D2 = 0;
D1 = 0;
D0 = 0;
LE = 0;
Point = 0;
for(i = 0; i <= 15; i = i+1)begin
#50;
{D3,D2,D1,D0} = i;
Point = i;
end
#50
LE = 1;
end
endmodule