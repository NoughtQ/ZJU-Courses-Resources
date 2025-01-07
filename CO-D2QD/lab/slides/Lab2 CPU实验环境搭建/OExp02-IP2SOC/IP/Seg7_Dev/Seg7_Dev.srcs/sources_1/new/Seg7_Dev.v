`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/03 22:16:49
// Design Name: 
// Module Name: Seg7_Dev
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


module Seg7_Dev(
input wire [31:0] disp_num,
input wire [7:0]  point,
input wire [7:0]  les,
input wire [2:0]  scan,
output wire [7:0] AN,
output wire [7:0] segment
  );
  wire [3:0] hex;
  wire p;
  wire LE;
  dispsync U1(
  .Hexs(disp_num),		
  .Scan(scan),
  .Point(point),
  .Les(les),
  .Hex(hex),
  .p(p),
  .LE(LE),
  .AN(AN));
  
  MC_14495 U2(                .D0(hex[0]), 
                              .D1(hex[1]), 
                              .D2(hex[2]), 
                              .D3(hex[3]), 
                              .LE(LE),  
                              .point(p), 
                              .a(segment[7]), 
                              .b(segment[6]), 
                              .c(segment[5]), 
                              .d(segment[4]), 
                              .e(segment[3]), 
                              .f(segment[2]), 
                              .g(segment[1]), 
                              .p(segment[0]));
 
endmodule
