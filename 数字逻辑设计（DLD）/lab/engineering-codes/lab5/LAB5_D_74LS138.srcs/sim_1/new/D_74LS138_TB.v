`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/28 14:01:32
// Design Name: 
// Module Name: D_74LS138_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module D_74LS138_TB();
    reg A;
    reg B;
    reg C;
    reg G;
    reg G2A;
    reg G2B;
    wire [7:0] Y;
     D_74LS138 u1(A,B,C,G,G2A,G2B,Y);
     integer i;
     initial begin
      A=0;B=0;C=0;G=1;G2A=0;G2B=0;#100;
      for (i=0;i<=7;i=i+1) begin {C,B,A}=i; #100; end
      G=0;G2A=0;G2B=0;#100;
      G=1;G2A=1;G2B=0;#100;
      G=1;G2A=0;G2B=1;#100;
      end
endmodule
