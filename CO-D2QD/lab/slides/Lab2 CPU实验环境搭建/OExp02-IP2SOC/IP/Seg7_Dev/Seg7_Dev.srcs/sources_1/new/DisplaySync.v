`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/03 21:55:34
// Design Name: 
// Module Name: DisplaySync
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


module dispsync(input   [31:0] Hexs,		
		 input   [2:0] Scan,
		 input   [7:0] Point,
		 input   [7:0] Les,
		 output reg[3:0] Hex,
		 output reg p,LE,
		 output reg[7:0] AN);
   always @* begin		      
	case (Scan)
	        3'b000 : begin Hex <= Hexs[3:0];     AN <= 8'b11111110; p <= Point[0]; LE <= Les[0];end
	        3'b001 : begin Hex <= Hexs[7:4];     AN <= 8'b11111101; p <= Point[1]; LE <= Les[1];end
	        3'b010 : begin Hex <= Hexs[11:8];    AN <= 8'b11111011; p <= Point[2]; LE <= Les[2];end
	        3'b011 : begin Hex <= Hexs[15:12];   AN <= 8'b11110111; p <= Point[3]; LE <= Les[3];end
	        3'b100 : begin Hex <= Hexs[19:16];   AN <= 8'b11101111; p <= Point[4]; LE <= Les[4];end
	        3'b101 : begin Hex <= Hexs[23:20];   AN <= 8'b11011111; p <= Point[5]; LE <= Les[5];end
            3'b110 : begin Hex <= Hexs[27:24];   AN <= 8'b10111111; p <= Point[6]; LE <= Les[6];end	       
            3'b111 : begin Hex <= Hexs[31:28];   AN <= 8'b01111111; p <= Point[7]; LE <= Les[7];end	 
	endcase
   end

endmodule

