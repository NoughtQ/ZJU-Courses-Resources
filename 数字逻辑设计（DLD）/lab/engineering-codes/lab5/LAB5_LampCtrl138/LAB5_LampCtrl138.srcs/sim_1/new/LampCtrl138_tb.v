`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/28 14:50:56
// Design Name: 
// Module Name: LampCtrl138_tb
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


module LampCtrl138_tb( );
    reg S1;
    reg S2;
    reg S3;
    wire F;
    integer i;
    LampCtrl138 lamp1(F,S1,S2,S3);
    initial begin
        for (i=0;i<=8;i=i+1)
        begin {S3,S2,S1}=i;#100; end
       end
endmodule
